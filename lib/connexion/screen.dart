import 'package:bilili/connexion/repositories.dart';
import 'package:bilili/connexion/userModel.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';




import 'connexion_bloc.dart';
import 'connexion_event.dart';
import 'connexion_state.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late FocusNode nameFocus;
  late FocusNode jobFocus;
  late FocusNode searchFocus;
  late TextEditingController nameController;
  late TextEditingController jobController;

  @override
  void initState(){
    super.initState();
    nameFocus= FocusNode();
    jobFocus= FocusNode();
    searchFocus= FocusNode();
    nameController= TextEditingController();
    jobController= TextEditingController();
  }

  @override
  void dispose(){
    nameFocus.dispose();
    jobFocus.dispose();
    searchFocus.dispose();
    nameController.dispose();
    jobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(UserRepository()),
        ),

      ],
      child: Scaffold(
        appBar: AppBar(title: const Text('Bloc user app'),),
        body: blocBody(),
      ),
    );
  }

  Widget blocBody(){
    return BlocProvider(create: (context)=> UserBloc(
     UserRepository(),
    )..add(LoadUserEvent()),
    child: BlocBuilder<UserBloc, UserState>(
      builder: (context, state){
        if (state is UserLoadingState){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is UserLoadedState){
          List<UserModel> userList= state.users;
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (_,index){
                return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                child: Card(
                  color: Theme.of(context).primaryColor,
                  child: ListTile(
                    title: Text(
                      '${userList[index].firstname} ${userList[index].lastname}',
                          style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      userList[index].email,
                      style: const TextStyle(color: Colors.white),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        userList[index].avatar.toString()
                      ),
                    ),
                  ),
                )
                );
            },

          );

        }

        //error state
        if (state is UserErrorState){
          return const Center(
            child: Text('Error'),
          );
        }

         return Container();

      },



    ),);
  }

}
