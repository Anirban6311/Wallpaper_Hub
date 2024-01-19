import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wallpaper_app/models/photosModel.dart';

class ApiOperations{
   static List<PhotosModel> trendingWallpapers=[];
   static List<PhotosModel> searchWallList=[];
   static Future<List<PhotosModel>> getTrendingWallpapers()  async{
      await http.get(
         Uri.parse("https://api.pexels.com/v1/curated"),
         headers: {"Authorization" : "riqdTAuMepAXSJWXu1uRKMapHB1jFzxYFjEW301ZQiXiEr8ER40cvRj6"}
      ).then((value) {
         Map<String,dynamic> jsonData= jsonDecode(value.body);
         List photos =jsonData['photos'];
         photos.forEach((element) {
            trendingWallpapers.add(PhotosModel.fromAPI2App(element));
         });

      });
      return trendingWallpapers;
   }
   static Future<List<PhotosModel>> searchWall(String query) async{
      await http.get(
          Uri.parse("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
          headers: {"Authorization" : "riqdTAuMepAXSJWXu1uRKMapHB1jFzxYFjEW301ZQiXiEr8ER40cvRj6"}
      ).then((value) {
         Map<String,dynamic> jsonData= jsonDecode(value.body);
         List photos =jsonData['photos'];
         searchWallList.clear(); // to clear elements from the previous search
         photos.forEach((element) {
            searchWallList.add(PhotosModel.fromAPI2App(element));
         });

      });
      return searchWallList;

   }
}