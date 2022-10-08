class A {
    var id = ""{
        didSet{
            print("A: \(id)")
        }
    }
}

class B: A{
    override var id: String {
        didSet{
            print("B: \(id)")
        }
    }
}

let sample = B()
sample.id = "1"
sample.id = "2"
