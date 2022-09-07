Pod::Spec.new do |s|
s.name             = "MathLibTest"
s.version          = "0.0.3"
s.summary          = "simple mathematical operations"
s.description      = "simple mathematical operations"
s.homepage         = "https://github.com/o-korniienko/MathLibTest"
s.license          = 'MIT'
s.author           = { "o-korniienko" => "o.korniienko@gms-worldwide.com" }
s.source           = { :git => "https://github.com/o-korniienko/MathLibTest.git", :tag => s.version.to_s }
s.platform     = :ios, '13.0'
s.requires_arc = true
 
# If more than one source file: https://guides.cocoapods.org/syntax/podspec.html#source_files
s.source_files = 'MathLib/MyMath.swift', "Classes", "Classes/**/*.{h,m}", "MathLib/*.{h,m}", "MathLib/sdk/*.swift", "MathLib/sdk/api", "MathLib/sdk/core", "MathLib/sdk/settings", "MathLib/sdk/firebase", "MathLib/sdk/models"

#s.source_files  = "Classes", "Classes/**/*.{h,m}", "GMSPushSDKIOS/*.{h,m}", "PushSDK", "GMSPushSDKIOS/api", "GMSPushSDKIOS/core", "GMSPushSDKIOS/settings", "GMSPushSDKIOS/firebase", "GMSPushSDKIOS/models"
 
 
s.dependency "BoringSSL-GRPC"
#s.dependency "BoringSSL-GRPC"
s.dependency "CryptoSwift"
s.dependency "SwiftyJSON", "5.0.0"
s.dependency "JSON", "5.0.0"
s.dependency 'SwiftyBeaver', "1.9.2"
s.dependency 'Firebase/Messaging'
#.dependency 'FirebaseCore'
s.dependency 'Firebase/Installations'
#s.dependency 'FirebaseInstanceID'
s.dependency 'Alamofire'
 
end
