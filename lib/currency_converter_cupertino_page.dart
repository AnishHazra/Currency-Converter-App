import 'package:flutter/cupertino.dart';

class CurrencyConverterCuperertinoPage extends StatefulWidget {
  const CurrencyConverterCuperertinoPage({super.key});

  @override
  State<CurrencyConverterCuperertinoPage> createState() {
    return _CurrencyConverterCuperertinoPageState();
  }
}

class _CurrencyConverterCuperertinoPageState
    extends State<CurrencyConverterCuperertinoPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      result = double.parse(textEditingController.text) * 80;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGrey3,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.systemGrey3,
        middle: Text(
          "Currency Converter",
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                //1. int -> string integervalue.toString()
                //2. string -> int int.parse(stringValue)
                "${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)} ₹",
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              CupertinoTextField(
                controller: textEditingController,
                style: const TextStyle(color: CupertinoColors.black),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                placeholder: "Please enter the amount in USD",
                prefix: const Icon(CupertinoIcons.money_dollar),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
              const SizedBox(height: 15),
              CupertinoButton(
                onPressed: () {
                  convert();
                },
                color: CupertinoColors.black,
                child: const Text("Convert"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
