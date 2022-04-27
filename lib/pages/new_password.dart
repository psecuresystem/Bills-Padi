import 'package:bills_padi_client/services/login.service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NewPassword extends StatefulWidget {
  final String phone;
  final AuthService service;
  const NewPassword({Key? key, required this.service, this.phone = ''})
      : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  String password = '';
  String confirm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Password'),
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
              child: Image.asset('assets/padlock 1.png'),
            ),
            const Text(
              'Reset Password',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15.0, right: 15.0),
              padding:
                  const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
              child: const Text(
                'Enter the new password of your choice.',
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
                      password = val;
                    });
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    hintText: 'Enter new password',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const Text(
              'Password must be 8-18 characters in length',
              style: TextStyle(
                fontSize: 10.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.end,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
              child: Material(
                elevation: 2,
                child: TextField(
                  onChanged: (String val) {
                    setState(() {
                      confirm = val;
                    });
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8.0),
                    hintText: 'Re-enter new password',
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
                      if (password == confirm) {
                        Response resp =
                            await widget.service.resetPassword(password);
                        if (resp.statusCode == 200) {
                          Navigator.popUntil(context, (route) => route.isFirst);
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      }
                    },
                    child: const Text('Next'),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFFF069A5),
                    ),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
