class OrderModel {
  String orderID;
  String address;
  String phone;
  String note;
  String subTotal;
  String discount;
  String finalPrice;
  String status;
  String paymentMethod;
  String username;
  String createdAt;

  OrderModel({
    this.orderID = "",
    this.address = "",
    this.phone = "",
    this.note = "",
    this.subTotal = "",
    this.discount = "",
    this.finalPrice = "",
    this.status = "",
    this.paymentMethod = "",
    this.username = "",
    this.createdAt = "",
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      orderID: json["orderId"],
      address: json["address"],
      phone: json["phone"],
      note: json["note"],
      subTotal: json["subTotal"].toString(),
      discount: json["discountAmount"].toString(),
      finalPrice: json["finalPrice"].toString(),
      status: json["status"],
      paymentMethod: json["paymentMethod"],
      username: json["createdBy"]["username"],
      createdAt: json["createdAt"],
    );
  }
}
