package{ 'docker.io':
  ensure   => 'installed',
  provider =>  'apt'
}

service { 'docker':
  ensure => 'running',
  enable => true,
  name   => 'docker'
}

exec { 'curl':
  command => 'curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64',
  path    => '/usr/bin'
}

exec { 'chmod +x minikube':
  command => 'chmod +x minikube',
  path    => '/bin'
}

exec { 'sudocmd':
  command => 'sudo mv minikube /usr/local/bin/',
  path    => '/usr/bin'
}

exec { 'curl2':
  command => 'curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/v1.9.4/bin/linux/amd64/kubectl',
  path    => '/usr/bin'
}

exec { 'chmod +x kubectl':
  command => 'chmod +x kubectl',
  path    => '/bin'
}

exec { 'sudocmd2':
  command => 'sudo mv kubectl /usr/local/bin/',
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
