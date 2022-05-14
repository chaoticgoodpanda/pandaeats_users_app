import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:pandaeats_users_app/main.dart';

import '../helperMethods/helper_methods.dart';
import '../widgets/app_bar.dart';
import '../models/items.dart';

class ItemDetailsScreen extends StatefulWidget {
  final Items? model;
  ItemDetailsScreen({this.model});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {

  TextEditingController counterTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.model!.thumbnailUrl.toString()),
          Padding(padding: const EdgeInsets.all(8.0),
          child: NumberInputPrefabbed.roundedButtons(
            controller: counterTextEditingController,
            incDecBgColor: Colors.amber,
            // lists min 1 and up to 9 items per page
            min: 1,
            max: 9,
            initialValue: 1,
            buttonArrangement: ButtonArrangement.incRightDecLeft,
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.title.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.longDescription.toString(),
              textAlign: TextAlign.justify,
              style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "\$" + widget.model!.price.toString(),
              textAlign: TextAlign.justify,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: InkWell(
              onTap: ()
              {

                int itemCounter = int.parse(counterTextEditingController.text);
                // check to see if the item already exists in the cart
                List<String> separateItemIDsList = separateItemIDs();
                separateItemIDsList.contains(widget.model!.itemID) ? Fluttertoast.showToast(msg: "Item is already in cart.") :
                  // if item not already in list, add to cart
                  addItemToCart(widget.model!.itemID, context, itemCounter);
              },
              child: Container(
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
                width: MediaQuery.of(context).size.width - 13,
                height: 50,
                child: const Center(
                  child: Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
