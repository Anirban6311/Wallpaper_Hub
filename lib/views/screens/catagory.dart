import 'package:flutter/material.dart';
import 'package:wallpaper_app/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_app/views/widgets/SearchBar.dart';
import 'package:wallpaper_app/controller/apiOper.dart';
import 'package:wallpaper_app/views/screens/fullScreen.dart';
import 'package:wallpaper_app/models/photosModel.dart';
import 'package:wallpaper_app/models/CatagoryModel.dart';
import '../widgets/catBlock.dart';



class CategoryScreen extends StatefulWidget {
  String catName;
  String catImgUrl;

  CategoryScreen({super.key, required this.catImgUrl, required this.catName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late List<PhotosModel> categoryResults;
  bool isLoading  = true;
  GetCatRelWall() async {
    categoryResults = await ApiOperations.searchWall(widget.catName);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetCatRelWall();
    super.initState();
  }

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
                      padding: EdgeInsets.only(top: 20, left: 12),
                      // Adjust the top padding as needed
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
                                  children: [
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
                height: 700,
                child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 400,
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 15

                    ),
                    itemCount: categoryResults.length,
                    itemBuilder: ((context, index) =>
                        GridTile(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FullScreen(
                                              imgUrl:
                                              categoryResults[index].imgSrc)));
                            },
                            child: Hero(
                              tag: categoryResults[index].imgSrc,
                              child: Container(
                                height: 800,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.amberAccent,
                                    borderRadius: BorderRadius.circular(20)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                      height: 800,
                                      width: 50,
                                      fit: BoxFit.cover,
                                      categoryResults[index].imgSrc),
                                ),
                              ),
                            ),
                          ),
                        ))),
              ),
            ],
          ),
        ),
      );
    }
  }

