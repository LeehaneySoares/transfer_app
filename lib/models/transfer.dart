class Transfer {
  final double value;
  final int accountNumber;

  Transfer ({ required this.accountNumber, required this.value });

  @override
  String toString () {
    return 'Transferência { accountNumber: $accountNumber, value: $value }';
  }
}