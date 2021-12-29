import 'package:aog/widgets/input.widget.dart';
import 'package:aog/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';

class SubmitForm extends StatelessWidget {
  final bool busy;
  final VoidCallback submitFunc;

  const SubmitForm({Key? key, required this.busy, required this.submitFunc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Gasolina",
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Álcool",
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        LoadingButton(
            busy: busy, invert: false, text: 'CALCULAR', func: submitFunc)
      ],
    );
  }
}
