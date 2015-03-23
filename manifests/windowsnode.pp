define tse_awsnodes::windowsnode (
  $nodename = $title,
  $availability_zone = $::ec2_placement_availability_zone,
  $image_id = 'ami-59f2d769',
  $region = $::ec2_region,
  $instance_type = 'm3.medium',
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
    user_data         => template('tse_awsnodes/windows.erb'),
  }


}
