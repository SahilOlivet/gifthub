
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontStyles {
  static  TextStyle myTextStyle1 =   GoogleFonts.lato(
  fontWeight: FontWeight.w700,
  color: Colors.black,
  fontSize: 25);
  static TextStyle myTextStyle2 = TextStyle(
    color: Colors.teal.shade900,
    fontFamily: 'Source Sans Pro',
    fontSize: 20.0,
  );
  static TextStyle myTextStyle3 = GoogleFonts.lato(

    fontWeight: FontWeight.w600,
    color: Colors.black,

    fontSize: 17.0,
  );
  static TextStyle myTextStyle4 = const TextStyle(
      fontSize: 35, fontWeight: FontWeight.w500
  );

}



// style: TextStyle(
// fontFamily: 'Circular',
// fontSize: 18.0,
// fontWeight: FontWeight.w800,
// letterSpacing: 1.2,
// color: Colors.black54