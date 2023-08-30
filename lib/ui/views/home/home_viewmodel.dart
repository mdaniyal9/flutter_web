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
    HomeMenu('Favourite', Icons.favorite_border, Icons.favorite),
    HomeMenu('Bookmarks', Icons.bookmark_border, Icons.book),
    HomeMenu('Starred', Icons.star_border, Icons.star)
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
