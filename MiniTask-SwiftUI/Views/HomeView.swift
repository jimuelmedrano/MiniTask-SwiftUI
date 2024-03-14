//
//  ContentView.swift
//  MiniTask-SwiftUI
//
//  Created by Jimuel Renzo Medrano on 3/1/24.
//

import SwiftUI


struct HomeView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color("background")
                    .ignoresSafeArea()
                VStack(alignment: .leading){
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
                    VStack(alignment: .leading){
                        cText(text: "Hey there, Renzo", size: 24,weight: "black")
                            .padding(.bottom, 5)
                        cText(text: "Organize your tasks today", size: 14,weight: "light")
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
                    .mask {
                        LinearGradient(stops: [
                            Gradient.Stop(color: .clear, location: 0.00),
                            Gradient.Stop(color: .black, location: 0.02),
                            Gradient.Stop(color: .black, location: 0.97),
                            Gradient.Stop(color: .clear, location: 1),
                        ], startPoint: .leading, endPoint: .trailing)
                      }
                    .padding(.bottom, 30)
                    cText(text: "Today's Tasks", size: 18, weight: "bold")
                        .padding(.bottom, 5)
                    ScrollView(.vertical,showsIndicators: false) {
                        VStack{
                            TaskCard(task: "Update MiniTask Design",
                                     taskDate: "Mar 06, 2024",
                                     taskTime: "08:00am",
                                     isChecked: false)
                            TaskCard(task: "Buy Snacks",
                                     isChecked: false)
                            TaskCard(task: "Clean my room",
                                     taskTime: "09:00pm",
                                     isChecked: false)
                            TaskCard(task: "Clean my desk",
                                     taskTime: "09:00pm ",
                                     isChecked: true)
                            
                        }
                    }
                    .mask {
                        LinearGradient(stops: [
                            Gradient.Stop(color: .clear, location: 0.00),
                            Gradient.Stop(color: .black, location: 0.02),
                            Gradient.Stop(color: .black, location: 0.95),
                            Gradient.Stop(color: .clear, location: 1),
                        ], startPoint: .top, endPoint: .bottom)
                      }
                    Spacer()
                    
                    NavigationLink {
                        // destination view to navigation to
                        AddTaskView()
                    } label: {
                        ZStack{
                            Color("foreground")
                            cText(text: "+ Add new task", size: 18, weight: "bold")
                                .foregroundColor(.white)
                        }
                        .frame(height: 60)
                        .cornerRadius(20)
                    }
                }
                .padding(.init(top: 30, leading: 30, bottom: 10, trailing: 30))
            }
        }
        
    }
}

#Preview {
    HomeView()
}





