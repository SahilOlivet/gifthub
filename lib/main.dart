import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gifts_hub/pages/my_home_page.dart';
import 'package:gifts_hub/pages/testing_page.dart';
import 'package:gifts_hub/providers/dark_theme_provider.dart';
import 'package:gifts_hub/providers/favourites_page_list_item_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'consts/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();

  FavouritesPageListItemProvider favouritesPageListItemProvider = FavouritesPageListItemProvider();

  void getCurrentAppTheme() async {
    themeProvider.darkTheme =
    await themeProvider.darkThemePreferences.getTheme();
  }

  void getCurrentFavPageItems() async {
    favouritesPageListItemProvider.favListSetter = await favouritesPageListItemProvider.favouritesPageSharedPreference.getFavModelData();

  }


  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
   initDynamicLinks();
    getCurrentFavPageItems();


  }





  void initDynamicLinks() async {


    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
          Uri? deepLink = dynamicLink?.link;

          if (deepLink != null) {
            final queryParams = deepLink.queryParameters;
            if(queryParams.isNotEmpty) {

            Get.to(()=>Testing(imageUrl: queryParams["username"]!));
                  String userName = queryParams["username"]!;
                  // verify the username is parsed correctly
                  print("My users username is: $userName and this is onLink method");

            }
          }
        },
        onError: (OnLinkErrorException e) async {
          print('onLinkError');
          print(e.message);
        }
    );

    final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;



    if (deepLink != null) {
      final queryParams = deepLink.queryParameters;
      if(queryParams.isNotEmpty) {
        Get.to(()=>Testing(imageUrl: queryParams["username"]!));
        String userName = queryParams["username"]!;
        // verify the username is parsed correctly
        print("My users username is: $userName and this is getInitialLink method");
      }
    }
  }



  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider<DarkThemeProvider>(create: (_) {
            return themeProvider; }),
            ChangeNotifierProvider<FavouritesPageListItemProvider>(create: (_) {
             return favouritesPageListItemProvider;})
        ],
        child:
            Consumer2<DarkThemeProvider,FavouritesPageListItemProvider>(builder: (context, themeData,favPageList, child) {
          return GetMaterialApp(
            theme: Styles.themeData(themeProvider.darkTheme, context),
            debugShowCheckedModeBanner: false,
            home: MyHomePage(),
          );
        }));
  }
}

