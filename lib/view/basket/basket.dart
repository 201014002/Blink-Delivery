import 'package:blink_delivery/utils/textStyles.dart';
import 'package:flutter/material.dart';
class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Basket Screen',
          style: AppTextStyles.body16Bold,
        ),
      ),
    );
  }
}
