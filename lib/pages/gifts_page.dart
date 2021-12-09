import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifts_hub/models/favourites_page_model.dart';
import 'package:gifts_hub/pages/details_page.dart';
import 'package:gifts_hub/providers/favourites_page_list_item_provider.dart';
import 'package:provider/provider.dart';

class GiftsPage extends StatefulWidget {
  const GiftsPage({Key? key}) : super(key: key);

  @override
  _GiftsPageState createState() => _GiftsPageState();
}

class _GiftsPageState extends State<GiftsPage> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    final favPageList = Provider.of<FavouritesPageListItemProvider>(context);
    bool itemsInFavPage = favPageList.favListGetter.isEmpty;

    return itemsInFavPage
        ? Text('gifts page')
        : SingleChildScrollView(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: favPageList.favListGetter.length,
              itemBuilder: (BuildContext context, int index) {
                FavouritePageModel favPageItem =
                    favPageList.favListGetter[index];
                return GestureDetector(
                  onTap: () {
                    Get.to(() => DetailsPage(
                        universalDataModel: favPageList.favListGetter[index]));
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                        height: 180.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      width: 120.0,
                                      child: Text(
                                        favPageItem.title,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        '\$${favPageItem.price}',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'per pax',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                favPageItem.categories,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              _buildRatingStars(favPageItem.rating),
                              SizedBox(height: 10.0),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xffadcfff),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      favPageItem.length,
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  Container(
                                    padding: EdgeInsets.all(5.0),
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      color: Color(0xffadcfff),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      favPageItem.length,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      favPageItem.isLiked = false;
                                      favPageList.favListItemsRemover(
                                          FavouritePageModel(
                                              imageUrl: favPageItem.imageUrl,
                                              title: favPageItem.title,
                                              price: favPageItem.price,
                                              description:
                                                  favPageItem.description,
                                              categories:
                                                  favPageItem.categories,
                                              rating: favPageItem.rating,
                                              length: favPageItem.length,
                                              isLiked: favPageItem.isLiked));
                                    },
                                    icon: Icon(Icons.close_rounded),
                                    // iconSize: 30.0,
                                    color: Colors.black,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 20.0,
                        top: 15.0,
                        bottom: 15.0,
                        child: Hero(
                          tag: favPageItem.imageUrl,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image(
                              width: 110.0,
                              image: NetworkImage(
                                favPageItem.imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
    ;
  }
}
