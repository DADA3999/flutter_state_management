import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_store.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    // これでwrapする決まり文句
    return ChangeNotifierProvider(
      // これでCounterStoreが使えるようになる
      create: (context) => CounterStore(),
      child: Builder(builder: (BuildContext context) {
        // Counterstoreのインスタンスを作成
        final store = Provider.of<CounterStore>(context);
        // 変数を取得
        final _counter = store.counter;
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                OutlinedButton(
                  onPressed: store.incrementCounter,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
