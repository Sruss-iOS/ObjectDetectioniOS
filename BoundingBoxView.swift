//
//  BoundingBoxView.swift
//  iosApp
//
//  Created by Srushti Choudhari on 31/10/25.
//  Copyright © 2025 orgName. All rights reserved.
//

import SwiftUI
import AVKit

struct BoundingBoxView: View {
    let detection: DetectResult
    static let fixedBoxSize = CGSize(width: 400, height: 700)
    @Binding var showDetails: Bool
    @State private var matchedProduct: ObjectD?
    @State private var showVideoPlayer: Bool = false
    @State private var player: AVPlayer? = nil
    let displayedLabel: String
    var correctedLabel: String {
        displayedLabel == "kajal" ? "oil" : displayedLabel
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .stroke(Color.green, lineWidth: 2)
                .overlay {
                    ZStack {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                
                                Text(correctedLabel)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(6)
                                    .background(Color.black.opacity(0.7))
                                    .cornerRadius(4)

                                Spacer()
                            }

                            Spacer()
                        }
                        
                        if showDetails {
                            VStack(alignment: .leading, spacing: 4) {
                                let label = correctedLabel
                                 if label == "shampoo" {
                                     let name = "Absolut Repair Shampoo"
//                                     if let matchedProduct = "Absolute Repair Shampoo" {
                                         Text("Absolute Repair Shampoo")
                                             .font(.custom("Ubuntu-Bold", size: 15))
                                         
                                
                                         HStack( alignment: .bottom ,spacing: 1) {
                                             Text("₹")
                                                 .font(.custom("Ubuntu-Bold", size: 15))
                                                 .foregroundColor(.black)
                                             Text("845")
                                                 .font(.custom("Ubuntu-Regular", size: 13))
                                                 .strikethrough()
                                                 .foregroundColor(.red)
                                             Text("676 ")
                                                 .font(.custom("Ubuntu-Bold", size: 15))
                                                 .foregroundColor(.black)
                                             Text("| ")
                                                 .font(.custom("Ubuntu-Bold", size: 15))
                                                 .foregroundColor(.black)
                                             Text("500ml ")
                                                 .font(.custom("Ubuntu-Bold", size: 15))
                                                 .foregroundColor(.black)
                                             Text("| ")
                                                 .font(.custom("Ubuntu-Bold", size: 15))
                                                 .foregroundColor(.black)
                                             Text("1L")
                                                 .font(.custom("Ubuntu-Bold", size: 15))
                                                 .foregroundColor(.black)
                                         }
                                     Spacer().frame(height: 8)
                                         
                                         Text("Professional-graded shampoo for color-treated hair.")
                                             .font(.custom("Ubuntu-Regular", size: 12))
                                             .foregroundColor(.gray)
                                     Spacer().frame(height: 8)
                                         HStack {
                                             Text("Usage:")
                                                 .font(.custom("Ubuntu-Bold", size: 12))
                                                 
                                             Text("Apply evenly, rinse thoroughly.")
                                                 .font(.custom("Ubuntu-Light", size: 12))
                                                 .foregroundColor(.gray)
                                         }
                                         HStack {
                                             Text("Key Ingredients:")
                                                 .font(.custom("Ubuntu-Bold", size: 12))
                                             Text("Keratin, Vitamin B5")
                                                 .font(.custom("Ubuntu-Light", size: 12))
                                         }
                                     Spacer().frame(height: 8)
                                         
                                     Text("🎓 Learn how to master this shampoo for professional-grade care. ")
                                         .font(.custom("Ubuntu-Regular", size: 12))
                                     + Text(" Start Tutorial")
                                         .font(.custom("Ubuntu-Regular", size: 12))
                                         .foregroundColor(.green)
                                         .underline()
                                     + Text(" 📚")
                                         .font(.custom("Ubuntu-Regular", size: 12))

                                     
                                     Spacer().frame(height: 8)
                                     
                                         Text("Looking for upskilling your team?")
                                             .font(.custom("Ubuntu-Medium", size: 12))
                                         
//                                     HStack {
                                         Text("Enroll in our Advanced Hair care Techniques Course.")
                                             .font(.custom("Ubuntu-Regular", size: 12))
                                     +
                                         Text(" Join Now")
                                             .font(.custom("Ubuntu-Regular", size: 12))
                                             .foregroundColor(.green)
                                             .underline(/*Color.green*/)
//                                     }
                                     Spacer().frame(height: 8)
                                     
                                     Text("♻️ Sustainability Matters:")
                                         .font(.custom("Ubuntu-Medium", size: 12))
                                     
                                         Text("✔️ Full Ingredient List")
                                             .font(.custom("Ubuntu-Medium", size: 12))
                                         +
                                         Text(" View DPP")
                                             .font(.custom("Ubuntu-Regular", size: 12))
                                             .foregroundColor(.green)
                                             .underline(/*Color.green*/)
                                     
                                     Text("✔️ Eco-friendly Packaging: 80% recycled")
                                         .font(.custom("Ubuntu-Medium", size: 12))
                                     Spacer().frame(height: 8)
                                    Text("🧳 Bulk Purchase Offers: ✔️Buy 6 Get 10% Off ✔️ Gold Tier: Extra 5% Off.")
                                             .font(.custom("Ubuntu-Mdeium", size: 12))
                                     Spacer().frame(height: 8)
                                     
                                     Button(action: {
                                         
                                     }) {
                                         Text("Add to Cart")
                                             .font(.custom("Ubuntu-Medium", size: 20))
                                             .foregroundColor(Color.white)
                                             .frame(maxWidth: .infinity, minHeight: 50)
                                             .background(Color(red: 0, green: 0.44, blue: 0.68))
                                             .cornerRadius(5)
                                             .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(hex: 0x0070ad)))
                                     }
                                     .padding()
//                                     }
                                     
                                 }
                                
                                else if label == "oil" {
                                    let name = "L'oreal Liss Unlimited Primrose Oil"
//                                    if let matchedProduct = CoreDataManager.shared.getProductDetailsByName(name) {
                                        Text(name)
                                            .font(.custom("Ubuntu-Bold", size: 15))
                                        
                                        
                                        HStack( alignment: .bottom ,spacing: 1) {
                                            Text("₹")
                                                .font(.custom("Ubuntu-Bold", size: 15))
                                                .foregroundColor(.black)
                                            Text("401")
                                                .font(.custom("Ubuntu-Regular", size: 13))
                                                .strikethrough()
                                                .foregroundColor(.red)
                                            Text("300")
                                                .font(.custom("Ubuntu-Bold", size: 15))
                                                .foregroundColor(.black)
                                        }
                                        
                                        Spacer().frame(height: 8)
                                        
                                        Text("Lightweight serum for smooth, shiny hair")
                                            .font(.custom("Ubuntu-Light", size: 12))
                                            .foregroundColor(.gray)
                                        
                                        Spacer().frame(height: 8)
                                        
                                        HStack {
                                            Text("Usage:")
                                                .font(.custom("Ubuntu-Medium", size: 12))
                                            Text("Apply 2-3 drops on damp hair.")
                                                .font(.custom("Ubuntu-Light", size: 12))
                                                .foregroundColor(.gray)
                                        }
                                        
                                        HStack {
                                            Text("Key Ingredients:")
                                                .font(.custom("Ubuntu-Medium", size: 12))
                                            Text("Argan Oil, Coconut Oil")
                                                .font(.custom("Ubuntu-Light", size: 12))
                                                .foregroundColor(.gray)
                                        }
                                        
                                        Spacer().frame(height: 8)
                                        
                                        Text("✨ Want silky, frizz-free hair all day?")
                                            .font(.custom("Ubuntu-Regular", size: 12))
                                        
                                        Text("Here's your personalized routine:")
                                            .font(.custom("Ubuntu-Regular", size: 12))
                                        Text("💧 Apply 2-3 drops daily")
                                            .font(.custom("Ubuntu-Regular", size: 12))
                                        
                                        Text("💪 Pair with L'Oréal Smooth Shampoo for best results")
                                            .font(.custom("Ubuntu-Regular", size: 12))
                                        + Text(" Shop Routine")
                                            .font(.custom("Ubuntu-Regular", size: 12))
                                            .foregroundColor(.green)
                                            .underline(/*Color.green*/)
                                        
                                        Spacer().frame(height: 8)
                                        
                                        Text("♻️ Transparency You Can Trust:")
                                            .font(.custom("Ubuntu-Medium", size: 12))
                                        Text("✔️ Sustainability Info ")
                                            .font(.custom("Ubuntu-Medium", size: 12))
                                        + Text("[View DPP]")
                                            .font(.custom("Ubuntu-Regular", size: 12))
                                            .foregroundColor(.green)
                                            .underline(/*Color.green*/)
                                        Text("✔️ Carbon Footprint: XX g CO₂")
                                            .font(.custom("Ubuntu-Medium", size: 12))
                                        Text("✔️ Recycling Instructions")
                                            .font(.custom("Ubuntu-Medium", size: 12))
                                        
                                        Spacer().frame(height: 8)
                                        
                                        Text("⭐ Customer Love : 4.9 ⭐⭐⭐⭐⭐")
                                            .font(.custom("Ubuntu-Medium", size: 12))
                                        
                                        Spacer().frame(height: 8)
                                        
                                        Text("Best serum for smooth hair!")
                                            .font(.custom("Ubuntu-Medium", size: 12))
                                        
                                        Button(action: {
                                            
                                        }) {
                                            Text("Add to Cart")
                                                .font(.custom("Ubuntu-Medium", size: 20))
                                                .foregroundColor(Color.white)
                                                .frame(maxWidth: .infinity, minHeight: 50)
                                                .background(Color(red: 0, green: 0.44, blue: 0.68))
                                                .cornerRadius(5)
                                                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(hex: 0x0070ad)))
                                        }
                                        .padding()
//                                    }
                                    
                                }
                                
                                else if label == "powder" {
                                    
                                    let name = "Maybelline Fit Me Powder" /*{*/
                                    Text(name)
                                        .font(.custom("Ubuntu-Bold", size: 15))
                                    
                                    
                                    HStack( alignment: .bottom ,spacing: 1) {
                                        Text("₹")
                                            .font(.custom("Ubuntu-Bold", size: 15))
                                            .foregroundColor(.black)
                                        Text("584")
                                            .font(.custom("Ubuntu-Regular", size: 13))
                                            .strikethrough()
                                            .foregroundColor(.red)
                                        Text("300")
                                            .font(.custom("Ubuntu-Bold", size: 15))
                                            .foregroundColor(.black)
                                    }
                                    
                                    Spacer().frame(height: 8)
                                    
                                    Text("Light-weight powder for a natural matte finish.")
                                        .font(.custom("Ubuntu-Light", size: 12))
                                        .foregroundColor(.gray)
                                    
                                    Spacer().frame(height: 8)
                                    
                                    HStack {
                                        Text("Usage:")
                                            .font(.custom("Ubuntu-Medium", size: 12))
                                        Text("Apply with sponge for shine control.")
                                            .font(.custom("Ubuntu-Light", size: 12))
                                            .foregroundColor(.gray)
                                    }
                                    
                                    HStack {
                                        Text("Key Ingredients:")
                                            .font(.custom("Ubuntu-Medium", size: 12))
                                        Text("Talc, Perlite Minerals")
                                            .font(.custom("Ubuntu-Light", size: 12))
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Spacer().frame(height: 8)
                                    
                                    Text("📷 Want to nail that flawless, camera-ready look?")
                                        .font(.custom("Ubuntu-Regular", size: 12))
                                    
                                    Text("Watch quick tips for creating trending makeup styles")
                                        .font(.custom("Ubuntu-Regular", size: 12))
                                    + Text(" Play Tutorial")
                                        .font(.custom("Ubuntu-Regular", size: 12))
                                        .foregroundColor(.green)
                                        .underline(/*Color.green*/)
                                    
                                    Spacer().frame(height: 8)
                                    
                                    Text("💪 Boost your reach with this hashtags:")
                                        .font(.custom("Ubuntu-Regular", size: 12))
                                    Text("#MaybellineIndia #FitMePowder #MakeupGoals")
                                        .font(.custom("Ubuntu-Regular", size: 12))
                                    + Text(" Copy Hashtags")
                                        .font(.custom("Ubuntu-Regular", size: 12))
                                        .foregroundColor(.green)
                                        .underline(/*Color.green*/)
                                           Spacer().frame(height: 8)
                                           
                                    Text("💰 Exclusive Influencer Perks:")
                                        .font(.custom("Ubuntu-Medium", size: 12))
                                    Text("✔️ Bundle Offer: Fit Me Powder + Fit Me Foundation 10% off")
                                        .font(.custom("Ubuntu-Medium", size: 12))
                                           + Text(" Add Bundle to Cart")
                                        .font(.custom("Ubuntu-Regular", size: 12))
                                        .foregroundColor(.green)
                                        .underline(/*Color.green*/)
                                    Text("✔️ Special Discount Code:")
                                        .font(.custom("Ubuntu-Medium", size: 12))
                                           + Text(" Reveal Code")
                                        .font(.custom("Ubuntu-Regular", size: 12))
                                        .foregroundColor(.green)
                                        .underline(/*Color.green*/)
                                     
                                           Spacer().frame(height: 8)
                                    Text("📈 Grow your audience with our promo tools:")
                                        .font(.custom("Ubuntu-Bold", size: 12))
                                    Text("✔️ Access Influencer guidelines")
                                        .font(.custom("Ubuntu-Regular", size: 12))
                                    Text("✔️ Download media kit")
                                        .font(.custom("Ubuntu-Regular", size: 12))
                                    
                                    Button(action: {
                                       
                                    }) {
                                        Text("Add to Cart")
                                            .font(.custom("Ubuntu-Medium", size: 20))
                                            .foregroundColor(Color.white)
                                            .frame(maxWidth: .infinity, minHeight: 50)
                                            .background(Color(red: 0, green: 0.44, blue: 0.68))
                                            .cornerRadius(5)
                                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color(hex: 0x0070ad)))
                                    }
                                    .padding()
