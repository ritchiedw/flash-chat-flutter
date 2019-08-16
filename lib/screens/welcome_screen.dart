import 'package:flutter/material.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      duration: Duration(
        seconds: 1,
      ),
      vsync: this,
      //upperBound: 100.0,
    );

    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);
    controller.forward();

    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red.withOpacity(controller.value),
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                    //height: controller.value,
                    //height: animation.value * 100,
                  ),
                ),
                TypewriterAnimatedTextKit(
                    text: ['Flash Chat'],
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.start,
                    alignment:
                        AlignmentDirectional.topStart // or Alignment.topLeft
                    ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            new RoundedButton(
              colour: Colors.lightBlueAccent,
              buttonTitle: "Log In",
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            new RoundedButton(
              colour: Colors.blueAccent,
              buttonTitle: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
