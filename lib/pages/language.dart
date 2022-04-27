import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final List<String> languages = ['English', 'French', 'Spanish', 'German'];
  String? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5E5E5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/app_logo.png'),
          SizedBox(height: (MediaQuery.of(context).size.height * 0.08)),
          Center(
            child: Container(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              color: const Color(0xFFF069A5),
              width: (MediaQuery.of(context).size.width * 0.6),
              child: DropdownButton(
                  isExpanded: true,
                  hint: const Text(
                    "Select item",
                    style: TextStyle(color: Colors.white),
                  ),
                  value: value,
                  onChanged: (dynamic val) {
                    setState(() {
                      value = val;
                    });
                  },
                  items: languages.map((String item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  dropdownColor: const Color(0xFFF069A5),
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
