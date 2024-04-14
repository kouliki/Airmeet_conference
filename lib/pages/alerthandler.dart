import 'package:flutter/material.dart';
// didnot work //
class AlertHandler {
  static void showInvalidLinkAlert(BuildContext context, bool isValidLink) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isValidLink ? 'Invalid Link' : 'Valid Link'),
          content: Text(isValidLink ? 'The link you entered is invalid. Please try again.' : 'The link you entered is valid.'),
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
}
