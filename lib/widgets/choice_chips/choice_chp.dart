import 'package:flutter/material.dart';
import 'package:prime/widgets/theme/theme.dart';

class ChoiceChps extends StatefulWidget {
  const ChoiceChps({Key? key}) : super(key: key);

  @override
  State<ChoiceChps> createState() => _ChoiceChpsState();
}
class _ChoiceChpsState extends State<ChoiceChps> {
  int selectedCategoryIndex = 0;
  List<String> chips = ["All", "Movies", "TV Shows"];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: Row(
            children: List<Widget>.generate(3, (index) {
              return  Row(
                children: [
                  const SizedBox(width: 10,),
                  
                  ChoiceChip(
                   backgroundColor: Clrs.maincolor,
                   labelStyle: selectedCategoryIndex == index ? const TextStyle(color: Color.fromARGB(255, 2, 2, 2)) : const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                   side: BorderSide(width: 0,color: Clrs.maincolor),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(23))),
                    showCheckmark: false,
                    visualDensity: const VisualDensity(horizontal: 2,vertical: 1),
                    label: 
                     
                    Text(chips[index]),
                     
                    selected: selectedCategoryIndex == index,

                    selectedColor: const Color.fromARGB(255, 255, 255, 255),
                  

                    onSelected: (value) {
                      print(value);
                      setState(() {
                        selectedCategoryIndex = index;
                      });
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}
