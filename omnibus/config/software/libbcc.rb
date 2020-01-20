# Unless explicitly stated otherwise all files in this repository are licensed
# under the Apache License Version 2.0.
# This product includes software developed at Datadog (https:#www.datadoghq.com/).
# Copyright 2016-2019 Datadog, Inc.

name 'bcc'
default_version '0.12.0'

dependency 'libelf'

version '0.12.0' do
  source url: 'https://github.com/iovisor/bcc/archive/v0.12.0.tar.gz',
         sha256: '53a247b8f5b654e3c6a003124b0c31ecc93a53cb9dddc87a0de5a8d290dfbee8'
end

relative_path = "bcc-#{version}"

build do
  mkdir "#{relative_path}/build"
  command "cmake .. -DCMAKE_INSTALL_PREFIX=#{install_dir}/embedded -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DCMAKE_CXX_FLAGS=-stdlib=libc++ -DCMAKE_CXX_FLAGS=-I/usr/include/c++/v1 -DCMAKE_EXE_LINKER_FLAGS=-stdlib=libc++ -DCMAKE_SHARED_LINKER_FLAGS=-stdlib=libc++", :cwd => "#{project_dir}/build"
  make "-j #{workers}", :cwd => "#{relative_path}/build"
  make 'install'      , :cwd => "#{relative_path}/build"
end
