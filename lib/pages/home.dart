import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget card(
      {required Widget icon, required String text, required Function onTap}) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(12.0),
          width: 100.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                icon,
                const SizedBox(height: 6.0),
                Text(
                  text,
                  style: const TextStyle(color: Color(0xFFF069A5)),
                )
              ],
            ),
          ),
        ),
        color: const Color(0xFFFEF7E5),
        elevation: 1,
      ),
    );
  }

  Widget biggerCard({
    required Widget icon,
    required String text,
    required String amount,
    String dueDate = '',
  }) {
    return Card(
      margin: const EdgeInsets.only(left: 50.0, right: 10.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                child: icon,
                decoration: const BoxDecoration(
                  color: Color(0xFFF069A5),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              const SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(dueDate,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600])),
                ],
              ),
              Expanded(
                child: Text(
                  amount,
                  style: const TextStyle(
                    color: Color(0xFFF069A5),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ),
      ),
      color: const Color(0xFFFEF7E5),
      elevation: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(
              color: Color(0xFFF069A5),
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          titleSpacing: 0.0,
          leading: Image.asset('assets/humberger.png'),
          backgroundColor: Colors.grey[50],
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.home_outlined,
                color: Color(0xFFF069A5),
                size: 40.0,
              ),
              backgroundColor: const Color(0xFFFEF7E5),
            ),
            FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.swap_horiz,
                size: 40.0,
                color: Colors.black,
              ),
              backgroundColor: Colors.grey[50],
              elevation: 0,
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: const Icon(
                Icons.person_outline,
                size: 40.0,
                color: Colors.black,
              ),
              backgroundColor: Colors.grey[50],
              elevation: 0,
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 45.0, right: 45.0),
              height: MediaQuery.of(context).size.height * 0.35,
              child: GridView.count(
                childAspectRatio: 1.5,
                primary: false,
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                children: [
                  card(
                      icon: const Icon(Icons.phone, color: Color(0xFFF069A5)),
                      text: 'Airtime',
                      onTap: () {
                        Navigator.pushNamed(context, '/airtime');
                      }),
                  card(
                    icon: Image.asset('assets/Group (1).png'),
                    text: 'Data Subscription',
                    onTap: () {
                      Navigator.pushNamed(context, '/data');
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 50.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Recent Paid',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
            biggerCard(
              icon: const Icon(Icons.flash_on),
              text: 'Electricity bill',
              amount: '\$100',
            ),
            const SizedBox(height: 10.0),
            Container(
              margin: const EdgeInsets.only(left: 50.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Your Loan',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            biggerCard(
              icon: const Icon(Icons.flash_on),
              text: '200\$',
              amount: 'Repay Loan',
              dueDate: 'Due Date Wed 1 July',
            ),
          ],
        ));
  }
}
