import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test12/Screens/vendeur/ajouter_commande.dart';
import 'package:test12/Screens/vendeur/menu/commandes/liste_commandes.dart';
import 'package:test12/Screens/vendeur/menu/commandes/tournee_widget.dart';
import 'package:test12/Screens/vendeur/widgets/wilya_button.dart';
import 'package:test12/constant.dart';

class Commandes extends StatefulWidget {
  const Commandes({Key? key}) : super(key: key);

  @override
  State<Commandes> createState() => _CommandesState();
}

class _CommandesState extends State<Commandes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AjouterCommande())),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 20,
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 56,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Livraisons",
                      style: TextStyle(
                          fontSize: 20,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Flexible(
                      child: WilayaButton(items: [
                        "En attente",
                        "Validé",
                        "Encours",
                        "Livrées",
                        "Annulées",
                        "Retours"
                      ], hint: "Filtrer"),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 10,
            )),
            SliverToBoxAdapter(
              child: TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Rechercher une commande..."),
                validator: (value) =>
                    value!.isEmpty ? "Entrez une valeur" : null,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),

                        // The start action pane is the one at the left or the top side.
                        startActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: const ScrollMotion(),

                          // A pane can dismiss the Slidable.
                          dismissible: DismissiblePane(onDismissed: () {}),

                          // All actions are defined in the children parameter.
                          children: [
                            // A SlidableAction can have an icon and/or a label.
                            SlidableAction(
                              onPressed: (context) {
                                setState(() {
                                  commandes.removeAt(index);
                                });
                              },
                              backgroundColor: Colors.transparent,
                              // const Color(0xFFFE4A49),
                              foregroundColor: Colors.red,
                              icon: Icons.delete,
                              label: 'Annuler',
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                setState(() {
                                  commandes.removeAt(index);
                                });
                              },
                              backgroundColor: Colors.transparent,
                              //   const Color.fromARGB(255, 64, 166, 67),
                              foregroundColor: Colors.green,
                              icon: Icons.done,
                              label: 'Valider',
                            ),
                          ],
                        ),

                        // The end action pane is the one at the right or the bottom side.

                        // The child of the Slidable is what the user sees when the
                        // component is not dragged.
                        child: TourneeWidget(
                            barcode: "21556", commande: commandes[index]),
                      ),
                  childCount: commandes.length),
            ),
          ],
        ),
      ),
    );
  }
}
