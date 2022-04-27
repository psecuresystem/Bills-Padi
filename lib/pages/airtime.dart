import 'dart:convert';

import 'package:bills_padi_client/components/dropdown_field.dart';
import 'package:bills_padi_client/components/input_sample.dart';
import 'package:bills_padi_client/services/payment.service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AirtimePage extends StatefulWidget {
  const AirtimePage({Key? key}) : super(key: key);
  @override
  State<AirtimePage> createState() => _AirtimePageState();
}

class _AirtimePageState extends State<AirtimePage> {
  final PaymentService service = PaymentService();
  String? value;
  late List<dynamic> countries = [];
  late List<dynamic> networks = [];
  bool sevenDays = true;
  String country = '';
  String network = '';
  int number = 0;
  int number2 = 265;
  String phone = '';
  int amount = 0;
  String skuCode = '';

  void showSuccessDialog(BuildContext context) => showDialog(
        builder: (context) => SimpleDialog(
          backgroundColor: const Color.fromARGB(255, 1, 253, 10),
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              child: const Icon(Icons.check),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                child: Column(
                  children: [
                    const Text('You successfully reharged',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("+$phone"),
                    const SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text('Amount'), Text('N$amount')],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Date'),
                        Text('${TimeOfDay.now()}')
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        context: context,
      );

  void setCountry(val, id) {
    setState(() {
      country = val;
    });
    service.getNetworks(id).then((Response resp) {
      setState(() {
        networks = json.decode(resp.body)["Items"].map((el) {
          print(el);
          String result = (el["Name"] as String);
          String country = (el["CountryIso"] as String);
          return [result, country];
        }).toList();
        number2++;
      });
    });
  }

  void setNetwork(val, id) {
    setState(() {
      network = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    service.getCountries().then((value) {
      print('value gotten');
      setState(() {
        countries = json.decode(value.body)["Items"].map((el) {
          String result = (el["CountryName"] as String);
          String id = (el["CountryIso"] as String);
          return [result, id];
        }).toList();
        number++;
      });
      print(countries.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Airtime',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          titleSpacing: 0.0,
          leading: Image.asset('assets/humberger (1).png'),
          backgroundColor: Colors.grey[50],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              children: [
                DropDown(
                  name: 'Select Country',
                  list: countries,
                  setter: setCountry,
                  key: ValueKey(number),
                ),
                const SizedBox(height: 20.0),
                DropDown(
                  name: 'Network Type',
                  list: networks,
                  setter: setNetwork,
                  key: ValueKey(number2),
                ),
                const SizedBox(height: 20.0),
                CustomInput(
                  hint: 'Loan Amount',
                  onChanged: (String val) {
                    setState(() {
                      amount = int.parse(val);
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                CustomInput(
                    hint: 'Enter Phone Number',
                    phone: true,
                    onChanged: (String val) {
                      setState(() {
                        phone = val;
                      });
                    }),
                const SizedBox(height: 20.0),
                Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Loan Term(days)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            sevenDays = true;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: sevenDays
                                ? const Color.fromARGB(255, 248, 105, 167)
                                : Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(7.0)),
                          ),
                          child: Text(
                            '7',
                            style: TextStyle(
                              color: sevenDays ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            sevenDays = false;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: !sevenDays
                                ? const Color.fromARGB(255, 248, 105, 167)
                                : Colors.grey[300],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(7.0)),
                          ),
                          child: Text(
                            '14',
                            style: TextStyle(
                              color: !sevenDays ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'By submitting, you agree that all the information provided are right',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.start,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (phone.isNotEmpty &&
                              country.isNotEmpty &&
                              network.isNotEmpty &&
                              amount != 0) {
                            Response resp =
                                await service.getAllValues(phone, data: false);
                            List<dynamic> codes = json.decode(resp.body);
                            for (var i in codes) {
                              print(i);
                              if (amount > i["minimum"] &&
                                  amount < i["maximum"]) {
                                setState(() {
                                  print("hey");
                                  skuCode = i["skuCode"];
                                });
                                print('skuCode');
                                bool success = await service.buyAirtime(
                                    skuCode, phone, amount, sevenDays);
                                print(success);
                                if (success) {
                                  showSuccessDialog(context);
                                  Future.delayed(const Duration(seconds: 5))
                                      .then((value) {
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  });
                                }
                                break;
                              }
                            }
                          }
                        },
                        child: const Text('Submit'),
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 248, 105, 167)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
