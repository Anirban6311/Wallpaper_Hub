import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_app/views/widgets/SearchBar.dart';

import '../widgets/catBlock.dart';

class CatagoryScreen extends StatelessWidget {
  const CatagoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 20,left: 12), // Adjust the top padding as needed
                    child: Container(
                      height: 100,
                      child: Column(
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Nature",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 38,
                                fontFamily: "Raleway",

                              ),
                                children:[
                                  TextSpan(
                                    text: "\n3D wallpapers available",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black54,

                                    )
                                  ),
                                ]

                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 400,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 15

                  ) ,
                  itemBuilder: ((context,index)=>GridTile(
                      child: Container(
                        height: 400,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.tealAccent,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              height: 400,
                              width: 50,
                              fit: BoxFit.cover,
                              "https://images.pexels.com/photos/19685003/pexels-photo-19685003/free-photo-of-small-lizard-climbing-a-palm-tree.jpeg"),
                        ),
                      )

                  ))),
            )
          ],
        ),
      ),
    );
  }
}

