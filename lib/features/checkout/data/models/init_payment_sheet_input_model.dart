 class InitPaymentSheetInputModel {
  
  final String clientSecret;
  final String customerId;
  final String? ephemeralKeySecret;
  InitPaymentSheetInputModel({
    required this.clientSecret,
    required this.customerId,
    this.ephemeralKeySecret,
  });

  Map<String, dynamic> toJson() {
    return {
      'clientSecret': clientSecret,
      'customerId': customerId,
      'ephemeralKeySecret': ephemeralKeySecret,
    };
  }

}
