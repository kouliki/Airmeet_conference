import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_conferencing/landing_page.dart';
import 'package:video_conferencing/pages/join.dart';
import 'package:video_conferencing/pages/navbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isLoading = true; // Define a loading state




  //// connecting to google calendar //////

  void _launchPlayStore() async {
    String appUrl = 'https://play.google.com/store/apps/details?id=com.google.android.calendar'; // Example Google Calendar app URL

    if (await canLaunch(appUrl)) {
      await launch(appUrl);
    } else {
      throw 'Could not launch $appUrl';
    }
  }


  /// generating meeting links automatically ////



  String meetLink = ''; // Initialize meetLink variable

  String generateLink() {
    const String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final Random random = Random();
    String randomLink = '';

    // Generate a random string of length 10
    for (int i = 0; i < 10; i++) {
      randomLink += chars[random.nextInt(chars.length)];
    }

    // Combine the random string with the base URL
    String generatedLink = 'meet.google.com/$randomLink';

    // Update the meetLink variable
    setState(() {
      meetLink = generatedLink;
    });

    return meetLink;
  }






  List images=[
    "welcome_3.jpeg",
    "welcome_2.jpeg",
  ];
  List text=[
    'Get a link that you can ',
    "Your meeting is safe",
  ];

  List text_1=[
    'Tap New Meeting to get a link that you ',
    'No one can join a meeting unless invited',
  ];
  @override

  void initState() {
    super.initState();
    // Simulate a delay to load data (or any other async operation)
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        // leading: IconButton(
        //   onPressed: (){},
        //   icon: Icon(Icons.menu),
        // ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                 padding: const EdgeInsets.only(right: 120,top: 10),
                child: Center(child: Text("Meet", style: GoogleFonts.alegreyaSans(fontSize: 25,color: Colors.black),),
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipOval(child: Image.asset('images/image_1.jpeg',height: 60,width: 60,fit: BoxFit.cover),
                ),

              )
            ],
          ),
        ],
      ),

      body: isLoading
          ? Center(
        child: SpinKitCircle(
          color: Colors.blue,
          size: 50.0,
        ),
      ): PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (_ ,index){
          return Container(
            // color: Colors.red,
            padding: EdgeInsets.only(left: 8,right: 30,top: 20),
            child: Column(
              // above buttons //
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {

                        //// bottom sheet ///


                        showModalBottomSheet(
                            context: context, builder: (BuildContext context){
                              return Container(
                                // padding: EdgeInsets.all(8.0),
                                width: double.maxFinite,
                                height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                // color: Colors.white,
                                 child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                     // mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[

                                      SizedBox(height: 30,),
                                      ListTile(
                                        leading: Icon(Icons.link,size: 18,),
                                        title: Text('Get a meeting link to share',style: GoogleFonts.arima(fontSize: 16,fontWeight: FontWeight.bold),),
                                        onTap: () {
                                          // Navigator.push(context,MaterialPageRoute(builder: (context)=> SharePage()))


                                          showDialog(
                                          context: context,
                                          builder: (context) {
                                          return StatefulBuilder(
                                          builder: (context, setState) {
                                            // String meetLink = ''; // Declare meetLink variable here

                                            return AlertDialog(
                                              title: Text(
                                                'Here is your link to your meeting',
                                                style: TextStyle(fontSize: 16),
                                              ),
                                              content: SingleChildScrollView(
                                                child: Container(
                                                  // color: Colors.blueAccent,
                                                  height: 250,
                                                  child: Column(

                                                    children: [
                                                      Text(
                                                          'Copy this link and send it to people that'),
                                                      Text(
                                                          'you want to meet with. Make sure that you save it so that you can use it later, too.'),
                                                      SizedBox(height: 10,),
                                                      //// generate link ///




                                                      ElevatedButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            meetLink = generateLink(); // Update meetLink
                                                          });
                                                        },
                                                        child: Text(
                                                            'Generate Random Link'),
                                                      ),
                                                     // SizedBox(height: 10),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(child: Text(meetLink),
                                                          ),

                                                          ////// copy to clipboard //
                                                          IconButton(
                                                              onPressed: (){
                                                                Clipboard.setData(ClipboardData(text: meetLink));
                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Link copied to clipboard')));
                                                              },
                                                              icon: Icon(Icons.copy)),
                                                        ],
                                                      ),
                                                      // SizedBox(height: 5,),
                                                      ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                          // backgroundColor: Colors.indigo[300],
                                                          shadowColor: Colors.black54,
                                                        ),
                                                        onPressed: (){},

                                                        child: Row(
                                                          mainAxisSize: MainAxisSize.min,
                                                          children: [
                                                            IconButton(
                                                              onPressed: () {
                                                                Share.share(meetLink);
                                                              },
                                                              icon: Icon(Icons.share),
                                                            ),
                                                            SizedBox(width: 8), // Add some space between the icon and the text
                                                            Text('Share your invitation',style: GoogleFonts.arima(fontWeight: FontWeight.bold),),
                                                          ],
                                                        ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              actions: [
                                                TextButton(onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                    child: Text('OK')
                                                )
                                              ],
                                            );
                                          });
                                          });
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.video_call,size: 18,),
                                        title: Text('Start an instant meeting',style: GoogleFonts.arima(fontSize: 16,fontWeight: FontWeight.bold),),
                                        onTap: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context)=> LandingPage())
                                          // Handle onTap for settings
                                          );},
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.calendar_today_rounded,size: 18,),
                                        title: Text('Schedule in Google Calendar',style: GoogleFonts.arima(fontSize: 16,fontWeight: FontWeight.bold),),
                                        onTap: () {
                                          _launchPlayStore(); // Call function to open Google Calendar link
                                        },
                                      ),
                                    ],
                                  ),
                                 )

                              );
                        });
                      },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(114, 47, 55,1),side: BorderSide.none,shape: StadiumBorder()
              ),
                      child: Row(
                        children: [
                          // Icon(
                          //   Icons.phone,
                          //   color: Colors.black,
                          //   size: 16,
                          // ),
                          SizedBox(width: 14,),
                          Text('New Meeting',style: TextStyle(
                              color: Colors.white,fontSize: 16
                          ),),
                        ],
                      ),
                ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> JoinPage()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,side: BorderSide(
                        style: BorderStyle.solid,color: Colors.brown
                      ),shape: StadiumBorder()
                      ),
                      child: Row(
                        children: [
                          // Icon(
                          //   Icons.phone,
                          //   color: Colors.black,
                          //   size: 16,
                          // ),
                          SizedBox(width: 8,),
                          Text('Join with a code',style: TextStyle(
                              color: Colors.black,fontSize: 16
                          ),),
                        ],
                      ),
                    ),

              ],
            ),
            SizedBox(height: 90,),
            Stack(
            children: [
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: SizedBox(width: 180,height: 180,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: AssetImage(
                          'images/'+images[index]),
                      fit: BoxFit.cover
                      ,
                    )
                ),
              ),
            ),

            ],
          ),
                if (index == 0) // Show text only on the first page
                  Padding(
                    padding: const EdgeInsets.only(left: 59),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Text(
                          text[index],
                          style: GoogleFonts.amethysta(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'share',
                          style: GoogleFonts.amethysta(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (index == 0) // Show text only on the first page
                  SizedBox(height: 20),
                if (index == 0) // Show text only on the first page
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Text(
                          'Tap New Meeting to get a link that you  ',
                          style: GoogleFonts.amethysta(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (index == 0) // Show text only on the first page
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      children: [
                        Text(
                          'can send to people that you want to',
                          style: GoogleFonts.amethysta(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'meet with ',
                          style: GoogleFonts.amethysta(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 20,),
                if (index == 1) // Show text only on the first page
                  Padding(
                    padding: const EdgeInsets.only(left: 70,top: 30),
                    child: Column(
                      children: [
                        Text(
                          'Your meeting is safe',
                          style: GoogleFonts.amethysta(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 44,),
                if (index == 1) // Show text only on the first page
                  Padding(
                    padding: const EdgeInsets.only(left: 50),
                    child: Column(
                      children: [
                        Text(
                          'No one can join a meeting unless invited',
                          style: GoogleFonts.amethysta(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'or admitted by the host ',
                          style: GoogleFonts.amethysta(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),


                SizedBox(height: 140),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(2, (indexDots) {
                    return Container(
                      /// index dots slider ///
                      margin: EdgeInsets.only(left: 4, right: 4),
                      height: 6,
                      width: index == indexDots ? 8 : 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDots
                            ? Color.fromRGBO(168, 66, 45,1)
                            : Color.fromRGBO(168, 66, 45,1).withOpacity(0.3),
                      ),
                    );
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}