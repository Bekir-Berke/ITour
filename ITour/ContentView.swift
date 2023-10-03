//
//  ContentView.swift
//  ITour
//
//  Created by Bekir Berke Yılmaz on 2.10.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
  
    @State private var path = [Destination]()
    @State private var sortOrder = SortDescriptor(\Destination.name)
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path){
            DestinationListingView(sort: sortOrder, searchString: searchText)
            .navigationTitle("ITour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .searchable(text: $searchText)
            .toolbar{
                Button("Add Samples", action: addSamples)
                Menu("Sort", systemImage: "arrow.up.arrow.down"){
                    Picker("Sort", selection: $sortOrder){
                        Text("Name").tag(SortDescriptor(\Destination.name))
                        Text("Priority").tag(SortDescriptor(\Destination.priority, order: .reverse))
                        Text("Date").tag(SortDescriptor(\Destination.date))
                    }
                    .pickerStyle(.inline)
                }
            }
        }
    }
    
    func addSamples(){
        let rome = Destination(name: "Rome", details: "", date: Date.now, priority: 1)
        let florence = Destination(name: "Florence", details: "", date: Date.now, priority: 2)
        let naples = Destination(name: "Naples", details: "", date: Date.now, priority: 3)
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
}

#Preview {
    ContentView()
}
