import 'package:count_app/screens/counter.dart';
import 'package:count_app/screens/main.dart';
import 'package:count_app/screens/web_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosPage extends StatefulWidget {
  const IosPage({Key? key}) : super(key: key);

  @override
  State<IosPage> createState() => _IosPageState();
}

class _IosPageState extends State<IosPage> {
  int _selectedIndex = 1;
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
        page = CounterPage(theme:'cuppertino');
        break;
      case 2:
        page = WebViewPage();
        break;
      default:
        throw UnimplementedError('нет виджета');
    }
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Ios'),
      ),
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.plus_app),
              label: 'Counter',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv_off),
              label: 'WebView',
            ),
          ],
          onTap: (index) {
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
          currentIndex: _selectedIndex,
        ), 
        tabBuilder: (context, index) {
          return SafeArea(
            child:CupertinoTabView(
              builder: (context) {
                return page;
              },
            )
          );
        }
      ),
    );
  }
}