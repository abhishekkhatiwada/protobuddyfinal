import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:protobuddy/providers/image_provider.dart';

class BuySell extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final moneyController = TextEditingController();
  final projectType = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text('Listing'),
      ),
      body: Center(
        child: Text('Buy Sell screen'),
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(15),
        ),
        child: MaterialButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text('Selling Form'),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.upload),
                    )
                  ],
                ),
                body: Consumer(builder: (context, ref, child) {
                  final image = ref.watch(imageProvider).image;

                  return Container(
                    height: 800,
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: titleController,
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return 'PLEASE INPUT NAME';
                              }
                              return null;
                            }),
                            autofocus: false,
                            cursorColor: Colors.grey,
                            textInputAction: TextInputAction.next,
                            cursorHeight: 25,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                              hintText: 'NAME OF YOUR PROJECT',
                              labelStyle: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                              label: Text('NAME'),
                              filled: true,
                              focusColor: Colors.grey,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: descriptionController,
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return 'PLEASE INPUT DESCRIPTION';
                              }
                              return null;
                            }),
                            autofocus: false,
                            cursorColor: Colors.grey,
                            textInputAction: TextInputAction.next,
                            cursorHeight: 25,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                              hintText: 'DESCRIPTION',
                              labelStyle: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                              label: Text('DESCRIPTION'),
                              filled: true,
                              focusColor: Colors.grey,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: moneyController,
                            validator: ((value) {
                              if (value!.isEmpty) {
                                return 'PLEASE INPUT AMOUNT';
                              }
                              return null;
                            }),
                            autofocus: false,
                            cursorColor: Colors.grey,
                            textInputAction: TextInputAction.next,
                            cursorHeight: 25,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                              hintText: 'AMOUNT',
                              labelStyle: const TextStyle(
                                  fontSize: 16, color: Colors.grey),
                              label: Text('AMOUNT'),
                              filled: true,
                              focusColor: Colors.grey,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.grey),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: (() {
                              ref.read(imageProvider).imagePicker();
                            }),
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: image == null
                                    ? Center(
                                        child: Text(
                                        'Select an image',
                                        style: TextStyle(color: Colors.grey),
                                      ))
                                    : Image.file(
                                        File(image.path),
                                        fit: BoxFit.cover,
                                      )),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            );
          },
          child: Text(
            'List Item',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
