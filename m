Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10FF522F9B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:40:10 +0200 (CEST)
Received: from localhost ([::1]:43866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noipE-0008Vk-HY
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:40:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noifU-00085g-5V
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:30:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noifQ-0000Xw-8T
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652261397;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tiJpa9zW+tP8/oalHsczytBGuca0yY/UxaFPZUHDhdk=;
 b=HP36O7/REje0xi3zmhjbnv/CU3T7/0MPTwvfxApVbCCEIKDBBXxlGaPpdKijDKfUwe0Fj/
 2u9AHuah99mYfg2N2vV/NmD+5f0KJqdJEGq8gbx79Xc1h1bzA9CoFvC8Vcp/9/faOm1RdH
 HCHLvrLjLIJSQTc0zgm3zs0psQbW174=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-5GDYnEnRM1-duHHf2unhRg-1; Wed, 11 May 2022 05:29:56 -0400
X-MC-Unique: 5GDYnEnRM1-duHHf2unhRg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2ABCE85A5BC;
 Wed, 11 May 2022 09:29:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E50F4146870F;
 Wed, 11 May 2022 09:29:54 +0000 (UTC)
Date: Wed, 11 May 2022 10:29:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH] Remove Ubuntu 18.04 support from the repository
Message-ID: <YnuCEPOj70J+1NXx@redhat.com>
References: <20220510195612.677494-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220510195612.677494-1-thuth@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 10, 2022 at 09:56:12PM +0200, Thomas Huth wrote:
> According to our "Supported build platforms" policy, we now do not support
> Ubuntu 18.04 anymore. Remove the related files and entries from our CI.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Seems like nobody touched the 18.04-based tests/vm/ubuntu* files in a
>  very long time, so I assume these are not used anymore and can completely
>  be removed now.

Or it could mean that they are working fine and so haven't needed
changes...

The cross-compiler container envs give us build coverage for
non-x86, but the VMs give developers on x86 the ability to
actually run the unit tests / I/O tests. Personally I've
never used them, but someone might be ?

I'd suggest splitting this patch into several pieces. One
to fixup all the custom runner related pieces to remove
references to 18.04. One to delete the 18.04 container
related pieces. One to delete the 18.04 VM related pieces.

If you're adventurous, add a 22.04 container since that
is released now and in the QEMU platform target scope.

