class TransferData {
  final int accountNumber;
  final double value;

  TransferData(this.accountNumber, this.value);

  @override
  String toString() {
    return 'TransferData{accountNumber: $accountNumber, value: $value}';
  }
}
