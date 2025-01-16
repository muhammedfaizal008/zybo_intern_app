import 'package:flutter/material.dart';
import 'package:zybo_intern_app/utils/images_constants.dart';
import 'package:zybo_intern_app/view/login_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds:10),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: InkWell(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
        },
        child: Center(
          child: Image.asset(
            fit: BoxFit.cover,
            ImagesConstants.logoImages),
        ),
      ),
    );
  }
}