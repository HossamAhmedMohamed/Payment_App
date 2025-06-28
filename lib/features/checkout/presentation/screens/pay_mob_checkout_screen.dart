import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PayMobCheckoutScreen extends StatefulWidget {
  const PayMobCheckoutScreen({super.key, required this.paymentKey});

  final String paymentKey;
  @override
  State<PayMobCheckoutScreen> createState() => _PayMobCheckoutScreenState();
}

class _PayMobCheckoutScreenState extends State<PayMobCheckoutScreen> {
  late InAppWebViewController _webViewController;

  void startPayment() async {
    _webViewController.loadUrl(
      urlRequest: URLRequest(
        url: WebUri(
          "https://accept.paymob.com/api/acceptance/iframes/935274?payment_token=${widget.paymentKey}",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        initialSettings: InAppWebViewSettings(javaScriptEnabled: true),
        onWebViewCreated: (controller) {
          _webViewController = controller;
          startPayment();
        },

        onLoadStop: (controller, url) {
          if (url != null &&
              url.queryParameters.containsKey("success") &&
              url.queryParameters["success"] == "true") {
            // Handle successful payment
            log("Payment successful: ${url.toString()}");
            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const ThankYouScreen()),
            // );
          } else if (url != null &&
              url.queryParameters.containsKey("success") &&
              url.queryParameters["success"] == "false") {
            log("Payment failed: ${url.toString()}");
          } else if (url != null && url.queryParameters.containsKey("error")) {
            log("error in payment: ${url.queryParameters["error"]}");
          }
        },
      ),
    );
  }
}
