// import 'dart:convert';

// import 'package:flutter/services.dart';
// import 'package:flutter_hl_vnpay/flutter_hl_vnpay.dart';
// import 'package:crypto/crypto.dart';

// class VNPayService {
//   String? paymentResultCodeCode;

//   get sha256 => null;

//   Future<String> payThebill() async {
//     try {
//       String url = 'http://sandbox.vnpayment.vn/paymentv2/vpcpay.html';
//       String tmnCode = 'QCVD5A9D'; // Get from VNPay
//       String hashKey = 'ONRVKZXKAPYJQDGSZTOWXHKBTKFIGMSI'; // Get from VNPay

//       final params = <String, dynamic>{
//         'vnp_Command': 'pay',
//         'vnp_Amount': '3000000',
//         'vnp_CreateDate': '20210315151908',
//         'vnp_CurrCode': 'VND',
//         'vnp_IpAddr': '192.168.15.102',
//         'vnp_Locale': 'vn',
//         'vnp_OrderInfo': '5fa66b8b5f376a000417e501 pay coin 30000 VND',
//         'vnp_ReturnUrl':
//             '', // Your Server https://sandbox.vnpayment.vn/apis/docs/huong-dan-tich-hop/#code-returnurl
//         'vnp_TmnCode': tmnCode,
//         'vnp_TxnRef': '604f187c862cd70004478e',
//         'vnp_Version': '2.0.0'
//       };

//       final sortedParams = FlutterHlVnpay.instance.sortParams(params);
//       final hashDataBuffer = new StringBuffer();
//       sortedParams.forEach((key, value) {
//         hashDataBuffer.write(key);
//         hashDataBuffer.write('=');
//         hashDataBuffer.write(value);
//         hashDataBuffer.write('&');
//       });
//       final hashData =
//           hashDataBuffer.toString().substring(0, hashDataBuffer.length - 1);
//       final query = Uri(queryParameters: sortedParams).query;
//       print('hashData = $hashData');
//       print('query = $query');

//       var bytes = utf8.encode(hashKey + hashData.toString());
//       final vnpSecureHash = sha256.convert(bytes);
//       final paymentUrl =
//           "$url?$query&vnp_SecureHashType=SHA256&vnp_SecureHash=$vnpSecureHash";
//       print('paymentUrl = $paymentUrl');
//       return paymentResultCodeCode = (await FlutterHlVnpay.instance
//               .show(paymentUrl: paymentUrl, tmnCode: tmnCode))
//           .toString();
//     } on PlatformException {
//       return paymentResultCodeCode = 'Failed to get payment result code';
//     }
//   }
// }
