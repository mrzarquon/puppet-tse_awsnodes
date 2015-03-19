define tse_awsnodes::linuxnode (
  $nodename = $title,
  $availability_zone = 'us-west-2b',
  $image_id = 'ami-5fbcf36f',
  $instance_type = 'm3.medium',
  $region = 'us-west-2',
  $security_groups = ['cbarker_awsdemo'],
  $subnet = 'cbarker-tse-subnet-b',
  $pe_version_string = $::pe_version,
  $project,
  $created_by,
  $key_name,
  $pe_master_hostname,
) {

  ec2_instance { $nodename:
    ensure            => 'running',
    availability_zone => $availability_zone,
    image_id          => $image_id,
    instance_type     => $instance_type,
    key_name          => $key_name,
    region            => $region,
    security_groups   => $security_groups,
    subnet            => $subnet,
    tags              => {
      'Department'    => 'TSE',
      'Project'       => $project,
      'created_by'    => $created_by, 
    },
    user_data         => template('tse_awsnodes/linux.erb'),
  }


}
