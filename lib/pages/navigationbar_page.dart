import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/create_page.dart';
import 'package:flutter_application_1/pages/home_pages.dart';
import 'package:flutter_application_1/pages/saved_page.dart';
import 'package:flutter_application_1/widget/navigationdrawer_widget.dart';

class NavigationbarPage extends StatefulWidget {
  const NavigationbarPage({super.key});

  @override
  State<NavigationbarPage> createState() => _NavigationbarPageState();
}

class _NavigationbarPageState extends State<NavigationbarPage> {
  final user = FirebaseAuth.instance.currentUser;
  int selectedIndex = 0;

  List<String> titles = ['Home', 'Create', 'Saved'];

  List<Widget> pages = [HomePages(), CreatePage(), SavedPage()];
  void onitem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[selectedIndex])),
      drawer: const NavigationdrawerWidget(),

      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: onitem,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create'),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: 'Saved'),
        ],
      ),
    );
  }
}
