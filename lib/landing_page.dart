import 'package:flutter/material.dart';
import 'package:video_conferencing/call_page.dart';
// import 'package:video_conferencing/themes/light_mode.dart';
// import 'package:video_conferencing/themes/dark_mode.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  TextEditingController calledController = TextEditingController();
  TextEditingController useridController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  bool _switchValue=false;

  Color iconColor = Colors.white;
  Color bgColor = Colors.black;

  void Change(){
    if(_switchValue == false){
      iconColor = Colors.white;
      bgColor = Colors.black;
    }
    else{
      iconColor = Colors.black;
      bgColor = Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: lightTheme,
      //  darkTheme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 120,
          elevation: 0,
          backgroundColor: Colors.indigo[300],
          title: Text(
            'Video Conferencing',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(

                width: MediaQuery.of(context).size.width*0.6,
                // padding: const EdgeInsets.fromLTRB(30, 20, 40, 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.6,
                      spreadRadius: 0.5,
                      // offset:Offset.infinite,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  controller: calledController,
                  decoration: InputDecoration(
                    hintText: "please enter call id",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    // contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height: 20), // Add space between text fields
              Container(
                width: MediaQuery.of(context).size.width *0.6,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.6,
                      spreadRadius: 0.5,
                      // offset:Offset.infinite,
                    )
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  controller: useridController,
                  decoration: InputDecoration(
                    hintText: "please enter user id",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  ),
                ),
              ),
              SizedBox(height: 20), // Add space between text fields
              Container(
                width: MediaQuery.of(context).size.width *0.6,
                padding: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 0.6,
                      spreadRadius: 0.5,
                      // offset:Offset.infinite,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: "please enter user name",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  ),
                ),
              ),
              SizedBox(height: 20), // Add space between text fields and button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CallPage(
                        callID: calledController.text,
                        userid: useridController.text,
                        username: usernameController.text,
                      ),
                    ),
                  );
                },
                child: Text("Join the call"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
