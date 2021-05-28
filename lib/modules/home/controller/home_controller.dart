import 'package:flutter_infinite_scroll_with_getx/models/pagination_filter.dart';
import 'package:flutter_infinite_scroll_with_getx/models/user_model.dart';
import 'package:flutter_infinite_scroll_with_getx/repositories/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  
  final UserRepository _userRepository;
  final _users = <UserModel>[].obs;
  final _paginationFilter = PaginationFilter().obs;
  final _lastPage = false.obs;

  var _loading = false.obs;
  bool get loading => _loading.value; 

  List<UserModel> get users => _users.toList();
  int get limit => _paginationFilter.value.limit;
  int get _page => _paginationFilter.value.page;
  bool get lastPage => _lastPage.value;

  HomeController(this._userRepository);

  @override
  void onInit() {

    ever(_paginationFilter, (_) => findUsers());
    _changePaginationFilter(1, 15);

    super.onInit();
  }

  void findUsers() async {

    _loading(true);

    final usersData = await _userRepository.findAll(_paginationFilter.value);
  
    if(usersData.isEmpty) {
      _lastPage.value = true;
    }

    _users.addAll(usersData);

    _loading(false);
  }

  // vai recarregar tudo, por isso da page = 1
  void changeTotalPerPage(int limitValue) {
    _users.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val.page = page;
      val.limit = limit;
    });
  }

  void nextPage() => _changePaginationFilter(_page + 1, limit);
  

}