import 'package:flutter/cupertino.dart';
import 'package:gifts_hub/models/universal_data_model.dart';

class RecommendedModel extends UniversalDataModel{
  // late String name ;
  // late String image ;
  late String imageUrl;
  late String title ;
  late int price;
  late String description ;
  late String categories ;
  late int rating;
  late String length;
  late bool isLiked;

  RecommendedModel({required this.imageUrl, required this.title, required this.price, required this.description,
      required this.categories, required this.rating, required this.length,required this.isLiked});
}

List<RecommendedModel> recommendations =[
  RecommendedModel(imageUrl: 'https://i.pinimg.com/564x/16/0d/99/160d99aa21851f648ab62b5436cc9e14.jpg', title: "/explore",price: 123, description: 'Animated work, with innovative design', categories: 'Animated invitation', rating: 5, length: "1:34",isLiked: false),
  RecommendedModel(imageUrl: 'https://i.pinimg.com/564x/29/f9/55/29f9556d7aa407495980bbdfb82346f0.jpg', title: "/more",price: 123, description: 'Animated work, with innovative design', categories: 'Animated invitation', rating: 5, length: "1:34",isLiked: false),
  RecommendedModel(imageUrl: 'https://i.pinimg.com/564x/fd/db/25/fddb2563063fb4e98c0cafcc331d13ab.jpg', title: "/gifts",price: 123, description: 'Animated work, with innovative design', categories: 'Animated invitation', rating: 5, length: "1:34",isLiked: false),
  RecommendedModel(imageUrl: 'https://i.pinimg.com/564x/8a/a4/8c/8aa48c77198bcf0317cb154d31a10fcd.jpg', title: "Hola",price: 123, description: 'Animated work, with innovative design', categories: 'Animated invitation', rating: 5, length: "1:34",isLiked: false),


];


// List<RecommendedModel> recommendations = recommendationsData.map((item)
// =>RecommendedModel(item['name'].toString(),item['image'].toString())).toList();
//
// var recommendationsData = [
//   {
//     "name": 'Ek Mulakat',
//     'image': 'images/1.jpg'
//   },
//
//   {
//     "name": 'Wo Baarish',
//     'image': 'images/2.png'
//   },
//
//   {
//     "name": 'Waqt kaa intezar',
//     'image': 'images/3.png'
//   },
//   {
//     "name": 'Soch bhi naa sake',
//     'image': 'images/4.png'
//   },
//
// ];