// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prime/Api/api_calling.dart';
import 'package:prime/Api/constant.dart';
import 'package:prime/widgets/custom_appbar/custom_appbar.dart';
import 'package:prime/widgets/theme/theme.dart';

import 'detailed_view.dart';

class SearchScrn extends StatefulWidget {
  SearchScrn({super.key});

  @override
  State<SearchScrn> createState() => _SearchScrnState();
}

class _SearchScrnState extends State<SearchScrn> {
  final SearchController _searchController = SearchController();

  Timer? _debounce;
  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    searchEmptyData();
    return Scaffold(
      appBar:CustomAppbar(title: "serach" ,primelogo: true, yellow: false,),
      backgroundColor: Clrs.maincolor,
      body: Column(children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SearchBar(
            controller: _searchController,
            onChanged: (value) {
              if (value.isEmpty) {
                searchEmptyData();
              } else {
                if (_debounce?.isActive ?? false) {
                  _debounce?.cancel();
                }
                _debounce = Timer(const Duration(milliseconds: 1000), () {
                  Api().searchData(value);
                });
              }
            },
            shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)))),
            leading: const Icon(Icons.search),
            trailing: [
              InkWell(
                child: const Icon(Icons.close),
                onTap: () async {
 await searchEmptyData();
_searchController.clear();


                } 
              )
            ],
            hintText: "Serach Movies,Tv Shows,More...",
            hintStyle:
                const MaterialStatePropertyAll(TextStyle(color: Colors.grey)),
            backgroundColor: const MaterialStatePropertyAll(Colors.white),
          ),
        ),
        ValueListenableBuilder(
          valueListenable: searchListener,
          builder: (context, value, child) {
            return value.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        "assets/images/no-connection (1).png",
                        height: 70,
                        width: 70,
                      ),
                      const Text(
                        "NO Data Found",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                : Expanded(
                    child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: List.generate(value.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: ()=>  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DetailedView(type:value[index] ,) )),
                            child: Container(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              height: 120,
                              child: Row(
                                children: [
                                  Image.network(Constants.iMgurl +
                                      value[index].posterpath!),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Text(
                                    value[index].title!,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ))
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ));
          },
        )
      ]),
    );
  }
}
