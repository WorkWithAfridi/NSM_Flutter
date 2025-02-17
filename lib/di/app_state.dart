import 'package:flutter/material.dart';
import 'package:nsm_flutter/view_models/auth_vm.dart';
import 'package:nsm_flutter/view_models/posts_vm.dart';

import '../view_models/counter_vm.dart';
import '../view_models/theme_vm.dart';

class AppState extends ChangeNotifier {
  final CounterViewModel counterVM = CounterViewModel();
  final ThemeViewModel themeVM = ThemeViewModel();
  final AuthViewModel authVM = AuthViewModel();
  final PostsViewModel postsVM = PostsViewModel();
}
