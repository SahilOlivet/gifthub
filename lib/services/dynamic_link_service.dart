//
//
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:gifts_hub/pages/testing_page.dart';
//
// class DynamicLinkPro with ChangeNotifier{
//
//   late String _imageURL;
//   String get imageUrlGetter =>_imageURL;
//
//   set imageUrlSetter(String imgUrl){
//     _imageURL = imgUrl;
//     notifyListeners();
//   }
//
//
//   void initDynamicLinks() async {
//     FirebaseDynamicLinks.instance.onLink(
//         onSuccess: (PendingDynamicLinkData? dynamicLink) async {
//            Uri? deepLink = dynamicLink?.link;
//
//           if (deepLink != null) {
//             final queryParams = deepLink.queryParameters;
//             if(queryParams.isNotEmpty) {
//               Get.to(Testing(imageUrl: queryParams["username"]!));
//               String userName = queryParams["username"]!;
//               // verify the username is parsed correctly
//               print("My users username is: $userName and this is onLink method");
//
//             }
//           }
//         },
//         onError: (OnLinkErrorException e) async {
//           print('onLinkError');
//           print(e.message);
//         }
//     );
//
//     final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
//     final Uri? deepLink = data?.link;
//
//     if (deepLink != null) {
//       final queryParams = deepLink.queryParameters;
//       if(queryParams.isNotEmpty) {
//
//         Get.to(Testing(imageUrl: queryParams["username"]!));
//         String userName = queryParams["username"]!;
//         // verify the username is parsed correctly
//         print("My users username is: $userName and this is getInitialLink method");
//       }
//     }
//   }
//
//
//
//
//
//
//
//
//
//
//   //
//   // Future<void> fetchLinkData() async {
//   //
//   //
//   //
//   //   // This will handle incoming links if the application is already opened
//   //   FirebaseDynamicLinks.instance.onLink(onSuccess: (PendingDynamicLinkData? dynamicLink) async {
//   //     handleLinkData(dynamicLink);},
//   //     );
//   //
//   //   // FirebaseDynamicLinks.getInitialLInk does a call to firebase to get us the real link because we have shortened it.
//   //   final PendingDynamicLinkData? link = await FirebaseDynamicLinks.instance.getInitialLink();
//   //
//   //
//   //   // This link may exist if the app was opened fresh so we'll want to handle it the same way onLink will.
//   //  handleLinkData(link);
//   //
//   // }
//   //
//   //
//   //
//   // void handleLinkData(PendingDynamicLinkData? data) {
//   //   final Uri? uri = data?.link;
//   //   print(uri);
//   //   if(uri != null) {
//   //
//   //     final queryParams = uri.queryParameters;
//   //     if(queryParams.isNotEmpty) {
//   //       Get.to(Testing(imageUrl: queryParams["username"]!));
//   //       String userName = queryParams["username"]!;
//   //       // verify the username is parsed correctly
//   //       print("My users username is: $userName");
//   //     }}
//   //   onError: (OnLinkErrorException e) async {
//   //     print('onLinkError');
//   //     print(e.message);
//   //   };
//
//
//
//
//
//   }
//
//
//
//
//
//
//
//
//
//
//
//
//   // Future<Uri> createDynamicLink({required String userName}) async {
//   //   final DynamicLinkParameters parameters = DynamicLinkParameters(
//   //     // This should match firebase but without the username query param
//   //     uriPrefix: 'https://sahilolivet.page.link/',
//   //     // This can be whatever you want for the uri, https://yourapp.com/groupinvite?username=$userName
//   //     link: Uri.parse('https://sahilolivet.page.link/?username=$userName'),
//   //     androidParameters: AndroidParameters(
//   //       packageName: 'com.example.gifts_hub',
//   //       minimumVersion: 1,
//   //     ),
//   //     iosParameters: IosParameters(
//   //       bundleId: 'com.test.demo',
//   //       minimumVersion: '1',
//   //       appStoreId: '',
//   //     ),
//   //   );
//   //   final link = await parameters.buildUrl();
//   //   final ShortDynamicLink shortenedLink = await DynamicLinkParameters.shortenUrl(
//   //     link,
//   //     DynamicLinkParametersOptions(shortDynamicLinkPathLength: ShortDynamicLinkPathLength.unguessable),
//   //   );
//   //   return shortenedLink.shortUrl;
//   // }
