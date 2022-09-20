import 'package:flutter/material.dart';
import 'package:screen_breakpoints/screen_breakpoints.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Copied from Material Design
  static const breakpoints = BreakpointConfiguration(
    xs: Breakpoint(breakpoint: 0, width: double.infinity, margin: 16, padding: 0, columns: 4),
    sm: Breakpoint(breakpoint: 600, width: double.infinity, margin: 32, padding: 0, columns: 8),
    md: Breakpoint(breakpoint: 905, width: 840, margin: null, padding: 0, columns: 12),
    lg: Breakpoint(breakpoint: 1240, width: double.infinity, margin: 200, padding: 0, columns: 12),
    xl: Breakpoint(breakpoint: 1440, width: 1040, margin: null, padding: 0, columns: 12),
    xxl: null,
  );

  @override
  Widget build(BuildContext context) {
    return BreakpointConfigurator(
      configuration: breakpoints,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BreakpointContainer(
          fluid: true,
          alignment: Alignment.center,
          xlChild: Text('${widget.title} - Desktop'),
          mdChild: Text('${widget.title} - Tablet'),
          child: Text('${widget.title} - Mobile'),
        ),
      ),
      body: BreakpointContainer(
        xlChild: _DesktopView(counter: _counter),
        mdChild: _TabletView(counter: _counter),
        child: _MobileView(counter: _counter),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _MobileView extends StatelessWidget {
  final int counter;

  const _MobileView({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}

class _TabletView extends StatelessWidget {
  final int counter;

  const _TabletView({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}

class _DesktopView extends StatelessWidget {
  final int counter;

  const _DesktopView({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }
}
