import 'package:flutter_test/flutter_test.dart';
import 'package:tip_calculator/data/models/bill.dart';

void main() {
  test('test bill', () {
    final bill = BillModel();
    bill.setTip(0.2);
    bill.addListener(() {
      expect(bill.subtotal, 1.23);
      expect(bill.total, 1.48);
    });
    bill.setSubtotal(1.23);
  });
}
