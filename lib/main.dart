import 'package:flutter/gestures.dart';
import 'package:wyrmywingspan/wyrmspan_page.dart';
import 'package:wyrmywingspan/wingspan_page.dart';
import 'package:wyrmywingspan/settings_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Color(0xff121212)));

  runApp(const MyApp());
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wyrms and wings score counter',
      scrollBehavior: AppScrollBehavior(),
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Wingspan score counter"),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      children: const [
        SettingsPage(title: "Settings"),
        WingspanPage(title: "Wingspan"),
        WyrmspanPage(title: "Wyrmspan"),
      ],
    ));
  }
}
