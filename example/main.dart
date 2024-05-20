import 'package:custom_router_transition_ah/custom_router_transition_ah.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
     initialRoute: 'page1',
     routes: {
        'page1': (_) => const Page1(),
        'page2': (_) => const Page2(),
     },
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: MaterialButton(
            color: Colors.white,
            onPressed: () {
              RouteTransitions(
                context: context,
                child: const Page2(),
                animation: AnimationType.fadeIn,
                duration : const Duration(seconds: 100),
                replecement: true,
              );
            },
            child: const Text('Go to Page 2')),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueGrey,
      body: const Center(
       child: Text(
         'Page 2'),
      ),
    );
  }
}
