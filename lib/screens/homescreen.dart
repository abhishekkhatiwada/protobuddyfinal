import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:protobuddy/models/user.dart';
import 'package:protobuddy/providers/crud_provider.dart';
import 'package:protobuddy/screens/create_portofolio_screen.dart';
import 'package:protobuddy/screens/details_screen.dart';
import 'package:protobuddy/widgets/drawer_widget.dart';
import 'package:protobuddy/widgets/updatepage.dart';

class HomeScreen extends StatelessWidget {
  late User user;
  final userId = auth.FirebaseAuth.instance.currentUser!.uid;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final userData = ref.watch(userStream);
      final postData = ref.watch(postStream);

      var size = MediaQuery.of(context).size;

      return Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'PROTOFOLIO',
            textScaleFactor: 1.2,
          ),
        ),
        backgroundColor: Colors.black,
        body: ListView(
          children: [
            Container(
              height: 600,
              child: postData.when(
                data: (data) {
                  return ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        //user = data.firstWhere((element) => element.userId == userId);
                        final dat = data[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => DetailScreen(dat));
                          },
                          onLongPress: () {
                            if (userId == dat.userId) {
                              Get.defaultDialog(
                                  title: 'Customize Portofolio',
                                  content: Text('Edit or remove post'),
                                  actions: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Get.to(() => UpdatePorto(dat),
                                            transition: Transition.leftToRight);
                                      },
                                      icon: Icon(Icons.edit),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Get.defaultDialog(
                                            title: 'Are you sure',
                                            content: Text(
                                                'you want to remove  this post'),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                    ref
                                                        .read(crudProvider)
                                                        .removePost(
                                                            postId: dat.id,
                                                            imageId:
                                                                dat.imageId);
                                                  },
                                                  child: Text('yes')),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('No'))
                                            ]);
                                      },
                                      icon: Icon(Icons.delete),
                                    )
                                  ]);
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            constraints: const BoxConstraints(
                              maxHeight: 250,
                            ),
                            child: Card(
                              margin: const EdgeInsets.all(0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 12, 0),
                                        width: 190,
                                        child: Image.network(
                                          dat.imageUrl,
                                          fit: BoxFit.cover,
                                          height: 250,
                                        ),
                                      )
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(8),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  dat.description,
                                                  textScaleFactor: 1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(8),
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircleAvatar(
                                                radius: 17,
                                                backgroundColor:
                                                    Colors.redAccent,
                                                child: Icon(
                                                  Icons.abc,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.all(0),
                                                child: FittedBox(
                                                  child: Text(
                                                    dat.creatorName,
                                                    //textScaleFactor: 1,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                error: (error, stackTrace) => Text('$error'),
                loading: () => Container(),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: (() {
            Get.to(() => CreateProto());
          }),
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
}
