import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pacotes/pages/home_page/home_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
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
            child: SizedBox(
              width: 250.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  repeatForever: false,
                  onFinished: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (builder) => HomePage()),
                    );
                  },
                  animatedTexts: [
                    FadeAnimatedText('MEU APP'),
                    FadeAnimatedText('Animação de Inicialização'),
                    FadeAnimatedText('Navegando...'),
                  ],
                  onTap: () {
                    debugPrint("Tap Event");
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
