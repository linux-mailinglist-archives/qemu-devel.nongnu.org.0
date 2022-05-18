Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9817C52B5AB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 11:21:12 +0200 (CEST)
Received: from localhost ([::1]:51958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrFrj-0003WM-HE
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 05:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbw-0008CJ-Df
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nrFbu-0004NI-3D
 for qemu-devel@nongnu.org; Wed, 18 May 2022 05:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652864685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ktoMqX4RnYl7VI9NssK6VB/5fYiUruG7UB0OBinRsYI=;
 b=gMJpT0WC9FgkxdlvkU0Y44vCjRYwpdZwBY9oYpxMZmTZ8170Qxi1gAgqDz0CrX47pZQIQa
 pmimVRpWIKeLJRz2PjYsu7OAWYGOGX+OFY5NGivb66tj+hm8R7jEW11OM91s0RLo+UlB2K
 UrrA1DINKwNINgOTQ0jVWX/q8yteEKo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-416-rTUAVRAQNIivzWMdaiSSAA-1; Wed, 18 May 2022 05:04:42 -0400
X-MC-Unique: rTUAVRAQNIivzWMdaiSSAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 462D73AF42A7;
 Wed, 18 May 2022 09:04:42 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC13C1410F37;
 Wed, 18 May 2022 09:04:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 2/8] Remove Ubuntu 18.04 container support from the repository
Date: Wed, 18 May 2022 11:04:32 +0200
Message-Id: <20220518090438.158475-3-thuth@redhat.com>
In-Reply-To: <20220518090438.158475-1-thuth@redhat.com>
References: <20220518090438.158475-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_FILL_THIS_FORM_SHORT=0.01,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to our "Supported build platforms" policy, we now do not support
Ubuntu 18.04 anymore. Remove the related container files and entries from
our CI.

Message-Id: <20220516115912.120951-1-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/containers.yml                   |   5 -
 .../custom-runners/ubuntu-20.04-aarch32.yml   |   2 +-
 .../custom-runners/ubuntu-20.04-aarch64.yml   |   2 +-
 scripts/ci/setup/build-environment.yml        |  14 +-
 tests/docker/dockerfiles/ubuntu1804.docker    | 144 ------------------
 tests/lcitool/refresh                         |   7 -
 6 files changed, 4 insertions(+), 170 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/ubuntu1804.docker

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index b9b675fdcb..e9df90bbdd 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -19,11 +19,6 @@ amd64-debian-container:
   variables:
     NAME: debian-amd64
 
-amd64-ubuntu1804-container:
-  extends: .container_job_template
-  variables:
-    NAME: ubuntu1804
-
 amd64-ubuntu2004-container:
   extends: .container_job_template
   variables:
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
index 9c589bc4cf..47856ac53c 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
@@ -1,6 +1,6 @@
 # All ubuntu-20.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/qemu/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+# "Install basic packages to build QEMU on Ubuntu 20.04"
 
 ubuntu-20.04-aarch32-all:
  needs: []
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
index 920e388bd0..951e490db1 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
@@ -1,6 +1,6 @@
 # All ubuntu-20.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/qemu/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+# "Install basic packages to build QEMU on Ubuntu 20.04"
 
 ubuntu-20.04-aarch64-all-linux-static:
  needs: []
diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
index 9182e0c253..232525b91d 100644
--- a/scripts/ci/setup/build-environment.yml
+++ b/scripts/ci/setup/build-environment.yml
@@ -33,10 +33,9 @@
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
 
-    - name: Install basic packages to build QEMU on Ubuntu 18.04/20.04
+    - name: Install basic packages to build QEMU on Ubuntu 20.04
       package:
         name:
-        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
           - ccache
           - gcc
           - gettext
@@ -90,7 +89,7 @@
       when:
         - ansible_facts['distribution'] == 'Ubuntu'
 
-    - name: Install packages to build QEMU on Ubuntu 18.04/20.04 on non-s390x
+    - name: Install packages to build QEMU on Ubuntu 20.04 on non-s390x
       package:
         name:
           - libspice-server-dev
@@ -100,15 +99,6 @@
         - ansible_facts['distribution'] == 'Ubuntu'
         - ansible_facts['architecture'] != 's390x'
 
-    - name: Install basic packages to build QEMU on Ubuntu 18.04
-      package:
-        name:
-        # Originally from tests/docker/dockerfiles/ubuntu1804.docker
-          - clang
-      when:
-        - ansible_facts['distribution'] == 'Ubuntu'
-        - ansible_facts['distribution_version'] == '18.04'
-
     - name: Install basic packages to build QEMU on Ubuntu 20.04
       package:
         name:
diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
deleted file mode 100644
index b3f2156580..0000000000
--- a/tests/docker/dockerfiles/ubuntu1804.docker
+++ /dev/null
@@ -1,144 +0,0 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool dockerfile --layers all ubuntu-1804 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
-
-FROM docker.io/library/ubuntu:18.04
-
-RUN export DEBIAN_FRONTEND=noninteractive && \
-    apt-get update && \
-    apt-get install -y eatmydata && \
-    eatmydata apt-get dist-upgrade -y && \
-    eatmydata apt-get install --no-install-recommends -y \
-            bash \
-            bc \
-            bsdmainutils \
-            bzip2 \
-            ca-certificates \
-            ccache \
-            clang \
-            dbus \
-            debianutils \
-            diffutils \
-            exuberant-ctags \
-            findutils \
-            g++ \
-            gcc \
-            gcovr \
-            genisoimage \
-            gettext \
-            git \
-            glusterfs-common \
-            hostname \
-            libaio-dev \
-            libasan5 \
-            libasound2-dev \
-            libattr1-dev \
-            libbrlapi-dev \
-            libbz2-dev \
-            libc6-dev \
-            libcacard-dev \
-            libcap-ng-dev \
-            libcapstone-dev \
-            libcurl4-gnutls-dev \
-            libdaxctl-dev \
-            libdrm-dev \
-            libepoxy-dev \
-            libfdt-dev \
-            libffi-dev \
-            libgbm-dev \
-            libgcrypt20-dev \
-            libglib2.0-dev \
-            libgnutls28-dev \
-            libgtk-3-dev \
-            libibumad-dev \
-            libibverbs-dev \
-            libiscsi-dev \
-            libjemalloc-dev \
-            libjpeg-turbo8-dev \
-            liblttng-ust-dev \
-            liblzo2-dev \
-            libncursesw5-dev \
-            libnfs-dev \
-            libnuma-dev \
-            libpam0g-dev \
-            libpcre2-dev \
-            libpixman-1-dev \
-            libpmem-dev \
-            libpng-dev \
-            libpulse-dev \
-            librbd-dev \
-            librdmacm-dev \
-            libsasl2-dev \
-            libsdl2-dev \
-            libsdl2-image-dev \
-            libseccomp-dev \
-            libselinux1-dev \
-            libsnappy-dev \
-            libspice-protocol-dev \
-            libspice-server-dev \
-            libssh-dev \
-            libsystemd-dev \
-            libtasn1-6-dev \
-            libubsan1 \
-            libudev-dev \
-            libusb-1.0-0-dev \
-            libusbredirhost-dev \
-            libvdeplug-dev \
-            libvirglrenderer-dev \
-            libvte-2.91-dev \
-            libxen-dev \
-            libzstd-dev \
-            llvm \
-            locales \
-            make \
-            multipath-tools \
-            netcat-openbsd \
-            nettle-dev \
-            ninja-build \
-            openssh-client \
-            perl-base \
-            pkgconf \
-            python3 \
-            python3-numpy \
-            python3-opencv \
-            python3-pillow \
-            python3-pip \
-            python3-setuptools \
-            python3-sphinx \
-            python3-sphinx-rtd-theme \
-            python3-venv \
-            python3-wheel \
-            python3-yaml \
-            rpm2cpio \
-            sed \
-            sparse \
-            systemtap-sdt-dev \
-            tar \
-            tesseract-ocr \
-            tesseract-ocr-eng \
-            texinfo \
-            xfslibs-dev \
-            zlib1g-dev && \
-    eatmydata apt-get autoremove -y && \
-    eatmydata apt-get autoclean -y && \
-    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
-    dpkg-reconfigure locales && \
-    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt && \
-    mkdir -p /usr/libexec/ccache-wrappers && \
-    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/c++ && \
-    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
-    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/clang && \
-    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/g++ && \
-    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
-
-RUN pip3 install meson==0.56.0
-
-ENV LANG "en_US.UTF-8"
-ENV MAKE "/usr/bin/make"
-ENV NINJA "/usr/bin/ninja"
-ENV PYTHON "/usr/bin/python3"
-ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
-# https://bugs.launchpad.net/qemu/+bug/1838763
-ENV QEMU_CONFIGURE_OPTS --disable-libssh
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index 2d198ad281..fb49bbc441 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -65,11 +65,6 @@ def generate_cirrus(target, trailer=None):
    cmd = lcitool_cmd + ["variables", target, "qemu"]
    generate(filename, cmd, trailer)
 
-ubuntu1804_skipssh = [
-   "# https://bugs.launchpad.net/qemu/+bug/1838763\n",
-   "ENV QEMU_CONFIGURE_OPTS --disable-libssh\n"
-]
-
 ubuntu2004_tsanhack = [
    "# Apply patch https://reviews.llvm.org/D75820\n",
    "# This is required for TSan in clang-10 to compile with QEMU.\n",
@@ -85,8 +80,6 @@ def debian_cross_build(prefix, targets):
 try:
    generate_dockerfile("centos8", "centos-stream-8")
    generate_dockerfile("fedora", "fedora-35")
-   generate_dockerfile("ubuntu1804", "ubuntu-1804",
-                       trailer="".join(ubuntu1804_skipssh))
    generate_dockerfile("ubuntu2004", "ubuntu-2004",
                        trailer="".join(ubuntu2004_tsanhack))
    generate_dockerfile("opensuse-leap", "opensuse-leap-152")
-- 
2.27.0


