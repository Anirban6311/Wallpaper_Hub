import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/screens/search.dart';

class searchBar extends StatelessWidget {
  searchBar({super.key});
  TextEditingController _searchController=TextEditingController();
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
                controller: _searchController,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchScreen(query: _searchController.text)));
                },
                child: Icon(Icons.search)
            ),
          ],
        )
    );
  }
}
