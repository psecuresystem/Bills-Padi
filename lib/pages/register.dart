import 'package:bills_padi_client/services/login.service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Register extends StatefulWidget {
  final AuthService service;
  const Register({Key? key, required this.service}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List<String> items = ['Nigeria', 'Ghana', 'US'];
  String? val;
  bool isChecked = false;
  String name = '';
  String password = '';
  String phone = '';
  String email = '';
  String country = '';
  String zipcode = '';
  String dob = '';
  bool err = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.height * 0.02,
              MediaQuery.of(context).size.height * 0.02,
              10.0,
              5.0),
          child: Column(children: <Widget>[
            SizedBox(height: (MediaQuery.of(context).size.height * 0.05)),
            Image.asset(
              'assets/app_logo.png',
              scale: 1.3,
            ),
            SizedBox(height: (MediaQuery.of(context).size.height * 0.03)),
            const Text(
              'Register',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: (MediaQuery.of(context).size.height * 0.03)),
            TextField(
              onChanged: (String value) {
                setState(() {
                  name = value;
                });
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline),
                hintText: "Full name",
                border: UnderlineInputBorder(),
              ),
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  email = value;
                });
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail_outline_rounded),
                hintText: "Email Address",
                border: UnderlineInputBorder(),
              ),
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  phone = value;
                });
              },
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: "Phone number",
                border: UnderlineInputBorder(),
              ),
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  dob = value;
                });
              },
              keyboardType: TextInputType.datetime,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.date_range_outlined),
                hintText: "Date of birth",
                border: UnderlineInputBorder(),
              ),
            ),
            TextField(
              onChanged: (String value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock_outlined),
                suffixIcon: Icon(Icons.remove_red_eye),
                hintText: "Password",
                border: UnderlineInputBorder(),
              ),
            ),
            TextField(
              onChanged: (String value) {
                if (password != value) {
                  err = true;
                } else {
                  err = false;
                }
              },
              obscureText: true,
              decoration: InputDecoration(
                errorText: err ? 'It must be equal to password' : null,
                prefixIcon: const Icon(Icons.lock_outlined),
                suffixIcon: const Icon(Icons.remove_red_eye),
                hintText: "Confirm Password",
                border: const UnderlineInputBorder(),
              ),
            ),
            Row(children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.45,
                child: TextField(
                  onChanged: (String value) {
                    setState(() {
                      zipcode = value;
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock_outlined),
                    hintText: "Zip code",
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.grey[600]!, width: 1))),
                  child: DropdownButton(
                    isExpanded: true,
                    // Not necessary for Option 1
                    value: val,
                    hint: Text('Country',
                        style: TextStyle(color: Colors.grey[600])),
                    onChanged: (dynamic newValue) {
                      setState(() {
                        val = newValue;
                        country = newValue;
                      });
                    },
                    items: items.map((location) {
                      return DropdownMenuItem(
                        child: Text(location,
                            style: TextStyle(color: Colors.grey[600])),
                        value: location,
                      );
                    }).toList(),
                  ),
                ),
              )
            ]),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (country.isNotEmpty &&
                          dob.isNotEmpty &&
                          email.isNotEmpty &&
                          name.isNotEmpty &&
                          password.isNotEmpty &&
                          phone.isNotEmpty &&
                          zipcode.isNotEmpty) {
                        Response success = await widget.service.register(email,
                            phone, country, dob, name, zipcode, password);
                        print(success);
                        if (success.statusCode == 201) {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      }
                    },
                    child: const Text('Register'),
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
                    value: isChecked,
                    onChanged: (dynamic val) {
                      setState(() {
                        isChecked = val;
                      });
                    }),
                const Text(
                  'Agree To Terms And Conditions',
                  style: TextStyle(fontSize: 13.0),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: const Text('Already have an account?',
                      style: TextStyle(fontSize: 13)),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  child: const Text('Login',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.red,
                          decoration: TextDecoration.underline)),
                  style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
