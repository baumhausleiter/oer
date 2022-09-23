class TopicRow extends TopicRowContainer {
  final int id;
  final String name;
  int starCount;
  final int starCountMax;

  TopicRow(this.id, this.name, this.starCount, this.starCountMax);
}

class SubTopicRow extends TopicRowContainer {
  final List<SubTopic> row;

  SubTopicRow(this.row);
}

class SubTopic {
  final int id;
  final String name;
  int starCount;
  final int starCountMax;


  SubTopic(this.id, this.name, this.starCount, this.starCountMax);
}

class TopicRowContainer {}