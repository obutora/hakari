import 'package:ansicolor/ansicolor.dart';
import 'package:flutter/material.dart';
import 'hakari.dart';

class Group {
  final String name;
  final List<Bench> benches;
  late HakariOption option;

  Group({required this.name, required this.benches});

  Group.single(this.name, Bench bench) : benches = [bench];

  Future<void> measure() async {
    for (final bench in benches) {
      debugPrint('📝: measuring... ${bench.name}');
      await bench.start();
    }

    debugPrint('🚀 complete!!\n');
  }

  void setOption(HakariOption option) {
    this.option = option;
  }

  Future<void> sort() async {
    benches.sort((a, b) => a.average.compareTo(b.average));
  }

  Future<void> start() async {
    if (benches.isEmpty) {
      debugPrint('please register bench.');
      return;
    }

    for (var bench in benches) {
      bench.setOption(option);
    }

    await measure();
    await sort();

    await printResult();

    debugPrint('');
  }

  Future<void> printResult() async {
    debugPrint(TextUtil.addHyphen('🏝️: $name ', option.maxLineCharNum));
    await printHeader();

    for (final bench in benches) {
      bench.printResult();
    }

    debugPrint('');

    printSummery();
  }

  Future<void> printHeader() async {
    await printCpu();
    final div = List.generate(option.maxLineCharNum, (_) => '-').join();

    final benchText =
        TextUtil.align('benchmark', (option.maxLineCharNum / 3).floor());
    final averageText = TextUtil.align(
      'time(avg)',
      (option.maxLineCharNum / 3).floor(),
      isLeft: false,
    );
    final minMaxText = TextUtil.align(
      'min - max',
      (option.maxLineCharNum / 3).floor(),
      isLeft: false,
    );

    debugPrint(benchText + averageText + minMaxText);

    debugPrint(div);
  }

  Future<void> printSummery() async {
    final len = benches.length;
    ansiColorDisabled = false;
    AnsiPen greenPen = AnsiPen()..xterm(10);

    if (len > 1) {
      debugPrint(
        TextUtil.addHyphen('summary ', option.maxLineCharNum),
      );
      debugPrint('⭐: ${greenPen(benches.first.name)} is the fastest!');

      for (int i = 1; i < len; i++) {
        final benchText =
            (benches[i].average / benches.first.average).toStringAsFixed(2);

        debugPrint(
            '     ${greenPen(benchText)} x faster than ${greenPen(benches[i].name)}');
      }

      debugPrint('');
      debugPrint(
        TextUtil.addHyphen('📊: bar chart ', option.maxLineCharNum),
      );

      for (int i = 0; i < len; i++) {
        final name = TextUtil.align(
            benches[i].name, (option.maxLineCharNum / 3).floor());
        final barVal = 1 / (benches.last.average / benches[i].average);
        final bar =
            List.filled((option.maxLineCharNum * (2 / 3) * barVal).floor(), ' ')
                .join();

        ansiColorDisabled = false;
        AnsiPen greenBg = AnsiPen()..xterm(30, bg: true);
        debugPrint('$name${greenBg(bar)}');
      }

      debugPrint(
        TextUtil.addHyphen('\n', option.maxLineCharNum),
      );
    }
  }

  Future<void> printCpu() async {
    final cpu = await SystemUtil.getCpuName();
    debugPrint('cpu : $cpu');
    debugPrint('iter: ${option.iter} \n');
  }
}
