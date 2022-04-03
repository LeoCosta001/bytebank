import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TransferenceList(),
      ),
    );
  }
}

class TransferenceForm extends StatefulWidget {
  final TextEditingController _fieldAccountNumberController = TextEditingController();
  final TextEditingController _fieldAccountValueController = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    _fieldAccountNumberController.dispose();
    _fieldAccountValueController.dispose();
  }

  @override
  State<StatefulWidget> createState() => _TransferenceFormState();
}

class _TransferenceFormState extends State<TransferenceForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nova Transferência')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                getController: widget._fieldAccountNumberController,
                getLabelText: 'Número da conta',
                getHintText: '00000'),
            Editor(
                getController: widget._fieldAccountValueController,
                getLabelText: 'Valor',
                getHintText: '0,00',
                getIcon: Icons.monetization_on),
            Padding(
              padding: const EdgeInsets.only(top: 32.00),
              child: ElevatedButton(
                  child: const Text('Confirmar'), onPressed: () => _createTransference(context)),
            ),
          ],
        ),
      ),
    );
  }

  void _createTransference(BuildContext context) {
    final int? accountNumber = int.tryParse(widget._fieldAccountNumberController.text);
    final double? accountValue = double.tryParse(widget._fieldAccountValueController.text);

    if (accountNumber != null && accountValue != null) {
      final transferCreated = TransferData(accountNumber, accountValue);
      Navigator.pop(context, transferCreated);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController getController;
  final String getLabelText;
  final String getHintText;
  final IconData? getIcon;

  Editor(
      {required this.getController,
      required this.getLabelText,
      required this.getHintText,
      this.getIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0),
      child: TextField(
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          labelText: getLabelText,
          icon: getIcon != null ? Icon(getIcon) : null,
          hintText: getHintText,
        ),
        keyboardType: TextInputType.number,
        controller: getController,
      ),
    );
  }
}

//**
class TransferenceList extends StatefulWidget {
  final List<TransferData> _transferDataList = [];

  @override
  State<StatefulWidget> createState() {
    return TransferenceListState();
  }
}

class TransferenceListState extends State<TransferenceList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferências')),
      body: ListView.builder(
        itemCount: widget._transferDataList.length,
        itemBuilder: (context, index) {
          final getTransferDataValue = widget._transferDataList[index];
          return TransferenceItem(getTransferDataValue);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future<TransferData?> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
            return TransferenceForm();
          }));

          future.then((newTransferData) {
            if (newTransferData != null) {
              setState(() {
                return widget._transferDataList.add(newTransferData);
              });
            }
          });
        },
      ),
    );
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
