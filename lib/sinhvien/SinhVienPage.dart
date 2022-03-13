import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qlsv/sinhvien/sinhvienenvents.dart';
import 'package:qlsv/sinhvien/sinhvienbloc.dart';
import 'package:qlsv/sinhvien/sinhvienstates.dart';
import 'package:qlsv/sinhvien/SinhVienModel.dart';

class SinhVienPage extends StatefulWidget {

  @override
  _SinhVienPageState createState()=> _SinhVienPageState();

  @override
  State<StatefulWidget> CreateState() {
// TODO: implement createState
    return _SinhVienPageState();
  }
}

class _SinhVienPageState extends State<SinhVienPage> {
  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: BlocProvider(
        create: (context)=>SinhVienBloc(SinhVienInitialState())..add(SinhVienGetAllEvent()),
        child: buildPage(),
      ),
    );

  }

  buildPage() {
    return SafeArea(child:
    BlocBuilder<SinhVienBloc,SinhVienState>(builder:(context,state)
    {
      if(state is SinhVienFailureState) {
        return Center(
          child: Text(state.message, style: TextStyle(fontSize: 20, color: Colors.red),),
        );
      }
      if(state is SinhVienSuccessState) {
        return Center(
          child: ListView.separated(itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.brown.shade800,
                child: Text("SV"),
              ),
              title: Text(state.lstSinhVien[index].hoten??""),
            );
          }, itemCount: state.lstSinhVien.length, separatorBuilder: (context, index)=> Divider(color: Colors.black),),
        );

      }
      return Center(child: Text("Chống lỗi"),);
    }),);
  }
}