//                                    }
                                    
                                } else {
                                    Text("No Description.")
                                }
                            }
                            .padding()
                                                        .background(Color.white.opacity(0.9))
                                                        .cornerRadius(8)
                                                        .frame(width: Self.fixedBoxSize.width)
                                                        .padding(.top, 20)
                        }
                        


                    }
                }
        }
        .frame(width: Self.fixedBoxSize.width, height: Self.fixedBoxSize.height)
        .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
    }
}

struct BoundingBoxView1: View {
    let detection: DetectResult
    static let fixedBoxSize = CGSize(width: 400, height: 700)
    @State private var showDetails: Bool = false
    @State private var matchedProduct: ObjectD?
    @State private var showVideoPlayer: Bool = false
    @State private var player: AVPlayer?
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Rectangle()
                .stroke(Color.green, lineWidth: 2)
                .overlay {
                    ZStack {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(detection.label)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(6)
                                    .background(Color.black.opacity(0.7))
                                    .cornerRadius(4)
                                
                                Spacer()
                                
//                                Button(action: {
//                                    if !showDetails {
//                                        
//                                        let matchedProduct = CoreDataManager.shared.getProductDetailsByName(detection.label)
//                                            print(matchedProduct?.name ?? "")
//                                            print(matchedProduct?.videoUrl ?? "")
//                                            withAnimation {
//                                                showDetails = true
//                                            }
//                                    }
//                                    print(showDetails)
//                                    showDetails.toggle()
//                                }) {
//                                    Text(showDetails ? "Hide Details" : "Show Details")
//                                        .font(.headline)
//                                        .foregroundColor(.white)
//                                        .padding(6)
//                                        .background(Color.black.opacity(0.7))
//                                        .cornerRadius(4)
//                                }
                            }
                            Spacer()
                        }
                        
//                        if showDetails {
                            VStack(alignment: .leading, spacing: 4) {
                                let matchedProduct = CoreDataManager.shared.getProductDetailsByName(detection.label)
                                Text("Description: ").font(.custom("Ubuntu-Bold", size: 12)) +
                                Text(matchedProduct?.descriptions ?? "").font(.custom("Ubuntu-Regular", size: 12))
                            }
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(8)
                            .frame(width: Self.fixedBoxSize.width)
                            .padding(.top, 20)
                        }
