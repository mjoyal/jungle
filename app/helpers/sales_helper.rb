module SalesHelper 
  def active_sale?
    if Sale.active.any?
      return Sale.active.first
    else 
     false
    end
  end
end