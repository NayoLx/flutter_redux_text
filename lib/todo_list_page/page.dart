import 'package:fish_redux/fish_redux.dart';
import 'package:flutte_fish_redux/todo_list_page/todo_component/state.dart';

import 'effect.dart';
import 'list_adapter/adapter.dart';
import 'reducer.dart';
import 'report_component/component.dart';
import 'state.dart';

import 'view.dart';

class ToDoListPage extends Page<PageState, Map<String, dynamic>> {
  ToDoListPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<PageState>(
              adapter: NoneConn<PageState>() + ToDoListAdapter(),
              slots: <String, Dependent<PageState>>{
                'report': ReportConnector() + ReportComponent()
              }),

          /// 页面私有AOP, 如果需要
          // middleware: <Middleware<PageState>>[
          //   logMiddleware(tag: 'ToDoListPage'),
          // ],
        );
}

//buildComponent
class ReportConnector extends ConnOp<PageState, ReportState>
    with ReselectMixin<PageState, ReportState> {
  @override
  ReportState computed(PageState state) {
    return ReportState()
      ..done = state.toDos.where((ToDoState tds) => tds.isDone).length
      ..total = state.toDos.length;
  }

  @override
  List<dynamic> factors(PageState state) {
    return <int>[
      state.toDos.where((ToDoState tds) => tds.isDone).length,
      state.toDos.length
    ];
  }

  @override
  void set(PageState state, ReportState subState) {
    throw Exception('Unexcepted to set PageState from ReportState');
  }
}