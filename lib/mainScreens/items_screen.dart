import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pandaeats_users_app/models/items.dart';
import 'package:pandaeats_users_app/widgets/items_design.dart';

import '../widgets/app_bar.dart';
import '../global/global.dart';
import '../models/menus.dart';
import '../widgets/sellers_design.dart';
import '../widgets/progress_bar.dart';
import '../widgets/text_widget_header.dart';
import '../widgets/user_drawer.dart';

class ItemsScreen extends StatefulWidget {
  final Menus? model;
  ItemsScreen({this.model});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(pinned: true, delegate: TextWidgetHeader(title: "Items of "+ widget.model!.menuTitle.toString()),),
            const SliverToBoxAdapter(
              child: ListTile(
                title: Text("My Menus",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Signatra",
                    fontSize: 30,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("sellers")
                  .doc(widget.model!.sellerUID)
                  .collection("menus")
                  .doc(widget.model!.menuID)
                  .collection("items")
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
                      Items model = Items.fromJson(
                          snapshot.data!.docs[index].data()! as Map<String, dynamic>
                      );
                      return ItemsDesignWidget(
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
