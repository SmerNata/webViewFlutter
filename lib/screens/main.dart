import 'package:count_app/screens/android.dart';
import 'package:count_app/screens/ios.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AndroidPage()),
                        );
                      },
                      icon: Icon(Icons.android),
                      label: Text('Android'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const IosPage()),
                        );
                      },
                      icon: Icon(Icons.apple),
                      label: Text('iOS'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}