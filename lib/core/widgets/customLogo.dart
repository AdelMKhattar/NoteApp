import 'package:flutter/material.dart';

import '../constants/imagesasset.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade100,
      ),
      child: Image.asset(
        ImageAssets.logo,
        height: 100,
        width: 100,
      ),
    );
  }
}
