# create a manifest that kills a process named killmenow

exec { 'pkill':
  command  => 'pkill -f killmenow',
  provider => 'shell',
}