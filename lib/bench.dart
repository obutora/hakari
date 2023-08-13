// ignore_for_file: library_prefixes
import 'dart:async';

import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/material.dart';

import 'hakari.dart';
import 'dart:math' as Math;

class Bench {
  final String name;
  final FutureOr Function() func;
  late HakariOption option;
  late num min;
  late num max;
  late num average;
  List<int> samples = [];

  Bench(this.name, this.func);

  void setOption(HakariOption option) {
    this.option = option;
  }

  Future<void> start() async {
    for (int i = 0; i < option.iter; i++) {
      final start = DateTime.now().microsecondsSinceEpoch;
      await func();
      final end = DateTime.now().microsecondsSinceEpoch;
      final duration = end - start;
      samples.add(duration);
    }

    average = samples.reduce((a, b) => a + b) / samples.length;
    min = samples.reduce(Math.min);
    max = samples.reduce(Math.max);
  }

  void printResult() {
    final itemCharNum = (option.maxLineCharNum / 3).floor();

    final nameResult = TextUtil.align(name, itemCharNum, isLeft: true);

    final averageResult = TextUtil.align(
      '${TextUtil.formatUnit(average.round())}/iter',
      itemCharNum,
      isLeft: false,
    );

    final minMaxResult = TextUtil.align(
      '${TextUtil.formatUnit(min.round())}/${TextUtil.formatUnit(max.round())}',
      itemCharNum,
      isLeft: false,
    );

    ansiColorDisabled = false;
    AnsiPen greenPen = AnsiPen()..xterm(10);

    debugPrint('${greenPen(nameResult)}$averageResult$minMaxResult');
  }
}
