import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_conferencing/Welcome_page.dart';
import 'package:video_conferencing/pages/Home_Page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with TickerProviderStateMixin{


  // animated text //

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //////// animation text //////////

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
    _navigatetchome();
  }

  _navigatetchome()async{
    await Future.delayed(Duration(milliseconds: 3500),(){});
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent,Colors.lightBlueAccent,Colors.lightGreenAccent,],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
              child: Image.asset(
                'images/image.gif',
                fit: BoxFit.cover,
                width: 300,
                height: 300,
              ),
            ),
              SizedBox(height: 30,),
              Text('Welcome to our Meeting App ! ',style: GoogleFonts.alatsi(fontSize: 20),),
        SizedBox(height: 20), // Add spacing between image and text
              FadeTransition(
                opacity: _animation,
                child: Text(
                  'AirMeet',
                  style: GoogleFonts.alata(fontSize: 30,fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 10,),
              Text('Connecting With People, Anywhere, Anytime',style: GoogleFonts.acme(fontSize: 16),),
              SizedBox(height: 10,),
              Text('Lets Make Meetings together !!!',style: GoogleFonts.acme(fontSize: 16),),
          ]),
          
        ),
        
      )

    );
  }
}
