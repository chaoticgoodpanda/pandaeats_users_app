import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pandaeats_users_app/models/sellers.dart';
import 'package:pandaeats_users_app/widgets/menus_design.dart';

import '../global/global.dart';
import '../models/menus.dart';
import '../widgets/sellers_design.dart';
import '../widgets/progress_bar.dart';
import '../widgets/text_widget_header.dart';
import '../widgets/user_drawer.dart';

class MenusScreen extends StatefulWidget {
  final Sellers? model;
  // pass the model because the model contains the seller info
  MenusScreen({this.model});

  @override
  State<MenusScreen> createState() => _MenusScreenState();
}

class _MenusScreenState extends State<MenusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: UserDrawer(),
        appBar: AppBar(
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
          title: const Text(
            "PandaEats",
            style: TextStyle(fontSize: 45, fontFamily: "Signatra"),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(pinned: true, delegate: TextWidgetHeader(title: widget.model!.sellerName.toString() + " Menus"),),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("sellers")
                  .doc(widget.model!.sellerUID)
                  .collection("menus")
              // how the menus are sorted, by time created, newest first
                  .orderBy("publishedDate", descending: true)
                  .snapshots(),
              builder: (context, snapshot)
              {
                return !snapshot.hasData ?
                SliverToBoxAdapter(
                  child: Center(child: circularProgress(),),
                )
                    :
                SliverStaggeredGrid.countBuilder(
                    crossAxisCount: 1,
                    staggeredTileBuilder: (c) => StaggeredTile.fit(1),
                    itemBuilder: (context, index)
                    {
                      Menus model = Menus.fromJson(
                          snapshot.data!.docs[index].data()! as Map<String, dynamic>
                      );
                      return MenusDesignWidget(
                        model: model,
                        context: context,
                      );
                    },
                    itemCount: snapshot.data!.docs.length
                );
              },
            )
          ],
        )
    );
  }
}
