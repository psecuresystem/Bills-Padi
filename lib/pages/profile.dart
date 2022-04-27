import 'package:bills_padi_client/components/field.dart';
import 'package:bills_padi_client/components/personal_profile.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Center(
                child: PersonalProfile(name: 'William Jones'),
              ),
              const SizedBox(height: 6.0),
              const Center(
                child: Field(name: 'Phone number', description: '08174024547'),
              ),
              const SizedBox(height: 6.0),
              const Center(
                child: Field(name: 'Gender', description: 'Male'),
              ),
              const SizedBox(height: 6.0),
              const Center(
                child: Field(name: 'Date Of Birth', description: '23/04/2008'),
              ),
              const Center(
                child: Field(name: 'Marital Status', description: 'Single'),
              ),
              const SizedBox(height: 6.0),
              const Center(
                child: Field(name: 'Address', description: 'Abuja'),
              ),
              const SizedBox(height: 6.0),
              const Center(
                child: Field(name: 'Age', description: '13'),
              ),
              const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Transaction History',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Manage Cards',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/managecards');
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  Text(
                    'Sign out',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFFF069A5),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
