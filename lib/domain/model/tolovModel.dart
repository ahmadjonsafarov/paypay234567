class TolovModel{
  final String name;
  final String number;
  final num money;

  TolovModel({required this.name, required this.number, required this.money});

  toJson(){
    return {
      "name":name,
      'number':number,
      'money':money,
    };
  }

  factory TolovModel.fromJson(dynamic data){
    return TolovModel(name: data['name'], number: data['number'], money: data['money']);
  }
}
