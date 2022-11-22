import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/data/models/bill.dart';

class ResultPanel extends StatelessWidget {
  const ResultPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: const [
            _TipDisplay(),
            Text(''),
            _SubtotalDisplay(),
            _SubtotalTipDisplay(),
          ],
        ),
      ),
    );
  }
}

class _TipDisplay extends StatelessWidget {
  const _TipDisplay();

  @override
  Widget build(BuildContext context) {
    return Consumer<BillModel>(
      builder: (context, bill, child) => Row(
        children: [
          Expanded(
            child: Text(
              'Tip (${bill.tipString()}) ${bill.split > 1 ? '(ea.)' : ''}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: Text(
              '\$${bill.tipAmountSplit.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}

class _SubtotalDisplay extends StatelessWidget {
  const _SubtotalDisplay();

  @override
  Widget build(BuildContext context) {
    return Consumer<BillModel>(
      builder: (context, bill, child) => Row(
        children: [
          Expanded(
            child: Text(
              'Subtotal ${bill.split > 1 ? '(ea.)' : ''}',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          Expanded(
            child: Text(
              '\$${bill.subtotalSplit.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}

class _SubtotalTipDisplay extends StatelessWidget {
  const _SubtotalTipDisplay();

  @override
  Widget build(BuildContext context) {
    return Consumer<BillModel>(
      builder: (context, bill, child) => Row(
        children: [
          Expanded(
            child: Text(
              'Subtotal + Tip ${bill.split > 1 ? '(ea.)' : ''}',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
          Expanded(
            child: Text(
              '\$${bill.totalSplit.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
