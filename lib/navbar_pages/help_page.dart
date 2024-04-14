import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {

  bool isLoading = true; // Define a loading state
  @override

  /// loading icon //
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
      appBar: AppBar(
        title: Text('Help', style: GoogleFonts.arima()),
        backgroundColor: Colors.white,
      ),
      body: isLoading
          ? Center(
        child: SpinKitCircle(
          color: Colors.blue,
          size: 50.0,
        ),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'How can we help you?',
              style: GoogleFonts.arima(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Here are some common questions and issues you might have:',
              style: GoogleFonts.arima(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            ExpansionTile(
              title: Text('How to join a meeting?', style: GoogleFonts.arima(fontSize: 16)),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'To join a meeting, click on the "Join" button and enter the meeting code or URL provided by the host.',
                    style: GoogleFonts.arima(fontSize: 14),
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: Text('How to start a meeting?', style: GoogleFonts.arima(fontSize: 16)),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'To start a meeting, click on the "Start" button, give the meeting a title, and share the meeting code or URL with participants.',
                    style: GoogleFonts.arima(fontSize: 14),
                  ),
                ),
              ],
            ),
            // Add more FAQs as needed
            const SizedBox(height: 16.0),
            Text(
              'Need further assistance?',
              style: GoogleFonts.arima(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              'For additional support or questions, please contact us at:',
              style: GoogleFonts.arima(fontSize: 14),
            ),
            Text(
              'support@yourapp.com',
              style: GoogleFonts.arima(fontSize: 14, color: Colors.blue),
            ),
            // Add additional contact information or links if needed
          ],
        ),
      ),
    );
  }
}
