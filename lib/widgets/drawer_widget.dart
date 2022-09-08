import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:protobuddy/providers/auth_provider.dart';
import 'package:protobuddy/providers/crud_provider.dart';
import 'package:protobuddy/providers/login_provider.dart';
import 'package:protobuddy/screens/buy_sell.dart';
import 'package:protobuddy/screens/create_portofolio_screen.dart';
import 'package:protobuddy/screens/profile_screen.dart';
import 'package:protobuddy/widgets/colors.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer(builder: (context, ref, child) {
        final userData = ref.watch(singleUserStream);
        return userData.when(
            data: (data) {
              String avatarText = data.username.toUpperCase();

              return Container(
                // width: MediaQuery.of(context).size.width * 0.5,
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView(
                    children: [
                      UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[800]),
                        accountName: Text(
                          data.username,
                          style: TextStyle(color: Colors.white),
                        ),
                        accountEmail: Text(
                          data.email,
                          style: TextStyle(color: Colors.white),
                        ),
                        currentAccountPicture: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.black,
                          child: Text('${avatarText[0]}',
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white)),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(5)),
                        child: ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Profile',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: (() {
                            Get.to(() => ProfileScreen());
                          }),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(5)),
                        child: ListTile(
                          leading: Icon(
                            Icons.create,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Create protofolio',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: (() {
                            Get.to(() => CreateProto());
                          }),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(5)),
                        child: ListTile(
                          leading: Icon(
                            Icons.attach_money_rounded,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Buy Sell',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: (() {
                            Get.to(() => BuySell());
                          }),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(5)),
                        child: ListTile(
                          leading: Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                          title: Text(
                            'Sign Out',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: (() {
                            ref.read(loadingProvider.notifier).toggle();
                            ref.read(authProvider).userSignOut();
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (error, stackTrace) => Text('$error'),
            loading: () => Container());
      }),
    );
  }
}
