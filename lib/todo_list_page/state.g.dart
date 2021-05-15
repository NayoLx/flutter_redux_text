part of 'state.dart';

PageState _pageStateClone(PageState resource) {
  final PageState clone = PageState();
  clone.toDos = resource.toDos;

  clone.themeColor = resource.themeColor;
  return clone;
}
