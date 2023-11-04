import 'package:flutter/material.dart';
import 'package:task1_app/constants/colors.dart';
import 'package:task1_app/models/loginmodel.dart';
import 'package:task1_app/screens/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

late LoginModel user;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lorem Ipsum',
      theme: ThemeData(
        splashColor: transparent,
        scaffoldBackgroundColor: white,
        primaryColor: primaryred,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: primaryred),
        appBarTheme: AppBarTheme(
            elevation: 10,
            color: primaryred,
            titleTextStyle: Theme.of(context).textTheme.bodyLarge),
        textTheme: TextTheme(
            displayLarge: TextStyle(
                fontWeight: FontWeight.w700,
                color: grey,
                fontSize: 60,
                fontFamily: 'Helvetica'),
            displayMedium: TextStyle(
                color: grey,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w400,
                fontSize: 26),
            bodyLarge: TextStyle(
                color: white,
                fontFamily: 'Helvetica',
                fontWeight: FontWeight.w500,
                fontSize: 18),
            bodySmall:
                TextStyle(color: grey, fontFamily: 'Helvetica', fontSize: 14),
            bodyMedium:
                TextStyle(color: black, fontFamily: 'Helvetica', fontSize: 16)),
        inputDecorationTheme: InputDecorationTheme(
            suffixIconColor: grey,
            filled: true,
            fillColor: greyLightTextField,
            iconColor: grey,
            labelStyle: TextStyle(fontSize: 11, color: grey),
            hintStyle: TextStyle(fontSize: 14, color: grey),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide.none,
            ),
            focusedBorder: UnderlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: greyLightTextField,
                )),
            enabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              borderSide:
                  BorderSide(color: greyLightTextField.withOpacity(0.50)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: primaryred),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: primaryred),
            )),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
