import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferenceForm(),
      ),
    );
  }
}

class TransferenceForm extends StatelessWidget {
  final TextEditingController _fieldAccountNumberController = TextEditingController();
  final TextEditingController _fieldAccountValueController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _fieldAccountNumberController.dispose();
    _fieldAccountValueController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova Transferência')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0),
            child: TextField(
              style: const TextStyle(fontSize: 24.0),
              decoration: const InputDecoration(
                labelText: 'Número da conta',
                hintText: '12345',
              ),
              keyboardType: TextInputType.number,
              controller: _fieldAccountNumberController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0),
            child: TextField(
              style: const TextStyle(fontSize: 24.0),
              decoration: const InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '0.00',
              ),
              keyboardType: TextInputType.number,
              controller: _fieldAccountValueController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.00),
            child: ElevatedButton(
                child: const Text('Confirmar'),
                onPressed: () {
                  final int? accountNumber = int.tryParse(_fieldAccountNumberController.text);
                  final double? accountValue = double.tryParse(_fieldAccountValueController.text);

                  if (accountNumber != null && accountValue != null) {
                   final transferCreated = TransferData(accountNumber, accountValue);
                   debugPrint('${transferCreated}');
                  }
                }),
          ),
        ],
      ),
    );
  }
}

//**
class TransferenceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferências')),
      body: Column(
        children: [
          TransferenceItem(TransferData(43236, 236.00)),
          TransferenceItem(TransferData(86254, 319.45)),
          TransferenceItem(TransferData(38195, 132.78)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          debugPrint('Hello world!');
        },
      ),
    );
    throw UnimplementedError();
  }
}

class TransferenceItem extends StatelessWidget {
  final TransferData _transferData;

  TransferenceItem(this._transferData);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text('Conta: ${_transferData.accountNumber.toString()}'),
        subtitle: Text('Valor: ${_transferData.value.toString()}'),
      ),
    );
    throw UnimplementedError();
  }
}

class TransferData {
  final int accountNumber;
  final double value;

  TransferData(this.accountNumber, this.value);

  @override
  String toString() {
    return 'TransferData{accountNumber: $accountNumber, value: $value}';
  }
}
