import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget with PreferredSizeWidget {

  final PreferredSizeWidget? bottom;
  MyAppBar({this.bottom});

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => bottom == null ? Size(56, AppBar().preferredSize.height) :
  Size(56, 80 + AppBar().preferredSize.height);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // TODO: colorful gradient thingy you'll want to change later
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.amber,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            )
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: ()
        {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        "PandaEats",
        style: TextStyle(fontSize: 45, fontFamily: "Signatra"),
      ),
      centerTitle: true,
      automaticallyImplyLeading: true,
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.cyan,),
              onPressed: ()
              {
                // send user to cart screen
              },
            ),
            Positioned(
                child: Stack(
                  children: const [
                    Icon(
                      Icons.brightness_1,
                      size: 20.0,
                      color: Colors.green,
                    ),
                    Positioned(
                      top: 3,
                      right: 4,
                      child: Center(
                        child: Text("0", style: TextStyle(color: Colors.white, fontSize: 12),),
                      ),
                    ),
                  ],
                )
            ),
          ],
        )
      ],
    );
  }
}
