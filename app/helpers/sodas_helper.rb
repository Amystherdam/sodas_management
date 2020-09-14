module SodasHelper
    def format_capacity(capacity)
        if capacity > 600 
            '1L'
        else 
            capacity.to_s + 'ml'
        end
    end

    def format_price(price)
        convert = price.to_s
        "R$ " + convert        
    end
    
end
