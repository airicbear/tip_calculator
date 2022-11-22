import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tip_calculator/data/models/bill.dart';

class SplitInput extends StatelessWidget {
  const SplitInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 12.0,
        ),
        child: Column(
          children: [
            const _SplitLabel(),
            Row(
              children: const [
                _SplitInput(),
                _MaxSplitInput(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SplitLabel extends StatelessWidget {
  const _SplitLabel();

  @override
  Widget build(BuildContext context) {
    return Consumer<BillModel>(
      builder: (context, bill, child) => Row(
        children: [
          Expanded(
            child: Text(
              'Split: ${bill.split}',
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}

class _SplitInput extends StatelessWidget {
  const _SplitInput();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Consumer<BillModel>(
        builder: (context, bill, child) => SliderTheme(
          data: SliderThemeData(
            trackShape: CustomTrackShape(),
          ),
          child: Slider(
            value: bill.split.toDouble(),
            min: 1,
            max: bill.maxSplit.toDouble(),
            label: bill.split.toString(),
            onChanged: (double value) => bill.setSplit(value.toInt()),
          ),
        ),
      ),
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width - 24.0;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

class _MaxSplitInput extends StatelessWidget {
  const _MaxSplitInput();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Consumer<BillModel>(
        builder: (context, bill, child) => TextFormField(
          initialValue: bill.maxSplit.toString(),
          onChanged: (text) => bill.parseMaxSplit(text),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp(r'^[0-9]{0,9}'),
            ),
          ],
          decoration: const InputDecoration(
            labelText: 'Max Split',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
