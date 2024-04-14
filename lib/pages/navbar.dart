import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_conferencing/navbar_pages/feedback.dart';
import 'package:video_conferencing/navbar_pages/help_page.dart';
import 'package:video_conferencing/navbar_pages/settings.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
        padding: const EdgeInsets.all(0.0),
    child: Container(
    color: Colors.white,

    child: ListView(
    padding: EdgeInsets.only(top: 50,left: 30),

    children: [
      Text('Google Meet',style: GoogleFonts.arima(fontSize: 20,color: Colors.black),),
      Divider(height: 10),
      SizedBox(height: 10,),
      ListTile(
        leading: Icon(Icons.settings,size: 16,),
        title: Text('Settings',style: TextStyle(fontSize: 16),),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsPage()));
        },
      ),
      ListTile(
        leading: Icon(Icons.feedback_outlined,size: 16,),
        title: Text('Send feedback',style: TextStyle(fontSize: 16),),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedbackPage()));
        },
      ),
      ListTile(
        leading: Icon(Icons.help_outline,size: 18,),
        title: Text('Help',style: TextStyle(fontSize: 18),),
        onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=>HelpPage()));
        },
      ),

    ],

    ),

        )
    )
    );
  }
}
