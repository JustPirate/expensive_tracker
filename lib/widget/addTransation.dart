import 'package:expensive_tracker/provider/transation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addtransation extends StatefulWidget {
  Addtransation({super.key});

  @override
  State<Addtransation> createState() => _AddtransationState();
}

class _AddtransationState extends State<Addtransation> {
  final _textfieldTitle = TextEditingController();
  final _textfieldAmount = TextEditingController();
  bool _isIncome = true;
  void finalSubmistion() {
    final title = _textfieldTitle.text;
    final amount = double.tryParse(_textfieldAmount.text) ?? 0;

    if (title.isEmpty || amount <= 0) return;
    Provider.of<TransationProvider>(context, listen: false).(amount,title,_isIncome);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(label: Text("Title")),
              controller: _textfieldTitle,
            ),
            TextField(
              decoration: InputDecoration(label: Text("amount")),
              controller: _textfieldAmount,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Icome",
                  style: TextStyle(
                    color: _isIncome ? Colors.green : Colors.black,
                  ),
                ),
                Switch(
                  value: _isIncome,
                  onChanged: (_) {
                    setState(() {
                      _isIncome = !_isIncome;
                    });
                  },
                ),

                Text(
                  "Expens",
                  style: TextStyle(
                    color: _isIncome ? Colors.black : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
