// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:gifts_hub/models/our_videos._model.dart';
//
// class OurVideosProvider with ChangeNotifier {
//   List<OurVideosModel> _ourvideos = [];
//
//   List<OurVideosModel> get ourVideosGetter {
//     return [..._ourvideos];
//   }
//
//   Future<void> fetchOurVideos() async {
//     await Firebase.initializeApp();
//     return await FirebaseFirestore.instance
//         .collection('ourVideos')
//         .get()
//         .then((QuerySnapshot ourVideosSnapShot) {
//       ourVideosSnapShot.docs.forEach((element) {
//         _ourvideos.insert(
//             0,
//             OurVideosModel(
//                 videoId: element.get('videoId'),
//                 videoTitle:element.get('videoTitle'),
//                 videoDescription: element.get('videoDescription'),
//                 videoGenre:element.get('videoGenre'),
//                 videoLength:element.get('videoLength'),
//                 videoRating:element.get('videoRating'),
//                 videoCategory:element.get('videoCategory'),
//                 videoThumbnail: element.get('videoThumbnail')));
//       });
//     });
//   }
// }
