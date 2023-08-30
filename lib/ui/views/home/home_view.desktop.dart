import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          NavigationRail(
            leading: IconButton(
                onPressed: () {
                  viewModel.isExtended = !viewModel.isExtended;
                  viewModel.notifyListeners();
                },
                icon:
                    Icon(viewModel.isExtended ? Icons.arrow_back : Icons.menu)),
            extended: viewModel.isExtended,
            selectedIndex: viewModel.selectedIndex,
            onDestinationSelected: (int index) {
              viewModel.selectedIndex = index;
              viewModel.notifyListeners();
            },
            labelType: viewModel.isExtended
                ? NavigationRailLabelType.none
                : NavigationRailLabelType.selected,
            destinations: [
              for (int i = 0; i < viewModel.menu.length; i++)
                NavigationRailDestination(
                  icon: Icon(viewModel.menu[i].icon),
                  selectedIcon: Icon(viewModel.menu[i].selectedIcon),
                  label: Text(viewModel.menu[i].label),
                )
            ],
          ),
          // VerticalDivider(thickness: 1, width: 1),
          // This is the main content.

          Expanded(
            child: SingleChildScrollView(
              child: onMakeTable(context,
                  rows: viewModel.selectedIndex == 0
                      ? 8
                      : viewModel.selectedIndex == 1
                          ? 6
                          : 20,
                  columns: viewModel.selectedIndex == 0
                      ? 4
                      : viewModel.selectedIndex == 1
                          ? 6
                          : 3),
            ),
          )
        ],
      ),
    );
  }
}

DataTable onMakeTable(BuildContext context, {int rows = 0, int columns = 0}) {
  DataTable table = DataTable(
      headingRowColor: MaterialStateColor.resolveWith(
        (states) {
          return Colors.grey;
        },
      ),
      headingRowHeight: MediaQuery.sizeOf(context).height / 10,
      headingTextStyle: const TextStyle(color: Colors.white, fontSize: 28),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red.shade50, Colors.green.shade50])),
      columns: [
        for (int i = 0; i < columns; i++) DataColumn(label: Text('C $i')),
      ],
      rows: [
        for (int j = 0; j < rows; j++)
          DataRow(cells: [
            for (int k = 0; k < columns; k++) DataCell(Text('R$j $k')),
          ])
      ]);
  return table;
}
