class Transation {
  final String id;
  final String title;
  final double amount;
  final DateTime data;
  final bool isIncome;
  Transation({
    required this.id,
    required this.title,
    required this.amount,
    required this.data,
    required this.isIncome
  });
}
