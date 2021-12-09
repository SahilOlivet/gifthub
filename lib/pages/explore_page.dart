import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gifts_hub/consts/configuration.dart';
import 'package:gifts_hub/consts/font_style.dart';
import 'package:gifts_hub/models/image_icon_model.dart';
import 'package:gifts_hub/models/images_and_title_model.dart';
import 'package:gifts_hub/models/new_data_provider.dart';
import 'package:gifts_hub/models/recommended_model.dart';
import 'package:gifts_hub/pages/category_items_listing_page.dart';
import 'package:gifts_hub/pages/details_page.dart';
import 'package:gifts_hub/providers/our_videos_provider.dart';
import 'package:gifts_hub/widgets/categories_items_card.dart';
import 'package:gifts_hub/widgets/explorepage_rectangular_card.dart';
import 'package:gifts_hub/widgets/horizontal_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final _pageController =
      PageController(viewportFraction: 0.877, initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (_currentPage < recommendations.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  List<ImageIconExplorePage> iconImages = [
    ImageIconExplorePage(
        imageUrl: 'images/wedicon.jpg', imageTitle: 'Wedding card'),
    ImageIconExplorePage(
        imageUrl: 'images/imageicon.jpg', imageTitle: 'Engagement'),
    ImageIconExplorePage(
        imageUrl: 'images/wedicon.jpg', imageTitle: 'Caricature'),
    ImageIconExplorePage(
        imageUrl: 'images/imageicon.jpg', imageTitle: 'Anniversary'),
  ];

  Widget buildImageIcon(int index) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CategoryItemsListingPage(category: iconImages[index].imageTitle)),
      ),


      //IMPLEMENT GESTURE DETECTOR


      child: Container(
        margin: EdgeInsets.only(left: 28),
        height: 100,
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(60.0)),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(80.0),
              child: Image(
                width: 70.0,
                height: 70,
                image: AssetImage(iconImages[index].imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              iconImages[index].imageTitle,
            )
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xfff5f5f5),
            ),
            child: ListView(
              //physics: const BouncingScrollPhysics(),
              children: [
                //container for hamburger icon and search icon
                Container(
                  height: 57.6,
                  margin:
                      const EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 57.6,
                        width: 57.6,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            color: const Color(0x080a0928)),
                        child: const Image(
                            image: AssetImage('images/appicon.png'),
                            fit: BoxFit.cover),
                      ),
                      Container(
                        height: 57.6,
                        width: 57.6,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9.6),
                            color: const Color(0x080a0928)),
                        child: const Image(
                          image: AssetImage('images/search_icon.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),

                //Homepage title text
                Padding(
                  padding: EdgeInsets.only(left: 28),
                  child: Text(
                    'Welcome\n Sahil',
                    style: FontStyles.myTextStyle4,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text(
                      'Featured Videos',
                      style: FontStyles.myTextStyle3,
                    ),
                  ),
                ),

                //image slider/////////////////////////////////////////////////
                Container(
                  height: 218.4,
                  margin: EdgeInsets.only(top: 16),
                  child: PageView(
                      physics: BouncingScrollPhysics(),
                      controller: _pageController,
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        recommendations.length,
                        (int index) => GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                  universalDataModel: recommendations[index]),
                            ),
                          ),
                          child: Hero(
                            tag: recommendations[index].imageUrl,
                            child: Container(
                              margin: EdgeInsets.only(right: 28.8),
                              width: 333.6,
                              height: 218.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9.6),
                                image: DecorationImage(
                                  image:
                                      NetworkImage(recommendations[index].imageUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                    bottom: 19.2,
                                    left: 19.2,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.8),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 19.3,
                                          sigmaY: 19.2,
                                        ),
                                        child: Container(
                                            height: 36,
                                            padding: const EdgeInsets.only(
                                                left: 16.72, right: 14.4),
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.slow_motion_video,
                                                  color: Color(0xffec2c2c),
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Text(
                                                  recommendations[index].title,
                                                  style: GoogleFonts.lato(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                    fontSize: 16.8,
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )),
                ),

                //image slider indicator///////////////////////////////////////////
                Padding(
                  padding: EdgeInsets.only(left: 28.8, top: 28.8),
                  child: SmoothPageIndicator(
                    count: recommendations.length,
                    controller: _pageController,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Color(0xFF8a8a8a),
                      dotColor: Color(0xFFababab),
                      dotHeight: 4.8,
                      dotWidth: 6,
                      spacing: 4.8,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    'Top Categories',
                    style: FontStyles.myTextStyle3,
                  ),
                ),
                SizedBox(height: 20),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: iconImages
                        .asMap()
                        .entries
                        .map((MapEntry map) => buildImageIcon(map.key))
                        .toList(),
                  ),
                ),

                SizedBox(height: 30),

                DestinationCarousel(),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    'Wedding Caricatures',
                    style: FontStyles.myTextStyle3,
                  ),
                ),

                CategoriesItemsCard(),

                //ExplorePageCard(),

                // const SizedBox(
                //   height: 20,
                // ),

                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    'Explore more',
                    style: FontStyles.myTextStyle3,
                  ),
                ),

                SizedBox(height: 15),

                //STAGGERED VIEW////////////////////////////////////////////
                // SingleChildScrollView(
                //   child: StaggeredGridView.countBuilder(
                //     crossAxisCount: 2,
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     mainAxisSpacing: 20,
                //     crossAxisSpacing: 20,
                //     padding: const EdgeInsets.symmetric(horizontal: 15),
                //     itemCount: newDataModelObject.length,
                //     itemBuilder: (cxt, index) => GestureDetector(onTap: () {
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => DetailsPage(
                //                 newDataModel: newDataModelObject[index])),
                //       );
                //       child:
                //       Stack(
                //         children: [
                //           Hero(
                //             tag: newDataModelObject[index].imageUrl,
                //             child: ClipRRect(
                //               borderRadius: BorderRadius.circular(10),
                //               child: Image(
                //                 image: NetworkImage(
                //                     newDataModelObject[index].imageUrl),
                //               ),
                //             ),
                //           ),
                //           Positioned(
                //             bottom: 10.2,
                //             left: 5.2,
                //             child: ClipRRect(
                //               borderRadius: BorderRadius.circular(4.8),
                //               child: BackdropFilter(
                //                 filter: ImageFilter.blur(
                //                   sigmaX: 19.3,
                //                   sigmaY: 19.2,
                //                 ),
                //                 child: Container(
                //                     height: 30,
                //                     padding: const EdgeInsets.only(
                //                         left: 5.72, right: 17.4),
                //                     alignment: Alignment.centerLeft,
                //                     child: Row(
                //                       children: [
                //                         const Icon(
                //                           Icons.star_rounded,
                //                           color: Color(0xfff1c447),
                //                         ),
                //                         const SizedBox(
                //                           width: 5,
                //                         ),
                //                         Text(
                //                           newDataModelObject[index].title,
                //                           style: GoogleFonts.lato(
                //                             fontWeight: FontWeight.w700,
                //                             color: Colors.white,
                //                             fontSize: 14,
                //                           ),
                //                         ),
                //                       ],
                //                     )),
                //               ),
                //             ),
                //           )
                //         ],
                //       );
                //     }),
                //     staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                //   ),
                // ),
                DestinationCarousel(),
              ],
            ),
          ),
        ));
  }
}

