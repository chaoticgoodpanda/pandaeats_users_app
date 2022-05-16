import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pandaeats_users_app/global/global.dart';
import 'package:pandaeats_users_app/helperMethods/cart_item_counter.dart';
import 'package:provider/provider.dart';

addItemToCart(String? foodItemId, BuildContext context, int itemCounter)
{
  List<String>? tempList = sharedPreferences!.getStringList("userCart");
  // adds the food item Id + total number of items user has selected
  tempList!.add(foodItemId! + ":$itemCounter");

  FirebaseFirestore.instance.collection("users").doc(firebaseAuth.currentUser!.uid).update({
    // save it as this in firestore
    "userCart": tempList,
  }).then((value){
    // show toast to user showing item added successfully
    Fluttertoast.showToast(msg: "Item successfully added.");

    // save this locally as well
    sharedPreferences!.setStringList("userCart", tempList);

    // update the # of items in the cart
    Provider.of<CartItemCounter>(context, listen: false).displayCartListItemsNumber();

  });
}

separateItemIDs()
{
  List<String> separateItemIDsList = [], defaultItemList = [];
  int i = 0;

  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for (i; i < defaultItemList.length; i++) {
    String item = defaultItemList[i].toString();
    var pos = item.lastIndexOf(":");
    // if there is an item quantity added, check the id pulled from the item substring
    String getItemId = (pos != -1) ? item.substring(0, pos) : item;

    print("\nThis is the itemID = " + getItemId);

    separateItemIDsList.add(getItemId);
  }

  print("\nThis is the Items List = ");
  print(separateItemIDsList);

  return separateItemIDsList;

}