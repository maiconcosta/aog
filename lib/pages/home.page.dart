import 'package:aog/widgets/logo.widget.dart';
import 'package:aog/widgets/submit-form.dart';
import 'package:aog/widgets/success.widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _busy = false;
  var _completed = false;
  var _resultText = "Compensa utilizar álcool";

  TextEditingController _gasCtrl = TextEditingController(text: 'R\$ 0,00');

  TextEditingController _alcCtrl = TextEditingController(text: 'R\$ 0,00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          children: <Widget>[
            const Logo(),
            _completed
                ? Success(
                    result: _resultText,
                    reset: reset,
                  )
                : SubmitForm(
                    busy: _busy,
                    submitFunc: calculate,
                    alcCtrl: _alcCtrl,
                    gasCtrl: _gasCtrl,
                  ),
          ],
        ));
  }

  Future calculate() {
    double alc =
        double.parse(_alcCtrl.text.replaceAll(RegExp(r'[R$ ,.]'), '')) / 100;

    double gas =
        double.parse(_gasCtrl.text.replaceAll(RegExp(r'[R$ ,.]'), '')) / 100;

    double res = alc / gas;

    setState(() {
      _completed = false;
      _busy = true;
    });

    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar Gasolina!";
        } else {
          _resultText = "Compensa utilizar Álcool!";
        }

        _completed = true;
        _busy = false;
      });
    });
  }

  reset() {
    setState(() {
      _alcCtrl = TextEditingController(text: 'R\$ 0,00');
      _gasCtrl = TextEditingController(text: 'R\$ 0,00');
      _completed = false;
      _busy = false;
    });
  }
}
