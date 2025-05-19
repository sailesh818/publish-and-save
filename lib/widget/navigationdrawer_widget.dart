import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/pages/home_pages.dart';
import 'package:flutter_application_1/pages/navigationbar_page.dart';

class NavigationdrawerWidget extends StatelessWidget {
  const NavigationdrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    void signOut() {
      FirebaseAuth.instance.signOut();
    }

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Text(
                    'Menu',
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                  Text(
                    user?.email ?? "No email",
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 2, 79, 34),
                    ),
                  ),
                ],
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NavigationbarPage()),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () => signOut(),
          ),
        ],
      ),
    );
  }
}
