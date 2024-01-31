import 'package:blink_delivery/utils/colors.dart';
import 'package:blink_delivery/view/account/account.dart';
import 'package:blink_delivery/view/basket/basket.dart';
import 'package:blink_delivery/view/browse/browse.dart';
import 'package:blink_delivery/view/grocery/groceryScreen.dart';
import 'package:blink_delivery/view/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BottomNavigationBarBlinkDelivery extends StatefulWidget {
  const BottomNavigationBarBlinkDelivery({super.key});

  @override
  State<BottomNavigationBarBlinkDelivery> createState() => _BottomNavigationBarBlinkDeliveryState();
}

class _BottomNavigationBarBlinkDeliveryState extends State<BottomNavigationBarBlinkDelivery> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const BrowseScreen(),
      const GroceryScreen(),
      const BasketScreen(),
      const AccountScreen()
    ];
        }
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.house),
        title: "Home",
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
        title: ("Browse"),
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.basketShopping),
        title: ("Grocery"),
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.cartShopping),
        title: ("Basket"),
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.person),
        title: ("Account"),
        activeColorPrimary: black,
        inactiveColorPrimary: grey,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarHeight: kBottomNavigationBarHeight,
      hideNavigationBarWhenKeyboardShows: true,
      margin: EdgeInsets.all(0.0),
      popActionScreens: PopActionScreensType.all,
      decoration: NavBarDecoration(
          colorBehindNavBar: Colors.white,
          borderRadius: BorderRadius.circular(10.0)),
      popAllScreensOnTapOfSelectedTab: true,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
      NavBarStyle.style6, // Choose the nav bar style with this property
    );

  }
}
