import 'dart:ffi';

import 'package:flutter/material.dart';

class TitleSection extends StatefulWidget {

  TitleSection({Key? key, required this.title, required this.startCount}) : super(key: key);

  String title;
  int startCount;

  @override
  State<StatefulWidget> createState() => _TitleSection();

}

class _TitleSection extends State<TitleSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.yellow[500],
          ),
          Text(widget.startCount.toString()),
        ],
      ),
    );
  }

}

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: const Text(
                'QuizApp',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
      /*3*/
      Icon(
        Icons.star,
        color: Colors.red[500],
      ),
      Text('23'),
    ],
  ),
);