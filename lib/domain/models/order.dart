import 'package:shopiverse/domain/models/product.dart';

class OrderModel {
  String address;
  String phone;
  String note;
  String subTotal;
  String discount;
  String finalPrice;
  String status;
  String paymentMethod;
  List<ProductModel>? products;

  OrderModel({
    this.address = "",
    this.phone = "",
    this.note = "",
    this.subTotal = "",
    this.discount = "",
    this.finalPrice = "",
    this.status = "",
    this.paymentMethod = "",
    this.products,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      address: json["address"],
      phone: json["phone"],
      note: json["note"],
      subTotal: json["subTotal"].toString(),
      discount: json["discountAmount"].toString(),
      finalPrice: json["finalPrice"].toString(),
      status: json["status"],
      paymentMethod: json["paymentMethod"],
    );
  }
}
