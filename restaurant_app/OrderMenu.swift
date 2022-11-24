//
//  OrderMenu.swift
//  restaurant_app
//
//  Created by Matus Cuninka on 14/11/2022.
//

import SwiftUI

// bit of View
@ViewBuilder
func buildInnerView(_ a: String, _ k: Food) -> some View {
        if a == k.food_menu_id {
            HStack {
                Text(k.name)
                Text(k.alergens)
            }.foregroundColor(Color(red: 225 / 255, green: 208 / 255, blue: 160 / 255))
            
            HStack {
                Text(k.description)
                Text(k.price)

                                     
            }.foregroundColor(Color(red: 225 / 255, green: 208 / 255, blue: 160 / 255))
        }
}



struct OrderMenu: View {
    @Binding var an_order_list : [String]
    @Binding var order_price: Int
    //@State var index: Int
    @State var custom_order: [String:String]
    @State var modify_orders : String
     //@State private var FoodDescription: String
     var body: some View {
         VStack{
            Text("Objednávka")
                .foregroundColor(Color(red: 225 / 255, green: 208 / 255, blue: 160 / 255))
                .frame(minWidth: 0, maxHeight: 400, alignment: .topLeading)
                .padding(45)
             List{
                ForEach(Array(decoding.keys.sorted()), id: \.self){ i in
                    ForEach(decoding[i]!){ k in
                        ForEach(an_order_list, id: \.self) { a in
                            buildInnerView(a, k)
                            //custom_order[a] = modify_orders
                        }
                        .onDelete(perform: delete)
                    }
                    //cstom_order(custom_order)
                }
             }
                 // list background color
                 .listStyle(.plain)
                 .toolbar {
                    EditButton()
                }
             Spacer()
             
             //modifying orders
            TextField("Chcete niečo zmeniť ?", text: $modify_orders)
                .background(Color(red: 225 / 255, green: 208 / 255, blue: 160 / 255))
                .font(.system(size: 36, weight: .semibold))
                .padding()
             Button("\(order_price)€"){
                 //post_request()
                 postMethod(url: "http://ordomi.4fan.cz/post.php", modify_orders, price: order_price)
             }
                 .frame(width: 100, height: 45)
                     .background(Color(red: 233 / 255, green: 183 / 255, blue: 34 / 255))
                     .clipShape(Capsule())
                     //.foregroundColor(.white)
                     .foregroundColor(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))
             
                
         }
         .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
         .background(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255)).ignoresSafeArea()
     }
    func delete(at offsets: IndexSet) {
        an_order_list.remove(atOffsets: offsets)
        //index = offsets[offsets.startIndex]
        order_price = 0
        order_price = calculate_items(an_order_list)
    }
}

 struct OrderMenu_Previews: PreviewProvider {
     
     static var previews: some View {
         OrderMenu(an_order_list: .constant(["Košík je prázdny"]),order_price: .constant(0),/* index: 0,*/ custom_order: [" ":" "], modify_orders: " " )
     }
 }


