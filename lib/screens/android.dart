import 'package:count_app/screens/counter.dart';
import 'package:count_app/screens/main.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AndroidPage extends StatefulWidget {
  const AndroidPage({Key? key}) : super(key: key);

  @override
  State<AndroidPage> createState() => _AndroidPageState();
}

class _AndroidPageState extends State<AndroidPage> {
  late final WebViewController controller;
  int _selectedIndex = 1;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse('https://shampuriko.ru/about/'),
      );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (_selectedIndex) {
      case 0:
        page = MainPage();
        break;
      case 1:
        page = CounterPage(theme:'material');
        break;
      case 2:
        page = WebViewWidget(controller: controller);
        break;
      default:
        throw UnimplementedError('нет виджета');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Андройд'),
      ),
      body: page,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.plus_one),
            label: 'Counter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.language),
            label: 'WebView',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            default:
              _onItemTapped(index);
          }
        },
      ),
    );
  }
}