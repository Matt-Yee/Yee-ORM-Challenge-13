CREATE DB inventorydb;

USE inventorydb;

CREATE TABLE category (
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    category_name VARCHAR(120) NOT NULL,
);

CREATE TABLE product (
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    product_name VARCHAR(120) NOT NULL,
    price DECIMAL NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 10,
    CHECK (stock_quantity >= 0),
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES category(id)

);

CREATE TABLE tag (
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    tag_name VARCHAR(120) NOT NULL
);

CREATE TABLE ProductTag (
    id INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (id),
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(id),
    tag_id INT NOT NULL,
    FOREIGN KEY (tag_id) REFERENCES tag(id)
    );