//                    }
                }
        }
        .frame(width: Self.fixedBoxSize.width, height: Self.fixedBoxSize.height)
        .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
    }
}

//struct BoundingBoxView: View {
//    let detection: DetectResult
//    @Binding var showDetails: Bool  // Binding from parent
//    @State private var matchedProduct: ObjectD?
//    @State private var showVideoPlayer: Bool = false
//    @State private var player: AVPlayer?
//
//    static let fixedBoxSize = CGSize(width: 400, height: 700)
//
//    var body: some View {
//        ZStack(alignment: .topLeading) {
//            Rectangle()
//                .stroke(Color.green, lineWidth: 2)
//                .overlay {
//                    VStack(alignment: .leading, spacing: 8) {
//                        HStack {
//                            Text(detection.label)
//                                .font(.headline)
//                                .foregroundColor(.white)
//                                .padding(6)
//                                .background(Color.black.opacity(0.7))
//                                .cornerRadius(4)
//
//                            Spacer()
//                        }
//
//                        if showDetails {
//
//                            if let matchedProduct = CoreDataManager.shared.getProductDetailsByName(detection.label) {
//                                VStack(alignment: .leading, spacing: 4) {
//                                    let hasDescription = !(matchedProduct.descriptions ?? "").isEmpty
//                                    let hasNutrition = !(matchedProduct.nutritions ?? "").isEmpty
//                                    let hasVideo = !(matchedProduct.videoUrl ?? "").isEmpty
//
//                                    if hasDescription {
//                                        Text("Description: ").font(.custom("Ubuntu-Bold", size: 12)) +
//                                        Text(matchedProduct.descriptions ?? "").font(.custom("Ubuntu-Regular", size: 12))
//                                    }
//
//                                    if hasNutrition {
//                                        Text("Nutrition Facts: ").font(.custom("Ubuntu-Bold", size: 12)) +
//                                        Text(matchedProduct.nutritions ?? "").font(.custom("Ubuntu-Regular", size: 12))
//                                    }
//
//                                    if !hasDescription {
//                                        Text("No description available").font(.custom("Ubuntu-Bold", size: 12))
//                                    }
//
//                                    if !hasNutrition {
//                                        Text("No nutrition information available").font(.custom("Ubuntu-Bold", size: 12))
//                                    }
//
//                                    if hasVideo, let videoUrlString = matchedProduct.videoUrl,
//                                       let url = URL(string: videoUrlString) {
//                                        if showVideoPlayer {
//                                            VideoPlayer(player: AVPlayer(url: url))
//                                                .frame(height: 200)
//                                                .cornerRadius(8)
//                                                .onAppear {
//                                                    player = AVPlayer(url: url)
//                                                    player?.play()
//                                                }
//                                        } else {
//                                            Button(action: {
//                                                showVideoPlayer = true
//                                            }) {
//                                                Text("Play Video")
//                                                    .font(.custom("Ubuntu-Regular", size: 10))
//                                                    .foregroundColor(.white)
//                                                    .padding(8)
//                                                    .background(Color.green)
//                                                    .cornerRadius(6)
//                                            }
//                                        }
//                                    }
//                                }
//                                .padding()
//                                .background(Color.white.opacity(0.9))
//                                .cornerRadius(8)
//                                .frame(width: Self.fixedBoxSize.width)
//                                .padding(.top, 20)
//                            }
//                        }
//                    }
//                }
//        }
//        .frame(width: Self.fixedBoxSize.width, height: Self.fixedBoxSize.height)
//        .position(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY)
//    }
//}


