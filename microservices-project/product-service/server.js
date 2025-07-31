const express = require('express');
const mongoose = require('mongoose');
require('dotenv').config();

const app = express();
app.use(express.json());

mongoose.connect(process.env.MONGO_URI)
.then(() => console.log("MongoDB connected to Product DB"))
.catch(err => console.error(err));

const productSchema = new mongoose.Schema({ name: String, price: Number });
const Product = mongoose.model('Product', productSchema);

app.get('/api/products', async (req, res) => {
  const products = await Product.find();
  res.json(products);
});

app.post('/api/products', async (req, res) => {
  const product = await Product.create(req.body);
  res.json(product);
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => console.log(`Product service running on ${PORT}`));
