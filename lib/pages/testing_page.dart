import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifts_hub/pages/testing_two.dart';
import 'package:gifts_hub/services/dynamic_link_service.dart';

class Testing extends StatefulWidget {
  String imageUrl;


   Testing({required this.imageUrl});

  @override
  State<Testing> createState() => _TestingState();

}

class _TestingState extends State<Testing> with WidgetsBindingObserver {


  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }


  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if (state == AppLifecycleState.resumed) {
    //   setState(() {
    //     imageURL = widget.imageUrl;
    //     print(imageURL+ 'on resumee-----------------------------------------------------------');
    //     print(ModalRoute.of(context)!.settings.name);
    //   });
    // }
    if(state ==AppLifecycleState.paused){
      Navigator.pop(context);
     // Get.to(()=>TestingTwo(imageUrl: widget.imageUrl));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 57.6,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    // padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),
                  Text('hello'
                  ),
                  IconButton(
                    // padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => print('Add to Favorites'),
                    icon: Icon(Icons.favorite_border),
                    iconSize: 30.0,
                    color: Colors.black,
                  ),

                ],
              ),

            ),
            Container(
                height: 60,
                width: 60, child: Image(image: NetworkImage(widget.imageUrl))),
          ],
        ),
      ),
    );
  }
}






































//
// void initDynamicLinks() async {
//   FirebaseDynamicLinks.instance.onLink(
//       onSuccess: (PendingDynamicLinkData? dynamicLink) async {
//         final Uri? deepLink = dynamicLink?.link;
//
//         if (deepLink != null) {
//           Navigator.pushNamed(context, deepLink.path);
//         }
//       },
//       onError: (OnLinkErrorException e) async {
//         print('onLinkError');
//         print(e.message);
//       }
//   );
//
//   final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
//   final Uri? deepLink = data?.link;
//
//   if (deepLink != null) {
//     Navigator.pushNamed(context, deepLink.path);
//   }
// }