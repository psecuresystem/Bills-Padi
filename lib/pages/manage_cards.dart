import 'package:bills_padi_client/components/debit_card.dart';
import 'package:flutter/material.dart';

class ManageCards extends StatefulWidget {
  const ManageCards({Key? key}) : super(key: key);

  @override
  State<ManageCards> createState() => _ManageCardsState();
}

class _ManageCardsState extends State<ManageCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Manage cards',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            const DebitCard(type: 'Master', initials: '6237'),
            const DebitCard(type: 'Visa', initials: '6237'),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/addcard');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add),
                                Text('Add new Card',
                                    style: TextStyle(fontSize: 18.0)),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 218, 89, 147),
                              padding: const EdgeInsets.all(20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ));
  }
}
