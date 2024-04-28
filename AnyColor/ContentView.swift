//
//  ContentView.swift
//  AnyColor
//
//  Created by azuki on 2024/04/28.
//

import SwiftUI
import AlertKit

struct ColorItem: Identifiable {
    let id = UUID()
    let name: String
    let color: UIColor
}

struct ContentView: View {
    let colors: [ColorItem] = [
        /*
        ColorItem(name: "Red", color: .red),
        ColorItem(name: "Green", color: .green),
        ColorItem(name: "Blue", color: .blue),
        ColorItem(name: "Orange", color: .orange),
        ColorItem(name: "Yellow", color: .yellow),
        // ColorItem(name: "Pink", color: .pink),
        ColorItem(name: "Purple", color: .purple),
        // ColorItem(name: "Teal", color: .teal),
        // ColorItem(name: "Indigo", color: .indigo),
        ColorItem(name: "Gray", color: .gray),
        ColorItem(name: "Black", color: .black),
        ColorItem(name: "White", color: .white)
         */
        ColorItem(name: "Blue", color: .systemBlue),
        ColorItem(name: "Brown", color: .systemBrown),
        ColorItem(name: "Cyan", color: .systemCyan),
        ColorItem(name: "Green", color: .systemGreen),
        ColorItem(name: "Indigo", color: .systemIndigo),
        ColorItem(name: "Mint", color: .systemMint),
        ColorItem(name: "Orange", color: .systemOrange),
        ColorItem(name: "Pink", color: .systemPink),
        ColorItem(name: "Purple", color: .systemPurple),
        ColorItem(name: "Red", color: .systemRed),
        ColorItem(name: "Teal", color: .systemTeal),
        ColorItem(name: "Yellow", color: .systemYellow)
    ]
    
    private let colorLayout = [GridItem(.adaptive(minimum: 160))]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("View and copy any system colors, literally.")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.leading, .trailing])
                    .foregroundColor(.secondary)
                ScrollView {
                    LazyVGrid(columns: colorLayout, spacing: 20) {
                        ForEach(colors) { color in
                            let hex = color.color.toHex()
                            
                            GroupBox {
                                
                            } label: {
                                Rectangle()
                                    .fill(Color(color.color))
                                    .frame(width: 50, height: 50)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                Text(color.name)
                                    .font(.title2)
                                    .bold()
                                Text(hex)
                                    .font(.subheadline)
                                    .foregroundStyle(.secondary)
                            }
                            .onTapGesture {
                                UIPasteboard.general.string = hex
                                AlertKitAPI.present(title: "Copied to clipboard", subtitle: "Copied \(hex) to clipboard", icon: .done, style: .iOS17AppleMusic, haptic: .success)
                            }
                        }
                    }.padding()
                    Text("Made by azuki")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            .navigationTitle("System colors")
        }
        .navigationViewStyle(.stack)
    }
}


#Preview {
    ContentView()
}
