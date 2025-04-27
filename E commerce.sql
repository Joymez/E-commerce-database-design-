-- Create the brand table
CREATE TABLE brand (
  brand_id INT PRIMARY KEY AUTO_INCREMENT,
  brand_name VARCHAR(255) NOT NULL
);

-- Create the product_category table
CREATE TABLE product_category (
  category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(255) NOT NULL
);

-- Create the product table
CREATE TABLE product (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  base_price DECIMAL(10,2) NOT NULL,
  brand_id INT,
  category_id INT,
  FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
  FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Create the color table
CREATE TABLE color (
  color_id INT PRIMARY KEY AUTO_INCREMENT,
  color_name VARCHAR(50) NOT NULL
);

-- Create the size_category table
CREATE TABLE size_category (
  size_category_id INT PRIMARY KEY AUTO_INCREMENT,
  size_category_name VARCHAR(100) NOT NULL
);

-- Create the size_option table
CREATE TABLE size_option (
  size_option_id INT PRIMARY KEY AUTO_INCREMENT,
  size_name VARCHAR(50) NOT NULL,
  size_category_id INT,
  FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Create the product_image table
CREATE TABLE product_image (
  image_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  image_url VARCHAR(500) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Create the product_item table
CREATE TABLE product_item (
  product_item_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  color_id INT,
  size_option_id INT,
  stock_quantity INT DEFAULT 0,
  price DECIMAL(10,2),
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (color_id) REFERENCES color(color_id),
  FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- Create the product_variation table
CREATE TABLE product_variation (
  variation_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  variation_name VARCHAR(255),
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Create the attribute_category table
CREATE TABLE attribute_category (
  attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(100) NOT NULL
);

-- Create the attribute_type table
CREATE TABLE attribute_type (
  attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
  type_name VARCHAR(50) NOT NULL
);

-- Create the product_attribute table
CREATE TABLE product_attribute (
  attribute_id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  attribute_name VARCHAR(255) NOT NULL,
  attribute_value VARCHAR(255),
  attribute_category_id INT,
  attribute_type_id INT,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
  FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);
