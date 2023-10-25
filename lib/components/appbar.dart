import 'package:flutter/material.dart';
import 'package:tech_news/utils/colors.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
  appbar({Key? key})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.black,
      elevation: 0,
      title: const SizedBox(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Your',style: TextStyle(color: Colors.purple),),
              Text('News',style: TextStyle(color: Colors.white),),
            ],
          ),),
      centerTitle: true,
    );
  }
}