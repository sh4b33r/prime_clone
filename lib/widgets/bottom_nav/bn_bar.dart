import 'package:flutter/material.dart';
import 'package:prime/widgets/theme/theme.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
    
      backgroundColor: Clrs.maincolor,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
    
      items: const [
     BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home" ),
     BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label:"Store" ),
     BottomNavigationBarItem(icon: Icon(Icons.live_tv),label:"Live Tv" ),
     BottomNavigationBarItem(icon: Icon(Icons.download),label:"Download" ),
     BottomNavigationBarItem(icon: Icon(Icons.search),label:"Search" )





    ]);
  }
}