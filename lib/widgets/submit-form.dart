import 'package:flutter/material.dart';
import 'package:aog/widgets/input.widget.dart';
import 'package:aog/widgets/loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  final TextEditingController? gasCtrl;
  final TextEditingController? alcCtrl;
  final bool busy;
  final VoidCallback submitFunc;

  const SubmitForm(
      {Key? key,
      required this.busy,
      required this.submitFunc,
      required this.gasCtrl,
      required this.alcCtrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Gasolina",
            ctrl: gasCtrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Input(
            label: "Álcool",
            ctrl: alcCtrl,
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
