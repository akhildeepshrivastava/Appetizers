//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Shweta Shrivastava on 11/27/20.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    let appetizer: Appetizer
    @Binding var isShowingDetails: Bool
    var body: some View {
        VStack {
            
            AppetizerRemoteImage(urlStirng: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                HStack(spacing: 40) {
                    NutritionInfoView(title: "Calories", value:appetizer.calories)
                    NutritionInfoView(title: "Carbs", value:(appetizer.carbs))
                    NutritionInfoView(title: "Protein", value:appetizer.protein)
                }
            }
            
            Spacer()
            
            Button(action: {
                order.add(appetizer)
                isShowingDetails = false
            }, label: {
                APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
            })
            .padding(.bottom, 30)
            
            
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetails = false
        } label: {
            DismissButton()
        }, alignment: .topTrailing)
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockDate.sampleApptizer, isShowingDetails: .constant(false))
    }
}

struct NutritionInfoView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
