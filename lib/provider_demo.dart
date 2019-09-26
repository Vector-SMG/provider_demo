import 'package:flutter/widgets.dart';

//提供数据存储的位置
class InheritedProvider<T> extends InheritedWidget {

  InheritedProvider({@required this.data, Widget child}) :super(child: child);

  final T data;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }

}

//数据通知
class ChangeNotifier implements Listenable {

  @override
  void addListener(listener) {
  }

  @override
  void removeListener(listener) {
  }

  void notifyListeners() {

  }

}

//订阅者
Type _typeof<T>() => T;

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {

  ChangeNotifierProvider({Key key, this.data, this.child});

  final Widget child;
  final T data;

  static T of<T>(BuildContext context) {
    final type = _typeof<InheritedProvider<T>>();
    final provider = context.inheritFromWidgetOfExactType(
        type) as InheritedProvider<T>;
    return provider.data;
  }

  @override
  _ChangeNotifierProviderState<T> createState() {
    return new _ChangeNotifierProviderState<T>();
  }

}

class _ChangeNotifierProviderState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider<T>> {

  void update() {
    setState(() => {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<T> oldWidget) {
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InheritedProvider<T>(data: widget.data, child: widget.child);
  }


}







