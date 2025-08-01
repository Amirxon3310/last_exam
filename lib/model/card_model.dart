class CardModel {
  final String name;
  final String type;
  final String number;
  final String date;
  final double summa;
  final String bank;

  CardModel({
    required this.bank,
    required this.date,
    required this.name,
    required this.number,
    required this.summa,
    required this.type,
  });
}
