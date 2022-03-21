# Poject Name
vendo-spree-api

# Problem Statement
This task shouldn’t take more than 1-2 hours to complete. The goal is not to have a fully implemented solution, Work-in-progress is more than enough! We just want to see how would you approach this challenge.
Working with 3rd party systems and APIs would be a big chunk of your work at Vendo. As you’ve heard Vendo originated from Spree Commerce. Our database schema is very similar and we’re fully compatible with Spree APIs.
The main objective of this task:
Create a super simple Ruby wrapper for Spree API to support:
Connect to Spree Storefront APIs - https://api.spreecommerce.org/docs/api-v2/YXBpOjMxMjQ5NjA-storefront-api - there’s no authentication needed for Storefront API
Create a cart - https://api.spreecommerce.org/docs/api-v2/b3A6MzE0Mjc0NQ-create-a-cart
Add an Item to the Cart - https://api.spreecommerce.org/docs/api-v2/b3A6MzE0Mjc0Nw-add-an-item-to-cart
It would be great to see some basic test coverage
This can be a ruby library or code embedded into a rails project, whatever is easier/faster to set it up for you
You can test against demo.spreecommerce.org - no need to set up the entire thing locally
After finishing your work please push it to GitHub, great git history of changes is a indicator of good software craftsmanship
Please share access to the repo with “damianlegawiec” user for review

------------



### Built With

* [Ruby](https://www.ruby-lang.org/en/)
* [Ruby on Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [RSpec](https://github.com/rspec/rspec-rails)

------------

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

* `ruby 2.6.5`
* `rails 6.1.5`

### Installation

1. Clone the repo and cd into it
```sh
git clone https://github.com/salmanali23/vendo-spree-api
cd vendo-spree-api
```
2. Install the gems
`bundle install`
3. Start the server
`rails s`
4. Run test suits
`rspec`

### API Collection

**Create Cart**
```http
POST http://localhost:3000/api/v1/carts
```

### Response

```javascript
{
    "id": 1,
    "cart_id": 12928,
    "data": {
        "number": "R710727297",
        "item_total": "0.0",
        "total": "0.0",
        "ship_total": "0.0",
        "adjustment_total": "0.0",
        "created_at": "2022-03-21T06:10:40.258-05:00",
        "updated_at": "2022-03-21T06:10:40.258-05:00",
        "completed_at": null,
        "included_tax_total": "0.0",
        "additional_tax_total": "0.0",
        "display_additional_tax_total": "$0.00",
        "display_included_tax_total": "$0.00",
        "tax_total": "0.0",
        "currency": "USD",
        "state": "cart",
        "token": "5WHAtEmPBXef1J2f-DLauA1647861040253",
        "email": null,
        "display_item_total": "$0.00",
        "display_ship_total": "$0.00",
        "display_adjustment_total": "$0.00",
        "display_tax_total": "$0.00",
        "promo_total": "0.0",
        "display_promo_total": "$0.00",
        "item_count": 0,
        "special_instructions": null,
        "display_total": "$0.00",
        "pre_tax_item_amount": "0.0",
        "display_pre_tax_item_amount": "$0.00",
        "pre_tax_total": "0.0",
        "display_pre_tax_total": "$0.00",
        "shipment_state": null,
        "payment_state": null
    },
    "metadata": {
        "relationships": {
            "line_items": {
                "data": []
            },
            "variants": {
                "data": []
            },
            "promotions": {
                "data": []
            },
            "payments": {
                "data": []
            },
            "shipments": {
                "data": []
            },
            "user": {
                "data": null
            },
            "billing_address": {
                "data": null
            },
            "shipping_address": {
                "data": null
            }
        }
    },
    "created_at": "2022-03-21T11:10:40.266Z",
    "updated_at": "2022-03-21T11:10:40.266Z"
}
```

------------

**Add Item to cart**
```http
POST http://localhost:3000/api/v1/carts/:id/add_item
```
| Parameter | Type | Description |
| :--- | :--- | :--- |
| `id` | `integer` | 1|
| `variant_id` | `integer` | 1|
| `quantity` | `integer` | 2|

### Response

```javascript
{
    "data": {
        "number": "R710727297",
        "item_total": "121.98",
        "total": "121.98",
        "ship_total": "0.0",
        "adjustment_total": "0.0",
        "created_at": "2022-03-21T06:10:40.258-05:00",
        "updated_at": "2022-03-21T06:14:05.567-05:00",
        "completed_at": null,
        "included_tax_total": "0.0",
        "additional_tax_total": "0.0",
        "display_additional_tax_total": "$0.00",
        "display_included_tax_total": "$0.00",
        "tax_total": "0.0",
        "currency": "USD",
        "state": "cart",
        "token": "5WHAtEmPBXef1J2f-DLauA1647861040253",
        "email": null,
        "display_item_total": "$121.98",
        "display_ship_total": "$0.00",
        "display_adjustment_total": "$0.00",
        "display_tax_total": "$0.00",
        "promo_total": "0.0",
        "display_promo_total": "$0.00",
        "item_count": 2,
        "special_instructions": null,
        "display_total": "$121.98",
        "pre_tax_item_amount": "121.98",
        "display_pre_tax_item_amount": "$121.98",
        "pre_tax_total": "121.98",
        "display_pre_tax_total": "$121.98",
        "shipment_state": null,
        "payment_state": null
    },
    "metadata": {
        "relationships": {
            "line_items": {
                "data": [
                    {
                        "id": "6719",
                        "type": "line_item"
                    }
                ]
            },
            "variants": {
                "data": [
                    {
                        "id": "1",
                        "type": "variant"
                    }
                ]
            },
            "promotions": {
                "data": []
            },
            "payments": {
                "data": []
            },
            "shipments": {
                "data": []
            },
            "user": {
                "data": null
            },
            "billing_address": {
                "data": null
            },
            "shipping_address": {
                "data": null
            }
        }
    },
    "id": 1,
    "cart_id": 12928,
    "created_at": "2022-03-21T11:10:40.266Z",
    "updated_at": "2022-03-21T11:14:05.657Z"
}
```