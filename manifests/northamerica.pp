class tse_awsnodes::northamerica {
  $public_key = split($ec2_public_keys_0_openssh_key, ' ')
  $key_name = $public_key[3]

  tse_awsnodes::linuxnode { "redhat7-${ec2_tags['created_by']}-01":
    project            => $ec2_tags['project'],
    created_by         => $ec2_tags['created_by'],
    key_name           => $key_name,
    pe_master_hostname => $::ec2_local_hostname,
  }
  tse_awsnodes::linuxnode { "redhat7-${ec2_tags['created_by']}-02":
    project            => $ec2_tags['project'],
    created_by         => $ec2_tags['created_by'],
    key_name           => $key_name,
    pe_master_hostname => $::ec2_local_hostname,
  }
  tse_awsnodes::windowsnode { "server2012-${ec2_tags['created_by']}-01":
    project            => $ec2_tags['project'],
    created_by         => $ec2_tags['created_by'],
    key_name           => $key_name,
    pe_master_hostname => $::ec2_local_hostname,
  }
  tse_awsnodes::windowsnode { "server2012-${ec2_tags['created_by']}-02":
    project            => $ec2_tags['project'],
    created_by         => $ec2_tags['created_by'],
    key_name           => $key_name,
    pe_master_hostname => $::ec2_local_hostname,
  }

}
