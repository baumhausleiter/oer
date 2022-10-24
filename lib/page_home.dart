import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_flutter_project/title_section.dart';
import 'package:my_flutter_project/topic_list.dart';
import 'package:my_flutter_project/topic_models.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int totalStarCount = 6;
  List<TopicRowContainer> rows = getRows();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: TitleSection(title: widget.title, startCount: totalStarCount),
        ),
        body: TopicList(rows: rows)
    );
  }
}

List<TopicRowContainer> getRows() {
  List<TopicRowContainer> rows = [];

  for (var i = 0; i < 60; i++) {
    rows.add(
        TopicRow(i, "Topic $i", 0, 5)
    );
    List<SubTopicRow> subTopics = [];
    int maxSubTopics = Random().nextInt(2) + 1;
    bool oneSub = Random().nextBool();
    for (var j = 0; j < maxSubTopics; j++) {
      if (oneSub) {
        subTopics.add(
            SubTopicRow(
                [
                  SubTopic(j, "SubTopic $j", 3, 5)
                ]
            )
        );
      } else {
        subTopics.add(
            SubTopicRow(
                [
                  SubTopic(j, "SubTopic $j A", 3, 5),
                  SubTopic(j, "SubTopic $j B", 3, 5)
                ]
            )
        );
      }
    }
    rows.addAll(subTopics);
  }

  return rows;
}