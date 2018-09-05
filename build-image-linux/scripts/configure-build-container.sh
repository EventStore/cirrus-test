#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o xtrace

function configure_mono_repo {
	rpm --import "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"

	curl "https://download.mono-project.com/repo/centos7-stable.repo" | \
		tee "/etc/yum.repos.d/mono-centos7-stable.repo"
}

function configure_dotnet_repo {
	rpm -Uvh "https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm"
}

function install_packages {
	yum update -y
	yum install -y mono-devel mkbundle msbuild python pip unzip git "dotnet-sdk-2.1"
}

function install_aws_cli {
	curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" \
		-o "awscli-bundle.zip"
	unzip awscli-bundle.zip
	./awscli-bundle/install \
		-i /usr/local/aws \
		-b /usr/local/bin/aws
	rm -rf awscli-bundle
	rm awscli-bundle.zip
}

configure_mono_repo
configure_dotnet_repo
install_packages
install_aws_cli

yum clean all
