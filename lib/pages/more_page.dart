import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gifts_hub/consts/font_style.dart';
import 'package:gifts_hub/providers/dark_theme_provider.dart';
import 'package:gifts_hub/widgets/reusable_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {



  @override
  Widget build(BuildContext context) {

    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Text('Profile',
              style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                color: Colors.black54,
                fontSize: 16.8,
              )),
          actions: const <Widget>[
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(
                Icons.shopping_bag,
                color: Colors.redAccent,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: CircleAvatar(
                // minRadius: 80,
                // maxRadius: 100,
                radius: 70,
                backgroundImage: AssetImage('images/2.png'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Sahil kumar',
              style: FontStyles.myTextStyle1,
            ),
            ReusableCard(
              icon: Icons.email,
              cardText: 'Sahilkumar@gmail.com',
              color: Colors.redAccent,
            ),
            ReusableCard(
              icon: Icons.phone,
              cardText: '+44 123 456 789',
              color: Colors.redAccent,
            ),

            const Divider(
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            ListTileSwitch(
              value: themeChange.darkTheme,
              leading: const Icon(CupertinoIcons.moon),
              onChanged: (value) {
                setState(() {

                  themeChange.darkTheme = value;
                  print('dark mode is on');
                });
              },
              visualDensity: VisualDensity.comfortable,
              switchType: SwitchType.cupertino,
              switchActiveColor: Colors.indigo,
              title: Text('Dark mode'),
            ),
          ],
        ));
  }
}
