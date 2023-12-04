// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:loan_instant_2/Media_qury.dart';

class Loan {
  final colors,
      colors1,
      lonaamount,
      rate,
      Loanterm,
      monthly_pyment,
      fee,
      avrage,
      Average;

  Loan(
    this.colors,
    this.colors1,
    this.lonaamount,
    this.rate,
    this.Loanterm,
    this.monthly_pyment,
    this.fee,
    this.avrage,
    this.Average,
  );
}

final List<Loan> Loan_List = List.generate(
    colors.length,
    (index) => Loan(
          colors[index],
          colors1[index],
          lonaamount[index],
          rates[index],
          Loanterm[index],
          monthly_pyment[index],
          fee[index],
          avrage[index],
          Average[index],
        ));
List colors = [
  const Color(0xFFD88DFA),
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  const Color(0xFFD88DFA),
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  const Color(0xFFD88DFA),
];
List colors1 = [
  const Color(0xFF000000),
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  const Color(0xFF000000),
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  Colors.transparent,
  const Color(0xFF000000),
];
List lonaamount = [
  4566,
  6959,
  1000,
  5100,
  1500,
  5686,
  6486,
  1450,
  2654,
  1235,
  5665,
  4648
];
List rates = [
  12,
  11,
  10,
  9,
  8,
  7,
  6,
  5,
  4,
  3,
  2,
  1,
];
List Loanterm = [
  20,
  18,
  21,
  15,
  17,
  16,
  19,
  25,
  22,
  27,
  15,
  20,
];
List monthly_pyment = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
List fee = [55, 43, 37, 18, 20, 40, 34, 32, 35, 41, 19, 50];
List avrage = [
  """High probability of approval""",
  """Average probability of approval""",
  """Medium probability of approval""",
  """Low probability of approval""",
  """High probability of approval""",
  """Average probability of approval""",
  """Medium probability of approval""",
  """Low probability of approval""",
  """Average probability of approval""",
  """Medium probability of approval""",
  """Low probability of approval""",
  """High probability of approval""",
];
List<double> Average = [95, 75, 50, 28, 91, 75, 50, 28, 75, 45, 15, 96];
List hight = [
  ScreenSize.fSize_30(),
  ScreenSize.fSize_3(),
  ScreenSize.fSize_3(),
  ScreenSize.fSize_3(),
  ScreenSize.fSize_30(),
  ScreenSize.fSize_3(),
  ScreenSize.fSize_3(),
  ScreenSize.fSize_3(),
  ScreenSize.fSize_3(),
  ScreenSize.fSize_3(),
  ScreenSize.fSize_3(),
  ScreenSize.fSize_30(),
];
