class tse_awsnodes {
  include tse_awsnodes::params
  $public_key = split($ec2_public_keys_0_openssh_key, ' ')
  $key_name = $public_key[2]

  tse_awsnodes::linuxnode { "redhat7-${ec2_tags['created_by']}-01":
    image_id           => $tse_awsnodes::params::redhat7,
    project            => $ec2_tags['project'],
    created_by         => $ec2_tags['created_by'],
    key_name           => $key_name,
    pe_master_hostname => $::ec2_local_hostname,
  }
  tse_awsnodes::linuxnode { "redhat7-${ec2_tags['created_by']}-02":
    image_id           => $tse_awsnodes::params::redhat7,
    project            => $ec2_tags['project'],
    created_by         => $ec2_tags['created_by'],
    key_name           => $key_name,
    pe_master_hostname => $::ec2_local_hostname,
  }
  tse_awsnodes::linuxnode { "redhat6-${ec2_tags['created_by']}-01":
    image_id           => $tse_awsnodes::params::redhat6,
    project            => $ec2_tags['project'],
    created_by         => $ec2_tags['created_by'],
    key_name           => $key_name,
    pe_master_hostname => $::ec2_local_hostname,
  }
  tse_awsnodes::linuxnode { "redhat6-${ec2_tags['created_by']}-02":
    image_id           => $tse_awsnodes::params::redhat6,
    project            => $ec2_tags['project'],
    created_by         => $ec2_tags['created_by'],
    key_name           => $key_name,
    pe_master_hostname => $::ec2_local_hostname,
  }
  tse_awsnodes::linuxnode { "amazonlinux-${ec2_tags['created_by']}-01":
    image_id           => $tse_awsnodes::params::amazonlinux,
    project            => $ec2_tags['project'],
    created_by         => $ec2_tags['created_by'],
    key_name           => $key_name,
    pe_master_hostname => $::ec2_local_hostname,
  }
  tse_awsnodes::windowsnode { "server2012-${ec2_tags['created_by']}-01":
    image_id           => $tse_awsnodes::params::windows2012,
    project            => $ec2_tags['project'],
    created_by         => $ec2_tags['created_by'],
    key_name           => $key_name,
    pe_master_hostname => $::ec2_local_hostname,
  }
  tse_awsnodes::windowsnode { "server2012-${ec2_tags['created_by']}-02":
    image_id           => $tse_awsnodes::params::windows2012,
    project            => $ec2_tags['project'],
    created_by         => $ec2_tags['created_by'],
    key_name           => $key_name,
    pe_master_hostname => $::ec2_local_hostname,
  }

}
