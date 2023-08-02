import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stopwatch/ui/stopwatch.dart';

bool isLight = false;
StreamController<bool> isLightTheme = StreamController<bool>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        initialData: true,
        stream: isLightTheme.stream,
        builder: (context, snapshot) {
          return MaterialApp(
            theme: snapshot.data == true ? ThemeData.light() : ThemeData.dark(),
            debugShowCheckedModeBanner: false,
            home: const MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value:
        isLight ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: isLight
                        ? GestureDetector(
                      onTap: () {
                        setState(() {
                          isLight = false;
                          isLightTheme.add(true);
                        });
                      },
                      child: const Icon(
                        Icons.wb_sunny,
                        size: 37,
                      ),
                    )
                        : GestureDetector(
                      onTap: () {
                        setState(() {
                          isLight = true;
                          isLightTheme.add(false);
                        });
                      },
                      child: const Icon(
                        Icons.nightlight,
                        size: 37,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  const AspectRatio(aspectRatio: .6, child: Stopwatch()),
                ],
              ),
            ),
          ),
        ));
  }
}
