tse_awsnodes::vpc {'ap-southeast-1': }

tse_awsnodes::securitygroups {'ap-southeast-1':
  require => Tse_awsnodes::Vpc['ap-southeast-1'],
}

