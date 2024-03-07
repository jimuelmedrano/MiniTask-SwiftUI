//
//  ContentView.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/1/24.
//

import SwiftUI


struct HomeView: View {
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
                        CategoryCard(iconName: "briefcase", categoryName: "Work")
                        CategoryCard(iconName: "house", categoryName: "Home")
                        CategoryCard(iconName: "bag", categoryName: "Shopping")
                        CategoryCard(iconName: "book", categoryName: "School")
                        CategoryCard(iconName: "briefcase", categoryName: "Work")
                        Spacer()
                    }
                }
                .padding(.bottom, 30)
                HStack {
                    cText(text: "Today's Tasks", size: 18, weight: "bold")
                    Spacer()
                }
                .padding(.bottom)
                ScrollView(.vertical,showsIndicators: false) {
                    VStack{
                        TaskCard(task: "Update MiniTask Design",
                                 time: "08:00am - 09:00am",
                                 category: "Shopping", isChecked: true)
                        TaskCard(task: "Buy Snacks",
                                 category: "Shopping", isChecked: true)
                        TaskCard(task: "Clean my room",
                                 time: "09:00pm - 11:pm",
                                 category: "Home", isChecked: false)
                        TaskCard(task: "Clean my room",
                                 time: "09:00pm - 11:pm",
                                 category: "Home", isChecked: false)
                        TaskCard(task: "Clean my room",
                                 time: "09:00pm - 11:pm",
                                 category: "Home", isChecked: true)
                    }
                }
                .frame(maxHeight: 270)
                Spacer()
                Button {
                    print("add new task")
                } label: {
                    cText(text: "+ Add new task", size: 18, weight: "bold")
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .foregroundColor(.white)
                }
                .background(Color("foreground"))
                .cornerRadius(20)
            }
            .padding(.init(top: 30, leading: 30, bottom: 10, trailing: 30))
        }
        
    }
}

#Preview {
    HomeView()
}





