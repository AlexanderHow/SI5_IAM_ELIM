import 'package:flutter/material.dart';
import 'package:flutter_app_blx2000/model/toolModel.dart';
import 'package:flutter_app_blx2000/view/measures_tools/tools_components/dataBlock.dart';
import 'package:flutter_app_blx2000/view/measures_tools/tools_components/inputsBlock.dart';
import 'package:provider/provider.dart';

/*class CommonTool extends StatelessWidget{
  CommonTool();

  @override
  Widget build(BuildContext context) {
    ToolModel tool = Provider.of<ToolModel>(context);

    List<Widget> content = new List<Widget>();
    content.add(new Center(
      child: Column(
        children: <Widget>[
          Text(tool.description),
          Text(tool.manual)
        ],
      ),
    ));

    content.add(tool.inputsBlock);

    content.add(new Center(
      child: Column(
        children: tool.dataBlocks
      ),
    ));

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: content
      ),
    );
  }
}*/

class CommonToolGeneralInfo extends StatelessWidget{
  String _name;
  String _descr;
  String _manual;

  CommonToolGeneralInfo(this._name, this._descr, this._manual);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.build),
                    title: Text(this._name + "\n"),
                  ),
                ],
              )
          ),
          Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.description),
                    title: Text("Description : \n"),
                  ),
                  Text(this._descr)
                ],
              )
          ),
          Card(
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.live_help),
                    title: Text("Manual : \n"),
                  ),
                  Text(this._manual)
                ],
              )
          ),
        ],
      ),
    );
  }
}

class CommonToolInputs extends StatelessWidget{
  InputsBlock _inputs;

  CommonToolInputs(this._inputs);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
            child: (this._inputs.isEmpty) ? Text("No command available") : this._inputs
        )
    );
  }
}

class CommonToolDataBlock extends StatelessWidget{

  CommonToolDataBlock();

  @override
  Widget build(BuildContext context) {
    ToolModel tm = Provider.of<ToolModel>(context);
    return SingleChildScrollView(
        child: Center(
          child: Column(
            children: tm.dataBlocks,
          ),
        )
    );
  }

}