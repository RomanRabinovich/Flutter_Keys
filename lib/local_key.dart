import 'dart:math';

import 'package:flutter/material.dart';

final key = GlobalKey();
final LocalKey = UniqueKey();

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PositionedTitles(),
    );
  }
}

class PositionedTitles extends StatefulWidget {
  const PositionedTitles({Key? key}) : super(key: key);

  @override
  State<PositionedTitles> createState() => _PositionedTitlesState();
}

class _PositionedTitlesState extends State<PositionedTitles> {
  List<Widget> titles = [
    StatelessColorfulTitle(key: UniqueKey()),
    StatelessColorfulTitle(key: UniqueKey()),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: swapTitles, child: Text('Blabla')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titles,
        )
      ],
    );
  }

  void swapTitles() {
    setState(() {
      titles.insert(1, titles.removeAt(0));
    });
  }
}

class StatelessColorfulTitle extends StatelessWidget {
  StatelessColorfulTitle({Key? key}) : super(key: key);

  final myColor = UniqueColorGenerator.getColor();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: myColor,
    );
  }
}

class UniqueColorGenerator {
  static final _random = Random();
  static Color getColor() {
    return Color.fromRGBO(
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1.0);
  }
}
