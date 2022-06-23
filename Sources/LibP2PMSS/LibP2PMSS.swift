import LibP2P

struct MSS: TransportUpgrader {
    public static var key:String = "/multistream/1.0.0"
    
    public enum UpgradeType {
        case security
        case muxer
        case upgrade
    }
    
    let application:Application
    
    func installHandlers(on channel:Channel) {
        print("MSS: InstallHandlers() -> Implement Me!")
    }
    
    func negotiate(protocols: [String], mode:LibP2P.Mode, logger:Logger, promise: EventLoopPromise<(`protocol`:String, leftoverBytes:ByteBuffer?)>) -> [ChannelHandler] {
        //print("MSS: negotiate() -> Implement Me!")
        let mss = LightMultistreamSelectHandler(mode: mode, protocols: protocols, logger: logger, upgradePromise: promise, uuid: UUID().uuidString)
        return [mss]
    }
    
    func printSelf() {
        print("\(MSS.key) has access to the following protocols...")
        application.security.available.forEach {
            print("Sec Protocol: \($0)")
        }
        application.muxers.available.forEach {
            print("Mux Protocol: \($0)")
        }
        print("---")
    }
}
