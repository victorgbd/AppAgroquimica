import 'dart:developer';

import 'package:agroquimica/cubit/adminstates_cubit.dart';
import 'package:agroquimica/data/entities/detallefact_entities.dart';
import 'package:agroquimica/data/entities/factura_entities.dart';
import 'package:agroquimica/data/entities/productos_entities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:agroquimica/pages/menu_page.dart';
import 'package:flutter_counter/flutter_counter.dart';

class VentasPage extends StatefulWidget {
  @override
  VentasPageState createState() => VentasPageState();
}

class VentasPageState extends State<VentasPage> {
  List<ProductosEntities> productos = [];

  @override
  void initState() {
    context.bloc<AdminstatesCubit>().getProductos();
    //ProductosSearch(state: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ventas"),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: ProductosSearch(productos: productos));
              },
            ),
            IconButton(
              icon: Icon(Icons.verified_user),
              onPressed: () {
                showDialog(
                    context: context,
                    child: AlertDialog(
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            Image(
                              height: 256.0,
                              width: 256.0,
                              image: AssetImage('assets/check_animation.gif'),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text('Compra realizada existosamente'),
                          ],
                        ),
                      ),
                      actions: [
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('CANCELAR'))
                      ],
                    ));
              },
            ),
            IconButton(
              icon: Icon(Icons.fact_check),
              onPressed: () {
                showDialog(
                    context: context,
                    child: AlertDialog(
                      content: Text("¿Estas seguro que quieres continuar?"),
                      actions: [
                        FlatButton(
                            onPressed: () async {
                              final factura = FacturaEntities(
                                  numfact: 1,
                                  codcli: int.parse(context
                                      .bloc<AdminstatesCubit>()
                                      .userEEntities
                                      .codcli),
                                  estado: 0,
                                  tipfac: "true",
                                  fecha: null,
                                  codemp: 13,
                                  balance: 0.0,
                                  total: context
                                      .bloc<AdminstatesCubit>()
                                      .totalfacturar);
                              int numfac = await context
                                  .bloc<AdminstatesCubit>()
                                  .createFactura(factura);

                              List<DetallefactEntities> detalle =
                                  List<DetallefactEntities>();
                              context
                                  .bloc<AdminstatesCubit>()
                                  .carrito
                                  .forEach((element) {
                                detalle.add(DetallefactEntities(
                                    numfac: numfac,
                                    codproducto: int.parse(element.codproducto),
                                    cantvent: int.parse(element.cantidadven),
                                    precvent: double.parse(element.precio),
                                    coduni: int.parse(element.codunidad)));
                              });

                              await context
                                  .bloc<AdminstatesCubit>()
                                  .createDetalleFactura(detalle);
                              print("tosdo bien toribio");
                              Navigator.of(context).pop();
                            },
                            child: Text('OK')),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('CANCELAR'))
                      ],
                    ));
              },
            )
          ],
        ),
        endDrawer: UserDrawer(),
        body: BlocConsumer<AdminstatesCubit, AdminstatesState>(
            listener: (context, state) {
          if (state is AdminstatesError) {
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        }, builder: (context, state) {
          if (state is AdminstatesloadingProd) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AdminstatesloadedProd) {
            this.productos = state.productosEntities;
            return Lista();
          } else if (state is Adminstatesloadedcarrito) {
            return Lista();
          } else {
            return Center(
              child: Text("error"),
            );
          }
        }));
  }

  //Future<void> facturar() async {}
}

