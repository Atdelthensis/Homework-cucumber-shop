package ku.shop;

public class InsufficientStockException extends Exception {
    public InsufficientStockException() {}
    public InsufficientStockException(String reason) {
        super(reason);
    }
}
