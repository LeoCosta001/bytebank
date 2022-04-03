import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferer_data.dart';
import 'package:flutter/material.dart';

const _titleAppBar = 'Nova Transferência';
const _inputLabelTextAccountNumber = 'Número da conta';
const _inputHintTextAccountNumber = '00000';
const _inputLabelTextValue = 'Valor';
const _inputHintTextValue = '0,00';
const _confirmButtonText = 'Confirmar';

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
      appBar: AppBar(title: const Text(_titleAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              getController: widget._fieldAccountNumberController,
              getLabelText: _inputLabelTextAccountNumber,
              getHintText: _inputHintTextAccountNumber,
            ),
            Editor(
              getController: widget._fieldAccountValueController,
              getLabelText: _inputLabelTextValue,
              getHintText: _inputHintTextValue,
              getIcon: Icons.monetization_on,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.00),
              child: ElevatedButton(
                  child: const Text(_confirmButtonText), onPressed: () => _createTransference(context)),
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
