const router = require('express').Router();
const { Tag, Product, ProductTag } = require('../../models');


router.get('/', (req, res) => {
  Tag.findAll({
    include: {
      model: Product,
      attributes: ['product_name']
    }
  })
});

router.get('/:id', (req, res) => {

  Tag.findOne({
    where: {
      id: req.params.id
    },
    include: {
      model: Product,
      attributes: ['product_name']
    }
  })
});

router.post('/', (req, res) => {
  Tag.create(req.body)
    .then((tag) => {
      res.status(200).json(tag);
    })
    .catch((err) => {
      res.status(400).json(err);
    });
});

router.put('/:id', (req, res) => {
  Tag.update(req.body, {
    where: {
      id: req.params.id
    }
  })
    .then((tag) => {
      res.status(200).json(tag);
    })
    .catch((err) => {
      res.status(400).json(err);
    });
});

router.delete('/:id', (req, res) => {
  Tag.destroy({
    where: {
      id: req.params.id
    }
  })
    .then((tag) => {
      res.status(200).json(tag);
    })
    .catch((err) => {
      res.status(400).json(err);
    });
});
module.exports = router;
