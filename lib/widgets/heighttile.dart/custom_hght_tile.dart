import 'package:flutter/material.dart';
import 'package:prime/models/movie.dart';
import 'package:prime/widgets/width_tile/widthtiles.dart';

class CustomHeightttile extends StatelessWidget {
 final  List<MovieModel> movies;
  const CustomHeightttile({super.key,required this.movies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "HEllooooo",
                  style: TextStyle(
                      fontFamily: 'Inter', fontSize: 15, color: Colors.white),
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.double_arrow,
                  color: Colors.red,
                )
              ],
            ),
          ),
        Widthlsquaretiles(movies: movies),
        Widthlsquaretiles(movies: movies,)
        ],
      ),
    );
  }
}
