import 'package:flutter/material.dart';
import 'package:prime/widgets/theme/theme.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
 final bool primelogo;
 final bool yellow;

  @override
  final Size preferredSize;

   const CustomAppbar({
    super.key,
    required this.primelogo,
    required this.title,
    required this.yellow,
  }) : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Clrs.maincolor,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

 primelogo==true?
              Image.asset(
                "assets/images/white_logo.png",
                height: 24,
              ):Text(title,style: TextStyle(color: Colors.amber),),

              const Row(
                children: [
                  Icon(
                    Icons.cast,
                    color: Colors.grey,
                    size: 28,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: AssetImage("assets/images/Avatr.png"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
