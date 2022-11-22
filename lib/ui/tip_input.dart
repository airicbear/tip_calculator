import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/data/models/bill.dart';
import 'package:tip_calculator/utils.dart';

class TipInput extends StatelessWidget {
  const TipInput({super.key});

  List<Widget> _tipItemList(BillModel bill) {
    return const [
      _TipInputItem(percentage: 0.2),
      _TipInputItem(percentage: 0.15),
      _TipInputItem(percentage: 0.10),
      _CustomTipInputItem(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BillModel>(
      builder: (context, bill, child) => SizedBox(
        height: 76,
        child: Row(
          children: _tipItemList(bill),
        ),
      ),
    );
  }
}

class _TipInputItem extends StatelessWidget {
  const _TipInputItem({required this.percentage});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<BillModel>(
        builder: (context, bill, child) => Card(
          color: bill.tip == percentage
              ? Theme.of(context).toggleableActiveColor
              : Theme.of(context).cardColor,
          child: InkWell(
            onTap: () => bill.setTip(percentage),
            child: Center(
              child: Text(
                Utils.toPercentage(percentage),
                style: TextStyle(
                  color: bill.tip == percentage
                      ? Theme.of(context).canvasColor
                      : Theme.of(context).disabledColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomTipInputItem extends StatelessWidget {
  const _CustomTipInputItem();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<BillModel>(
        builder: (context, bill, child) => Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (text) => bill.parseTip(text),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'^[0-9]{0,4}'),
                ),
              ],
              decoration: const InputDecoration(
                labelText: 'Tip',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
