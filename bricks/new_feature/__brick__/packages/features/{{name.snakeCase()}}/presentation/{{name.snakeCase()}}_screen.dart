import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../{{name.snakeCase()}}.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => {{name.pascalCase()}}Cubit(),
      child: const {{name.pascalCase()}}View(),
    );
  }
}

class {{name.pascalCase()}}View extends StatelessWidget {
  const {{name.pascalCase()}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
      builder: (context, state) {
        // TODO: return correct widget based on the state.
        return const SizedBox();
      },
    );
  }
}
