import 'package:flutter/material.dart';
import 'package:flutter_app_blx2000/mockup_data/toolsMockUp.dart';
import 'package:flutter_app_blx2000/model/toolModel.dart';
import 'package:flutter_app_blx2000/view/measures_tools/tools_wrapper/CommonToolWrapper.dart';
//bluetooth on another page of viewpage that will wrap that
class ListTools extends StatelessWidget {
  List<ToolModel> _tools;
  ListTools(){
    this._tools = ToolMock().getTools(1, 3);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List of tools"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<List<ToolModel>>(
                stream: Stream.periodic(Duration(seconds: 1)).asyncMap((_)=>this._tools),
                initialData: this._tools,
                builder: (c, snapshot) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: snapshot.data.map((d) =>
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.build),
                          title: Text(d.description),
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CommonToolWrapper(d)
                              )
                          ),
                        ),
                      )).toList(),
                ),
              )
            ],
          ),
        ),
        /*floatingActionButton: FloatingActionButton(onPressed: (){
          this._tools = ToolMock().getTools(2, -1);
        }),*/
      ),
    );
  }
}