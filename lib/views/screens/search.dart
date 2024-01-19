import 'package:flutter/material.dart';
import 'package:wallpaper_app/controller/apiOper.dart';
import 'package:wallpaper_app/models/photosModel.dart';
import 'package:wallpaper_app/views/widgets/CustomAppBar.dart';
import 'package:wallpaper_app/views/widgets/SearchBar.dart';

import '../widgets/catBlock.dart';

class SearchScreen extends StatefulWidget {
  String query;
  SearchScreen({super.key , required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();

}

class _SearchScreenState extends State<SearchScreen> {

  late List<PhotosModel> searchRes=[];
  getSeachRes() async
  {
       searchRes= await ApiOperations.searchWall(widget.query);
       setState(() {

       });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSeachRes();
  }
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
                  itemCount: searchRes.length,
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
                              searchRes[index].imgSrc,
                        ),
                      )

                  ))),
            )
            )
          ],
        ),
      ),
    );
  }
}

