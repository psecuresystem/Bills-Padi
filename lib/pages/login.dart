import 'package:bills_padi_client/services/login.service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Login extends StatefulWidget {
  final AuthService service;
  const Login({Key? key, required this.service}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool value = false;
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: const Text('Don\'t have an account?',
                style: TextStyle(fontSize: 13)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/register');
            },
            child: const Text('Register',
                style: TextStyle(
                    fontSize: 13,
                    color: Colors.red,
                    decoration: TextDecoration.underline)),
            style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * 0.02,
            MediaQuery.of(context).size.height * 0.02, 10.0, 5.0),
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(height: (MediaQuery.of(context).size.height * 0.13)),
            Image.asset(
              'assets/app_logo.png',
              scale: 1.3,
            ),
            SizedBox(height: (MediaQuery.of(context).size.height * 0.04)),
            const Text(
              'Login',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: (MediaQuery.of(context).size.height * 0.04)),
            TextField(
                onChanged: (String val) {
                  setState(() {
                    email = val;
                  });
                },
                decoration: InputDecoration(
                    fillColor: Colors.grey[650],
                    filled: true,
                    prefixIcon: const Icon(Icons.person_outline),
                    hintText: "email address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 1.0,
                            color: Color.fromARGB(255, 155, 150, 150))))),
            SizedBox(height: (MediaQuery.of(context).size.height * 0.02)),
            TextField(
                onChanged: (String val) {
                  setState(() {
                    password = val;
                  });
                },
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: Colors.grey[650],
                    filled: true,
                    prefixIcon: const Icon(Icons.lock_outlined),
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(
                            width: 1.0,
                            color: Color.fromARGB(255, 221, 221, 221))))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgotpassword');
                    },
                    child: const Text(
                      'Forgot Password?',
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            SizedBox(height: (MediaQuery.of(context).size.height * 0.02)),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (email.isNotEmpty && password.isNotEmpty) {
                        Response isAuth =
                            await widget.service.signIn(email, password);
                        print(isAuth);
                        if (isAuth.statusCode == 200) {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      }
                    },
                    child: const Text('Sign in'),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(12.0),
                        primary: const Color(0xFFF069A5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0))),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: value,
                    onChanged: (dynamic val) {
                      setState(() {
                        value = val;
                      });
                    }),
                const Text(
                  'Agree To Terms And Conditions',
                  style: TextStyle(fontSize: 13.0),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