//custom tab bar with custom indicator
// Container(
//   height: 30,
//   margin: const EdgeInsets.only(left: 14.4, top: 28.8),
//   child: DefaultTabController(
//     length: 4,
//     child: TabBar(
//         labelPadding: EdgeInsets.only(left: 14.4, right: 14.4),
//         indicatorPadding:
//             EdgeInsets.only(left: 14.4, right: 14.4),
//         isScrollable: true,
//         labelColor: Color(0xFF000000),
//         unselectedLabelColor: Color(0xFF8a8a8a),
//         labelStyle: GoogleFonts.lato(
//           fontSize: 14,
//           fontWeight: FontWeight.w700,
//         ),
//         unselectedLabelStyle: GoogleFonts.lato(
//           fontSize: 12,
//           fontWeight: FontWeight.w700,
//         ),
//         indicator: BoxDecoration(
//           borderRadius: BorderRadius.circular(4.6),
//           color: const Color(0x080a0928),
//         ),
//         tabs: [
//           Tab(
//             child: Container(
//               child: const Text('Recommended'),
//             ),
//           ),
//           Tab(
//             child: Container(
//               child: const Text('Popular'),
//             ),
//           ),
//           Tab(
//             child: Container(
//               child: const Text('Most Viewed'),
//             ),
//           ),
//           Tab(
//             child: Container(
//               child: const Text('More Offers'),
//             ),
//           ),
//         ]),
//   ),
// ),
