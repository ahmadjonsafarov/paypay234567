class CardModel{
  final String name;
  final String surname;
  final String cardnumber;
  final String date;
  final num money;
  final num color;

  CardModel(
      this.money, {
    required this.color,
    required this.name,
    required this.surname,
    required this.cardnumber,
    required this.date,
      });

  toJson(){
    return {
      "name":name,
      "surname":surname,
      "date":date,
      "cardnumber":cardnumber,
      "color":color,
      'money':money,
    };
  }

  factory CardModel.fromJson(dynamic data){
    return CardModel(
        1000000,
        name: data['name'],
        surname: data['surname'],
        cardnumber: data['cardnumber'],
        date: data['date'],
        color: data['color']

    );
  }

}
