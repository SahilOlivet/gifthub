import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gifts_hub/models/new_data_provider.dart';
import 'package:gifts_hub/pages/details_page.dart';

class CategoriesItemsCard extends StatefulWidget {
  const CategoriesItemsCard({Key? key}) : super(key: key);

  @override
  State<CategoriesItemsCard> createState() => _CategoriesItemsCardState();
}

class _CategoriesItemsCardState extends State<CategoriesItemsCard> {
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
    return SingleChildScrollView(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
        itemCount: newDataModelObject.length,
        itemBuilder: (BuildContext context, int index) {
          NewDataModel newCard = newDataModelObject[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsPage(
                        universalDataModel: newDataModelObject[index],
                      )),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                  height: 170.0,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                width: 120.0,
                                child: Text(
                                  newCard.title,
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
                                  '\$${newCard.price}',
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
                          newCard.categories,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        _buildRatingStars(newCard.rating),
                        SizedBox(height: 10.0),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 70.0,
                              decoration: BoxDecoration(
                                color: Color(0xffadcfff),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                newCard.length,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              width: 70.0,
                              decoration: BoxDecoration(
                                color: Color(0xffadcfff),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                newCard.length,
                              ),
                            ),
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
                    tag: newCard.imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image(
                        width: 110.0,
                        image: NetworkImage(
                          newCard.imageUrl,
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
  }
}
