import 'package:flutter/cupertino.dart';
import 'package:pandaeats_users_app/global/global.dart';

class CartItemCounter extends ChangeNotifier {

  // this gets the cart list (total # of items in cart list)
  int cartListItemCount = sharedPreferences!.getStringList("userCart")!.length - 1;
  int get count => cartListItemCount;

  Future<void> displayCartListItemsNumber() async {
    cartListItemCount = sharedPreferences!.getStringList("userCart")!.length - 1;


    await Future.delayed(const Duration(milliseconds: 100), () {
      // share the data using our provider
      notifyListeners();
    });
  }

}