import List "mo:base/List";

module Parser {
    private type List<T> = List.List<T>;
    public type Parser<T, R> = List<T> -> ?(R, List<T>);

    // Succeeds without consuming any of the input, and returns the single result x.
    public func result<T, R>(x : R) : Parser<T, R> {
        func (xs : List<T>) { ?(x, xs); };
    };

    // Always fails, regardless of the input.
    public func zero<T, R>() : Parser<T, R> {
        func (_ : List<T>) { null; };
    };

    // Successfully consumes the first item if the input is non-empty, and fails otherwise.
    public func item<T>() : Parser<T, T> {
        func (xs : List<T>) {
            switch(xs) {
                case (null) { null; };
                case (? (x, xs)) {
                    ?(x,xs);
                };
            };
        };
    };
};
