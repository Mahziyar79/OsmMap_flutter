import 'package:flutter/material.dart';
import 'package:snapp_map/constants/Dimens.dart';

class MyBackButton extends StatelessWidget {
  final Function() onPress;
  const MyBackButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Dimens.medium,
      left: Dimens.medium,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 3),
              blurRadius: 18,
            ),
          ],
        ),
        child: IconButton(onPressed: onPress, icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
