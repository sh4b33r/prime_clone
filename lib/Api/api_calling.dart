// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prime/Api/constant.dart';
import 'package:prime/models/movie.dart';
import 'package:http/http.dart' as http;

List<MovieModel> allMovies = [];
List<MovieModel> nowplaying = [];
ValueNotifier<List<MovieModel>> searchListener = ValueNotifier([]);

class Api {

  Future<List<MovieModel>> getdata(String base) async {
    final response = await http.get(Uri.parse("$base${Constants.apiKey}"));
    if (response.statusCode == 200) {
      final List<dynamic> decodedData = jsonDecode(response.body)['results'];

      return decodedData.map((items) => MovieModel.fromJson(items)).toList();
    } else {
      throw Exception("Something Went Wrong >>${response.statusCode}");
    }
  }



  Future<void> searchData(String keyword) async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/search/movie?query=$keyword&api_key=bda239d0434bc8e35365350d913ef224"));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<dynamic> decodedData = data['results'];
      final val = decodedData.map((json) => MovieModel.fromJson(json)).toList();
      searchListener.value.clear();
      for (var element in val) {
        if (element.posterpath != null) {
          searchListener.value.add(element);
        }
      }
      searchListener.notifyListeners();
    } else {
      throw Exception("Something Went Wrong >>${response.statusCode}");
    }
  }

}

Future<void> fetchAll() async {
  allMovies = await Api().getdata(Constants.all);
}

searchEmptyData() {
  searchListener.value = allMovies;
}
