import 'dart:ui';

import 'package:flutter/material.dart';

class PizzeriaStyle {
  static final baseTextStyle = const TextStyle(fontWeight: FontWeight.bold);

  static final TextStyle pageTitleTextStyle = baseTextStyle.copyWith(
    fontSize: 26.0,
  );
  static final TextStyle headerTextStyle = baseTextStyle.copyWith(
    fontSize: 20.0,
  );
  static final TextStyle regularTitleTextStyle = baseTextStyle.copyWith(
    fontSize: 18.0,
  );
  static final TextStyle subHeaderTextStyle = baseTextStyle.copyWith(
      fontSize: 26.0);
  static final TextStyle itemPriceTextStyle = baseTextStyle.copyWith(
      color: Colors.blueGrey);
  static final TextStyle subPriceTextStyle = baseTextStyle.copyWith(
    color: Colors.blueGrey,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle priceSubTotalTextStyle = baseTextStyle.copyWith(
    color: Colors.blueGrey,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
  static final TextStyle priceTotalTextStyle = baseTextStyle.copyWith(
    color: Colors.blueGrey,
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );
}