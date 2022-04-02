import 'package:flutter/cupertino.dart';

class AppTheme {
  static AppTypography text = AppTypography();
}

class AppTypography {
  TextStyle largeTitle = const TextStyle(
    fontFamily: "SFPro",
    color: CupertinoColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 34,
    height: 1.28,
    wordSpacing: 0.37,
  );
  TextStyle title1 = const TextStyle(
    fontFamily: "SFPro",
    color: CupertinoColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 28,
    height: 1.28,
    wordSpacing: 0.36,
  );
  TextStyle title2 = const TextStyle(
    fontFamily: "SFPro",
    color: CupertinoColors.white,
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 1.28,
    wordSpacing: 0.35,
  );
  TextStyle title3 = const TextStyle(
    fontFamily: "SFPro",
    color: CupertinoColors.white,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 1.28,
    wordSpacing: 0.38,
  );
  TextStyle headline = const TextStyle(
    fontFamily: "SFPro",
    color: CupertinoColors.white,
    fontWeight: FontWeight.w600,
    fontSize: 17,
    height: 1.28,
    wordSpacing: -0.41,
  );
  TextStyle subheadline = const TextStyle(
    fontFamily: "SFPro",
    color: CupertinoColors.white,
    fontWeight: FontWeight.w600,
    fontSize: 15,
    height: 1.28,
    wordSpacing: -0.24,
  );
  TextStyle body = const TextStyle(
    fontFamily: "SFPro",
    color: CupertinoColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 17,
    height: 1.28,
    wordSpacing: -0.41,
  );
  TextStyle callout = const TextStyle(
    fontFamily: "SFPro",
    color: CupertinoColors.white,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.28,
    wordSpacing: -0.32,
  );
}
