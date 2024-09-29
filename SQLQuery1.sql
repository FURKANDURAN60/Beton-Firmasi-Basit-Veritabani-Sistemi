CREATE TABLE users (
  id INTEGER PRIMARY KEY IDENTITY(1,1),
  username VARCHAR(100),
  phone VARCHAR(20),
  email VARCHAR(50) UNIQUE,
  password_ VARCHAR(25)
);

CREATE TABLE clients (
  id INTEGER PRIMARY KEY IDENTITY(1,1),
  name_ VARCHAR(100),
  email VARCHAR(50),
  phone VARCHAR(20)
);

CREATE TABLE vehicles (
  id INTEGER PRIMARY KEY IDENTITY(1,1),
  user_id INTEGER,
  brand VARCHAR(100),
  model VARCHAR(100),
  plate VARCHAR(20),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE purchases (
  id INTEGER PRIMARY KEY IDENTITY(1,1),
  client_id INTEGER,
  purchase_no INTEGER,
  total_price FLOAT,
  payment_type VARCHAR(50),
  status_ BIT,
  FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE addresses (
  id INTEGER PRIMARY KEY IDENTITY(1,1),
  client_id INTEGER,
  name_surname VARCHAR(100),
  address_ VARCHAR(200),
  district VARCHAR(100),
  city VARCHAR(50),
  FOREIGN KEY (client_id) REFERENCES clients(id)
);

CREATE TABLE invoices (
  id INTEGER PRIMARY KEY IDENTITY(1,1),
  purchase_id INTEGER,
  address_id INTEGER,
  instalment TINYINT,
  status_ BIT,
  FOREIGN KEY (purchase_id) REFERENCES purchases(id),
  FOREIGN KEY (address_id) REFERENCES addresses(id)
);

CREATE TABLE products (
  id INTEGER PRIMARY KEY IDENTITY(1,1),
  pname VARCHAR(100),
  price FLOAT,
  stock BIT
);

CREATE TABLE orders (
  id INTEGER PRIMARY KEY IDENTITY(1,1),
  product_id INTEGER,
  client_id INTEGER,
  purchase_id INTEGER,
  address_id INTEGER,
  vehicle_id INTEGER,
  is_delivered BIT,
  price FLOAT,
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (client_id) REFERENCES clients(id),
  FOREIGN KEY (purchase_id) REFERENCES purchases(id),
  FOREIGN KEY (address_id) REFERENCES addresses(id),
  FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);
