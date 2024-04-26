import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    controller!.repeat();
    controller!.addListener(() {
      setState(() {});
    });
    Future.delayed(Duration(seconds: 3),() => Navigator.pushReplacementNamed(context, 'home'),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/image/galaxy1.gif",
            height:MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.cover,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotationTransition(
                turns: controller!,
                child: Center(
                  child: Image.asset("assets/image/earth.png",height: 150, ),
                ),
              ),
              Text("Planet App",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "f6"),)
            ],
          )
        ],
      ),
    );
  }
}
