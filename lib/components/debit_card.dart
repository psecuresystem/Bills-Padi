import 'package:flutter/material.dart';

class DebitCard extends StatefulWidget {
  final String type;
  final String initials;

  const DebitCard({
    Key? key,
    required this.type,
    required this.initials,
  }) : super(key: key);

  @override
  State<DebitCard> createState() => _DebitCardState();
}

class _DebitCardState extends State<DebitCard> {
  final Map images = {
    "Visa": "assets/visa.png",
    "Master": "assets/mastercard.png"
  };

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.only(
            left: 30.0, right: 30.0, top: 15.0, bottom: 20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
        ),
        child: Row(
          children: [
            Image.asset(images[widget.type]),
            const SizedBox(width: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.type} card',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
                Text(
                  '${widget.initials} **** **** ****',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[150],
                  ),
                )
              ],
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PopupMenuButton(
                  onSelected: (String value) {},
                  itemBuilder: (BuildContext context) {
                    return ['Delete card']
                        .map((e) => PopupMenuItem(
                              child: Text(e),
                              value: e,
                            ))
                        .toList();
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
