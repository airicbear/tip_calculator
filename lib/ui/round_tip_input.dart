import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/data/models/bill.dart';

class RoundTipInput extends StatelessWidget {
  const RoundTipInput({super.key});

  List<_RoundTipInputItem> _tipItemList(BillModel bill) {
    return const [
      _RoundTipInputItem(roundTip: RoundTip.none),
      _RoundTipInputItem(roundTip: RoundTip.down),
      _RoundTipInputItem(roundTip: RoundTip.up),
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

class _RoundTipInputItem extends StatelessWidget {
  const _RoundTipInputItem({required this.roundTip});

  final RoundTip roundTip;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<BillModel>(
        builder: (context, bill, child) => Card(
          color: bill.roundTip == roundTip
              ? Theme.of(context).toggleableActiveColor
              : Theme.of(context).cardColor,
          child: InkWell(
            onTap: () => bill.setRoundTip(roundTip),
            child: Center(
              child: Text(
                roundTip.label,
                style: TextStyle(
                  color: bill.roundTip == roundTip
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
