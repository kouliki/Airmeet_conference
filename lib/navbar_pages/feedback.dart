import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {

  bool isLoading = true; // Define a loading state


  final TextEditingController _feedbackController = TextEditingController();

  void _submitFeedback() {
    // Handle feedback submission logic here
    final feedback = _feedbackController.text;

    if (feedback.isNotEmpty) {
      // Here you can send feedback to your server or database
      // For example, using an HTTP request
      // await sendFeedbackToServer(feedback);

      // Show a confirmation message to the user
      Fluttertoast.showToast(
        msg: 'Feedback submitted successfully',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

      // Clear the text field
      _feedbackController.clear();
    } else {
      Fluttertoast.showToast(
        msg: 'Please enter your feedback',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

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
        title: Text('Feedback', style: GoogleFonts.arima()),
        backgroundColor: Colors.white,
      ),
      body:isLoading
          ? Center(
        child: SpinKitCircle(
          color: Colors.blue,
          size: 50.0,
        ),
      )
          :  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Please provide your feedback:',
              style: GoogleFonts.arima(fontSize: 18),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter your feedback here',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitFeedback,
              child: Text('Submit Feedback', style: GoogleFonts.arima()),
            ),
          ],
        ),
      ),
    );
  }
}