//                        if showDetails, let object = CoreDataManager.shared.getProductDetailsByName(detection.label) {
//                            VStack(alignment: .leading, spacing: 4) {
//                                let hasDescription = !(object.descriptions ?? "").isEmpty
//                                let hasNutrition = !(object.nutritions ?? "").isEmpty
//                                let hasVideo = !(object.videoUrl ?? "").isEmpty
//
//                                if hasDescription {
//                                    Text("Description: ").font(.custom("Ubuntu-Bold", size: 12)) +
//                                    Text(object.descriptions ?? "").font(.custom("Ubuntu-Regular", size: 12))
//                                }
//
//                                if hasNutrition {
//                                    Text("Nutrition Facts: ").font(.custom("Ubuntu-Bold", size: 12)) +
//                                    Text(object.nutritions ?? "").font(.custom("Ubuntu-Regular", size: 12))
//                                }
//
//                                if !hasDescription {
//                                    Text("No description available").font(.custom("Ubuntu-Bold", size: 12))
//                                }
//
//                                if !hasNutrition {
//                                    Text("No nutrition information available").font(.custom("Ubuntu-Bold", size: 12))
//                                }
//
//                                if hasVideo, let videoUrlString = object.videoUrl,
//                                   let url = URL(string: videoUrlString) {
//                                    if showVideoPlayer {
//                                        VideoPlayer(player: AVPlayer(url: url))
//                                            .frame(height: 200)
//                                            .cornerRadius(8)
//                                            .onAppear {
//                                                player = AVPlayer(url: url)
//                                                player?.play()
//                                            }
//                                    } else {
//                                        Button(action: {
//                                            showVideoPlayer = true
//                                        }) {
//                                            Text("Play Video")
//                                                .font(.custom("Ubuntu-Regular", size: 10))
//                                                .foregroundColor(.white)
//                                                .padding(8)
//                                                .background(Color.green)
//                                                .cornerRadius(6)
//                                        }
//                                    }
//                                }
//                            }
//                            .padding()
//                            .background(Color.white.opacity(0.9))
//                            .cornerRadius(8)
//                            .frame(width: Self.fixedBoxSize.width)
//                            .padding(.top, 20)
//                        }


//                                    let videoUrl = "https://cornershop-mobile-gateway-4tdymxnl.an.gateway.dev/api/video/793b9579-7270-4201-ba77-e9e87a23e889"
//                                    let url = URL(string: videoUrl)
//                                    if showVideoPlayer {
//                                        if let url = URL(string: videoUrl) {
//                                            VideoPlayer(player: AVPlayer(url: url))
//                                                .frame(height: 200)
//                                                .cornerRadius(8)
//                                                .onAppear {
//                                                    player = AVPlayer(url: url)
//                                                    player?.play()
//                                                }
//                                        }
//                                    }
//                                     else {
//                                        Button(action: {
//                                            showVideoPlayer = true
//                                        }) {
//                                            Text("Play Video")
//                                                .font(.custom("Ubuntu-Regular", size: 10))
//                                                .foregroundColor(.white)
//                                                .padding(8)
//                                                .background(Color.green)
//                                                .cornerRadius(6)
//                                        }
//                                    }
