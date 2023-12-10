// ignore_for_file: use_build_context_synchronously
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prime/Api/api_calling.dart';

import 'package:prime/home_main.dart';
import 'package:prime/widgets/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () async {
      await fetchAll();
     
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx) => const HomeScreenbottomchange()));
    });

    

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Clrs.maincolor,
      body: Center(child: Image.asset("assets/images/prime___.png" ,height:90,width: 200,),),
    );
  }
}
