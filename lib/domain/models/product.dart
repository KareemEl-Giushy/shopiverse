class ProductModel {
  String name;
  String unitPrice;
  String finalPrice;
  String quantity;

  ProductModel({
    this.name = "",
    this.unitPrice = "",
    this.finalPrice = "",
    this.quantity = "",
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json["name"],
      unitPrice: json["unitPrice"].toString(),
      finalPrice: json["finalPrice"].toString(),
      quantity: json["quantity"].toString(),
    );
  }
}
