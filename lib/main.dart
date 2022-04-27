// import 'package:bills_padi_client/pages/splash.dart';
import 'package:bills_padi_client/pages/airtime.dart';
import 'package:bills_padi_client/pages/card_details.dart';
import 'package:bills_padi_client/pages/confirm_password.dart';
import 'package:bills_padi_client/pages/data.dart';
import 'package:bills_padi_client/pages/forgot_password.dart';
import 'package:bills_padi_client/pages/home.dart';
import 'package:bills_padi_client/pages/login.dart';
import 'package:bills_padi_client/pages/manage_cards.dart';
import 'package:bills_padi_client/pages/new_password.dart';
import 'package:bills_padi_client/pages/profile.dart';
import 'package:bills_padi_client/pages/register.dart';
import 'package:bills_padi_client/services/login.service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/home': (context) => const Home(),
      '/forgotpassword': (context) => ForgotPassword(
            service: AuthService(),
          ),
      '/confirmpassword': (context) => const ConfirmPassword(),
      '/airtime': (context) => const AirtimePage(),
      '/data': (context) => const DataPage(),
      '/newpassword': (context) => NewPassword(
            service: AuthService(),
          ),
      '/profile': (context) => const Profile(),
      '/managecards': (context) => const ManageCards(),
      '/addcard': (context) => const CardDetails(),
      '/register': (context) => Register(service: AuthService()),
      '/login': (context) => Login(service: AuthService()),
    },
    home: Login(service: AuthService()),
  ));
}
