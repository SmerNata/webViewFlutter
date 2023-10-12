import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key, required this.theme}) : super(key: key);

  final String theme;

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterProvider>(context);
    final count = counter.count;

    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'You pressed button\n $count times',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Button(counter: counter, theme: theme),
          ],
        ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.counter,
    required this.theme,
  });

  final CounterProvider counter;
  final String theme;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (theme == 'cuppertino')
          CupertinoButton.filled(
            onPressed: counter.increment,
            child: const Icon(Icons.plus_one),
          )
        else
          ElevatedButton(
            onPressed: counter.increment,
            child: const Icon(Icons.plus_one),
          )
      ],
    );
  }
}