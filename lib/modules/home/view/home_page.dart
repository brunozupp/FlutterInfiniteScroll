import 'package:flutter/material.dart';
import 'package:flutter_infinite_scroll_with_getx/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomePage extends StatelessWidget {
  final HomeController _controller;

  const HomePage(this._controller, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Infinite Scroll"),
        actions: [
          Obx(() => PopupMenuButton(
            initialValue: _controller.limit,
            onSelected: (value) => _controller.changeTotalPerPage(value),
            itemBuilder: (context) {
              return [
                CheckedPopupMenuItem(
                  value: 15,
                  checked: _controller.limit == 15,
                  child: Text('15 por página'),
                ),
                CheckedPopupMenuItem(
                  value: 20,
                  checked: _controller.limit == 20,
                  child: Text('20 por página'),
                ),
                CheckedPopupMenuItem(
                  value: 50,
                  checked: _controller.limit == 50,
                  child: Text('50 por página'),
                ),
              ];
            },
          )),
        ],
      ),
      body: Obx(() => _controller.loading && _controller.users.isEmpty 
        ? Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              width: 50,
              height: 50,
              child: CircularProgressIndicator()
            )
          )
        : _buildListUsers()
      ),
    );
  }

  Widget _buildListUsers() => LazyLoadScrollView(
    onEndOfPage: () => _controller.nextPage(),
    isLoading: _controller.lastPage,
    child: ListView.builder(
      itemCount: _controller.users.length + 1,
      itemBuilder: (context, index) {

        if(_controller.users.length == index) {
          return _controller.loading
            ? Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator()
                ),
            )
            : Container();
        }

        final user = _controller.users[index];

        return ListTile(
          leading: Text(user.id),
          title: Text(user.name),
          subtitle: Text(user.username),
        );
      },
    ),
  );
}
