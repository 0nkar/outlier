class SimpleDatabase[T] {
  private val store = scala.collection.mutable.Map[String, T]()

  def put(key: String, value: T): Unit = store(key) = value

  def get(key: String): Option[T] = store.get(key)

  def delete(key: String): Unit = store.remove(key)

  def display(): Unit = store.foreach { case (k, v) => println(s"$k -> $v") }
}

val db = new SimpleDatabase[String]()
db.put("name", "John Doe")
db.put("age", "30")
println(db.get("name").getOrElse("Key not found"))
db.delete("age")
db.display()
