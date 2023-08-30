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
            elevation: 4,
            // leading: const Text(
            //   'CHI Tech',
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 32),
            // ),
            minWidth: MediaQuery.sizeOf(context).width / 15.6,
            selectedLabelTextStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600),
            // useIndicator: true,
            //
            // unselectedLabelTextStyle: const TextStyle(color: Colors.white),
            // unselectedIconTheme: const IconThemeData(color: Colors.white),
            // selectedIconTheme: const IconThemeData(color: Colors.white),
            labelType: NavigationRailLabelType.all,
            selectedIndex: viewModel.selectedIndex,
            onDestinationSelected: (int index) {
              viewModel.selectedIndex = index;
              viewModel.notifyListeners();
            },
            destinations: [
              for (int i = 0; i < viewModel.menu.length; i++)
                NavigationRailDestination(
                  icon: Icon(viewModel.menu[i].icon),
                  selectedIcon: Icon(viewModel.menu[i].selectedIcon),
                  label: Text(viewModel.menu[i].label),
                )
            ],
          ),
          const SizedBox(width: 12),
          // const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: SingleChildScrollView(
              child: viewModel.selectedIndex == 0
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height / 1.5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  'https://lh3.googleusercontent.com/2OrUzHCRSI-V46Z1qJBh90usG6OkKwCbXN80FbrjkWoQz4VfoJjNAoQHLHPQRZWH7dI_m5I1gi48h6xMJ5pK6kkdXmUnXPe4VqwvEdo4QeWRjLV9Oew=w2400-rj',
                                ))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Material Design',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.sizeOf(context).height / 8),
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Material 3 is the latest version of Google’s open-source design system. Design and \n build beautiful, usable products with Material 3.',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.sizeOf(context).height / 40),
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height / 20,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 12),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          MediaQuery.sizeOf(context).height /
                                              36),
                                ),
                              ),
                              style: ButtonStyle(backgroundColor:
                                  MaterialStateColor.resolveWith((states) {
                                return Color.fromRGBO(9, 87, 208, 1);
                              })),
                            )
                          ],
                        ),
                      ),
                    )
                  : onMakeTable(context,
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
