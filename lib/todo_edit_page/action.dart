import 'package:fish_redux/fish_redux.dart';
import 'package:flutte_fish_redux/todo_edit_page/state.dart';

typedef ModifyFunc = void Function(TodoEditState clone);

enum ToDoEditAction { onDone, onChangeTheme, modify }

class ToDoEditActionCreator {
  static Action modify(ModifyFunc clone) {
    return Action(ToDoEditAction.modify, payload: clone);
  }

  static Action onDone() {
    return const Action(ToDoEditAction.onDone);
  }

  static Action onChangeTheme() {
    return const Action(ToDoEditAction.onChangeTheme);
  }
}
