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

List<int>? sampleData() {
  // i need this function to return a list of numbers from 1 to 100
  return List<int>.generate(25, (index) => index + 1);
}
