import 'package:wyrmywingspan/fullscreen_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin<SettingsPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 320.0,
            height: 80.0,
            child: ElevatedButton(
              onPressed: () {
                toggleFullscreen();
                HapticFeedback.vibrate();
              },
              child: const Text(
                'toggle fullscreen',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
