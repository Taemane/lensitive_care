import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:lensitive_care/presentation/catalog_screen.dart';
import 'package:lensitive_care/presentation/cart_screen.dart';
import 'package:lensitive_care/presentation/home_screen.dart';
import 'package:lensitive_care/presentation/settings_screen.dart';
import 'package:lensitive_care/presentation/wishlist_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const CatalogScreen(),
      const WishlistScreen(),
      const CartScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
        elevation: 5,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.home_24_regular),
            activeIcon: Icon(FluentIcons.home_24_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.clipboard_bullet_list_ltr_20_regular),
            activeIcon: Icon(FluentIcons.clipboard_bullet_list_ltr_20_filled),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.heart_24_regular),
            activeIcon: Icon(FluentIcons.heart_24_filled),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.cart_24_regular),
            activeIcon: Icon(FluentIcons.cart_24_filled),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentIcons.settings_24_regular),
            activeIcon: Icon(FluentIcons.settings_24_filled),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
