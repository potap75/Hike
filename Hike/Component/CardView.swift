//
//  CardView.swift
//  Hike
//
//  Created by Roman Potapov on 7/18/24.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    
    // MARK: - FUNCTIONS
    
    func randomImage () {
        print("--- BUTTON WAS PRESSED ---")
        print("Status: Old Image number = \(imageNumber)")
        repeat {
            randomNumber = Int.random(in: 1...5)
            print("Action: Random number generated = \(randomNumber)")
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
        
        print("Result: New Image Number = \(imageNumber)")
        print("--- THE END ---")
        print("\n")
    }
    var body: some View {
        // MARK: - CARD
        
        ZStack {
            CustomBackgroundView()
            VStack {
                // MARK: - HEADER
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [
                                    .customGrayLight,
                                        .customGrayMedium
                                ],
                                               startPoint: .top, 
                                               endPoint: .bottom
                                )
                        )
                        Spacer()
                        Button {
                            // ACTION: Show a sheet
                            print("The button was pressed")
                        } label: {
                            CustomButtonView()
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for family and friends")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundStyle(Color.customGrayMedium)
                } //: HEADER
                .padding(.horizontal, 30)
                
                // MARK: - MAIN CONTENT
                ZStack {
                    CustomCircleView()
                    Image("image-\(randomNumber)")
                        .resizable()
                    .scaledToFit()
                    .animation(.default, value: imageNumber)
                }
                // MARK: - FOOTER
                
                Button {
                    // ACTION: Generate a random number
                    
                    randomImage()
                } label: {
                    Text("Explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient (colors:
                                            [
                                                .customGreenLight,
                                                .customGreenDark
                                            ],
                                            startPoint: .top,
                                            endPoint: .bottom
                                            )
                        
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                    
                }
                .buttonStyle(GradientButton())
            }
        }
        //: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
