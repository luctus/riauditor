class Account < ActiveRecord::Base

  def get_instances
    az = Hash.new
    AWS.config(access_key_id: access_key_id, secret_access_key: secret_access_key, region: 'us-east-1')
    ec2 = AWS.ec2

    ec2.instances.each do |i|
      next unless i.status.to_s == 'running'
      az[i.availability_zone] = Hash.new unless az.key?(i.availability_zone)
      if az[i.availability_zone].key?(i.instance_type)
        az[i.availability_zone][i.instance_type] += 1
      else
        az[i.availability_zone][i.instance_type] = 1
      end
    end
    az
  end

  def get_reserved_instances
    az = Hash.new
    AWS.config(access_key_id: access_key_id, secret_access_key: secret_access_key, region: 'us-east-1')
    ec2 = AWS.ec2

    ec2.reserved_instances.each do |ri|
      next unless ri.state.to_s == 'active'
      az[ri.availability_zone] = Hash.new unless az.key?(ri.availability_zone)
      if az[ri.availability_zone].key?(ri.instance_type)
        az[ri.availability_zone][ri.instance_type] += ri.instance_count
      else
        az[ri.availability_zone][ri.instance_type] = ri.instance_count
      end
    end
    az
  end
end
