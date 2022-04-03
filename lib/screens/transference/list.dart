import 'package:bytebank/models/transferer_data.dart';
import 'package:bytebank/screens/transference/form.dart';
import 'package:flutter/material.dart';

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