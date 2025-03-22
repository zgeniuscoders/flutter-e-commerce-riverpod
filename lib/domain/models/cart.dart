class Cart {
  int productId;
  String productName;
  String productPhoto;
  double productPrice;
  int qty;

  Cart({
    required this.productId,
    required this.productName,
    required this.productPhoto,
    required this.productPrice,
    required this.qty,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    productId: json["productId"],
    productName: json["productName"],
    productPhoto: json["productPhoto"],
    productPrice: json["productPrice"],
    qty: json["qty"],
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "productName": productName,
    "productPhoto": productPhoto,
    "productPrice": productPrice,
    "qty": qty,
  };
}
