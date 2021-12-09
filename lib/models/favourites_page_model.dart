import 'dart:convert';

import 'package:gifts_hub/models/universal_data_model.dart';

class FavouritePageModel extends UniversalDataModel {
  late String imageUrl;
  late String title;
  late int price;
  late String description;
  late String categories;
  late int rating;
  late String length;
  late bool isLiked;

  FavouritePageModel(
      {required this.imageUrl,
      required this.title,
      required this.price,
      required this.description,
      required this.categories,
      required this.rating,
      required this.length,
      required this.isLiked});

  //constructor that convert json to object instance
  FavouritePageModel.fromJson(Map<String, dynamic> json)
      : imageUrl = json['imageUrl'],
        title = json['title'],
        price = json['price'],
        description = json['description'],
        categories = json['categories'],
        rating = json['rating'],
        length = json['length'],
        isLiked = json['isLiked'];

  //a method that convert object to json

  Map<String, dynamic> toJson() => {
    'imageUrl' :imageUrl,
    'title': title,
    'price': price,
    'description': description,
    'categories': categories,
    'rating': rating,
    'length': length,
    'isLiked':isLiked
  };

  //a method that convert object to map
  static Map<String, dynamic> toMap(FavouritePageModel favPageObj) => {
        'imageUrl': favPageObj.imageUrl,
        'title': favPageObj.title,
        'price': favPageObj.price,
        'description': favPageObj.description,
        'categories': favPageObj.categories,
        'rating': favPageObj.rating,
        'length': favPageObj.length,
    'isLiked': favPageObj.isLiked,
      };
//converting our List  to  String(not list of string)
//    static String encode(List<FavouritePageModel> favPageObj) => json.encode(
//     favPageObj
//         .map<Map<String, dynamic>>((favPageObj) => FavouritePageModel.toMap(favPageObj))
//         .toList(),
//   );


//converting our object to  map  and then to list of String
  static List<String> encode(List<FavouritePageModel> favPageList) {
    return favPageList
        .map((favPageListItem) =>
            jsonEncode(FavouritePageModel.toMap(favPageListItem)))
        .toList();
  }

//converting the List of String back to list of our Object
//   static List<FavouritePageModel> decode(String favModelStringData) =>
//       (json.decode(favModelStringData) as List<dynamic>)
//           .map<FavouritePageModel>((item) => FavouritePageModel.fromJson(item))
//           .toList();



  //converting the List of String back to list of our Object
  static List<FavouritePageModel> decode(List<String> favPageStringList){
  return
    favPageStringList.map((favPageStringListItem)=> jsonDecode(favPageStringListItem)).toList()
        .map<FavouritePageModel>((item) => FavouritePageModel.fromJson(item)).toList();

  }



}
