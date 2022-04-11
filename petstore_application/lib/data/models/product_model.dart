class ProductModel {
  int? _id;
  String? _name;
  int? _quantity;
  double? _price;

  ProductModel({int? id, String? name, int? quantity, double? price}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (quantity != null) {
      this._quantity = quantity;
    }
    if (price != null) {
      this._price = price;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get quantity => _quantity;
  set quantity(int? quantity) => _quantity = quantity;
  double? get price => _price;
  set price(double? price) => _price = price;

  ProductModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _quantity = json['quantity'];
    _price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['quantity'] = this._quantity;
    data['price'] = this._price;
    return data;
  }
}
