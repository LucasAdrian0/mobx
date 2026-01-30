import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pacotes/pages/home_page/home_page.dart';

class SplashScreenDelayPage extends StatefulWidget {
  const SplashScreenDelayPage({super.key});

  @override
  State<SplashScreenDelayPage> createState() => _SplashScreenDelayPageState();
}

class _SplashScreenDelayPageState extends State<SplashScreenDelayPage> {
  //adicionei o init state aqui para evitar o travamento
  @override
  void initState() {
    super.initState();
    openHome();
  }

  openHome() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (builder) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //openHome(); caomentado para evitar o travamento
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue.shade200,
                Colors.white,
                Colors.pink.shade200,
              ],
            ),
          ),
          child: Center(
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              repeatForever: false,
              animatedTexts: [
                TypewriterAnimatedText(
                  'MEU APP',
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              pause: const Duration(milliseconds: 50),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          ),
        ),
      ),
    );
  }
}
