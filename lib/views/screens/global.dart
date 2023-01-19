

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Global{
  static List ind = [];
  static File? image;
  static bool swval = false;
  static bool swval1 = false;
  static bool isIOS = false;

  static int currentItem = 0;

  static late TabController tabController;
  static PageController pageController = PageController();
}

class detail {
  final File? image;
  final String? name;
  final String? discription;

  detail({
    required this.image,
    required this.name,
    required this.discription,
});
}


List <Map<String , dynamic>> allContacts = [
  {
    'id' : 1,
    'name' : "Harshil",
    'desc' : "Great",
    'time': 'Now',
    'num' : "7621839795",
    'image' : "assets/images/images/1.jpeg",
  },
  {
    'id' : 2,
    'name' : "Akash",
    'desc' : "mature banda",
    'time': 'Now',
    'num' : "8470713567",
    'image' : "assets/images/images/2.jpeg",
  },
  {
    'id' : 3,
    'name' : "parth",
    'desc' : "No caption needed",
    'time': 'Now',
    'num' : "7443859876",
    'image' : "assets/images/images/3.jpeg",
  },
  {
    'id' : 4,
    'name' : "archit",
    'desc' : "No great",
    'time': 'Now',
    'num' : "9869821986",
    'image' : "assets/images/images/4.jpeg",
  },
  {
    'id' : 5,
    'name' : "Kishan",
    'desc' : "Jay Mogal",
    'time': 'Now',
    'num' : "8745982373",
    'image' : "assets/images/images/5.jpg",
  },
  {
    'id' : 6,
    'name' : "aayush",
    'desc' : "hashtag tiger",
    'time': 'Now',
    'num' : "6784323567",
    'image' : "assets/images/images/6.jpg",
  }

];