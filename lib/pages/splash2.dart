import 'package:flutter/material.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({Key? key}) : super(key: key);
  final Color color = const Color(0xffeb37b8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFE5E5E5),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            SizedBox(
              height: (MediaQuery.of(context).size.height * 0.5),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 70.0),
              child: Text(
                  'We provide you best and easy services that make life easier.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                      fontSize: 28.0)),
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.arrow_right_alt),
                style: ElevatedButton.styleFrom(
                  primary: color,
                  fixedSize: const Size(60, 60),
                  shape: const CircleBorder(),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              const Text('Already have an account?'),
              TextButton(child: const Text('Login'), onPressed: () {})
            ])
          ]),
        ));
  }
}
