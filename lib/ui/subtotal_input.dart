import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/data/models/bill.dart';

class SubtotalInput extends StatelessWidget {
  const SubtotalInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BillModel>(
      builder: (context, bill, child) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (text) => bill.parseSubtotal(text),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'^([0-9]{0,14}.)?([0-9]{0,2})'),
              ),
              FilteringTextInputFormatter.deny('-'),
              FilteringTextInputFormatter.deny(','),
            ],
            decoration: const InputDecoration(
              labelText: 'Enter Your Bill Subtotal',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
