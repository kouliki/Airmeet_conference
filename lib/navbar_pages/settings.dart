import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool isLoading = true; // Define a loading state


  // Example settings variables
  bool isDarkTheme = false;
  bool isMirroring = false;
  String selectedLanguage = 'English';
  String selectedCamera = 'Front Camera';
  String selectedMicrophone = 'Default Microphone';
  String selectedSpeaker = 'Default Speaker';

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
        title: Text('Settings', style: GoogleFonts.arima()),
        backgroundColor: Colors.white,
      ),
      body:isLoading
          ? Center(
        child: SpinKitCircle(
          color: Colors.blue,
          size: 50.0,
        ),
      )
          :  ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          // Theme settings
          SwitchListTile(
            title: Text('Dark Theme', style: GoogleFonts.arima()),
            value: isDarkTheme,
            onChanged: (value) {
              setState(() {
                isDarkTheme = value;
                // Handle theme change logic here
              });
            },
          ),
          // Language selection
          ListTile(
            title: Text('Language', style: GoogleFonts.arima()),
            subtitle: Text(selectedLanguage, style: GoogleFonts.arima()),
            onTap: () {
              // Handle language selection here
            },
          ),
          // Video settings
          ListTile(
            title: Text('Camera', style: GoogleFonts.arima()),
            subtitle: Text(selectedCamera, style: GoogleFonts.arima()),
            onTap: () {
              // Handle camera selection here
            },
          ),
          SwitchListTile(
            title: Text('Mirror Video', style: GoogleFonts.arima()),
            value: isMirroring,
            onChanged: (value) {
              setState(() {
                isMirroring = value;
                // Handle mirror video logic here
              });
            },
          ),
          // Audio settings
          ListTile(
            title: Text('Microphone', style: GoogleFonts.arima()),
            subtitle: Text(selectedMicrophone, style: GoogleFonts.arima()),
            onTap: () {
              // Handle microphone selection here
            },
          ),
          ListTile(
            title: Text('Speaker', style: GoogleFonts.arima()),
            subtitle: Text(selectedSpeaker, style: GoogleFonts.arima()),
            onTap: () {
              // Handle speaker selection here
            },
          ),
          // Add more settings as needed
        ],
      ),
    );
  }
}
