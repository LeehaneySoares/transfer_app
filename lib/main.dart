import 'package:flutter/material.dart';
import 'screens/transfer/list.dart';

void main () => runApp(const Bytebank());

const _titleApp = 'Transfer App';

class Bytebank extends StatelessWidget {

  const Bytebank({ super.key });

  @override
  Widget build (BuildContext context) {
    return MaterialApp(
      title: _titleApp,
      home: TransferList());
  }
}









