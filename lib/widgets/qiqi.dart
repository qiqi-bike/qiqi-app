import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'app_reducer.dart';
import 'app_state.dart';
import 'find_my_bike.dart';
import 'package:redux/redux.dart';
import 'settings.dart';

class Page {
  final Widget page;
  final IconData icon;
  final String name;
  const Page(this.page, this.icon, this.name);
}

const navigationPages = [
  Page(SettingsPage(), Icons.settings, 'settings'),
  Page(FindMyBikePage(), Icons.search, 'findMyBike'),
];

class QiQi extends StatelessWidget {

  late final Store<AppState> store;

  QiQi({super.key}) {
    store = Store<AppState>(appReducer, initialState: AppState());
  }

  @override
  build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'QiQi',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('title')),
          bottomNavigationBar: NavigationBar(
            selectedIndex: 0,
            onDestinationSelected: (destination) => {},
            destinations: [
              for (final page in navigationPages) NavigationDestination(icon: Icon(page.icon), label: page.name)
            ]
          ),
          body: Text('test body'),
        ),
      ),
    );
  }
}
