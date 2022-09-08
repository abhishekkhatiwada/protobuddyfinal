import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:protobuddy/models/post_proto.dart';
import 'package:protobuddy/providers/crud_provider.dart';
import 'package:protobuddy/providers/image_provider.dart';
import 'package:protobuddy/widgets/colors.dart';

class UpdatePorto extends StatelessWidget {
  final Postproto post;
  UpdatePorto(this.post);
  final specificationController = TextEditingController();
  final creatorController = TextEditingController();
  final educationController = TextEditingController();
  final experienceController = TextEditingController();
  final descriptionController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  final mailController = TextEditingController();

  final _form = GlobalKey<FormState>();
  final userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: ((context, ref, child) {
      final image = ref.watch(imageProvider).image;
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            onPressed: (() {
              Navigator.of(context).pop();
            }),
            icon: Icon(
              Icons.arrow_back,
              color: ColorConstants.secondaryColor,
            ),
          ),
          backgroundColor: Colors.black,
          title: Text(
            'Create a protofolio',
            style: TextStyle(color: ColorConstants.secondaryColor),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () async {
                  _form.currentState!.save();
                  FocusScope.of(context).unfocus();
                  SystemChannels.textInput.invokeMethod('TextInput.hide');
                  if (_form.currentState!.validate()) {
                    if (image == null) {
                      final response = await ref.read(crudProvider).updatePost(
                            email: mailController.text.trim(),
                            address: addressController.text.trim(),
                            number: numberController.text.trim(),
                            creatorName: creatorController.text.trim(),
                            speciality: specificationController.text.trim(),
                            education: educationController.text.trim(),
                            experience: experienceController.text.trim(),
                            description: descriptionController.text.trim(),
                            postId: post.id,
                          );
                      if (response != 'success') {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: ColorConstants.secondaryColor,
                            duration: Duration(seconds: 1),
                            content: Text(
                              response,
                              style:
                                  TextStyle(color: ColorConstants.primaryColor),
                            )));
                      } else {
                        Navigator.of(context).pop();
                      }
                    } else {
                      final response = await ref.read(crudProvider).updatePost(
                          email: mailController.text.trim(),
                          address: addressController.text.trim(),
                          number: numberController.text.trim(),
                          creatorName: creatorController.text.trim(),
                          speciality: specificationController.text.trim(),
                          education: educationController.text.trim(),
                          experience: experienceController.text.trim(),
                          description: descriptionController.text.trim(),
                          postId: post.id,
                          imageId: post.imageId,
                          file: image);
                      if (response != 'success') {
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: ColorConstants.secondaryColor,
                            duration: Duration(seconds: 1),
                            content: Text(
                              response,
                              style:
                                  TextStyle(color: ColorConstants.primaryColor),
                            )));
                      } else {
                        Navigator.of(context).pop();
                      }
                    }
                  }
                },
                icon: Icon(
                  Icons.upload,
                  color: ColorConstants.secondaryColor,
                ))
          ],
        ),
        body: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: ListView(
              children: [
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: creatorController..text = post.creatorName,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'PLEASE INPUT CREATOR NAME';
                    }
                    return null;
                  }),
                  autofocus: false,
                  cursorColor: Colors.grey,
                  textInputAction: TextInputAction.next,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    label: Text('Creator Name'),
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
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: specificationController..text = post.speciality,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'PLEASE INPUT SPECIALITY';
                    }
                    return null;
                  }),
                  autofocus: false,
                  cursorColor: Colors.grey,
                  textInputAction: TextInputAction.next,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    hintText: 'Designer, Coder, Developer',
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    label: Text('Speciality'),
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
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: educationController..text = post.education,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'PLEASE INPUT EDUCATION';
                    }
                    return null;
                  }),
                  autofocus: false,
                  cursorColor: Colors.grey,
                  textInputAction: TextInputAction.next,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    hintText: '+2,Bachelor, Graduated',
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    label: Text('Education'),
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
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: experienceController..text = post.education,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'PLEASE INPUT EDUCATION';
                    }
                    return null;
                  }),
                  autofocus: false,
                  cursorColor: Colors.grey,
                  textInputAction: TextInputAction.next,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    label: Text('Experience'),
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    hintText: 'Years of experience',
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
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: addressController..text = post.address,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'PLEASE INPUT ADDRESS';
                    }
                    return null;
                  }),
                  autofocus: false,
                  cursorColor: Colors.grey,
                  textInputAction: TextInputAction.next,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    label: Text('Address'),
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
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: numberController..text = post.number,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'PLEASE INPUT NUMBER';
                    }
                    return null;
                  }),
                  autofocus: false,
                  cursorColor: Colors.grey,
                  textInputAction: TextInputAction.next,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    label: Text('Number'),
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
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'PLEASE INPUT EMAIL';
                    } else if (!value.contains('@')) {
                      return 'ENTER VALID EMAILADDRESS';
                    }
                    return null;
                  }),
                  controller: mailController..text = post.email,
                  autofocus: false,
                  cursorColor: Colors.grey,
                  textInputAction: TextInputAction.next,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    label: Text('Email'),
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
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: descriptionController..text = post.description,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return 'PLEASE INPUT DESCRIPTION';
                    }
                    return null;
                  }),
                  autofocus: false,
                  cursorColor: Colors.grey,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.next,
                  cursorHeight: 25,
                  decoration: InputDecoration(
                    labelStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    hintStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    hintText: 'About the project',
                    label: Text('Project Description'),
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
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: (() {
                    ref.read(imageProvider).imagePicker();
                  }),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: image == null
                          ? Image.network(post.imageUrl)
                          : Image.file(
                              File(image.path),
                              fit: BoxFit.cover,
                            )),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}
