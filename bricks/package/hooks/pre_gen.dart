import 'package:mason/mason.dart';

void run(HookContext context) {
  final type = (context.vars['type'] as String).snakeCase;
  final name = (context.vars['name'] as String).snakeCase;
  final layers = context.vars['layers'] as List;

  context.vars = {
    ...context.vars,
    'package_id': "${type}_${name}",
    'is_core': type == 'core',
    'is_feature': type == 'feature',
    'is_shared': type == 'shared',
    'use_application': layers.contains('application'),
    'use_data': layers.contains('data'),
    'use_domain': layers.contains('domain'),
    'use_presentation': layers.contains('presentation'),
  };
}
