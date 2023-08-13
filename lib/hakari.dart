library hakari;

export 'util/system_util.dart';
export 'util/text_util.dart';
export 'bench.dart';
export 'group.dart';
export 'hakari_option.dart';

import 'package:flutter/material.dart';

import 'group.dart';
import 'hakari_option.dart';

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
