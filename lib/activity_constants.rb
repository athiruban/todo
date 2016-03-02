ACTIVITY_STATUS = {
  :open     => 1,
  :pending  => 2,
  :hold     => 3,
  :closed   => 4 
}

ACTIVITY_PRIORITIES = {
  :low     => {:min => -10, :max => -1},
  :medium  => {:min => 0,   :max => 10},
  :high    => {:min => 11,  :max => 15}
}
