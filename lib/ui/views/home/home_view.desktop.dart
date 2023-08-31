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
            backgroundColor: const Color(0xFFf3f6fc),
            minWidth: MediaQuery.sizeOf(context).width / 16.4,
            unselectedLabelTextStyle:
                const TextStyle(color: Colors.black, fontSize: 12),
            selectedLabelTextStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12),
            labelType: NavigationRailLabelType.all,
            selectedIndex: viewModel.selectedIndex,
            onDestinationSelected: (int index) {
              viewModel.selectedIndex = index;
              viewModel.notifyListeners();
            },
            destinations: [
              for (int i = 0; i < viewModel.menu.length; i++)
                NavigationRailDestination(
                  padding: EdgeInsets.only(top: i == 0 ? 12 : 5, bottom: 5),
                  icon: Icon(viewModel.menu[i].icon),
                  selectedIcon: Icon(viewModel.menu[i].selectedIcon),
                  label: Text(viewModel.menu[i].label),
                )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: viewModel.selectedIndex == 0
                  ? homeTab(context)
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

  Widget homeTab(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          topHeader(context),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.sizeOf(context).width / 16,
              top: MediaQuery.sizeOf(context).width / 16,
            ),
            child: const Text(
              'News & Launches',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 56),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width / 20),
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height / 2.8,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: InkWell(
                        onTap: () {

                        },
                        hoverColor: Colors.grey,
                        child: Container(
                          decoration: BoxDecoration(
                              // color: const Color(0xFFf3f6fc),
                              borderRadius: BorderRadius.circular(12)),
                          width: MediaQuery.sizeOf(context).width / 3.75,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: MediaQuery.sizeOf(context).height / 4.4,
                                decoration: BoxDecoration(
                                    image: const DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            "https://lh3.googleusercontent.com/51moDkmVWptBFXRReuACKocS_fsOoYtfT-C78onEUKeRr7ky4l_ZsuZMK2AnE7-MPRbLzcKTAIFmNyyN7ACo0-eygmXaGeR0ItYtRcYNE8-_L8RHqkA=w960")),
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.sizeOf(context).width / 40,
                                    vertical:
                                        MediaQuery.sizeOf(context).height / 70),
                                child: const Text(
                                  'Material Design at Google I/O',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.sizeOf(context).width / 40,
                                ),
                                child: const Text(
                                  'See the full list of Material talks and tutorials launching at I/O 2023',
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  Container topHeader(BuildContext context) {
    return Container(
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
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.sizeOf(context).height / 7.2),
          ),
          Text(
            textAlign: TextAlign.center,
            'Material 3 is the latest version of Google’s open-source design system. Design and \n build beautiful, usable products with Material 3.',
            style:
                TextStyle(fontSize: MediaQuery.sizeOf(context).height / 38.4),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 32,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) {
              return const Color.fromRGBO(9, 87, 208, 1);
            })),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32),
              child: Text(
                'Get Started',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.sizeOf(context).height / 36),
              ),
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
