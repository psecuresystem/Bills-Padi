import 'dart:convert';

import 'package:bills_padi_client/services/login.service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ForgotPassword extends StatefulWidget {
  final AuthService service;
  const ForgotPassword({Key? key, required this.service}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forgot Password'),
        backgroundColor: const Color(0xFFEDEDED),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(30.0),
              margin: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Color(0xFFD2146D), blurRadius: 3.0)
                  ],
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                      BorderSide(color: Color(0xFFF069A5), width: 2.0))),
              child: Image.asset('assets/icon.png'),
            ),
            const Text(
              'Forgot Password',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              padding:
                  const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
              child: const Text(
                'Enter the phone number associated with your account.',
                style: TextStyle(fontSize: 13.0),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
              child: Material(
                elevation: 2,
                child: TextField(
                  onChanged: (String val) {
                    setState(() {
                      phone = val;
                    });
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    hintText: 'Phone number',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      Response resp = await widget.service.getOtp(phone);
                      print(resp.statusCode);
                      if (resp.statusCode == 200) {
                        dynamic body = json.decode(resp.body);
                        Navigator.pushNamed(context, '/confirmpassword',
                            arguments: <String, String>{"id": body["id"]});
                      }
                    },
                    child: const Text('Next'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFF069A5),
                    ),
                  ),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
