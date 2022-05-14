import 'package:flutter/material.dart';
import 'package:pandaeats_users_app/mainScreens/item_detail_screen.dart';
import 'package:pandaeats_users_app/models/items.dart';
import 'package:pandaeats_users_app/models/sellers.dart';

class ItemsDesignWidget extends StatefulWidget {
  Items? model;
  BuildContext? context;

  ItemsDesignWidget({this.model, this.context});

  @override
  State<ItemsDesignWidget> createState() => _ItemsDesignWidgetState();
}



class _ItemsDesignWidgetState extends State<ItemsDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()
      {
        Navigator.push(context, MaterialPageRoute(builder: (c) => ItemDetailsScreen(model: widget.model)));
      },
      splashColor: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: 285,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Divider(
                height: 4,
                thickness: 3,
                // not too grey
                color: Colors.grey[300],
              ),
              Image.network(
                widget.model!.thumbnailUrl!,
                height: 220.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 1.0,),
              Text(
                widget.model!.title!,
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontFamily: "Train",
                ),
              ),
              Text(
                widget.model!.shortInfo!,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
              Divider(
                height: 4,
                thickness: 3,
                color: Colors.grey[300],
              )
            ],
          ),
        ),
      ),
    );
  }
}
