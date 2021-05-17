import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<TodoEditState> buildReducer() {
  return asReducer(
    <Object, Reducer<TodoEditState>>{ToDoEditAction.modify: _modify},
  );
}

TodoEditState _modify(TodoEditState state, Action action) {
  final void Function(TodoEditState clone) modifyFunc =
      action.payload as void Function(TodoEditState clone);
  final TodoEditState clone = state.clone();
  modifyFunc(clone);
  assert(state.hashCode != clone.hashCode);
  return clone;
}
