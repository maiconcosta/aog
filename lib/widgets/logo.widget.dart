import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const SizedBox(
        height: 50,
      ),
      Image.asset("assets/images/aog-white.png", height: 100),
      const SizedBox(
        height: 20,
      ),
      const Text(
        "Álcool ou Gasolina",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontFamily: "Big Shoulders Display",
        ),
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 20)
    ]);
  }
}
