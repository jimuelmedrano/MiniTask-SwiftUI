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
                .padding(.bottom, 30)
                HStack {
                    cText(text: "Today's Tasks", size: 18, weight: "bold")
                    Spacer()
                }
                .padding(.bottom)
                ScrollView(.vertical,showsIndicators: false) {
                    VStack{
                        TaskCard(checkboxIcon: "checkmark.square.fill", 
                                 task: "Update MiniTask Design",
                                 time: "08:00am - 09:00am",
                                 category: "Work")
                        TaskCard(checkboxIcon: "square",
                                 task: "Buy Snacks",
                                 category: "Shopping")
                        TaskCard(checkboxIcon: "square",
                                 task: "Clean my room",
                                 time: "09:00pm - 11:pm",
                                 category: "Home")
                        TaskCard(checkboxIcon: "square",
                                 task: "Clean my room",
                                 time: "09:00pm - 11:pm",
                                 category: "Home")
                        TaskCard(checkboxIcon: "square",
                                 task: "Clean my room",
                                 time: "09:00pm - 11:pm",
                                 category: "Home")
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
    ContentView()
}




struct TaskCard: View {
    var checkboxIcon: String
    var task: String
    var time: String?
    var category: String
    var body: some View {
        ZStack{
            Color("lightGray")
            HStack {
                Image(systemName: checkboxIcon)
                    .resizable()
                    .frame(width: 25.0, height: 25.0)
                    .padding(.trailing)
                    .aspectRatio(contentMode: .fit)
                    .onTapGesture {
                        print("Task Checked!")}
                VStack {
                    HStack {
                        cText(text: task, size: 14)
                            .padding(.bottom, 2)
                        Spacer()
                    }
                    HStack() {
                        if(time != nil){
                            cText(text: time!, size: 12, weight: "light")
                        }
                        cText(text: category, size: 12, weight: "light")
                        Spacer()
                    }
                }
                Spacer()
                
            }
            .padding(.horizontal, 25)
            
        }
        .frame(height: 80)
        .cornerRadius(20)
        .padding(.bottom, 3)
    }
}
