import 'package:flutter/material.dart';
import 'package:pandaeats_users_app/global/global.dart';

import '../authentication/auth_screen.dart';

class UserDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: [
      Container(
      padding: const EdgeInsets.only(top: 25, bottom: 10),
        child: Column(
          children: [
            // header drawer
            Material(
              borderRadius: const BorderRadius.all(Radius.circular(80)),
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: Container(
                  height: 160,
                  width: 160,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        sharedPreferences!.getString("photoUrl")!
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              sharedPreferences!.getString("name")!,
              style: const TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Train"),
            )
          ],
          ),
          ),

            const SizedBox(height: 12,),

            // body of the drawer
            Container(
              padding: const EdgeInsets.only(top: 1.0),
              child: Column(
                children: [
                  const Divider(
                    height: 10,
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  ListTile(
                    leading: Icon(Icons.home, color: Colors.black,),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: ()
                    {

                    },
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  ListTile(
                    leading: Icon(Icons.reorder, color: Colors.black,),
                    title: Text(
                      "My Orders",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: ()
                    {

                    },
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  ListTile(
                    leading: Icon(Icons.access_time, color: Colors.black,),
                    title: Text(
                      "Order History",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: ()
                    {

                    },
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  ListTile(
                    leading: Icon(Icons.search, color: Colors.black,),
                    title: Text(
                      "Search",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: ()
                    {

                    },
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  ListTile(
                    leading: Icon(Icons.add_location, color: Colors.black,),
                    title: Text(
                      "Add New Address",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: ()
                    {

                    },
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.grey,
                    thickness: 2,
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app, color: Colors.black,),
                    title: Text(
                      "Sign Out",
                      style: TextStyle(color: Colors.black),
                    ),
                    onTap: ()
                    {
                      // makes the current user null
                      firebaseAuth.signOut().then((value) {
                        // return to the login screen
                        Navigator.push(context, MaterialPageRoute(builder: (c) => const AuthScreen()));
                      });
                    },
                  ),
                  const Divider(
                    height: 10,
                    color: Colors.grey,
                    thickness: 2,
                  ),
                ],
              ),
            )
          ],
        ),
    );
  }
}
