import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xff2AB5E1),
          leading: IconButton(
            icon: const Icon(
                Icons.arrow_back
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50,horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[const Color(0xff2AB5E1),const Color(0xff19C5FC).withOpacity(0.5)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
            )
        ),
        child: const Text(
            "Made by Citizenfive\n Saransh Chopra\n Onkar Mahapatra\n Akhil Sharma",
          style: TextStyle(
              color: Colors.white,
            fontSize: 20
          ),
        ),
      ),
    );
  }
}
