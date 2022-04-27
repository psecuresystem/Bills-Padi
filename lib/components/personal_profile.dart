import 'package:flutter/material.dart';

class PersonalProfile extends StatelessWidget {
  final String name;
  const PersonalProfile({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: const Color(0xFFF069A5),
            ),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            maxRadius: 50.0,
            backgroundColor: Colors.grey[50],
            child: const Icon(
              Icons.person,
              size: 90,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          name,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
