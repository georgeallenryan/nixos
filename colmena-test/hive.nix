{
  meta = {
    description = "Academic Computing Infrastructure";
  };

#  defaults = {
#    deployment = {
#      targetEnv = "none";
#    };
#  };
  
  # Infrastructure Nodes
  infra-01.imports = [ ./infra-01/configuration.nix ];

}
