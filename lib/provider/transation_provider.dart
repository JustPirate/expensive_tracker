import 'package:expensive_tracker/model/transation.dart';
import 'package:flutter/material.dart';

class TransationProvider extends ChangeNotifier {
  final List<Transation> _transation = [];
  List<Transation> get transation => _transation;

  double get totalIncome => _transation
      .where((tx) => tx.isIncome)
      .fold(0, (Sum, tx) => Sum = Sum + tx.amount);

  double get totalExpenses => _transation
      .where((tx) => !tx.isIncome)
      .fold(0, (Sum, tx) => Sum = Sum + tx.amount);

  double get remainingBalence => totalIncome - totalExpenses;

  void insertNewTransation(
    String id,
    String title,
    double amount,
    DateTime date,
    bool isIncome,
  ) {
    final newTransation = Transation(
      id: id,
      title: title,
      amount: amount,
      data: date,
      isIncome: isIncome,
    );
    transation.insert(0, newTransation);
    notifyListeners();
  }

  void removeTransation(String id) {
    transation.removeWhere((tx) => tx.id == id);
    notifyListeners();
  }
}
