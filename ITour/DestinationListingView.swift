//
//  DestinationListingView.swift
//  ITour
//
//  Created by Bekir Berke Yılmaz on 2.10.2023.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destinations: [Destination]
    var body: some View {
        List{
            ForEach(destinations){destination in
                VStack(alignment: .leading){
                    NavigationLink(value: destination){
                        Text(destination.name)
                            .font(.headline)
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }.onDelete(perform: deleteDestinations(_:))
        }
    }
    init(sort: SortDescriptor<Destination>, searchString: String){
        _destinations = Query(filter: #Predicate{
            if searchString.isEmpty{
                return true
            }else{
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }
    
    func deleteDestinations(_ indexSet: IndexSet){
        for index in indexSet{
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }

}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name), searchString: "")
}
