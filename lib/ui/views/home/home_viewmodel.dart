import 'package:filledstacked_academy/app/app.bottomsheets.dart';
import 'package:filledstacked_academy/app/app.dialogs.dart';
import 'package:filledstacked_academy/app/app.locator.dart';
import 'package:filledstacked_academy/ui/common/app_strings.dart';
import 'package:filledstacked_academy/ui/views/home/home_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  bool isExtended = true;
  List<HomeMenu> menu = [
    HomeMenu('Home', Icons.home_outlined, Icons.home_filled),
    HomeMenu('Get Started', Icons.apps, Icons.apps_rounded),
    HomeMenu('Develop', Icons.code, Icons.code_rounded),
    HomeMenu('Foundations', Icons.book_outlined, Icons.book),
    HomeMenu('Styles', Icons.palette_outlined, Icons.palette_rounded),
    HomeMenu('Components', Icons.add_circle_outline, Icons.add_circle),
  ];
  int selectedIndex = 0;

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
