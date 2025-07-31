const express = require('express');
const mongoose = require('mongoose');
require('dotenv').config();

const app = express();
app.use(express.json());

mongoose.connect(process.env.MONGO_URI)
.then(() => console.log("MongoDB connected to Order DB"))
.catch(err => console.error(err));

const orderSchema = new mongoose.Schema({
  productId: String,
  userId: String,
  quantity: Number
});
const Order = mongoose.model('Order', orderSchema);

app.get('/api/orders', async (req, res) => {
  const orders = await Order.find();
  res.json(orders);
});

app.post('/api/orders', async (req, res) => {
  const order = await Order.create(req.body);
  res.json(order);
});

const PORT = process.env.PORT || 3002;
app.listen(PORT, () => console.log(`Order service running on ${PORT}`));
