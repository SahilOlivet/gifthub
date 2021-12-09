import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gifts_hub/models/favourites_page_model.dart';
import 'package:gifts_hub/sharedpreferences/favourite_shared_preference.dart';

class FavouritesPageListItemProvider with ChangeNotifier {
  FavouritesPageSharedPreference favouritesPageSharedPreference =
      FavouritesPageSharedPreference();
  List<FavouritePageModel> _favouritesPageList = [
    // FavouritePageModel(
    //     imageUrl:
    //         'https://i.pinimg.com/564x/fd/db/25/fddb2563063fb4e98c0cafcc331d13ab.jpg',
    //     title: "/gifts",
    //     price: 123,
    //     description: 'Animated work, with innovative design',
    //     categories: 'Animated invitation',
    //     rating: 5,
    //     length: "1:34"),
  ];

  List<FavouritePageModel> get favListGetter => _favouritesPageList;

  bool favListItemsAdder(FavouritePageModel item) {
    _favouritesPageList.add(item);
    favouritesPageSharedPreference.saveFavModelData(_favouritesPageList);

    notifyListeners();
    return true;
  }

  set favListSetter(List<FavouritePageModel> favModelList) {
    _favouritesPageList = favModelList;
    favouritesPageSharedPreference.saveFavModelData(favModelList);
    notifyListeners();
    print('fav set function is also called');
  }

  void favListItemsRemover(FavouritePageModel item) {
    print(_favouritesPageList.contains(item));

    print ("remove was called");
    favouritesPageSharedPreference.saveFavModelData(_favouritesPageList);
    notifyListeners();
  }
}

// FavouritePageModel(imageUrl: 'https://i.pinimg.com/564x/fd/db/25/fddb2563063fb4e98c0cafcc331d13ab.jpg', title: "/gifts",price: 123, description: 'Animated work, with innovative design', categories: 'Animated invitation', rating: 5, length: "1:34"),
//FavouritePageModel(imageUrl: imageUrl, title: title, price: price, description: description, categories: categories, rating: rating, length: length)
