import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_conferencing/pages/Home_Page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool isLoading = true; // Define a loading state

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

  void _showExitConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Exit'),
          content: Text('Do you want to exit the app?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                // Exit the app by popping all routes from the navigator stack
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
        child: SpinKitThreeBounce(
          color: Colors.blue,
          size: 50.0,
        ),
      )
          : Container(
        padding: EdgeInsets.only(top: 100, left: 50, right: 50),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('images/welcome_page.jpeg'),
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 30),
              Text(
                'Ready for a better',
                style: GoogleFonts.abel(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                'Meet?',
                style: GoogleFonts.abel(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to AirMeet, where seamless collaboration and effective meetings come together and provide a streamlined experience.',
                style: GoogleFonts.abel(fontSize: 16),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(
                    style: BorderStyle.solid,
                    color: Colors.brown,
                  ),
                  shape: StadiumBorder(),
                ),
                child: Text(
                  'Get it now',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: _showExitConfirmationDialog,
                child: Text('Maybe later'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
