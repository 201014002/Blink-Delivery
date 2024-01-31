import 'package:blink_delivery/utils/colors.dart';
import 'package:blink_delivery/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List account = [
    [FontAwesomeIcons.shop, 'Orders'],
    [FontAwesomeIcons.heart, 'Yours favourites'],
    [FontAwesomeIcons.star, 'Restaurant Rewards'],
    [FontAwesomeIcons.wallet, 'Wallet'],
    [FontAwesomeIcons.gift, 'Send a gift'],
    [FontAwesomeIcons.suitcase, 'Business preferences'],
    [FontAwesomeIcons.person, 'Help'],
    [FontAwesomeIcons.tag, 'Promotion'],
    [FontAwesomeIcons.ticket, 'Blink Delivery Pass'],
    [FontAwesomeIcons.suitcase, 'Deliver with Blink Delivery'],
    [FontAwesomeIcons.gear, 'Settings'],
    [FontAwesomeIcons.powerOff, 'Sign Out'],
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              children: [
                CircleAvatar(radius: 3.h,backgroundColor: black,
                  child: CircleAvatar(
                    radius: 3.h-2,
                    backgroundColor: white,
                    child: FaIcon(
                      FontAwesomeIcons.user,
                      size: 3.h,
                      color: grey,
                    ),
                  ),
                ),
                SizedBox(width: 10.w,),
                Text(
                  'Users Name',
                  style: AppTextStyles.body16,
                ),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            ListView.builder(
                itemCount: account.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: FaIcon(
                      account[index][0],
                      size: 2.h,
                      color: black,
                    ),
                    title: Text(
                      account[index][1],
                      style: AppTextStyles.body14,
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
