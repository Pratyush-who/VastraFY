import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vastrafy/providers/product.dart';
import 'package:vastrafy/providers/products.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({super.key});
  static const routeName = '/edit-product';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _focusNode = FocusNode();
  final _descNode = FocusNode();
  final _imgUrlController = TextEditingController();
  final _imgUrlFocusNode = FocusNode();
  final _formSubmit = GlobalKey<FormState>();
  var _editedProd =
      Product(id: '', title: '', description: '', imageUrl: '', price: 0);

  var initValues = {
    'title': '',
    'price': '',
    'description': '',
    'imgUrl': '',
  };

  var isInit = true;

  @override
  void initState() {
    _imgUrlFocusNode.addListener(_updateImgUrl);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (isInit) {
      final productId = ModalRoute.of(context)?.settings.arguments as String?;
      if (productId != null) {
        _editedProd =
            Provider.of<Products>(context, listen: false).findById(productId);
        initValues = {
          'title': _editedProd.title,
          'description': _editedProd.description,
          'price': _editedProd.price.toString(),
          // 'imgUrl': _editedProd.imageUrl,
          'imgUrl': '',
        };
        _imgUrlController.text = _editedProd.imageUrl;
      }
    }
    isInit = false;
    super.didChangeDependencies();
  }

  void _updateImgUrl() {
    if (!_imgUrlFocusNode.hasFocus) {
      setState(() {});
    }
  }

  void _submitForm() {
    final isValid = _formSubmit.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formSubmit.currentState?.save();
    if (_editedProd.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProd(_editedProd.id, _editedProd);
    } else {
      Provider.of<Products>(context, listen: false).addProduct(_editedProd);
    }

    setState(() {});

    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _imgUrlFocusNode.removeListener(_updateImgUrl);
    _focusNode.dispose();
    _descNode.dispose();
    _imgUrlController.dispose();
    _imgUrlFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _submitForm();
            },
          ),
        ],
      ),
      body: Form(
        key: _formSubmit,
        child: ListView(
          padding: EdgeInsets.all(16), // Added padding to ListView
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                initialValue: initValues['title'],
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
                onSaved: (value) {
                  _editedProd = Product(
                    title: value!,
                    description: _editedProd.description,
                    imageUrl: _editedProd.imageUrl,
                    price: _editedProd.price,
                    id: _editedProd.id,
                    isFavorite: _editedProd.isFavorite,
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please return ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.next,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                initialValue: initValues['title'],
                keyboardType: TextInputType.number,
                focusNode: _focusNode,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_descNode);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return 'Enter a valid price';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProd = Product(
                    id: _editedProd.id,
                    isFavorite: _editedProd.isFavorite,
                    title: _editedProd.title,
                    description: _editedProd.description,
                    imageUrl: _editedProd.imageUrl,
                    price: double.parse(value!),
                  );
                },
                decoration: InputDecoration(
                  label: Text('Price'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.next,
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                initialValue: initValues['title'],
                focusNode: _descNode,
                keyboardType: TextInputType.multiline,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(_focusNode);
                },
                onSaved: (value) {
                  _editedProd = Product(
                    id: _editedProd.id,
                    isFavorite: _editedProd.isFavorite,
                    title: _editedProd.title,
                    description: value!,
                    imageUrl: _editedProd.imageUrl,
                    price: _editedProd.price,
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please return ';
                  }
                  return null;
                },
                maxLines: 3,
                decoration: InputDecoration(
                  label: Text('Description'),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Fixed Row layout
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black38),
                    ),
                    child: _imgUrlController.text.isEmpty
                        ? Text('Paste a Url plx')
                        : FittedBox(
                            fit: BoxFit
                                .contain, // Ensure the image fits inside the box without overflowing
                            child: Image.network(_imgUrlController.text),
                          ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'ImageUrl',
                        enabledBorder: OutlineInputBorder(
                          // Box visible when the field is unfocused
                          borderSide: BorderSide(color: Colors.grey, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          // Box visible when the field is focused
                          borderSide:
                              BorderSide(color: Colors.purple, width: 1),
                        ),
                      ),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imgUrlController,
                      focusNode: _imgUrlFocusNode,
                      onFieldSubmitted: (_) => _submitForm(),
                      onSaved: (value) {
                        _editedProd = Product(
                          id: _editedProd.id,
                          isFavorite: _editedProd.isFavorite,
                          title: _editedProd.title,
                          description: _editedProd.description,
                          imageUrl: value!,
                          price: _editedProd.price,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
