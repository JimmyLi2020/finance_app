import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHomePageState(1000);
}

class _MyHomePageState extends State<MyHomePage> {
  int bal;
  String option1;
  String option2;
  Function pressed1;
  Function pressed2;

  _MyHomePageState(this.bal) {
    setFirstPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Balance',
              style: Theme.of(context).textTheme.display3,
            ),
            BalanceDisplay(bal),
            Text(''),
            MyButton(
              option1,
              pressed1,
            ),
            MyButton(
              option2,
              pressed2,
            ),
          ],
        ),
      ),
    );
  }

  void setFirstPage() {
    option1 = 'Invest in TESLA';
    option2 = 'Invest in new interview suit';
    pressed1 = () {
      setState(() {
        bal -= 200;
        setSecondPage();
      });
    };
    pressed2 = () {
      setState(() {
        bal -= 300;
        setSecondPage();
      });
    };
  }

  void setSecondPage() {
    option1 = 'Buy a Raffle Ticket';
    option2 = 'Buy a National Bond';
    pressed1 = () {
      setState(() {
        bal -= 300;
        setThirdPage();
      });
    };
    pressed2 = () {
      setState(() {
        bal += 500;
        setThirdPage();
      });
    };
  }

  void setThirdPage() {
    option1 = 'Invest in a school';
    option2 = 'Invest in Angel Fund project';
    pressed1 = () {
      setState(() {
        bal += 1000;
      });
    };
    pressed2 = () {
      setState(() {
        bal += 300;
      });
    };
  }
}

class BalanceDisplay extends StatelessWidget {
  final int bal;
  BalanceDisplay(this.bal, {Key key});
  @override
  Widget build(BuildContext context) {
    return Text(
      '\$${bal.toString()}',
      style: Theme.of(context).textTheme.display4,
    );
  }
}

class MyButton extends StatelessWidget {
  final option;
  final pressed;
  MyButton(this.option, this.pressed, {Key key});
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: FlatButton(
        color: Colors.blue[500],
        child: Text(
          option.toString(),
          style: Theme.of(context).textTheme.headline,
        ),
        onPressed: pressed,
      ),
    );
  }
}