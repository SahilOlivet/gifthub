import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gifts_hub/consts/configuration.dart';
import 'package:gifts_hub/models/images_and_title_model.dart';
import 'package:gifts_hub/models/new_data_provider.dart';
import 'package:gifts_hub/pages/details_page.dart';

class ExplorePageCard extends StatelessWidget {
  const ExplorePageCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              // scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              itemCount: newDataModelObject.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                NewDataModel newCard = newDataModelObject[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailsPage(
                            universalDataModel: newDataModelObject[index])),
                  ),
                  child: Container(
                    height: 240,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Hero(
                                tag: newCard.imageUrl,
                                child: Container(
                                  margin: EdgeInsets.only(top: 20, bottom: 8),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      height: 240.0,
                                      width: 240.0,
                                      image: NetworkImage(newCard.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Stack(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 60, bottom: 20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: shadowList,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
