// import 'dart:async';
// import 'package:demoapp/register.dart';
// import 'package:flutter/material.dart';
// import 'package:demoapp/reusable_widgets/reusable_widgets.dart';
// import 'package:demoapp/utils/color_utils.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(
//       Duration(seconds: 1), // Change the duration to your desired duration
//       () => Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => Register()),
//       ),
//     );
//   }

//   @override
//   // Widget build(BuildContext context) {
//   //   return Container(
//   //     color: Color.fromARGB(255, 198, 90, 208),
//   //     child: Center(
//   //       child: Image.asset(
//   //         'assets/images/logo1.png', // Replace this with your Flutter logo
//   //         width: 200.0,
//   //         height: 200.0,
//   //       ),
//   //     ),
//   //   );
//   // }
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color.fromARGB(255, 198, 90, 208),
//             Color.fromARGB(255, 120, 18, 166),
//           ],
//         ),
//       ),
//       child: Center(
//         child: ColorFiltered(
//           colorFilter: ColorFilter.mode(Colors.white, BlendMode.modulate),
//           child: Image.asset(
//             'assets/images/logo1.png',
//             width: 200.0,
//             height: 200.0,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:demoapp/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1), // Change the duration to your desired duration
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      ),
    );
  }

  Widget logoWidget(String imageName) {
    return Image.asset(
      imageName,
      fit: BoxFit.fitWidth,
      width: 240,
      height: 240,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 198, 90, 208),
            Color.fromARGB(255, 120, 18, 166),
          ],
        ),
      ),
      child: Center(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.modulate),
          child: logoWidget(
              'assets/images/logo1.png'), // Call the logoWidget function
        ),
      ),
    );
  }
}
