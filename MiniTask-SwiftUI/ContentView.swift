//
//  ContentView.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color("background")
                .ignoresSafeArea()
            VStack{
                HStack {
                    cText(text: "MiniTask", size: 24)
                    Spacer()
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 25.0, height: 25.0)
                        .padding(.trailing)
                        .onTapGesture {
                                print("Search tapped!")
                            }
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 25.0, height: 25.0)
                        .onTapGesture {
                                print("settings tapped!")
                            }
                }
                .padding(.bottom, 30)
                HStack{
                    VStack(alignment: .leading){
                        cText(text: "Hey there, Renzo", size: 24,weight: "black")
                            .padding(.bottom, 5)
                        cText(text: "Organize your tasks today", size: 14,weight: "light")
                    }
                    Spacer()
                }
                .padding(.bottom,30)
                HStack{
                    cText(text: "Categories", size: 18, weight: "bold")
                    Spacer()
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 15.0, height: 15.0)
                        .padding(.trailing)
                        .onTapGesture {
                                print("add category tapped!")}
                }
                .padding(.bottom)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        CategoryCards(iconName: "briefcase", categoryName: "Work")
                        CategoryCards(iconName: "house", categoryName: "Home")
                        CategoryCards(iconName: "bag", categoryName: "Shopping")
                        CategoryCards(iconName: "book", categoryName: "School")
                        CategoryCards(iconName: "briefcase", categoryName: "Work")
                        Spacer()
                    }
                }
                Spacer()
                
            }
            .padding(30)
        }
        
    }
}

#Preview {
    ContentView()
}


struct CategoryCards: View {
    var iconName: String
    var categoryName: String
    var body: some View {
        VStack {
            ZStack{
                Color("lightGray")
                Image(systemName: iconName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30.0, height: 30.0)
            }
            .frame(width: 70,height: 70)
            .cornerRadius(20)
            .padding(.bottom, 3)
            cText(text: categoryName, size: 14, weight: "bold")
        }
        .padding(.leading, 5)
    }
}
