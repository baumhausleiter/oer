import 'package:flutter/material.dart';
import 'package:my_flutter_project/page_home.dart';

import 'topic_models.dart';

class TopicList extends StatefulWidget {
  TopicList({Key? key, required this.rows}) : super(key: key);

  List<TopicRowContainer> rows;

  @override
  State<StatefulWidget> createState() => _TopicList();
}

class _TopicList extends State<TopicList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.rows.length,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, i) {
          final row = widget.rows[i];
          late Widget widgetRow;
          if (row is TopicRow) {
            widgetRow = _topicRow(row);
          } else {
            widgetRow = _subtopicRow(row as SubTopicRow);
          }
          return widgetRow;
        });
  }

  Widget _topicRow(TopicRow topic) {
    return ListTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Text(
              topic.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  Widget _subtopicRow(SubTopicRow subTopicRow) {
    if (subTopicRow.row.length == 1) {
      final subRow = subTopicRow.row[0];
      return ListTile(
          title: Align(
            alignment: Alignment.center,
            child: _subTopic(
                subRow.name, subRow.starCount, subRow.starCountMax),
          ));
    } else {
      final subRow1 = subTopicRow.row[0];
      final subRow2 = subTopicRow.row[1];
      return ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _subTopic(subRow1.name, subRow1.starCount, subRow1.starCountMax),
            const SizedBox(width: 50),
            _subTopic(subRow2.name, subRow2.starCount, subRow2.starCountMax)
          ],
        ),
      );
    }
  }

  Widget _subTopic(String name, int starCount, int starCountMax) {
    return Column(
      children: [
        const SizedBox(height: 20),
        _circle(starCount, starCountMax),
        const SizedBox(height: 10),
        Text(name)
      ],
    );
  }

  Widget _circle(int starCount, int starCountMax) {
    return
      Center(
        child: Stack(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage(title: "title")),
                );
              },
              child: Ink(
                  width: 80.0,
                  height: 80.0,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  )
              ),
            ),
            Positioned.fill(
              child: Align(
                  alignment: Alignment.center,
                  child: Text("$starCount/$starCountMax")
              ),
            ),
          ],
        ),
      );
  }
}
