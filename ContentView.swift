
import SwiftUI

struct DrMa: Decodable, Identifiable{
    
    let id: String
    let name: String?
    let patronus: String?
    let image: String?
    let house: String?
}

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        
            NavigationStack{
                
                ZStack{
                    Color.back
                        .ignoresSafeArea()
                    ScrollView{
                        VStack{
                            
                            Image("Sonserina")
                                .resizable()
                                .frame(height: 200)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            
                            Text("Seja bem-vindo a Hogwarts!")
                                .font(.title)
                                .foregroundColor(.place)
                                .multilineTextAlignment(.center)
                                .bold()
                                .padding(50)
                            ForEach(viewModel.personagens){ persona in
                                HStack{
                                    
                                    AsyncImage(url: URL(string: persona.image!)) { image in
                                        image
                                            .resizable()
                                            .frame(width: 100, height: 100, alignment:.leading)
                                            .clipShape(Circle())
                                            .padding(10)
                                        
                                        
                                    } placeholder: {
                                        Color.place
                                            .frame(width: 100, height: 100, alignment: .leading)
                                            .clipShape(Circle())
                                    }
                                    
                                    
                                    Text(persona.name!)
                                    
                                        .font(.subheadline)
                                        .foregroundColor(.place)
                                        .bold()
                                    
                                    Spacer()
                                }
                            }}
                    }
                }
            }.onAppear(){
                
                viewModel.fetch()
            }
    }
}

#Preview {
    ContentView()
}
