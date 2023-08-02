import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch/ui/stop_watch_renderer.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  bool onStart = false;
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;
  Duration get _elapsed => _previouslyElapsed + _currentlyElapsed;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker((elapsed) {
      setState(() {
        _currentlyElapsed = elapsed;
        if (kDebugMode) {
          print(elapsed);
        }
      });
    });
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void reset() {
    _ticker.stop();
    setState(() {
      _previouslyElapsed = Duration.zero;
      _currentlyElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      final radius = constraint.maxWidth / 2;
      return StopWatchRenderer(
        onpause: () {
          setState(() {
            onStart = false;
            _ticker.stop();
            _previouslyElapsed += _currentlyElapsed;
            _currentlyElapsed = Duration.zero;
          });
        },
        startState: onStart,
        elasped: _elapsed,
        radius: radius,
        startCallback: () {
          setState(() {
            onStart = true;
            _currentlyElapsed = _previouslyElapsed;
            _ticker.start();
          });
        },
        resetCallback: () {
          setState(() {
            onStart = false;
            reset();
          });
        },
      );
    });
  }
}
