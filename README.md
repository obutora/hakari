<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Hakari
Simple & Cool Benchmarking Library for Dart 🚀

<img width="454" alt="image" src="https://github.com/obutora/hakari/assets/24934672/fc14deb4-9353-4def-bf9c-2cce0547bda3">

A package that allows you to easily benchmark the execution speed of your code in Dart. Along with beautifully formatted bar charts, it is possible to compare execution speeds intuitively.

## Features

- Measure code execution time in micro/milliseconds
- Intuitive bar chart display of results
- Comparing multiple benchmark results

## Getting started

```
flutter pub add hakari
```

## Usage

```dart
final list = List.generate(100000, (index) => index
final group = Group(
  name: 'explore fast dart loop.',
  benches: [
    Bench('loop', () async {
      var count = 0;
      num eachElement = 0;
      while (count < list.length) {
        eachElement = pow(list[count], 3);
        count++;
      }
    }),
    Bench('for in', () async {
      num eachElement = 0;
      for (var element in list) {
        eachElement = pow(element, 3);
      }
    }),
    Bench('forEach', () async {
      num eachElement = 0;
      list.forEach((e) {
        eachElement = pow(e, 3);
      });
    }),
    Bench('map', () async {
      num eachElement = 0;
      list.map((e) {
        eachElement = pow(e, 3);
      }).toList();
    }),
  ],

final hakari = Hakari(
    groups: [
      group,
    ],
    option: HakariOption(
      maxLineCharNum: 80,
      iter: 100,
      // emphasisAnsiColor: some value [0-255],
      // barAnsiColor: some value [0-255],
    
await hakari.start();
```

Happy Benchmarking! 🚀

## Contributing
Hakari is a project that thrives with community involvement. We wholeheartedly welcome contributors who are passionate about enriching the Dart ecosystem.

Why contribute?
1. Skill Enhancement : Contributing to the project is a great opportunity to improve your Dart and overall programming skills.

2. Networking : Engage with other engineers and contributors, gaining new insights and knowledge.

3. Early Access: By contributing, you might get early access to the project's resources or documents.
4. Recognition: Contributions to open-source provide a substantial recognition to your profile and career.

### Ideas for Contribution
- Feature Suggestions: We welcome new ideas and feature proposals.
- Documentation: Help in enhancing documentation or translating it into other languages.
- Testing: Add new test cases or improve the existing ones.
- UI/UX: Propose and improve designs for the bar graphs and output formats.
- Code Optimization: Propose more efficient code or algorithms.
- Security: Enhancements in security and vulnerability reporting.

### Getting Started
1. Fork the repository on GitHub.
2. Clone and work on it locally.
3. Create a new branch and make your changes.
4. Run the tests to ensure no issues arise.
5. Commit your changes and create a Pull Request (PR).
6. Clearly describe the rationale and details of your changes in the PR description.
