//
//  ContentView.swift
//  SwiftUISearchList
//
//  Created by Angelos Staboulis on 16/6/23.
//

import SwiftUI

struct ContentView: View {
    @State var namesArray:[String] = ["John","Angelos","Angeliki","Theodoros"]
    @State var searchText:String
    var searchResultsArray:[String]{
        if namesArray.isEmpty {
            return namesArray
        }else{
            return namesArray.filter{$0.contains(searchText)}
        }
    }
    var body: some View {
        NavigationView{
            List(searchResultsArray.count > 0 ? searchResultsArray : namesArray,id:\.self){ item in
                Text(item)
            }.searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always))
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(searchText: "")
    }
}
