
class FoodItemPojo {



  String _name ;
  double _price ;
  String _description;
  String _img;

  FoodItemPojo(this._name, this._price, this._description,this._img);

/*
  factory FoodItemPojo.fromJson(Map<String, dynamic> json) {
    return FoodItemPojo(
      _name: json["_name"],
      _price: double.parse(json["_price"]),
      _description: json["_description"],
      _img: json["_img"],
    );
  }*/

  String get img => _img;

  set img(String value) {
    _img = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

//

}