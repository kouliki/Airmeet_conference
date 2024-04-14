import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_conferencing/pages/alerthandler.dart';
import 'package:video_conferencing/call_page.dart';
import 'package:video_conferencing/pages/landing_join.dart';
import 'package:video_conferencing/landing_page.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  State<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  TextEditingController codeController = TextEditingController();

  void showInvalidCodeAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Invalid Code'),
          content: Text('The code you entered is invalid. Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool isValidCode(String code) {
    // Implement the logic to check the validity of the code
    // This is an example condition: the code should be non-empty and have exactly 12 characters
    return code.isNotEmpty && code.length == 12; // Example condition
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 120, top: 10),
                child: Center(
                  child: Text(
                    "Join with a code",
                    style: GoogleFonts.alegreyaSans(fontSize: 25, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Enter the code provided by the meeting organizer',
              style: GoogleFonts.arima(fontSize: 14),
            ),
            SizedBox(height: 10),
            TextField(
              controller: codeController,
              decoration: InputDecoration(
                hintText: 'Example: abc-mnop-xyz',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // String enteredCode = codeController.text.trim();
                // if (isValidCode(enteredCode)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LandingJoin(),
                    ));
                //   );
                // } else {
                //   showInvalidCodeAlert(context);
                //  }
              },
              child: Text('Join'),
            ),
          ],
        ),
      ),
    );
  }
}