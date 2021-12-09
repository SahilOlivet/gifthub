

import 'dart:convert';

import 'package:gifts_hub/models/favourites_page_model.dart';
import 'package:gifts_hub/providers/favourites_page_list_item_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouritesPageSharedPreference{
   late FavouritesPageListItemProvider favouritesPageListItemProvider ;
  //static const FAV_MODEL_DATA = "FAVMODELDATA";


  static List<FavouritePageModel> dummyList =[
    FavouritePageModel(
        imageUrl:
        'https://i.pinimg.com/564x/fd/db/25/fddb2563063fb4e98c0cafcc331d13ab.jpg',
        title: "/gifts",
        price: 123,
        description: 'Animated work, with innovative design',
        categories: 'Animated invitation',
        rating: 5,
        length: "1:34",
    isLiked: false),
  ];

  static List<String> dummyListString =FavouritePageModel.encode(dummyList);



  //save the data into sharedPreferences using key-value pairs
  //ye method ek object (which have different properties) ko save krne ke liye sahi tha

  // saveFavModelData(FavouritePageModel favModelObj) async{
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String favModelJsonString =  jsonEncode(favModelObj);
  //   prefs.setString(FAV_MODEL_DATA, favModelJsonString);
  // }



  //save the List of our favModel data into sharedPreferences using List of key-value pairs i.e List of string
  saveFavModelData(List<FavouritePageModel> list) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   List<String> encodedData = FavouritePageModel.encode(
     list
    );
  // print(FavouritesPageListItemProvider().favListGetter[0]);
print('save is being called');
   await  prefs.setStringList("FAVMODELDATA",encodedData );
  }

 // Fetch and decode data i.e getting our List out of the list of string
 //  Future<List<FavouritePageModel>> getFavModelData() async{
 //    SharedPreferences prefs = await SharedPreferences.getInstance();
 //   // print(prefs.getString(FAV_MODEL_DATA));
 //    String favModelListStringData = await prefs.getString(FAV_MODEL_DATA)??('hello ');
 //   // print(dummyListString);
 //    print(favModelListStringData);
 //    print('=========---=0099999cgfbfcgxdf=dvgdsvsdvc=============cdcc_____gyug ');
 //    List<FavouritePageModel> favModelList = FavouritePageModel.decode(favModelListStringData);
 //   // print(favModelList );
 //    return favModelList;
 //  }


Future<List<FavouritePageModel>> getFavModelData() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print( prefs.getStringList("FAVMODELDATA",));
  List<String> stringList = prefs.getStringList("FAVMODELDATA",)??dummyListString;
  print(stringList );
  //print(dummyListString);

  List<FavouritePageModel> favModelList = FavouritePageModel.decode(stringList);
    return favModelList;
}


// Read the data, decode it and store it in map structure
//   Future<FavouritePageModel> getFavModelData() async{
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     Map<String,dynamic> jsondatais = jsonDecode(prefs.getString(FAV_MODEL_DATA)!);
//
//     //convert it into FavouritePageModel object
//     FavouritePageModel favouritePageModelObj = FavouritePageModel.fromJson(jsondatais);
//     return favouritePageModelObj;
//   }


}