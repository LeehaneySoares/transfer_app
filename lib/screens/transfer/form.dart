import 'package:flutter/material.dart';
import '../../models/transfer.dart';
import '../../widgets/editor.dart';
import './schema.dart';

class TransferForm extends StatefulWidget {
  const TransferForm ({ super.key });

  @override
  State<StatefulWidget> createState() {
    return TransferFormState();
  }
}

class TransferFormState extends State<TransferForm> {
  final TextEditingController _controllerAccountNumber = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  void _createTransfer(context) {
    final int? accountNumberParsed = int.tryParse(_controllerAccountNumber.text);
    final double? valueParsed = double.tryParse(_controllerValue.text);

    if (accountNumberParsed != null && valueParsed != null) {
      final Transfer currentTransfer = Transfer(accountNumber: accountNumberParsed, value: valueParsed);
      final SnackBar notify = SnackBar(
        backgroundColor: Colors.green[900],
        content: const Text(transferCreatedSuccess, style: TextStyle(color: Colors.white))
      );
      ScaffoldMessenger.of(context).showSnackBar(notify);
      Navigator.pop(context, currentTransfer);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          foregroundColor: Colors.white,
          title: const Text(createATransfer)),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Editor(
              label: const Text(labelAccountNumber),
              hint: hintAccountNumber,
              controller: _controllerAccountNumber,
            ),
            Editor(
              label: const Text(labelAccountValue),
              hint: hintAccountValue,
              icon: const Icon(Icons.monetization_on),
              controller: _controllerValue),
            ElevatedButton(
              child: const Text(confirm),
              onPressed: () => _createTransfer(context))
          ])
        ));
  }
}