library hakari;

export 'util/system_util.dart';
export 'util/text_util.dart';
export 'bench.dart';
export 'group.dart';

import 'dart:io';

import 'package:flutter/material.dart';

import 'group.dart';

class Hakari {
  final List<Group> groups;
  HakariOption? option;

  Hakari({
    required this.groups,
    this.option,
  });

  Future<void> start() async {
    if (groups.isEmpty) {
      throw Exception('no group registered');
    }

    option ??= HakariOption.create();

    for (final group in groups) {
      group.setOption(option!);
    }

    debugPrint('\n');
    debugPrint('Hakari start! '.padRight(option!.maxLineCharNum, '-'));

    for (final group in groups) {
      await group.start();
    }
  }
}

class HakariOption {
  /// Set how many times to repeat the process
  final int iter;

  /// If you want display full screen, use [ stdout.terminalColumns ]
  ///
  /// or [create] method.
  final int maxLineCharNum;

  HakariOption({
    this.iter = 100,
    required this.maxLineCharNum,
  });

  /// A factory method for easily realizing full-screen display.
  ///
  /// you can change [iter] value.
  factory HakariOption.create({int iter = 100}) {
    return HakariOption(
      iter: iter,
      maxLineCharNum: stdout.terminalColumns,
    );
  }
}
