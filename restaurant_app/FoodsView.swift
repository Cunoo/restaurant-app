//
//  ContentView.swift
//  testing
//
//  Created by Matus Cuninka on 06/10/2022.
//
import SwiftUI

//for render images
struct RemoteImage: View {
    private enum LoadState {
        case loading, success, failure
    }

    private class Loader: ObservableObject {
        var data = Data()
        var state = LoadState.loading

        init(url: String) {
            guard let parsedURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }

            URLSession.shared.dataTask(with: parsedURL) { data, response, error in
                if let data = data, data.count > 0 {
                    self.data = data
                    self.state = .success
                } else {
                    self.state = .failure
                }

                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }

    @StateObject private var loader: Loader
    var loading: Image
    var failure: Image

    var body: some View {
        selectImage()
            .resizable()
    }

    init(url: String, loading: Image = Image(systemName: "photo"), failure: Image = Image(systemName: "multiply.circle")) {
        _loader = StateObject(wrappedValue: Loader(url: url))
        self.loading = loading
        self.failure = failure
    }

    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loading
        case .failure:
            return failure
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failure
            }
        }
    }
}



struct FoodsView: View {
    @State public var an_order_list : [String] = []
    //@State var an_order_list_price : [String] = []
    //@State private var isOrderMenuEmpty = false
    @State private var order_price: Int = 0
    //@State var custom_order: [String: String] = [:]
    var body: some View {
        //Show menu
        VStack{
            Text("JEDÁLNY LÍSTOK")
                .foregroundColor(Color(red: 225 / 255, green: 208 / 255, blue: 160 / 255))
            
            List{
                ForEach(Array(decoding.keys.sorted()), id: \.self){ i in
                    
                    // food_category
                    DisclosureGroup("\(i)", content: {
                        ForEach(decoding[i]!){ k in
                            
                            HStack{
                                Text(k.name)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color(red: 233 / 255, green: 183 / 255, blue: 34 / 255))
                                    
                                Text("(\(k.alergens))")
                                    .foregroundColor(Color(red: 225 / 255, green: 208 / 255, blue: 160 / 255))
                            }
                            RemoteImage(url: "http://ordomi.4fan.cz/\(k.image_path)")
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200)
                            
                            HStack{
                                Text(k.description)
                                    .foregroundColor(Color(red: 225 / 255, green: 208 / 255, blue: 160 / 255))
                                Spacer()
                                Button("\(k.price)€") {
                                    an_order_list.append("\(k.food_menu_id)")
                                    order_price += Int(k.price) ?? 0
                                    
                                    
                                }.frame(width: 50, height: 25)
                                    .background(Color(red: 233 / 255, green: 183 / 255, blue: 34 / 255))
                                    .clipShape(Capsule())
                                    //.foregroundColor(.white)
                                    .foregroundColor(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))
                            }
                            
                                
                        }
                    })
                        //arrow color
                        .accentColor(Color(red: 233 / 255, green: 183 / 255, blue: 34 / 255))
                        //text color
                        .foregroundColor(Color(red: 233 / 255, green: 183 / 255, blue: 34 / 255))
                }
                .listRowBackground(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))
            }
            // list background color
            .listStyle(.plain)
            //Spacer()
                
            NavigationLink(destination: OrderMenu(an_order_list: $an_order_list, order_price: $order_price,/* index: 0,*/ custom_order: [" ":" "], modify_orders: " " )) {
                    Text("Objednať")
                    //self.isOrderMenuEmpty = false
            }
                    .padding()
                    .frame(width: 200, height: 50)
                    .background(Color(red: 233 / 255, green: 183 / 255, blue: 34 / 255))
                    .clipShape(Capsule())
                    .foregroundColor(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))
                    
        }
        .background(Color(red: 71 / 255, green: 71 / 255, blue: 71 / 255))
        
    }
}
struct Foods_Previews: PreviewProvider {
    static var previews: some View {
        FoodsView()
    }
}
