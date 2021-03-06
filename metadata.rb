name 'pipeline'
maintainer 'DevOps'
maintainer_email 'devops@kgbconcepts.com'
source_url 'https://bitbucket.org/kgbconcepts/chef'
issues_url 'https://bitbucket.org/kgbconcepts/chef/issues'
license 'Proprietary - All Rights Reserved'
description 'Installs/Configures a Jenkins based delivery pipeline'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '3.1.8'
chef_version '>= 12.21.26' if respond_to?(:chef_version)

supports 'ubuntu', '>= 14.04'

depends 'apt'
depends 'yum'
depends 'git'
depends 'java'
depends 'jenkins'
depends 'chef-zero'
depends 'emacs'
depends 'sudo'
depends 'chefdk'
