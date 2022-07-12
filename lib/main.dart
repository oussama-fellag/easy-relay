import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';


import 'Screens/Welcome/welcome_screen.dart';

import 'constants.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: kPrimaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(35)),
              borderSide: BorderSide.none,
            ),
          )),
      home:  new SplashScreen(
        seconds: 14,
        navigateAfterSeconds:  AfterSplash(),
        title: new Text('Easy Relay: Logistics made easy !',  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        image: new Image.asset('assets/images/easy_relay.jpg'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red
    ),


    );

  }

}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const WelcomeScreen();
  }
}