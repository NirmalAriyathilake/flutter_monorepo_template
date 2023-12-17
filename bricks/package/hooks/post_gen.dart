import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

Future<void> run(HookContext context) async {
  await _runDartFormat(context);

  await _runDartFix(context);

  await _runMelosBootstrap(context);

  await _runGitCommit(context);
}

Future<void> _runDartFormat(HookContext context) async {
  final formatProgress = context.logger.progress('Running "dart format ."');

  await Process.run(
    'dart',
    ['format', '.'],
    runInShell: true,
  );

  formatProgress.complete();
}

Future<void> _runDartFix(HookContext context) async {
  final formatProgress = context.logger.progress('Running "dart fix --apply"');

  await Process.run(
    'dart',
    ['fix', '--apply'],
    runInShell: true,
  );

  formatProgress.complete();
}

Future<void> _runMelosBootstrap(HookContext context) async {
  final formatProgress = context.logger.progress('Running "melos bootstrap"');

  await Process.run(
    'melos',
    ['bootstrap'],
    runInShell: true,
  );

  formatProgress.complete();
}

Future<void> _runGitCommit(HookContext context) async {
  final type = (context.vars['type'] as String).snakeCase;
  final packageId = (context.vars['package_id'] as String).snakeCase;
  final packageIdTitle = (context.vars['package_id'] as String).sentenceCase;

  final formatProgress = context.logger.progress(
      'Running "Git commit : feat(${packageId}): Generated ${packageIdTitle} package"');

  final pathOfPackage = path.join(
    Directory.current.path,
    'packages',
    type,
    packageId,
  );

  await Process.run(
    'git',
    [
      'add',
      pathOfPackage,
    ],
    runInShell: true,
  );

  await Process.run(
    'git',
    [
      'commit',
      pathOfPackage,
      '-m',
      'feat(${packageId}): Generated ${packageIdTitle} package',
    ],
    runInShell: true,
  );

  formatProgress.complete();
}
