def test_order_create
  {
    retailer: 'amazon',
    is_gift: true,
    shipping_method: 'free',
    gift_message: 'Thanks for your order, Foo Baz. Enjoy!',
    shipping_address: {
      first_name: 'Foo',
      last_name: 'Baz',
      address_line1: '123 3rd Street',
      address_line2: '',
      zip_code: 95112,
      city: 'San Jose',
      state: 'CA',
      country: 'US',
      phone_number: '4085551212'
   },
   billing_address: {
     first_name: 'Foo',
     last_name: 'Baz',
     address_line1: '1 Mission Street',
     address_line2: '',
     zip_code: '94105',
     city: 'San Francisco',
     state: 'CA',
     country: 'US',
     phone_number: '4155551212'
  },
  payment_method: {
    name_on_card: ENV['AMAZON_CC_NAME'],
    number: ENV['AMAZON_CC_NUM'],
    security_code: ENV['AMAZON_CC_CVV2'],
    expiration_month: ENV['AMAZON_CC_EXP_MO'],
    expiration_year: ENV['AMAZON_CC_EXP_YR'],
    use_gift: false
  },
  retailer_credentials: {
    email: ENV['AMAZON_ASSOC_EMAIL'],
    password: ENV['AMAZON_ASSOC_PASSWORD']
  },
  address_suggestion_choice: 'suggested',
    products: [
      {
        product_id: 'B01M0RU6LY',
        pid_type: 'ASIN',
        quantity: 1,
        seller_selection_criteria: {
          prime: true,
          handling_days_max: 6,
          condition_in: ['New'],
        }
      }
    ]
  }
end

def test_order_response
  {
      :_type => "order",
      :id => "xyg2rfplly",
      :mode => "live",
      :order_total => 2040,
      :fee => 40,
      :max_total => 4000,
      :address => {
          :_type => "address",
          :name => "Tim Beaver",
          :address_line1 => "77 Massachusetts Avenue",
          :address_line2 => nil,
          :zip_code => "02139",
          :city => "Cambridge",
          :state => "MA",
          :country => "US"
      },
      :address_original => nil,
      :address_suggested => nil,
      :address_suggestion_choice => nil,
      :products => [
          {
              :_type => "product",
              :pid => "B003L1ZYYM",
              :pid_type => "ASIN",
              :qty => 1,
              :price => 1500
          }
      ],
      :merchant => "amazon",
      :gift_ship => false,
      :gift_message => nil,
      :shipping_method => "standard",
      :shipping_cost => 500,
      :status => {
          :_type => "status",
          :state => "active",
          :code => "processed",
          :message => "Your order has been processed with the merchant and is awaiting shipment."
      },
      :created_date => 1336100454,
      :ship_date => nil,
      :delivery_date => nil,
      :ship_date_estimate => 1336120454,
      :delivery_date_estimate => 1336705254,
      :tracking_number => nil,
      :tracking_type => nil
  }
end
