import 'package:flutter/material.dart';
import 'package:prime/widgets/custom_appbar/custom_appbar.dart';
import 'package:prime/widgets/theme/theme.dart';

class StorePAge extends StatelessWidget {
  const StorePAge({super.key});

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: CustomAppbar(primelogo: false, title: "Store", yellow: false,),
      backgroundColor: Clrs.maincolor,
      body: Center(child: Text("STore"),),
    );
  }
  
}