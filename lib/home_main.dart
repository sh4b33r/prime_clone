import 'package:flutter/material.dart';
import 'package:prime/Api/api_calling.dart';

import 'package:prime/widgets/theme/theme.dart';

import 'screens/donwloads.dart';
import 'screens/home.dart';
import 'screens/livetv.dart';
import 'screens/search.dart';
import 'screens/store.dart';

class HomeScreenbottomchange extends StatefulWidget {
  const HomeScreenbottomchange({super.key});

  @override
  State<HomeScreenbottomchange> createState() => _HomeScreenbottomchangeState();
}

class _HomeScreenbottomchangeState extends State<HomeScreenbottomchange> {
  int selected = 0;
  var pages = [
    const HomeScreen(),
    const StorePAge(),
    const LiveTv(),
    const Downloads(),
    SearchScrn(),
  ];
  @override
  Widget build(BuildContext context) {
    fetchAll();

    return Scaffold(
    body:pages[selected] ,

 bottomNavigationBar: BottomNavigationBar(
    elevation: 0,
     useLegacyColorScheme: false,
      backgroundColor: Clrs.maincolor,
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: selected,
      enableFeedback: false,
    onTap: (index) {
                setState(() {
                  selected = index;
                });
              },

      
      items: const [

     BottomNavigationBarItem(icon: Icon(Icons.home),label:"Home" ),
     BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label:"Store" ),
     BottomNavigationBarItem(icon: Icon(Icons.live_tv),label:"Live Tv" ),
     BottomNavigationBarItem(icon: Icon(Icons.download),label:"Download" ),
     BottomNavigationBarItem(icon: Icon(Icons.search),label:"Search" )





    ]),



    );
  }
}