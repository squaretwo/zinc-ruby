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

def test_cancelled_order_response
  {
      :id => "abc3rfplly"
  }
end

def test_returned_order_response
  {
      :id => "efg5grrtyu"
  }
end

def test_product_prices_response
  {
      :status => "completed",
      :timestamp => 1492554376,
      :offers =>
          [{:seller_percent_positive => 71,
            :prime => false,
            :ship_price => 5.19,
            :handling_days_min => 0,
            :handling_days_max => 0,
            :seller_name => "everythingskincare",
            :price => 65.9,
            :prime_only => false,
            :seller_num_ratings => 4767,
            :comments => nil,
            :offerlisting_id => "7xkKIbc0kK4y9dXkqqpeg%2F92epaNb%2FFl0uTif8L%2FK%2B%2BA%2FrlI2ll1rsnIcnSPGHhdlweO8n5obx7LZg7zFPrjJmh82IykLMMYja4p%2BXg42NgDmjav4PIkRa0Y246dPZmfqi6HR1%2B0wKuqrGcvsGbXhQladlU6v6UF",
            :buy_box_winner => false,
            :international => false,
            :merchant_id => "AU3WPZ6YG8U0I",
            :greytext => "Ships from CA, United States.",
            :condition => "New",
            :addon => false},
           {:seller_percent_positive => 90,
            :prime => true,
            :ship_price => 0,
            :handling_days_min => 0,
            :handling_days_max => 0,
            :seller_name => "Maryanne LLC",
            :price => 74.9,
            :prime_only => false,
            :seller_num_ratings => 594,
            :comments => nil,
            :offerlisting_id => "7xkKIbc0kK4y9dXkqqpeg%2F92epaNb%2FFlcPSFgVhGhQ0GSlTcME%2FtVNr9LMWCEl5ATDfvBtu8Jp%2BoCPm%2F7v9t29XFB8KL%2BNOnepNIEq9IxOh8PkEuLFb7%2BjfgHse82qxim2S5tffg40wcgqccVD%2B%2B3d5pui0pf5xD",
            :buy_box_winner => true,
            :international => false,
            :merchant_id => "A1J4YROMOLNY67",
            :greytext => "Shipping rates",
            :condition => "New",
            :addon => false},
           {:seller_percent_positive => 93,
            :prime => false,
            :ship_price => 0,
            :handling_days_min => 0,
            :handling_days_max => 0,
            :seller_name => "shopUSAmall",
            :price => 82.5,
            :prime_only => false,
            :seller_num_ratings => 949,
            :comments => nil,
            :offerlisting_id => "7xkKIbc0kK4y9dXkqqpeg%2F92epaNb%2FFl4gBg0mhdXFN00ZOb9aYMJtPsX1dcQhFtj5sQrBAQHz%2Fw%2BSB0ozU4kWU%2BX9WcKKZve61q7uHDjwUM%2BQRm6rZwPTa79IeMcBU5znBEnSQxk5k6XKporDCMi%2FdmpfKXBj6j",
            :buy_box_winner => false,
            :international => false,
            :merchant_id => "A3ETT6GIDGEGE7",
            :greytext => "Ships from TX, United States.",
            :condition => "New",
            :addon => false},
           {:seller_percent_positive => 87,
            :prime => false,
            :ship_price => 4.49,
            :handling_days_min => 0,
            :handling_days_max => 0,
            :seller_name => "x-linds",
            :price => 94.49,
            :prime_only => false,
            :seller_num_ratings => 307,
            :comments => nil,
            :offerlisting_id => "7xkKIbc0kK4y9dXkqqpeg%2F92epaNb%2FFlZZVIojsMG8%2Fejy3DXnol7gSyXY6iXkEX6at80tPX4TvME5YJw1vMocFnfcqnK3E8pn54AXo1EaHYdvJKfo0o%2FoRuj3I4sSmwbp3y9v6jtV22z5Y%2BNakNzRXRtTPLf7oe",
            :buy_box_winner => false,
            :international => false,
            :merchant_id => "A3PB5YSMR6CMYO",
            :greytext => "Ships from CA, United States.",
            :condition => "New",
            :addon => false},
           {:seller_percent_positive => 96,
            :prime => false,
            :ship_price => 6.99,
            :handling_days_min => 0,
            :handling_days_max => 0,
            :seller_name => "YouthNBeauty",
            :price => 126.99,
            :prime_only => false,
            :seller_num_ratings => 439,
            :comments => nil,
            :offerlisting_id => "7xkKIbc0kK4y9dXkqqpeg%2F92epaNb%2FFlR%2BSNOcDgvdjr%2FPMobwnABkzr5gLdPNC0KkbsOcIfJ66sV8De04WloQF6xp45kvwap2l%2BlGK1lPDc7pw%2FwL0j17SEqMbe28qWaJHBRHHmgBdu4FckC7UoHw%3D%3D",
            :buy_box_winner => false,
            :international => false,
            :merchant_id => "A303YC1JQ8723G",
            :greytext => "Ships from CA, United States.",
            :condition => "New",
            :addon => false},
           {:seller_percent_positive => 94,
            :prime => false,
            :ship_price => 34.99,
            :handling_days_min => 0,
            :handling_days_max => 0,
            :seller_name => "Cooking Marvellous",
            :price => 119.79,
            :prime_only => false,
            :seller_num_ratings => 10575,
            :comments => nil,
            :offerlisting_id => "7xkKIbc0kK4y9dXkqqpeg%2F92epaNb%2FFllBK%2FTw1ykUS6aTpXijAGk%2B7WfdSYHl1GRHSZH%2F9vz%2BvSp5Hl3v5GBKbbIYh88KZ2dxP7egRIRoUdn2icG5Po4m7mXd1rSYzU%2F2B4qszGrCUfGD4tRMhf6A%3D%3D",
            :buy_box_winner => false,
            :international => true,
            :merchant_id => "A2T82LPZDA08T9",
            :greytext => "Ships from United Kingdom.",
            :condition => "New",
            :addon => false}],
      :retailer => "amazon",
      :asin => "B002Q633CI"
  }
