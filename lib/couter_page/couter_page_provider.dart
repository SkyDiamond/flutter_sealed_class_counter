import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sealed_class_counter/couter_page/couter_page_controller.dart';
import 'package:flutter_sealed_class_counter/couter_page/couter_page_state.dart';

final counterProvider =
    StateNotifierProvider<CouterPageController, CouterPageState>((ref) => CouterPageController());
