//
//  ContentView.swift
//  StateManagementUI
//
//  Created by Safak Yaral on 27.01.2025.
//

import SwiftUI
import SwiftData

@Observable // başka bir yerden propertyleri takip edebilriiz.
class DarkTheme {
    var isEnabled: Bool = false
}

struct DarkChoiceView: View {
    
    @Bindable var darkTheme: DarkTheme //bindable ile toggle a bağladık
    
    var body: some View {
           Toggle(isOn: $darkTheme.isEnabled) {
               EmptyView()
           }.fixedSize()
       }
}
struct DarkChoiceToggleView: View {
    
    @Environment(DarkTheme.self) private var darkTheme
    
    var body: some View {
        DarkChoiceView(darkTheme: darkTheme)
    }
    
}
struct InformationText: View {
    
    @Environment(DarkTheme.self) private var darkTheme // çevresel birşey tanımladık ve darktheme den information text bütün bilgileri alır.
    
    var body: some View {
        
        Text(darkTheme.isEnabled ? "Dark Theme Enabled" : "Dark Theme Not Enabled")
            .font(.title)
            .foregroundStyle(darkTheme.isEnabled ? .white : .black)
        
    }
}

struct ContentView: View {
    
   // @State var counter = 0 //değişkeni kontrol etme imkanı saglar
    
    @Environment(DarkTheme.self) private var darkTheme

    var body: some View {
        VStack{
            DarkChoiceToggleView()
            InformationText()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(darkTheme.isEnabled ? .black: .white)
       
        }
    }


/*struct addButtonView: View { //child view olarak düşünürsek parents view a bağlayıcı ile tanımladık. aşağıdaki değişiklikler yukarda gözüktü.
   
    @Binding var NewCounter : Int //binding = bağlayıcı
    var body: some View {
        VStack{
            Button(action:{
                self.NewCounter += 1
            }, label: {
                Text ("add")
            })
            
        }
       
        }
}
*/

   
#Preview {
    ContentView()
        .environment(DarkTheme()) //environment ı enjekte ettik.
}