end

def test_product_details_response
  {
      :status => "completed",
      :timestamp => 1492552913,
      :brand => "Bobbi Brown",
      :cleaned_product_description =>
          "Color:Light Tint Enriched with moisturizing, glorious ingredients that blends\n" + "easily Reduces the appearance of fine lines Protects skin against dehydration\n" + "& damage UV rays Leaves skin a dewy, radiant look with light coverage Suitable\n" + "for dry skin Dermatologist tested",
      :feature_bullets => ["Extra Tinted Moisturizing Balm SPF25 - Light Tint"],
      :variant_specifics => [{:dimension => "Color", :value => "Light Tint"}],
      :main_image => "https://images-na.ssl-images-amazon.com/images/I/81qW%2BQkGT9L.jpg",
      :images => ["https://images-na.ssl-images-amazon.com/images/I/81qW%2BQkGT9L.jpg"],
      :package_dimensions => {:weight => {:amount => 6.4, :unit => "ounces"}},
      :epids => [{:type => "MPN", :value => "85772"}, {:type => "EAN", :value => "6909121848512"}, {:type => "UPC", :value => "883579617813"}],
      :asin => "B002Q633CI",
      :categories => ["Beauty & Personal Care", "Skin Care", "Face", "Creams & Moisturizers", "Tinted Moisturizers"],
      :review_count => 46,
      :product_id => "B002Q633CI",
      :retailer => "amazon",
      :title => "Bobbi Brown Extra Tinted Moisturizing Balm Spf 25 Light Tint 1 Oz",
      :product_description =>
          "Color:Light Tint Enriched with moisturizing, glorious ingredients that blends\n" + "easily Reduces the appearance of fine lines Protects skin against dehydration\n" + "& damage UV rays Leaves skin a dewy, radiant look with light coverage Suitable\n" + "for dry skin Dermatologist tested",
      :reviews =>
          [{:title => "This is the Best!",
            :author => "KAH",
            :content =>
                "A friend had recommended this tinted moisturizer versus a foundation when I mentioned that I was looking for a smoother, dewy look for foundations. I took a chance and tried this - it's great! it has enough coverage to gently reduce the appearance of  my freckles as well as give my face a more balanced color.  Plus, it's a moisturizer with sunscreen. Great product that I have reordered several times!",
            :stars => 5,
            :date => 1404864000,
            :verified_purchase => true,
            :id => "R2TXOYQKCVDWDH"},
           {:title => "Fresh and Dewey looking skin",
            :author => "Marcia Acker-Missall",
            :content => "The best light weight foundation I have ever used. Leaves my face looking dewey and clear of any heavy looking finish. I pat it on with lightly moistened make up sponge. I get compliments often I am a woman over 65. Perfect finished look for my skin.",
            :stars => 5,
            :date => 1481068800,
            :verified_purchase => true,
            :id => "R3K86X9JXGAZZX"},
           {:title => "Expensive AND WORTH IT!  BEST EVER",
            :author => "DBatesCampbell",
            :content =>
                "I am 60 with medium dry skin.  BEST MAKEUP I'VE EVER PURCHASED.As I've matured, it's hard to find a moist dreamy foundation that is not cakey or thick & has DOG.It is expensive, but so worth it & now I can throw away 4 other makeup bottles that all total a lot more than this jar.",
            :stars => 5,
            :date => 1492387200,
            :verified_purchase => true,
            :id => "R3L5AQ3T1B65L7"},
           {:title => "Like it!", :author => "RDRE", :content => "Will continue to purchase - I'm new to Bobbi Brown products but so far really like the ones I've tried.", :stars => 5, :date => 1488758400, :verified_purchase => true, :id => "R2JRRRZJBOVE2R"},
           {:title => "Covers nicely.", :author => "Amy M. Shanahan", :content => "Makes skin oily looking.", :stars => 3, :date => 1490486400, :verified_purchase => true, :id => "R3MH71LWO6CXSA"},
           {:title => "Wonderful for dry skin",
            :author => "Em G",
            :content => "This is the second time I'm purchasing this product. I'm in love with it. Coverage is absolutely fantastic, and it's perfect for my extremely-dry skin. Highly recommended! Keeps it dewy and fresh all day, for real",
            :stars => 5,
            :date => 1410998400,
            :verified_purchase => true,
            :id => "R31JWHFI55G56D"},
           {:title => "Absolutely fantastic!",
            :author => "Linda",
            :content =>
                "I am 63 with essentially \"good\" skin that I inherited, and I'm told it looks some 15 yrs younger than my chronological age.  That said, I still have to take consistent care with exfoliation and serums to keep it moisturized and clear.  My skin is combination - not excessively dry, though drier in the winter, of course -- but I've found that I can use it year round. This balm, which I discovered through a Lisa Eldridge beauty video (YouTube) on makeup for mature skin, has become my standard daily product for moisture with the perfect tint (I am medium) and coverage.  I use it over a vitamin C serum and a layer of Olay Regenerist.  It's the perfect weight an coverage, and I no longer use foundation during the day.  It gives me an illuminated, dewy finish and I've never found another product to rival it.  It's expensive (though I've found it for around $60) but it really lasts.  Would highly recommend this product.",
            :stars => 5,
            :date => 1391126400,
            :verified_purchase => false,
            :id => "RFKS9S5A7QHAU"},
           {:title => "Average At Best",
            :author => "Peter Rabbit",
            :content =>
                "I really had high hopes for this product and wanted to like it. I'm a big fan of BB Cosmetics and also of make-up artist Lisa Eldridge, where I first saw this product. I'm fortunate to have very good skin that requires little make-up and am in my early 60's. For me. this product  basically works as a moisturizer and nothing more. In fact, I put it on just one side of my face and left the other side bare. The only difference was the sheen of this product on the side of my face where it had been applied. There was virtually no coverage at all. In reapplying, I found that this product isn't build able , either.  So, I use this as a moisturizer on days my face feels particularly dry but must follow with a dusting of loose powder, to combat the excessive shine, and provide a little coverage if I need any. Too expensive for this use so will finish the jar and not purchase again. I'd recommend this product for those with very dry and/or wrinkled skin that need more moisture than coverage.",
            :stars => 2,
            :date => 1426723200,
            :verified_purchase => true,
            :id => "R37QZH887M2768"}],
      :product_details => ["Item Weight: 1 ounces", "Shipping Weight: 6.4 ounces", "UPC: 883579617813 008577226502 716170030661 716170030654", "Item model number: 0421329598141"],
      :question_count => 7,
      :stars => 4.1}
end