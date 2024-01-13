import 'package:flutter/material.dart';

class CatBlock extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              height: 50,
              width: 100,
              fit: BoxFit.cover,
              "https://images.pexels.com/photos/19708337/pexels-photo-19708337/free-photo-of-samoyed-dog-in-the-snow.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
            ),
          ),
          Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned(
            left: 30,
            top: 15,
            child: Text(
              "Animal",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
