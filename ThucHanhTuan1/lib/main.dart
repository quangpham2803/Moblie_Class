import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'My App',
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomeScreen(),
      '/color_change': (context) => ColorChangePage(),
      '/calculator': (context) => CalculatorApp(),
      '/prime_number_checker': (context) => PrimeNumberCheckerApp(),
    },
  ));
}

// Widget chính (trang chủ)
class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Test Home Page'),
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: 390,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello World',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 20),
              buildRowLayout(),
              SizedBox(height: 20),
              Image.network(
                'https://storage.googleapis.com/cms-storage-bucket/bfc8defed4ac2d549f0d.png',
                width: 120,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/color_change');
                },
                child: Text('Color Change App'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/calculator');
                },
                child: Text('Calculator App'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/prime_number_checker');
                },
                child: Text('Prime Number Checker App'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget của trang Color Change App
class ColorChangePage extends StatefulWidget {
  @override
  _ColorChangePageState createState() => _ColorChangePageState();
}

class _ColorChangePageState extends State<ColorChangePage> {
  Color _backgroundColor = Colors.white;

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Color.fromRGBO(
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Change App'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: _changeBackgroundColor,
            child: Text('Change Color'),
          ),
        ),
      ),
    );
  }
}

// Widget của trang Calculator App
class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  late TextEditingController _value1Controller, _value2Controller;
  late String _message;

  @override
  void initState() {
    super.initState();
    _message = "0.00";
    _value1Controller = TextEditingController();
    _value2Controller = TextEditingController();
  }

  Widget _buildValue1TextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: TextField(
        controller: _value1Controller,
        decoration: InputDecoration(labelText: 'Enter a number'),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _buildValue2TextField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: TextField(
        controller: _value2Controller,
        decoration: InputDecoration(labelText: 'Enter a number'),
        keyboardType: TextInputType.number,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _value1Controller.dispose();
    _value2Controller.dispose();
  }

  void _calcUpdate(String opr) {
    setState(() {
      final double value1 = double.parse(_value1Controller.text);
      final double value2 = double.parse(_value2Controller.text);
      switch (opr) {
        case "+":
          {
            _message = (value1 + value2).toString();
          }
          break;
        case "-":
          {
            _message = (value1 - value2).toString();
          }
          break;
        case "*":
          {
            _message = (value1 * value2).toString();
          }
          break;
        case "/":
          {
            _message = (value1 / value2).toString();
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simplistic Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.network(
                'https://www.involve.me/img/containers/assets/blog/how-to-create-a-simple-price-calculator-and-capture-more-leads/calculator-L.png/8a78c88505e10eb192769b383777b149.webp',
                width: 200,
                height: 200,
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "$_message",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            Divider(
              height: 4,
              color: Colors.grey,
              thickness: 5,
            ),
            _buildValue1TextField(),
            _buildValue2TextField(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _calcUpdate("+");
                  },
                  child: Text("+"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _calcUpdate("-");
                  },
                  child: Text("-"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _calcUpdate("*");
                  },
                  child: Text(
                    "*",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _calcUpdate("/");
                  },
                  child: Text(
                    "/",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Widget của trang Prime Number Checker App
class PrimeNumberCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Prime Number Checker'),
        ),
        body: PrimeNumberChecker(),
      ),
    );
  }
}

class PrimeNumberChecker extends StatefulWidget {
  @override
  _PrimeNumberCheckerState createState() => _PrimeNumberCheckerState();
}

class _PrimeNumberCheckerState extends State<PrimeNumberChecker> {
  int number = 0;
  bool isPrime = false;

  bool checkPrime(int n) {
    if (n <= 1) return false;
    if (n == 2) return true;
    if (n % 2 == 0) return false;

    int sqrtN = sqrt(n).toInt();
    for (int i = 3; i <= sqrtN; i += 2) {
      if (n % i == 0) return false;
    }
    return true;
  }

  void onCheckButtonPressed() {
    setState(() {
      isPrime = checkPrime(number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              number = int.tryParse(value)!;
            },
            decoration: InputDecoration(
              labelText: 'Enter a number',
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: onCheckButtonPressed,
            child: Text('Check'),
          ),
          SizedBox(height: 20),
          Text(
            isPrime ? 'This is a prime number.' : 'This is not a prime number.',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Widget hỗ trợ vẽ Row Layout
Widget buildRowLayout() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.green,
        height: 100,
        width: 100,
      ),
      Container(
        color: Colors.orange,
        height: 100,
        width: 100,
      )
    ],
  );
}
