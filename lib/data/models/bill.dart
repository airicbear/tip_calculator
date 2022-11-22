import 'package:flutter/material.dart';
import 'package:tip_calculator/utils.dart';

enum RoundTip {
  none('DO NOT ROUND'),
  down('ROUND DOWN'),
  up('ROUND UP');

  const RoundTip(this.label);

  final String label;
}

class BillModel extends ChangeNotifier {
  double _subtotal = 0.0;
  double _tip = 0.20;
  int _split = 1;
  int _maxSplit = 5;
  RoundTip _roundTip = RoundTip.none;

  double get subtotal {
    return _subtotal;
  }

  double get tip {
    return _tip;
  }

  int get split {
    return _split;
  }

  int get maxSplit {
    return _maxSplit;
  }

  RoundTip get roundTip {
    return _roundTip;
  }

  double get tipAmount {
    double amt = subtotal * tip;
    switch (roundTip) {
      case RoundTip.none:
        return amt;
      case RoundTip.down:
        return amt.floorToDouble();
      case RoundTip.up:
        return amt.ceilToDouble();
    }
  }

  double get tipAmountSplit {
    double amt = tipAmount / split;
    switch (roundTip) {
      case RoundTip.none:
        return amt;
      case RoundTip.down:
        return amt.floorToDouble();
      case RoundTip.up:
        return amt.ceilToDouble();
    }
  }

  double get total {
    return subtotal + tipAmount;
  }

  double get subtotalSplit {
    return subtotal / split;
  }

  double get totalSplit {
    return total / split;
  }

  String tipString() {
    return Utils.toPercentage(tip);
  }

  void parseSubtotal(String amount) {
    if (amount.isNotEmpty) {
      setSubtotal(double.parse(amount));
    } else {
      setSubtotal(0.0);
    }
    notifyListeners();
  }

  void setSubtotal(double subtotal) {
    _subtotal = subtotal;
    notifyListeners();
  }

  void setTip(double tip) {
    _tip = tip;
    notifyListeners();
  }

  void parseTip(String amount) {
    if (amount.isNotEmpty) {
      setTip(double.parse(amount) / 100.0);
    } else {
      setTip(0.0);
    }
    notifyListeners();
  }

  void setSplit(int split) {
    _split = split;
    notifyListeners();
  }

  void setMaxSplit(int maxSplit) {
    _maxSplit = maxSplit;
    notifyListeners();
  }

  void parseMaxSplit(String amount) {
    if (amount.isNotEmpty) {
      int val = int.parse(amount);
      if (val > 0) {
        if (val < split) {
          setSplit(val);
        }
        setMaxSplit(val);
      }
    }
    notifyListeners();
  }

  void setRoundTip(RoundTip roundTip) {
    _roundTip = roundTip;
    notifyListeners();
  }
}
