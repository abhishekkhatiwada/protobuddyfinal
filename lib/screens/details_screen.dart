import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:protobuddy/models/post_proto.dart';

class DetailScreen extends StatelessWidget {
  final Postproto proto;
  DetailScreen(this.proto);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'Protofolio Details',
            textScaleFactor: 1.2,
          ),
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    'Hi, i\'m ',
                    style: TextStyle(color: Colors.white, fontSize: 50),
                  ),
                  Text(
                    proto.creatorName,
                    style: TextStyle(color: Colors.red, fontSize: 50),
                  )
                ],
              ),
              Text(
                'a Professional ${proto.speciality}',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Text(
                'With an experience of ${proto.experience}.',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Here is my details:',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Contact No: ${proto.number}',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'Address: ${proto.address}',
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Email: ${proto.email}',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'My Projects:',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              SizedBox(height: 30),
              Text(
                proto.description,
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(proto.imageUrl),
              )
            ]),
          ),
        ),
      );
    });
  }
}
