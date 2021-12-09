import 'dart:convert';

import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gifts_hub/consts/my_app_icon.dart';
import 'package:gifts_hub/models/favourites_page_model.dart';
import 'package:gifts_hub/models/images_and_title_model.dart';
import 'package:gifts_hub/models/new_data_provider.dart';
import 'package:gifts_hub/models/universal_data_model.dart';
import 'package:gifts_hub/pages/explore_page.dart';
import 'package:gifts_hub/pages/testing_page.dart';
import 'package:gifts_hub/providers/favourites_page_list_item_provider.dart';
import 'package:gifts_hub/widgets/circular_clipper.dart';
import 'package:get/get.dart';
import 'package:gifts_hub/widgets/contact_us_widget.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsPage extends StatefulWidget {
  //   final NewDataModel newDataModel;
  // DetailsPage({ required this.newDataModel});

  // late NewDataModel newDataModel;
  // late ImagesAndTitleModel imagesAndTitleModel;
  final UniversalDataModel universalDataModel;

  DetailsPage(
      {required this.universalDataModel}); // DetailsPage({required this.});

  // DetailsPage.newModelConstructor({required this.imagesAndTitleModel});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isLoading = false;
  late bool isLiked = widget.universalDataModel.isLiked;

  late Color _iconColor ;

  @override
  void initState() {
    super.initState();
    print ("init state of details page is called");
    setState(() {
      if(widget.universalDataModel.isLiked){
        print ("red colour is called");
        _iconColor =Colors.red;
      }
      else{
        print ("grey colour is called");
        _iconColor = Colors.grey;
      }
    });

    // fetchLinkData();
  }

  // void fetchLinkData() async {
  //   // FirebaseDynamicLinks.getInitialLInk does a call to firebase to get us the real link because we have shortened it.
  //   var link = await FirebaseDynamicLinks.instance.getInitialLink();
  //
  //   // This link may exist if the app was opened fresh so we'll want to handle it the same way onLink will.
  //   handleLinkData(link);
  //
  //   // This will handle incoming links if the application is already opened
  //   FirebaseDynamicLinks.instance.onLink(
  //       onSuccess: (PendingDynamicLinkData? dynamicLink) async {
  //     handleLinkData(dynamicLink!);
  //   }, onError: (OnLinkErrorException e) async {
  //     print('onLinkError');
  //     print(e.message);
  //   });
  // }
  //
  // void handleLinkData(PendingDynamicLinkData? data) {
  //   final Uri? uri = data?.link;
  //   if (uri != null) {
  //     final queryParams = uri.queryParameters;
  //     if (queryParams.isNotEmpty) {
  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //       builder: (context) => Testing(imageUrl: queryParams["username"]!)),
  //       // );
  //       Get.to(Testing(imageUrl: queryParams["username"]!));
  //       String userName = queryParams["username"]!;
  //       // verify the username is parsed correctly
  //       print("My users username is: $userName");
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final favPageList = Provider.of<FavouritesPageListItemProvider>(context);

    // Future<bool> onLikeButtonTapped(bool isLiked) async{
    //   /// send your request here
    //   // final bool success= await sendRequest();
    //   print('hello');
    //
    //  // favPageList.favListItemsRemover(widget.universalDataModel.imageUrl);
    //   //
    //      final bool success = favPageList.favListItemsAdder(FavouritePageModel(
    //           imageUrl: widget.universalDataModel.imageUrl,
    //           title: widget.universalDataModel.title,
    //           price: widget.universalDataModel.price,
    //           description: widget.universalDataModel.description,
    //           categories: widget.universalDataModel.categories,
    //           rating: widget.universalDataModel.rating,
    //           length: widget.universalDataModel.length, isLiked: widget.universalDataModel.isLiked));
    //
    //
    //   /// if failed, you can do nothing
    //   return success? !isLiked:isLiked;
    //
    // // return !isLiked;
    // }
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.universalDataModel.imageUrl,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      //////network image
                      image: NetworkImage(widget.universalDataModel.imageUrl),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                  // const Image(
                  //   image: AssetImage('images/popcorn.jpg'),
                  //   height: 60.0,
                  //   width: 150.0,
                  // ),
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0, right: 10),
                    onPressed: () => print('Add to Favorites'),
                    icon: Icon(Icons.favorite_border),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 12.0,
                    onPressed: () => print('Play Video'),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60.0,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 2.0,
                left: 25.0,

                // child:  FavoriteButton(
                //   isFavorite: widget.universalDataModel.isLiked,
                //   // iconDisabledColor: Colors.white,
                //   valueChanged: (_isFavorite) {
                //    //print('Is Favorite : $_isFavorite');
                //     if(_isFavorite ==true){
                //       print('Is Favorite : $_isFavorite');
                //     widget.universalDataModel.isLiked= true;
                //         favPageList.favListItemsAdder(FavouritePageModel(
                //             imageUrl: widget.universalDataModel.imageUrl,
                //             title: widget.universalDataModel.title,
                //             price: widget.universalDataModel.price,
                //             description: widget.universalDataModel.description,
                //             categories: widget.universalDataModel.categories,
                //             rating: widget.universalDataModel.rating,
                //             length: widget.universalDataModel.length,
                //             isLiked: widget.universalDataModel.isLiked));
                //
                //         print(favPageList.favListGetter.length);}
                //     if(_isFavorite ==false){
                //       print('Is Favorite : $_isFavorite');
                //       widget.universalDataModel.isLiked= false;
                //         favPageList.favListItemsRemover(widget.universalDataModel.imageUrl);
                //     }
                //
                //
                //   },
                // ),
                // child: LikeButton(
                //   onTap: onLikeButtonTapped,
                //   size: 40,
                //
                // ),

                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (!isLiked) {
                       setState(() {
                         _iconColor = Colors.red;
                         widget.universalDataModel.isLiked = true;
                         favPageList.favListItemsAdder(FavouritePageModel(
                             imageUrl: widget.universalDataModel.imageUrl,
                             title: widget.universalDataModel.title,
                             price: widget.universalDataModel.price,
                             description: widget.universalDataModel.description,
                             categories: widget.universalDataModel.categories,
                             rating: widget.universalDataModel.rating,
                             length: widget.universalDataModel.length,
                             isLiked: widget.universalDataModel.isLiked));
                         isLiked = true;

                         print(favPageList.favListGetter.length);
                       });
                      } else {
                        setState(() {
                          _iconColor = Colors.grey;
                          widget.universalDataModel.isLiked = false;
                          favPageList.favListItemsRemover(FavouritePageModel(
                              imageUrl: widget.universalDataModel.imageUrl,
                              title: widget.universalDataModel.title,
                              price: widget.universalDataModel.price,
                              description: widget.universalDataModel.description,
                              categories: widget.universalDataModel.categories,
                              rating: widget.universalDataModel.rating,
                              length: widget.universalDataModel.length,
                              isLiked: widget.universalDataModel.isLiked));
                          isLiked =false;
                        });
                      }
                    });
                  },
                  // onPressed:  isLiked?() {
                  //   widget.universalDataModel.isLiked = false;
                  //   favPageList.favListItemsRemover(widget.universalDataModel.imageUrl);
                  //   _iconColor = Colors.grey;
                  //
                  // }:() {
                  //   widget.universalDataModel.isLiked = true;
                  //   _iconColor = Colors.red;
                  //
                  //   //favPageList.favListItemsRemover(widget.universalDataModel.imageUrl);
                  //
                  //
                  //
                  //   favPageList.favListItemsAdder(FavouritePageModel(
                  //       imageUrl: widget.universalDataModel.imageUrl,
                  //       title: widget.universalDataModel.title,
                  //       price: widget.universalDataModel.price,
                  //       description: widget.universalDataModel.description,
                  //       categories: widget.universalDataModel.categories,
                  //       rating: widget.universalDataModel.rating,
                  //       length: widget.universalDataModel.length,
                  //       isLiked: widget.universalDataModel.isLiked));
                  //
                  //   print(favPageList.favListGetter.length);
                  //
                  //
                  //
                  // }
                  icon: Icon(Icons.favorite),
                  iconSize: 40.0,
                  color: _iconColor,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 25.0,
                child: IconButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          setState(() {
                            isLoading = true;
                          });

                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              });
                          await shareAction();

                          setState(() {
                            isLoading = false;
                          });
                          Navigator.pop(context);

                          // setState(() {
                          //   isLoading = true;
                          // });
                          //
                          // var dynamicLink = await createDynamicLink(userName: widget.universalDataModel.imageUrl);
                          // // dynamicLink has been generated. share it with others to use it accordingly.
                          //
                          //
                          //   await Share.share('$dynamicLink');
                          // setState(() {
                          //   isLoading = false;
                          // });
                          // print("Dynamic Link: $dynamicLink");
                        },
                  icon: Icon(Icons.share),
                  iconSize: 35.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.universalDataModel.title.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.universalDataModel.categories,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 12.0),
                const Text(
                  '⭐ ⭐ ⭐ ⭐',
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(height: 15.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: <Widget>[
                //     Column(
                //       children: const <Widget>[
                //         Text(
                //           'Year',
                //           style: TextStyle(
                //             color: Colors.black54,
                //             fontSize: 16.0,
                //           ),
                //         ),
                //         SizedBox(height: 2.0),
                //
                //       ],
                //     ),
                //     Column(
                //       children: const <Widget>[
                //         Text(
                //           'Country',
                //           style: TextStyle(
                //             color: Colors.black54,
                //             fontSize: 16.0,
                //           ),
                //         ),
                //         SizedBox(height: 2.0),
                //
                //       ],
                //     ),
                Column(
                  children: <Widget>[
                    const Text(
                      'Length',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 2.0),
                    Text(
                      '${widget.universalDataModel.length} min',
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 15.0),
                    ContactUsWidget(
                        icon: FontAwesomeIcons.whatsapp,
                        buttonText: 'Contact us',
                        contactUsWhatsappFunction: openwhatsapp),
                    SizedBox(height: 25.0),
                    Container(
                      height: 120.0,
                      child: SingleChildScrollView(
                        child: Text(
                          widget.universalDataModel.description,
                          style: const TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }

  Future<Uri> createDynamicLink({required String userName}) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      // This should match firebase but without the username query param
      uriPrefix: 'https://sahilolivet.page.link/',
      // This can be whatever you want for the uri, https://yourapp.com/groupinvite?username=$userName
      link: Uri.parse('https://sahilolivet.page.link/?username=$userName'),
      androidParameters: AndroidParameters(
        packageName: 'com.example.gifts_hub',
        minimumVersion: 0,
      ),
      iosParameters: IosParameters(
        bundleId: 'com.test.demo',
        minimumVersion: '0',
        appStoreId: '',
      ),
    );
    final link = await parameters.buildUrl();
    final ShortDynamicLink shortenedLink =
        await DynamicLinkParameters.shortenUrl(
      link,
      DynamicLinkParametersOptions(
          shortDynamicLinkPathLength: ShortDynamicLinkPathLength.unguessable),
    );
    return shortenedLink.shortUrl;
  }

  ////Share Action function

  Future<bool> shareAction() async {
    var dynamicLink =
        await createDynamicLink(userName: widget.universalDataModel.imageUrl);
    // dynamicLink has been generated. share it with others to use it accordingly.

    await Share.share('$dynamicLink');
    return true;
  }
////contact us button function

  Future<bool> contactUsAction() async {
    var dynamicLink =
        await createDynamicLink(userName: widget.universalDataModel.imageUrl);

    var whatsapp = "+919431734294";
    var whatsappURl_android = "whatsapp://send?phone=" +
        whatsapp +
        "&text=hello Sahil, I am interested in this work " +
        '$dynamicLink';
    if (await canLaunch(whatsappURl_android)) {
      await launch(whatsappURl_android);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("whatsapp not installed")));
    }
    return true;
  }

  openwhatsapp() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });
    await contactUsAction();
    Navigator.pop(context);
  }
}
