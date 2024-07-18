import 'package:flutter/material.dart';
import 'package:transfer_app/screens/transfer/schema.dart';
import '../../models/transfer.dart';
import 'form.dart';

class TransferList extends StatefulWidget {
  final List<Transfer> _transfers = [];

  TransferList ({ super.key });

  @override
  State<StatefulWidget> createState () {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  void _addTransfer (receivedTransfer) {
    setState(() => widget._transfers.add(receivedTransfer));
  }
  
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
        title: const Text(appBarTitle)
      ),
      body: ListView.builder(
        itemCount: widget._transfers.length,
        itemBuilder: (BuildContext context, int index) {
          final Transfer transfer = widget._transfers[index];
          return TransferItem(transfer);
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator
            .push(context, MaterialPageRoute(builder: (context) => const TransferForm()))
            .then((receivedTransfer) => _addTransfer(receivedTransfer));
        },
        child: const Icon(Icons.add)
      )
    );
  }
}

class TransferItem extends StatelessWidget {
  final Transfer _transfer;

  const TransferItem(this._transfer, { super.key });

  @override
  Widget build (BuildContext context) {
    final int accountNumber = _transfer.accountNumber;
    final double value = _transfer.value;

    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text('$labelValue $value'),
        subtitle: Text('$labelAccount $accountNumber')
      )
    );
  }
}