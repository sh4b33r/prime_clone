import 'package:flutter/material.dart';
import 'package:prime/Api/constant.dart';

import 'package:prime/models/movie.dart';

import '../../screens/detailed_view.dart';

class Heightlsquaretiles extends StatelessWidget {
  final List<MovieModel> movies;
 const Heightlsquaretiles ({super.key,required this.movies});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(movies.length, (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: ()=>  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DetailedView(type:movies[index],) ))

                    
,
                    child: Container(
                      height:170,
                      width: 120,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(
                        
                          Constants.iMgurl+movies[index].posterpath!
                        ),fit: BoxFit.fill
                        ),
                        
                        borderRadius: BorderRadius.circular(8)), 
                    
                       
                     
                    ),
                  ),
                );
              }),
            ),
          );
  }
}