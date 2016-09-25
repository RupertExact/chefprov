log_level                :info
current_dir = File.dirname(__FILE__)
node_name                "provisioner"
client_key               "c://users/rupert/.ssh/adm_rbroad_dev.pem"
validation_client_name   "validator"
knife[:ssh_user] = "ubuntu"
knife[:aws_ssh_key_id] = 'adm_rbroad_dev'
private_keys     'adm_rbroad_dev' => 'c://users/rupert/.ssh/adm_rbroad_dev.pem'
public_keys      'adm_rbroad_dev' => 'c://users/rupert/.ssh/adm_rbroad_dev.pub'