class Lista extends StatelessWidget {
  const Lista({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double totalfact = getTotal(context);
    context.bloc<AdminstatesCubit>().totalfacturar = totalfact;
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: context.bloc<AdminstatesCubit>().carrito.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cancel,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          //llamar un metodo para eliminarlo de la tabla wishlist
                          setState(() {
                            totalfact -= int.parse(context
                                    .bloc<AdminstatesCubit>()
                                    .carrito[index]
                                    .cantidadven) *
                                double.parse(context
                                    .bloc<AdminstatesCubit>()
                                    .carrito[index]
                                    .precio);
                            context.bloc<AdminstatesCubit>().totalfacturar =
                                totalfact;
                            context
                                .bloc<AdminstatesCubit>()
                                .carrito
                                .removeAt(index);
                          });
                        }
                      },
                      key: UniqueKey(),
                      child: ListTile(
                        title: Text(context
                            .bloc<AdminstatesCubit>()
                            .carrito[index]
                            .descripcion),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(context
                                .bloc<AdminstatesCubit>()
                                .carrito[index]
                                .cantidadven),
                            Text("Precio: " +
                                context
                                    .bloc<AdminstatesCubit>()
                                    .carrito[index]
                                    .precio),
                            Divider()
                          ],
                        ),
                        onTap: () {
                          int cantidad = int.parse(context
                              .bloc<AdminstatesCubit>()
                              .carrito[index]
                              .cantidadven);
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                      content: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            FadeInImage(
                                                height: 256.0,
                                                width: 256.0,
                                                placeholder: AssetImage(
                                                    'assets/plant_icon.png'),
                                                image: NetworkImage(context
                                                    .bloc<AdminstatesCubit>()
                                                    .carrito[index]
                                                    .url)),
                                            Text(context
                                                .bloc<AdminstatesCubit>()
                                                .carrito[index]
                                                .descripcion),
                                            Text("Precio: " +
                                                context
                                                    .bloc<AdminstatesCubit>()
                                                    .carrito[index]
                                                    .precio),
                                            Counter(
                                                initialValue: cantidad,
                                                minValue: 1,
                                                step: 1,
                                                maxValue: int.parse(context
                                                    .bloc<AdminstatesCubit>()
                                                    .carrito[index]
                                                    .cantidad),
                                                onChanged: (value) {
                                                  setState(() {
                                                    cantidad = value;
                                                  });
                                                },
                                                decimalPlaces: 0)
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        FlatButton(
                                            onPressed: () {
                                              context
                                                  .bloc<AdminstatesCubit>()
                                                  .setcantven(index, cantidad);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("OK")),
                                        FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text("CANCELAR"))
                                      ]);
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                child: Text('Total: $totalfact'),
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        );
      },
    );
  }

  double getTotal(BuildContext context) {
    double total = 0;
    context.bloc<AdminstatesCubit>().carrito.forEach((element) {
      total += int.parse(element.cantidadven) * double.parse(element.precio);
    });
    return total;
  }
}

class ProductosSearch extends SearchDelegate<ProductosEntities> {
  final List<ProductosEntities> productos;

  ProductosSearch({@required this.productos});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    int cantidad = 1;
    List<ProductosEntities> lista = query.isEmpty
        ? productos
        : productos
            .where((element) => element.descripcion
                .toLowerCase()
                .startsWith(query.toLowerCase()))
            .toList();
    return lista.isEmpty
        ? Text('Producto no encontrado...')
        : ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(lista[index].descripcion),
                subtitle: Column(
                  children: [Divider()],
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return StatefulBuilder(
                        builder: (context, setState) {
                          return AlertDialog(
                              content: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    FadeInImage(
                                        height: 256.0,
                                        width: 256.0,
                                        placeholder:
                                            AssetImage('assets/plant_icon.png'),
                                        image: NetworkImage(lista[index].url)),
                                    Text(lista[index].descripcion),
                                    Text("Precio: " + lista[index].precio),
                                    Counter(
                                        initialValue: cantidad,
                                        minValue: 1,
                                        step: 1,
                                        maxValue:
                                            int.parse(lista[index].cantidad),
                                        onChanged: (value) {
                                          // ignore: invalid_use_of_protected_member
                                          setState(() {
                                            cantidad = value;
                                          });
                                        },
                                        decimalPlaces: 0)
                                  ],
                                ),
                              ),
                              actions: [
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      bool flag = true;

                                      lista[index].cantidadven =
                                          cantidad.toString();
                                      context
                                          .bloc<AdminstatesCubit>()
                                          .carrito
                                          .forEach((element) {
                                        if (element.codproducto ==
                                            lista[index].codproducto) {
                                          showDialog(
                                            context: context,
                                            builder: (dialogcontext) {
                                              return AlertDialog(
                                                content: Text(
                                                    "Producto ya agredado al carrito"),
                                                actions: [
                                                  FlatButton(
                                                      onPressed: () {
                                                        Navigator.of(
                                                                dialogcontext)
                                                            .pop();
                                                      },
                                                      child: Text("OK"))
                                                ],
                                              );
                                            },
                                          );
                                          flag = false;
                                        }
                                      });
                                      if (flag) {
                                        context
                                            .bloc<AdminstatesCubit>()
                                            .addcarrito(lista[index]);
                                      }
                                    },
                                    child: Text("AGREGAR")),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("CANCELAR"))
                              ]);
                        },
                      );
                    },
                  );
                },
              );
            });
  }
}
