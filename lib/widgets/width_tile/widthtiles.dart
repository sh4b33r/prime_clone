import 'package:flutter/material.dart';
import 'package:prime/Api/constant.dart';
import 'package:prime/models/movie.dart';

import '../../screens/detailed_view.dart';

class Widthlsquaretiles extends StatelessWidget {
  final List<MovieModel> movies;
  const Widthlsquaretiles({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(movies.length, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => DetailedView(
                          type: movies[index],
                        )));
              },
              child: Container(
                height: 100,
                width: 190,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            Constants.iMgurl + movies[index].backdroppath!),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("${movies[index].title}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                shadows: [
                                  BoxShadow(
                                      color: Colors.black, offset: Offset(2, 1))
                                ]),
                            textAlign: TextAlign.start),
                        const SizedBox(
                          height: 4,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
