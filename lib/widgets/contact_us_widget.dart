import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsWidget extends StatefulWidget {
   late final IconData icon;
   late final String buttonText;
   final Function contactUsWhatsappFunction ;


   ContactUsWidget({required this.icon, required this.buttonText, required this.contactUsWhatsappFunction});

  @override
  State<ContactUsWidget> createState() => _ContactUsWidgetState();
}

class _ContactUsWidgetState extends State<ContactUsWidget> {
  get borderRadius => BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        borderRadius: borderRadius,
        child: InkWell(
          onTap: () {
            widget.contactUsWhatsappFunction();
          },
          child: Container(
            padding: EdgeInsets.all(0.0),
            height: 50.0,//MediaQuery.of(context).size.width * .08,
            width: 200.0,//MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            child: Row(
              children: <Widget>[
                LayoutBuilder(builder: (context, constraints) {
                  print(constraints);
                  return Container(
                    height: constraints.maxHeight,
                    width: constraints.maxHeight,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: borderRadius,
                    ),
                    child: Icon(
                      widget.icon,
                      color: Colors.white,
                    ),
                  );
                }),
                Expanded(
                  child: Text(
                    widget.buttonText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



}
