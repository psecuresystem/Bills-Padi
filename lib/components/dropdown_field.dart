import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  final String name;
  final List<dynamic> list;
  final Function setter;
  const DropDown(
      {Key? key, required this.name, required this.list, required this.setter})
      : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String hintText = '';
  dynamic value;
  List<dynamic> list = ['Sample', 'Sample2'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    hintText = widget.name;
    list = widget.list;
  }

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
        color: const Color(0xFFFFFFFF),
        width: (MediaQuery.of(context).size.width),
        child: DropdownButton(
          menuMaxHeight: MediaQuery.of(context).size.height * 0.8,
          isExpanded: true,
          hint: Text(
            hintText,
            style: const TextStyle(
              color: Colors.grey,
            ),
          ),
          value: value,
          onChanged: (dynamic val) {
            setState(() {
              value = val;
              widget.setter(val[0], val[1]);
            });
          },
          items: list.map((dynamic item) {
            return DropdownMenuItem(
                value: item,
                child: Row(
                  children: [
                    Text(
                      "${item[0]}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ));
          }).toList(),
          dropdownColor: const Color(0xFFFFFFFF),
          style: const TextStyle(color: Colors.white),
          underline: Container(
            height: 1,
            color: const Color.fromARGB(255, 235, 133, 178),
          ),
        ),
      ),
    );
  }
}
