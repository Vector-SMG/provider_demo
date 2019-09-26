
import 'package:flutter/widgets.dart';
import 'package:provider_demo/provider_demo.dart';

///这是便捷类，会获得当前context和指定数据类型 的Provider
class Consumer<T> extends StatelessWidget{

  Consumer({Key key,@required this.builder,this.child}):assert(builder!=null),super(key:key);

  final Widget child;

  final Widget Function(BuildContext context,T value) builder;

  @override
  Widget build(BuildContext context) {
    return builder(context,ChangeNotifierProvider.of(context));
  }

}







