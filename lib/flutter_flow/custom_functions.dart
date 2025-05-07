import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String newCustomFunction(String? productDescription) {
  // Write a function that takes in the "productDescription" variable and removes any html tages it has, before returning it. It should never return a null value.
  if (productDescription == null) {
    return '';
  }
  // Remove HTML tags using a regular expression
  return productDescription.replaceAll(RegExp(r'<[^>]*>'), '');
}

List<double>? sampleDataX() {
  return [for (int i = 0; i < 53; i++) i.toDouble()];
}

List<double>? sampleDataY() {
  return [
    17.4,
    17.1,
    16.8,
    17.3,
    16.1,
    15.9,
    15.9,
    15.9,
    14.7,
    14.0,
    14.1,
    13.6,
    13.6,
    12.6,
    12.6,
    12.6,
    11.8,
    11.8,
    11.1,
    10.8,
    10.8,
    11.8,
    11.8,
    9.3,
    9.3,
    9.3,
    10.7,
    10.7,
    10.7,
    8.2,
    8.8,
    7.5,
    6.1,
    6.1,
    6.1,
    5.0,
    5.4,
    5.4,
    5.0,
    5.0,
    3.3,
    3.3,
    3.3,
    2.2,
    1.4,
    1.5,
    1.2,
    0.7,
    0.5,
    0.5,
    0.3,
    0.4,
    0.0
  ];
}

double priceTax(
  int numProduct,
  double productPrice,
  double taxPercent,
) {
  double subtotal = numProduct * productPrice;
  return subtotal * taxPercent;
}

double priceTotal(
  double productPrice,
  int numProducts,
  double shipping,
  double taxPercent,
) {
  double subtotal = productPrice * numProducts;
  return (subtotal * taxPercent) + shipping;
}

double priceMultiply(
  int numProduct,
  double productPrice,
) {
  // Multiply the two variables together and return them.
  return numProduct * productPrice;
}
