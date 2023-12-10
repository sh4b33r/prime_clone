import 'package:flutter/material.dart';
import 'package:prime/Api/api_calling.dart';
import 'package:prime/widgets/carousel/carousel.dart';
import 'package:prime/widgets/choice_chips/choice_chp.dart';
import 'package:prime/widgets/custom_appbar/custom_appbar.dart';
import 'package:prime/widgets/heighttile.dart/hght_tiles.dart';
import 'package:prime/widgets/theme/theme.dart';
import 'package:prime/widgets/width_tile/cust_widthtile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Clrs.maincolor,
      appBar: CustomAppbar(title: "hellooo",primelogo: true, yellow: false),
      body: ListView(
        children: [
          const Align(alignment: Alignment.topLeft, child: ChoiceChps()),
          const SizedBox(
            height: 10,
          ),
          const CarouselCustom(),
          Customwidthttile(movies: allMovies,),
          Heightlsquaretiles(movies: allMovies),
        
        
        ],
      ),
    );
  }
}
