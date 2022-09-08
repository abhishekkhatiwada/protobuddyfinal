// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:protobuddy/providers/auth_provider.dart';

// import 'package:protobuddy/providers/image_provider.dart';
// import 'package:protobuddy/providers/login_provider.dart';

// class AuthScreen extends StatelessWidget {
//   final nameController = TextEditingController();
//   final mailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final _form = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Consumer(
//         builder: (context, ref, child) {
//           final isLogin = ref.watch(loginProvider);
//           final image = ref.watch(imageProvider).image;
//           final isLoad = ref.watch(loadingProvider);
//           return SafeArea(
//             child: Container(
//               height: double.infinity,
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                       isLogin ? "assets/pg.png" : "assets/signup.png"),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               child: Container(
//                   padding: isLogin
//                       ? EdgeInsets.fromLTRB(8, 50, 8, 8)
//                       : EdgeInsets.fromLTRB(8, 95, 8, 8),
//                   width: double.infinity,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 isLogin ? 'Login' : 'Sign Up',
//                                 textScaleFactor: 3.5,
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 45,
//                             ),
//                             Form(
//                               child: Column(
//                                 children: [
//                                   if (isLogin == false)
//                                     TextFormField(
//                                       controller: nameController,
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return 'PLEASE ENTER USERNAME';
//                                         } else if (value.length > 10) {
//                                           return 'Maximum 10 characters only';
//                                         }
//                                         return null;
//                                       },
//                                       autofocus: false,
//                                       cursorColor: Colors.grey,
//                                       textInputAction: TextInputAction.next,
//                                       cursorHeight: 25,
//                                       decoration: InputDecoration(
//                                         hintStyle: const TextStyle(
//                                             fontSize: 16, color: Colors.grey),
//                                         hintText: 'Username',
//                                         filled: true,
//                                         focusColor: Colors.grey,
//                                         enabledBorder: OutlineInputBorder(
//                                           borderSide: const BorderSide(
//                                             color: Colors.grey,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(5.0),
//                                         ),
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: const BorderSide(
//                                             color: Colors.grey,
//                                           ),
//                                           borderRadius:
//                                               BorderRadius.circular(5.0),
//                                         ),
//                                         prefixIcon: const Icon(
//                                           Icons.mail,
//                                           color: Colors.grey,
//                                           size: 30,
//                                         ),
//                                       ),
//                                       style: const TextStyle(
//                                           fontSize: 16, color: Colors.grey),
//                                     ),
//                                   const SizedBox(
//                                     height: 15,
//                                   ),
//                                   TextFormField(
//                                     controller: mailController,
//                                     validator: (value) {
//                                       if (value!.isEmpty ||
//                                           !value.contains('@')) {
//                                         return 'PLEASE ENTER VALID EMAIL ADDRESS';
//                                       }
//                                       return null;
//                                     },
//                                     autofocus: false,
//                                     cursorColor: Colors.grey,
//                                     textInputAction: TextInputAction.next,
//                                     cursorHeight: 25,
//                                     decoration: InputDecoration(
//                                       hintStyle: const TextStyle(
//                                           fontSize: 16, color: Colors.grey),
//                                       hintText: 'Email',
//                                       filled: true,
//                                       focusColor: Colors.grey,
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: const BorderSide(
//                                           color: Colors.grey,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: const BorderSide(
//                                           color: Colors.grey,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                       ),
//                                       prefixIcon: const Icon(
//                                         Icons.mail,
//                                         color: Colors.grey,
//                                         size: 30,
//                                       ),
//                                     ),
//                                     style: const TextStyle(
//                                         fontSize: 16, color: Colors.grey),
//                                   ),
//                                   const SizedBox(
//                                     height: 15,
//                                   ),
//                                   TextFormField(
//                                     controller: passwordController,
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return 'PLEASE ENTER PASSWORD';
//                                       }
//                                       return null;
//                                     },
//                                     autofocus: false,
//                                     cursorColor: Colors.grey,
//                                     cursorHeight: 25,
//                                     obscureText: true,
//                                     decoration: InputDecoration(
//                                       hintStyle: const TextStyle(
//                                           fontSize: 16, color: Colors.grey),
//                                       hintText: 'Password',
//                                       enabledBorder: OutlineInputBorder(
//                                         borderSide: const BorderSide(
//                                           color: Colors.grey,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                       ),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderSide: const BorderSide(
//                                           color: Colors.grey,
//                                         ),
//                                         borderRadius:
//                                             BorderRadius.circular(5.0),
//                                       ),
//                                       filled: true,
//                                       focusColor: Colors.grey,
//                                       prefixIcon: const Icon(
//                                         Icons.lock,
//                                         color: Colors.grey,
//                                         size: 30,
//                                       ),
//                                     ),
//                                     style: const TextStyle(
//                                         fontSize: 16, color: Colors.black),
//                                   ),
//                                   const SizedBox(
//                                     height: 15,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       MaterialButton(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(30),
//                                         ),
//                                         onPressed: () async {
//                                           FocusScope.of(context).unfocus();

//                                           _form.currentState!.save();
//                                           print(mailController);
//                                           print(passwordController);
//                                           print(nameController);

//                                           if (_form.currentState!.validate()) {
//                                             if (isLogin) {
//                                               ref
//                                                   .read(
//                                                       loadingProvider.notifier)
//                                                   .toggle();
//                                               final response = await ref
//                                                   .read(authProvider)
//                                                   .userSignIn(
//                                                     email: mailController.text
//                                                         .trim(),
//                                                     password: passwordController
//                                                         .text
//                                                         .trim(),
//                                                   );
//                                               if (response != 'success') {
//                                                 ref
//                                                     .read(loadingProvider
//                                                         .notifier)
//                                                     .toggle();
//                                                 ScaffoldMessenger.of(context)
//                                                     .hideCurrentSnackBar();
//                                                 ScaffoldMessenger.of(context)
//                                                     .showSnackBar(SnackBar(
//                                                         duration: Duration(
//                                                             milliseconds: 1500),
//                                                         content:
//                                                             Text(response)));
//                                               }
//                                             } else {
//                                               ref
//                                                   .read(
//                                                       loadingProvider.notifier)
//                                                   .toggle();
//                                               final response = await ref
//                                                   .read(authProvider)
//                                                   .userSignUp(
//                                                     username: nameController
//                                                         .text
//                                                         .trim(),
//                                                     email: mailController.text
//                                                         .trim(),
//                                                     password: passwordController
//                                                         .text
//                                                         .trim(),
//                                                   );
//                                               if (response != 'success') {
//                                                 ref
//                                                     .read(loadingProvider
//                                                         .notifier)
//                                                     .toggle();
//                                                 ScaffoldMessenger.of(context)
//                                                     .hideCurrentSnackBar();
//                                                 ScaffoldMessenger.of(context)
//                                                     .showSnackBar(SnackBar(
//                                                         duration: Duration(
//                                                             milliseconds: 1500),
//                                                         content:
//                                                             Text(response)));
//                                               }
//                                             }
//                                           }
//                                         },
//                                         child: Ink(
//                                           decoration: const BoxDecoration(
//                                             gradient: LinearGradient(
//                                               colors: <Color>[
//                                                 Color.fromARGB(
//                                                     255, 0, 125, 150),
//                                                 Color.fromARGB(255, 18, 18, 18)
//                                               ],
//                                             ),
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(80.0)),
//                                           ),
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(15.0),
//                                             child: Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 Text(
//                                                   isLogin ? 'Login' : 'Signup',
//                                                   textScaleFactor: 1.5,
//                                                   style: TextStyle(
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                                 Icon(
//                                                   Icons.arrow_forward,
//                                                   color: Colors.white,
//                                                 )
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             isLogin
//                                 ? "Don't have an Account? "
//                                 : 'Already have an Account?',
//                             style: TextStyle(color: Colors.white, fontSize: 19),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               ref.read(loginProvider.notifier).toggle();
//                             },
//                             child: Text(
//                               isLogin ? "Register" : 'Login',
//                               style:
//                                   TextStyle(color: Colors.blue, fontSize: 19),
//                             ),
//                           )
//                         ],
//                       )
//                     ],
//                   )),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
