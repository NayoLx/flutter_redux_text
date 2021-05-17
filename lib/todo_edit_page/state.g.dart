part of 'state.dart';

TodoEditState _todoEditStateClone(TodoEditState resource) {
  final TodoEditState clone = TodoEditState();
  clone.themeColor = resource.themeColor;

  clone.toDo = resource.toDo;

  clone.descEditController = resource.descEditController;

  clone.focusNodeDesc = resource.focusNodeDesc;

  clone.focusNodeName = resource.focusNodeName;

  clone.nameEditController = resource.nameEditController;
  return clone;
}
