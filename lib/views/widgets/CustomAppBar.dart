import "package:flutter/material.dart";
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         child: RichText(
           textAlign: TextAlign.center,
           text: TextSpan(
               text: "Wallpapers",
               style: TextStyle(
                 color: Colors.orange,
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
               ),
             children: [
               TextSpan(
                   text: " Hub",
                   style: TextStyle(
                     color: Colors.black,
                   )
               )
             ]
           ),
         ),
      ),
    );
  }
}

