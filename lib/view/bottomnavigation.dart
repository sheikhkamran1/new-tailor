import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newtailor/pages/bottomnavigation/notification.dart';
import 'package:newtailor/view/login.dart';
import '../pages/bottomnavigation/cart/checkout.dart';
import '../pages/bottomnavigation/dashboard.dart';
import '../pages/drawer/privacy.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorScreenState();
}

class _BottomNavigatorScreenState extends State<BottomNavigatorScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.blue,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (value) {
            setState(() {});
            index = value;
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Notification"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Profile"),
          ]),
      body: index == 0
          ? const DashboradScreen()
          : index == 1
              ? const CheckoutScreen()
              : index == 2
                  ? const NotificationScreen()
                  : SafeArea(
                      child: Drawer(
                        child: Column(
                          children: [
                            const UserAccountsDrawerHeader(
                              accountEmail: Text('KamranSheikh786@gmail.com'),
                              accountName: Text('Sheikh Kamran'),
                              currentAccountPicture: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://st2.depositphotos.com/2056297/7333/i/600/depositphotos_73331715-stock-photo-handsome-man.jpg"),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(const LoginScreen());
                              },
                              child: const ListTile(
                                title: Text('Sign in'),
                              ),
                            ),
                            ListTile(
                              title:
                                  const Text('Privacy & Terms Of Conditions'),
                              onTap: () {
                                Get.to(const PrivacyScreen());
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
    );
  }
}
