class ProductModel {
  int? _id;
  String? _name;
  int? _quantity;
  double? _price;
  String? _image;

  ProductModel(
      {int? id, String? name, int? quantity, double? price, String? image}) {
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
    if (image != null) {
      this._image = image;
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
  String? get image => _image;
  set image(String? image) => _image = image;

  ProductModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _quantity = json['quantity'];
    _price = json['price'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['quantity'] = this._quantity;
    data['price'] = this._price;
    data['image'] = this._image;
    return data;
  }
}
