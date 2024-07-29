import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Container(
          height: 60,
          child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white60,
              indicatorColor: Colors.transparent,
              tabs: [

              ],
          ),
        ),
    );
  }
}


class IconBox {
  Icon ic;
  String str;

  IconBox({this.ic,this.str});
}