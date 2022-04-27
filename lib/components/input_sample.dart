import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {
  final String? hint;
  final bool phone;
  final Function(String)? onChanged;
  const CustomInput(
      {Key? key,
      required String this.hint,
      this.phone = false,
      required this.onChanged})
      : super(key: key);

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          top: 15.0,
          bottom: 10.0,
        ),
        color: Colors.white,
        child: TextField(
          onChanged: widget.onChanged,
          keyboardType: widget.phone ? TextInputType.phone : TextInputType.text,
          decoration: InputDecoration(
            // hintText: widget.hint,
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 235, 133, 178),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