> 
>  .gitlab-ci.d/containers.yml                   |   5 -
>  .../custom-runners/ubuntu-20.04-aarch32.yml   |   2 +-
>  .../custom-runners/ubuntu-20.04-aarch64.yml   |   2 +-
>  scripts/ci/setup/build-environment.yml        |  14 +-
>  tests/docker/dockerfiles/ubuntu1804.docker    | 144 ------------------
>  tests/lcitool/refresh                         |   7 -
>  tests/vm/ubuntu.aarch64                       |  68 ---------
>  tests/vm/ubuntu.i386                          |  40 -----
>  tests/vm/ubuntuvm.py                          |  60 --------
>  9 files changed, 4 insertions(+), 338 deletions(-)
>  delete mode 100644 tests/docker/dockerfiles/ubuntu1804.docker
>  delete mode 100755 tests/vm/ubuntu.aarch64
>  delete mode 100755 tests/vm/ubuntu.i386
>  delete mode 100644 tests/vm/ubuntuvm.py
> 
> diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
> index b9b675fdcb..e9df90bbdd 100644
> --- a/.gitlab-ci.d/containers.yml
> +++ b/.gitlab-ci.d/containers.yml
> @@ -19,11 +19,6 @@ amd64-debian-container:
>    variables:
>      NAME: debian-amd64
>  
> -amd64-ubuntu1804-container:
> -  extends: .container_job_template
> -  variables:
> -    NAME: ubuntu1804
> -
>  amd64-ubuntu2004-container:
>    extends: .container_job_template
>    variables:
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
> index 9c589bc4cf..47856ac53c 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
> @@ -1,6 +1,6 @@
>  # All ubuntu-20.04 jobs should run successfully in an environment
>  # setup by the scripts/ci/setup/qemu/build-environment.yml task
> -# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +# "Install basic packages to build QEMU on Ubuntu 20.04"
>  
>  ubuntu-20.04-aarch32-all:
>   needs: []
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> index 920e388bd0..951e490db1 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
> @@ -1,6 +1,6 @@
>  # All ubuntu-20.04 jobs should run successfully in an environment
>  # setup by the scripts/ci/setup/qemu/build-environment.yml task
> -# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
> +# "Install basic packages to build QEMU on Ubuntu 20.04"
>  
>  ubuntu-20.04-aarch64-all-linux-static:
>   needs: []
> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
> index 9182e0c253..232525b91d 100644
> --- a/scripts/ci/setup/build-environment.yml
> +++ b/scripts/ci/setup/build-environment.yml
> @@ -33,10 +33,9 @@
>        when:
>          - ansible_facts['distribution'] == 'Ubuntu'
>  
> -    - name: Install basic packages to build QEMU on Ubuntu 18.04/20.04
> +    - name: Install basic packages to build QEMU on Ubuntu 20.04
>        package:
>          name:
> -        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
>            - ccache
>            - gcc
>            - gettext
> @@ -90,7 +89,7 @@
>        when:
>          - ansible_facts['distribution'] == 'Ubuntu'
>  
> -    - name: Install packages to build QEMU on Ubuntu 18.04/20.04 on non-s390x
> +    - name: Install packages to build QEMU on Ubuntu 20.04 on non-s390x
>        package:
>          name:
>            - libspice-server-dev
> @@ -100,15 +99,6 @@
>          - ansible_facts['distribution'] == 'Ubuntu'
>          - ansible_facts['architecture'] != 's390x'
>  
> -    - name: Install basic packages to build QEMU on Ubuntu 18.04
> -      package:
> -        name:
> -        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
> -          - clang
> -      when:
> -        - ansible_facts['distribution'] == 'Ubuntu'
> -        - ansible_facts['distribution_version'] == '18.04'
> -
>      - name: Install basic packages to build QEMU on Ubuntu 20.04
>        package:
>          name:
> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
> deleted file mode 100644
> index b3f2156580..0000000000
> --- a/tests/docker/dockerfiles/ubuntu1804.docker
> +++ /dev/null
> @@ -1,144 +0,0 @@
> -# THIS FILE WAS AUTO-GENERATED
> -#
> -#  $ lcitool dockerfile --layers all ubuntu-1804 qemu
> -#
> -# https://gitlab.com/libvirt/libvirt-ci
> -
> -FROM docker.io/library/ubuntu:18.04
> -
> -RUN export DEBIAN_FRONTEND=noninteractive && \
> -    apt-get update && \
> -    apt-get install -y eatmydata && \
> -    eatmydata apt-get dist-upgrade -y && \
> -    eatmydata apt-get install --no-install-recommends -y \
> -            bash \
> -            bc \
> -            bsdmainutils \
> -            bzip2 \
> -            ca-certificates \
> -            ccache \
> -            clang \
> -            dbus \
> -            debianutils \
> -            diffutils \
> -            exuberant-ctags \
> -            findutils \
> -            g++ \
> -            gcc \
> -            gcovr \
> -            genisoimage \
> -            gettext \
> -            git \
> -            glusterfs-common \
> -            hostname \
> -            libaio-dev \
> -            libasan5 \
> -            libasound2-dev \
> -            libattr1-dev \
> -            libbrlapi-dev \
> -            libbz2-dev \
> -            libc6-dev \
> -            libcacard-dev \
> -            libcap-ng-dev \
> -            libcapstone-dev \
> -            libcurl4-gnutls-dev \
> -            libdaxctl-dev \
> -            libdrm-dev \
> -            libepoxy-dev \
> -            libfdt-dev \
> -            libffi-dev \
> -            libgbm-dev \
> -            libgcrypt20-dev \
> -            libglib2.0-dev \
> -            libgnutls28-dev \
> -            libgtk-3-dev \
> -            libibumad-dev \
> -            libibverbs-dev \
> -            libiscsi-dev \
> -            libjemalloc-dev \
> -            libjpeg-turbo8-dev \
> -            liblttng-ust-dev \
> -            liblzo2-dev \
> -            libncursesw5-dev \
> -            libnfs-dev \
> -            libnuma-dev \
> -            libpam0g-dev \
> -            libpcre2-dev \
> -            libpixman-1-dev \
> -            libpmem-dev \
> -            libpng-dev \
> -            libpulse-dev \
> -            librbd-dev \
> -            librdmacm-dev \
> -            libsasl2-dev \
> -            libsdl2-dev \
> -            libsdl2-image-dev \
> -            libseccomp-dev \
> -            libselinux1-dev \
> -            libsnappy-dev \
> -            libspice-protocol-dev \
> -            libspice-server-dev \
> -            libssh-dev \
> -            libsystemd-dev \
> -            libtasn1-6-dev \
> -            libubsan1 \
> -            libudev-dev \
> -            libusb-1.0-0-dev \
> -            libusbredirhost-dev \
> -            libvdeplug-dev \
> -            libvirglrenderer-dev \
> -            libvte-2.91-dev \
> -            libxen-dev \
> -            libzstd-dev \
> -            llvm \
> -            locales \
> -            make \
> -            multipath-tools \
> -            netcat-openbsd \
> -            nettle-dev \
> -            ninja-build \
> -            openssh-client \
> -            perl-base \
> -            pkgconf \
> -            python3 \
> -            python3-numpy \
> -            python3-opencv \
> -            python3-pillow \
> -            python3-pip \
> -            python3-setuptools \
> -            python3-sphinx \
> -            python3-sphinx-rtd-theme \
> -            python3-venv \
> -            python3-wheel \
> -            python3-yaml \
> -            rpm2cpio \
> -            sed \
> -            sparse \
> -            systemtap-sdt-dev \
> -            tar \
> -            tesseract-ocr \
> -            tesseract-ocr-eng \
> -            texinfo \
> -            xfslibs-dev \
> -            zlib1g-dev && \
> -    eatmydata apt-get autoremove -y && \
> -    eatmydata apt-get autoclean -y && \
> -    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
> -    dpkg-reconfigure locales && \
> -    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
> -    mkdir -p /usr/libexec/ccache-wrappers && \
> -    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
> -    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
> -    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
> -    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
> -    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
> -
> -RUN pip3 install meson==0.56.0
> -
> -ENV LANG "en_US.UTF-8"
> -ENV MAKE "/usr/bin/make"
> -ENV NINJA "/usr/bin/ninja"
> -ENV PYTHON "/usr/bin/python3"
> -ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
> -# https://bugs.launchpad.net/qemu/+bug/1838763
> -ENV QEMU_CONFIGURE_OPTS --disable-libssh
> diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
> index 2d198ad281..fb49bbc441 100755
> --- a/tests/lcitool/refresh
> +++ b/tests/lcitool/refresh
> @@ -65,11 +65,6 @@ def generate_cirrus(target, trailer=None):
>     cmd = lcitool_cmd + ["variables", target, "qemu"]
>     generate(filename, cmd, trailer)
>  
> -ubuntu1804_skipssh = [
> -   "# https://bugs.launchpad.net/qemu/+bug/1838763\n",
> -   "ENV QEMU_CONFIGURE_OPTS --disable-libssh\n"
> -]
> -
>  ubuntu2004_tsanhack = [
>     "# Apply patch https://reviews.llvm.org/D75820\n",
>     "# This is required for TSan in clang-10 to compile with QEMU.\n",
> @@ -85,8 +80,6 @@ def debian_cross_build(prefix, targets):
>  try:
>     generate_dockerfile("centos8", "centos-stream-8")
>     generate_dockerfile("fedora", "fedora-35")
> -   generate_dockerfile("ubuntu1804", "ubuntu-1804",
> -                       trailer="".join(ubuntu1804_skipssh))
>     generate_dockerfile("ubuntu2004", "ubuntu-2004",
>                         trailer="".join(ubuntu2004_tsanhack))
>     generate_dockerfile("opensuse-leap", "opensuse-leap-152")
> diff --git a/tests/vm/ubuntu.aarch64 b/tests/vm/ubuntu.aarch64
> deleted file mode 100755
> index b291945a7e..0000000000
> --- a/tests/vm/ubuntu.aarch64
> +++ /dev/null
> @@ -1,68 +0,0 @@
> -#!/usr/bin/env python3
> -#
> -# Ubuntu aarch64 image
> -#
> -# Copyright 2020 Linaro
> -#
> -# Authors:
> -#  Robert Foley <robert.foley@linaro.org>
> -#  Originally based on ubuntu.i386 Fam Zheng <famz@redhat.com>
> -#
> -# This code is licensed under the GPL version 2 or later.  See
> -# the COPYING file in the top-level directory.
> -#
> -
> -import sys
> -import basevm
> -import aarch64vm
> -import ubuntuvm
> -
> -DEFAULT_CONFIG = {
> -    'cpu'          : "cortex-a57",
> -    'machine'      : "virt,gic-version=3",
> -    'install_cmds' : "apt-get update,"\
> -                     "apt-get build-dep -y --arch-only qemu,"\
> -                     "apt-get install -y libfdt-dev pkg-config language-pack-en ninja-build",
> -    # We increase beyond the default time since during boot
> -    # it can take some time (many seconds) to log into the VM
> -    # especially using softmmu.
> -    'ssh_timeout'  : 60,
> -}
> -
> -class UbuntuAarch64VM(ubuntuvm.UbuntuVM):
> -    name = "ubuntu.aarch64"
> -    arch = "aarch64"
> -    image_name = "ubuntu-18.04-server-cloudimg-arm64.img"
> -    image_link = "https://cloud-images.ubuntu.com/releases/18.04/release/" + image_name
> -    image_sha256="0fdcba761965735a8a903d8b88df8e47f156f48715c00508e4315c506d7d3cb1"
> -    BUILD_SCRIPT = """
> -        set -e;
> -        cd $(mktemp -d);
> -        sudo chmod a+r /dev/vdb;
> -        tar --checkpoint=.10 -xf /dev/vdb;
> -        ./configure {configure_opts};
> -        make --output-sync {target} -j{jobs} {verbose};
> -    """
> -    def boot(self, img, extra_args=None):
> -        aarch64vm.create_flash_images(self._tmpdir, self._efi_aarch64)
> -        default_args = aarch64vm.get_pflash_args(self._tmpdir)
> -        if extra_args:
> -            extra_args.extend(default_args)
> -        else:
> -            extra_args = default_args
> -        # We always add these performance tweaks
> -        # because without them, we boot so slowly that we
> -        # can time out finding the boot efi device.
> -        if '-smp' not in extra_args and \
> -           '-smp' not in self._config['extra_args'] and \
> -           '-smp' not in self._args:
> -            # Only add if not already there to give caller option to change it.
> -            extra_args.extend(["-smp", "8"])
> -
> -        # We have overridden boot() since aarch64 has additional parameters.
> -        # Call down to the base class method.
> -        super(UbuntuAarch64VM, self).boot(img, extra_args=extra_args)
> -
> -if __name__ == "__main__":
> -    defaults = aarch64vm.get_config_defaults(UbuntuAarch64VM, DEFAULT_CONFIG)
> -    sys.exit(basevm.main(UbuntuAarch64VM, defaults))
> diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
> deleted file mode 100755
> index 47681b6f87..0000000000
> --- a/tests/vm/ubuntu.i386
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -#!/usr/bin/env python3
> -#
> -# Ubuntu i386 image
> -#
> -# Copyright 2017 Red Hat Inc.
> -#
> -# Authors:
> -#  Fam Zheng <famz@redhat.com>
> -#
> -# This code is licensed under the GPL version 2 or later.  See
> -# the COPYING file in the top-level directory.
> -#
> -
> -import sys
> -import basevm
> -import ubuntuvm
> -
> -DEFAULT_CONFIG = {
> -    'install_cmds' : "apt-get update,"\
> -                     "apt-get build-dep -y qemu,"\
> -                     "apt-get install -y libfdt-dev language-pack-en ninja-build",
> -}
> -
> -class UbuntuX86VM(ubuntuvm.UbuntuVM):
> -    name = "ubuntu.i386"
> -    arch = "i386"
> -    image_link="https://cloud-images.ubuntu.com/releases/bionic/"\
> -               "release-20191114/ubuntu-18.04-server-cloudimg-i386.img"
> -    image_sha256="28969840626d1ea80bb249c08eef1a4533e8904aa51a327b40f37ac4b4ff04ef"
> -    BUILD_SCRIPT = """
> -        set -e;
> -        cd $(mktemp -d);
> -        sudo chmod a+r /dev/vdb;
> -        tar -xf /dev/vdb;
> -        ./configure {configure_opts};
> -        make --output-sync {target} -j{jobs} {verbose};
> -    """
> -
> -if __name__ == "__main__":
> -    sys.exit(basevm.main(UbuntuX86VM, DEFAULT_CONFIG))
> diff --git a/tests/vm/ubuntuvm.py b/tests/vm/ubuntuvm.py
> deleted file mode 100644
> index 6689ad87aa..0000000000
> --- a/tests/vm/ubuntuvm.py
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -#!/usr/bin/env python3
> -#
> -# Ubuntu VM testing library
> -#
> -# Copyright 2017 Red Hat Inc.
> -# Copyright 2020 Linaro
> -#
> -# Authors:
> -#  Robert Foley <robert.foley@linaro.org>
> -#  Originally based on ubuntu.i386 Fam Zheng <famz@redhat.com>
> -#
> -# This code is licensed under the GPL version 2 or later.  See
> -# the COPYING file in the top-level directory.
> -
> -import os
> -import subprocess
> -import basevm
> -
> -class UbuntuVM(basevm.BaseVM):
> -
> -    def __init__(self, args, config=None):
> -        self.login_prompt = "ubuntu-{}-guest login:".format(self.arch)
> -        basevm.BaseVM.__init__(self, args, config)
> -
> -    def build_image(self, img):
> -        """Build an Ubuntu VM image.  The child class will
> -           define the install_cmds to init the VM."""
> -        os_img = self._download_with_cache(self.image_link,
> -                                           sha256sum=self.image_sha256)
> -        img_tmp = img + ".tmp"
> -        subprocess.check_call(["cp", "-f", os_img, img_tmp])
> -        self.exec_qemu_img("resize", img_tmp, "+50G")
> -        ci_img = self.gen_cloud_init_iso()
> -
> -        self.boot(img_tmp, extra_args = [ "-device", "VGA", "-cdrom", ci_img, ])
> -
> -        # First command we issue is fix for slow ssh login.
> -        self.wait_ssh(wait_root=True,
> -                      cmd="chmod -x /etc/update-motd.d/*")
> -        # Wait for cloud init to finish
> -        self.wait_ssh(wait_root=True,
> -                      cmd="ls /var/lib/cloud/instance/boot-finished")
> -        self.ssh_root("touch /etc/cloud/cloud-init.disabled")
> -        # Disable auto upgrades.
> -        # We want to keep the VM system state stable.
> -        self.ssh_root('sed -ie \'s/"1"/"0"/g\' '\
> -                      '/etc/apt/apt.conf.d/20auto-upgrades')
> -        self.ssh_root("sed -ie s/^#\ deb-src/deb-src/g /etc/apt/sources.list")
> -
> -        # If the user chooses not to do the install phase,
> -        # then we will jump right to the graceful shutdown
> -        if self._config['install_cmds'] != "":
> -            # Issue the install commands.
> -            # This can be overriden by the user in the config .yml.
> -            install_cmds = self._config['install_cmds'].split(',')
> -            for cmd in install_cmds:
> -                self.ssh_root(cmd)
> -        self.graceful_shutdown()
> -        os.rename(img_tmp, img)
> -        return 0
> -- 
> 2.27.0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


