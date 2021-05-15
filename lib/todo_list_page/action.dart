import 'package:fish_redux/fish_redux.dart';
import 'todo_component/component.dart';

import 'state.dart';

typedef ModifyFunc = void Function(PageState clone);

enum PageAction { modify, initToDos, onAdd }

class PageActionCreator {
  static Action modify(ModifyFunc clone) {
    return Action(PageAction.modify, payload: clone);
  }

  static Action initToDosAction(List<ToDoState> toDos) {
    return Action(PageAction.initToDos, payload: toDos);
  }

  static Action onAddAction() {
    return const Action(PageAction.onAdd);
  }
}
