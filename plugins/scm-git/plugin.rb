Plugin.define do
  name    "scm-git"
  version "0.1"
  file    "lib", "scm-git"
  object  "Redcar::Scm::Git::Manager"
  dependencies "scm", ">0"
end
