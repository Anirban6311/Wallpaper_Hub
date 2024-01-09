import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  const searchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),

      ),
        child:Row(
          children: [
            Expanded(
              child: TextField(
                 decoration: InputDecoration(
                   errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                   focusedBorder: InputBorder.none,
                   disabledBorder: InputBorder.none,
                   enabledBorder: InputBorder.none,
                   hintText: "Search Wallpapers",
                 ),
              ),
            ),
            InkWell(
                onTap: ()
                {
                  print("Searching...");
                },
                child: Icon(Icons.search)
            ),
          ],
        )
    );
  }
}
