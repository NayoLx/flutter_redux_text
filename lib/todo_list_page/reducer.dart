import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<PageState> buildReducer() {
  return asReducer(
    <Object, Reducer<PageState>>{PageAction.modify: _modify},
  );
}

PageState _modify(PageState state, Action action) {
  final void Function(PageState clone) modifyFunc =
      action.payload as void Function(PageState clone);
  final PageState clone = state.clone();
  modifyFunc(clone);
  assert(state.hashCode != clone.hashCode);
  return clone;
}
