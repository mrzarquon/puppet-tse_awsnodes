tse_awsnodes::vpc { ['us-west-2a', 'ap-southeast-2a', 'eu-west-1a']: }
tse_awsnodes::securitygroups { ['us-west-2a', 'ap-southeast-2a', 'eu-west-1a']: 
  require => Tse_awsnodes::vpc ['us-west-2a', 'ap-southeast-2a', 'eu-west-1a'], 
}
