require_relative("../db/sql_runner")

class Customer

  # attr_reader :id, :name
  attr_accessor :id, :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds) 
    VALUES ('#{@name}', '#{funds}') RETURNING id"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def film()
    sql = "SELECT films.* FROM films 
    INNER JOIN tickets
    ON films.id = tickets.film_id 
    WHERE tickets.film_id = #{@id};"
    return Customer.map_items(sql)
  end

  def money_update()
    sql = "SELECT films.price, customers.funds FROM films
      INNER JOIN tickets
      ON tickets.film_id = films.id
      INNER JOIN customers
      ON customers.id = tickets.customer_id
      WHERE tickets.customer_id = #{@id};"
    result_hash = SqlRunner.run(sql)[0]
    result = result_hash["funds"].to_i - result_hash["price"].to_i
    return result
  end

  def check_tickets()
    sql = "SELECT tickets.customer_id FROM tickets
      INNER JOIN films
      ON tickets.film_id = film_id
      WHERE customer_id = #{@id};"
      result_hash = SqlRunner.run(sql)[0]
      result = result_hash.count()
      return result
  end

  def self.all()
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    return Customer.map_items(sql)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.map_items(sql)
    customer_hashes = SqlRunner.run(sql)
    result = customer_hashes.map {|customer_hash| Customer.new (customer_hash)}
    return result
  end

end