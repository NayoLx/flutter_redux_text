import 'dart:ui';

import 'package:fish_redux/fish_redux.dart';
import '../global_store/state.dart';
import 'todo_component/component.dart';

part 'state.g.dart';

class PageState extends MutableSource
    implements GlobalBaseState, Cloneable<PageState> {
  List<ToDoState> toDos;

  @override
  Color themeColor;

  @override
  PageState clone() {
    return _pageStateClone(this);
  }

  @override
  Object getItemData(int index) => toDos[index];

  @override
  String getItemType(int index) => 'toDo';

  @override
  int get itemCount => toDos?.length ?? 0;

  @override
  void setItemData(int index, Object data) => toDos[index] = data;
}

PageState initState(Map<String, dynamic> args) {
  //just demo, do nothing here...
  return PageState();
}
