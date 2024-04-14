import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'dart:math' as math;

/// for performing unique call id ///

final userID = math.Random().nextInt(10000).toString();


class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID,required this.userid,required this.username}) : super(key: key);
  final String callID;
  final String userid;
  final String username;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID:1605958427, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: "89e0abccdab3fc81e48edeb055d2d46f0cd92baa74fde0817c5938804a8964bb",
       // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userid,
      userName: username, // change user name accordingly
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
