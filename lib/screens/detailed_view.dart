import 'package:flutter/material.dart';
import 'package:prime/Api/constant.dart';
import 'package:prime/models/movie.dart';
import 'package:prime/widgets/custom_appbar/custom_appbar.dart';
import 'package:prime/widgets/theme/theme.dart';

class DetailedView extends StatelessWidget {
  final MovieModel type;
  const DetailedView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: const CustomAppbar(
        title: "",
        primelogo: true,
       yellow: true,
      ),
      backgroundColor: Clrs.maincolor,
      body: ListView(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Stack(
                children: [
                  SizedBox(
                      height: 300,
                      width: 150,
                      child: Image.network(
                        Constants.iMgurl + type.posterpath!,
                        height: 250,
                        width: 30,
                      )),
                  Positioned(
                    left: 96,
                    top: 220,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 27,
                      child: CircleAvatar(
                        backgroundColor: Clrs.maincolor,
                        radius: 26,
                        child: Text(
                          type.voterating,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                  child: Text(
                type.title!,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )),
            ],
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(18, 10, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Language: ${type.language.toUpperCase()}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      type.overview!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
