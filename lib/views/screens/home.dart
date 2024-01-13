import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_app/views/widgets/SearchBar.dart';

import '../widgets/catBlock.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: searchBar()
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 30,
                  itemBuilder: ((context,index) => CatBlock()),
                ),
              ),
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

