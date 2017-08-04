class Queue
  def initialize
    @queue = []
  end

  def enqueue(value)
    @queue.push(value)
  end

  def dequeue(value)
    @queue.shift(value)
  end

  def show
    @queue
  end

end
