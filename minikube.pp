package { 'curl':
  ensure => 'present'
}

package{ 'docker.io':
  ensure   => 'installed',
  provider =>  'apt'
}

service { 'docker':
  ensure => 'running',
  enable => true,
  name   => 'docker'
}

exec { 'install minikube':
  command => 'curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64',
  path    => '/usr/bin'
}

exec { 'install kubectl':
  command => 'curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/v1.9.4/bin/linux/amd64/kubectl',
  path    => '/usr/bin'
}

exec { 'add executable mode to minikube and kubectl':
  command => 'chmod +x minikube kubectl',
  path    => '/bin'
}

exec { 'move minikube kubectl to /usr/local/bin':
  command => 'sudo mv minikube /usr/local/bin/ && sudo mv kubectl /usr/local/bin/',
  path    => '/usr/bin'
}

exec { 'start minikube':
  command => 'sudo minikube start --vm-driver=none',
  path    => '/usr/bin'
}

exec { 'enable dashboard':
  command => 'sudo minikube addons enable dashboard',
  path    => '/usr/bin'
}

exec { 'create nginx deployment(mynginx)':
  command => 'sudo kubectl run mynginx --image=nginx --port=80',
  path    => '/usr/bin'
}

exec { 'create nginx service(mynginx)':
  command => 'sudo kubectl expose deployment mynginx --type=LoadBalancer',
  path    => '/usr/bin'
  }
