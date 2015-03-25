#!/bin/bash

# ERB generated userdata script

PE_MASTER='hostname master.foo.com'
AWS_INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

# since we were passed @nodename we are prepending it
# to instance-id
PE_CERTNAME="nodename test-${AWS_INSTANCE_ID}"

# these are attributes we know already
PP_INSTANCE_ID="${AWS_INSTANCE_ID}"

PP_IMAGE_NAME='pp_image_name ami-4dbf9e7d'

function write_csr_attributes () {
  if [ ! -d /etc/puppetlabs/puppet ]; then
    mkdir -p /etc/puppetlabs/puppet
  fi

  cat > /etc/puppetlabs/puppet/csr_attributes.yaml << YAML
extension_requests:
  pp_instance_id: $PP_INSTANCE_ID
  pp_image_name: $PP_IMAGE_NAME
YAML
  
  echo '  pp_uuid: pp_uuid BD018C91-EEA2-4641-85C1-3EEA09282639' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  pp_preshared_key: pp_preshared_key B7A7136A-5850-4315-BAB6-C3DFE4B41487' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.5: pp_cost_center tse' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.6: pp_product testing code' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.7: pp_project' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.8: pp_application' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.9: pp_service' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.10: pp_employee' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.11: pp_created_by' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.12: pp_environment' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.13: pp_role' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.14: pp_software_version' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.15: pp_department' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.16: pp_cluster' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
  echo '  1.3.6.1.4.1.34380.1.1.17: pp_provisioner' >> /etc/puppetlabs/puppet/csr_attributes.yaml 
}

function install_pe_agent () {
  curl -sk https://$PE_MASTER:8140/packages/current/install.bash | /bin/bash -s agent:certname=$PE_CERTNAME
}

write_csr_attributes
install_pe_agent
