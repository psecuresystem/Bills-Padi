import 'package:flutter/material.dart';

class ConfirmPassword extends StatefulWidget {
  final String id;
  final String phone;
  const ConfirmPassword({Key? key, this.id = '', this.phone = ''})
      : super(key: key);

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  late FocusNode inputFocusNode;
  late FocusNode inputFocusNode2;
  late FocusNode inputFocusNode3;
  late FocusNode inputFocusNode4;
  String confirm = '';

  @override
  void initState() {
    super.initState();

    inputFocusNode = FocusNode();
    inputFocusNode2 = FocusNode();
    inputFocusNode3 = FocusNode();
    inputFocusNode4 = FocusNode();
  }

  @override
  void dispose() {
    inputFocusNode.dispose();
    inputFocusNode2.dispose();
    inputFocusNode3.dispose();
    inputFocusNode4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Confirm Password'),
        backgroundColor: const Color(0xFFEDEDED),
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
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
                ),
                child: Image.asset('assets/icon (1).png'),
              ),
              const Text(
                'We sent a code',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Container(
                margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                padding:
                    const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                child: const Text(
                  'Enter the otp code sent to your phone number.',
                  style: TextStyle(fontSize: 13.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.0,
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 3.0)
                        ],
                      ),
                      child: Center(
                        child: TextField(
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          focusNode: inputFocusNode,
                          autofocus: true,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(8.0),
                            border: InputBorder.none,
                            counterText: "",
                          ),
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          onChanged: (val) {
                            if (val.isNotEmpty) {
                              inputFocusNode2.requestFocus();
                              setState(() {
                                confirm += val;
                              });
                            } else {
                              setState(() {
                                confirm =
                                    confirm.substring(0, confirm.length - 1);
                              });
                            }
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 50.0,
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 3.0)
                        ],
                      ),
                      child: TextField(
                        maxLength: 1,
                        focusNode: inputFocusNode2,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          border: InputBorder.none,
                          counterText: "",
                        ),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            setState(() {
                              confirm += val;
                            });
                            inputFocusNode3.requestFocus();
                          } else {
                            setState(() {
                              confirm =
                                  confirm.substring(0, confirm.length - 1);
                            });
                            inputFocusNode.requestFocus();
                          }
                        },
                      ),
                    ),
                    Container(
                      width: 50.0,
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 3.0)
                        ],
                      ),
                      child: TextField(
                        maxLength: 1,
                        focusNode: inputFocusNode3,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          border: InputBorder.none,
                          counterText: "",
                        ),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            inputFocusNode4.requestFocus();
                            setState(() {
                              confirm += val;
                            });
                          } else {
                            inputFocusNode2.requestFocus();
                            setState(() {
                              confirm =
                                  confirm.substring(0, confirm.length - 1);
                            });
                          }
                        },
                      ),
                    ),
                    Container(
                      width: 50.0,
                      margin: const EdgeInsets.all(8.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.grey, blurRadius: 3.0)
                        ],
                      ),
                      child: TextField(
                        maxLength: 1,
                        focusNode: inputFocusNode4,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8.0),
                          border: InputBorder.none,
                          counterText: "",
                        ),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                        onChanged: (val) {
                          if (val.isNotEmpty) {
                            inputFocusNode4.unfocus();
                            setState(() {
                              confirm += val;
                            });
                          } else {
                            inputFocusNode3.requestFocus();
                            setState(() {
                              confirm =
                                  confirm.substring(0, confirm.length - 1);
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (confirm.length == 4) {
                          // Response resp = await widget.service
                          //     .verifyOtp(confirm, widget.id);
                          if (200 == 200) {
                            Navigator.pushNamed(context, '/newpassword',
                                arguments: {"phone": widget.phone});
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
              Row(children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 50.0, right: 50.0, top: 10.0),
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Resend',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
