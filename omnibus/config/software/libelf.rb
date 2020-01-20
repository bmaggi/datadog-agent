# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https:#www.datadoghq.com/).
# Copyright 2016-2019 Datadog, Inc.

name 'libelf'
default_version '0.178'

version '0.178' do
  source url: 'https://sourceware.org/elfutils/ftp/0.178/elfutils-0.178.tar.bz2',
         sha256: '31e7a00e96d4e9c4bda452e1f2cdac4daf8abd24f5e154dee232131899f3a0f2'
         # sha512: '356656ad0db8f6877b461de1a11280de16a9cc5d8dde4381a938a212e828e32755135e5e3171d311c4c9297b728fbd98123048e2e8fbf7fe7de68976a2daabe5'
end

relative_path = "elfutils-#{version}"

build do
  command 'pwd; ls -lad; false'
  command "./configure --prefix=#{install_dir}/embedded", :cwd => "#{relative_path}"
  make "-j #{workers}",                                   :cwd => "#{relative_path}"
  make 'install',                                         :cwd => "#{relative_path}"
end
