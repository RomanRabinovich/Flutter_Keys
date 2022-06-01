import 'package:flutter/material.dart';

final key = GlobalKey();

class ExampleGlobalKey extends StatelessWidget {
  const ExampleGlobalKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Container(
                color: Colors.green[100],
                child: _Page(key: PageStorageKey('First page')),
              );
            case 1:
              return Container(
                color: Colors.blue[100],
                child: Text('Black Page'),
              );
            case 2:
              return Container(
                color: Colors.red[100],
                child: _Page(key: PageStorageKey('First page')),
              );
            default:
              throw '404';
          }
        },
      ),
    );
  }
}

class Foo extends StatefulWidget {
  @override
  State<Foo> createState() => _FooState();
  Foo(Key? key) : super(key: key);
}

class _FooState extends State<Foo> {
  bool _switchValue = false;
  double _sliderValue = 0.5;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _switchValue,
          onChanged: (v) {
            setState(() => _switchValue = v);
          },
        ),
        Slider(
          value: _sliderValue,
          onChanged: (v) {
            setState(() => _sliderValue = v);
          },
        )
      ],
    );
  }
}
