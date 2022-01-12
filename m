Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5870848C34C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:38:24 +0100 (CET)
Received: from localhost ([::1]:53840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7bxO-0000GN-Jk
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:38:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bn2-0002eF-O6
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:42 -0500
Received: from [2607:f8b0:4864:20::92f] (port=38551
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bn0-0003Ov-BB
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:40 -0500
Received: by mail-ua1-x92f.google.com with SMTP id h11so4098482uar.5
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=On0PdfVo3ovlIEbfjGqMRwBeSK0yTJODoGb4wIQT5Xs=;
 b=l7p35rVJAPbYQbm/LGizuQ+Ios2azoCPWCnWVcU1qipvOfPO3vxodumnw0YeabkWOk
 Eh9tKt/WytQrEo1cribghThXQ+WXJsA7plj2/B5MIouR6KZRR9sEE770yKDCmq6cVBgp
 XX89ognSXULlr1+feGP7QT9wi7VDfqfl8XoRIZqFJvHfNaRSrVwT4XGNplBSPLsZTHqJ
 mfNZcyfQct0YAPsuXbMzsltdgQREIwapAAtWj7pv07Kkvv4u8zfuGwjkxfi3h+NBzXIw
 NAL5AAlyT60cIPbJftD5ZroLTD8FdqZpW0tUquUVgcjjngoBhi9tFvbEJwySrfDAh+HB
 3ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=On0PdfVo3ovlIEbfjGqMRwBeSK0yTJODoGb4wIQT5Xs=;
 b=ogLoPDz7srgTlp6CxH6ESYANEcOOe6io1QKCBgqMt6CRSVkcR2OEGRvTkTl38hrKww
 iFlhvGDgWny/YM4eyxTPDRH1CoSzzsDFL962dO8GNJ4vcpJ6uACCS5tIJvxMGigoHGXs
 COpuIPEPBcl/Xga8eb8N1/WZpGwXTFoIW2wolVxIRD5/3cOQGhIW0uyb6enkI957fBp5
 03Mf+ATO4Uu/hqqLiZyyWUc+JhwR2HLd/DGIpzd9z5pDAlrx5vhEgp8/1FWpQvF5Hcui
 r/bgj0GcFsV7cv0rShm/Udio2UwTDSCoudBKv/6BQduMOvVZ9wUam++Z73OxmyQQixn+
 bAdA==
X-Gm-Message-State: AOAM530ThkX0fmIwzxBvmcewyZ14G0rrWq+k9ulmH22T3X/gqEkAH9FM
 fIY0MOztHeHg6rTpwsn0PXjU+Q==
X-Google-Smtp-Source: ABdhPJw5wv0WkB3CXjNXSfBN4wAgJ+zzdklvaXuagHxrZ8oRu0gJ8qAO1hTHo0hdw/Tr6uyrDFKcdA==
X-Received: by 2002:a05:6102:3218:: with SMTP id
 r24mr4236552vsf.74.1641986856799; 
 Wed, 12 Jan 2022 03:27:36 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k15sm8096071vsj.3.2022.01.12.03.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E5C021FFBF;
 Wed, 12 Jan 2022 11:27:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 07/31] tests: integrate lcitool for generating build env
 manifests
Date: Wed, 12 Jan 2022 11:26:58 +0000
Message-Id: <20220112112722.3641051-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This introduces

  https://gitlab.com/libvirt/libvirt-ci

as a git submodule at tests/lcitool/libvirt-ci

The 'lcitool' program within this submodule will be used to
automatically generate build environment manifests from a definition
of requirements in tests/lcitool/projects/qemu.yml

It will ultimately be capable of generating

 - Dockerfiles
 - Package lists for installation in VMs
 - Variables for configuring Cirrus CI environments

When a new build pre-requisite is needed for QEMU, if this package
is not currently known to libvirt-ci, it must first be added to the
'mappings.yml' file in the above git repo.

Then the submodule can be updated and the build pre-requisite added
to the tests/lcitool/projects/qemu.yml file. Now all the build env
manifests can be re-generated using  'make lcitool-refresh'

This ensures that when a new build pre-requisite is introduced, it
is added to all the different OS containers, VMs and Cirrus CI
environments consistently.

It also facilitates the addition of containers targetting new distros
or updating existing containers to new versions of the same distro,
where packages might have been renamed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-8-berrange@redhat.com>
Message-Id: <20220105135009.1584676-8-alex.bennee@linaro.org>

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 755343c7dd..d744b5909c 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -382,14 +382,112 @@ Along with many other images, the ``centos8`` image is defined in a Dockerfile
 in ``tests/docker/dockerfiles/``, called ``centos8.docker``. ``make docker-help``
 command will list all the available images.
 
-To add a new image, simply create a new ``.docker`` file under the
-``tests/docker/dockerfiles/`` directory.
-
 A ``.pre`` script can be added beside the ``.docker`` file, which will be
 executed before building the image under the build context directory. This is
 mainly used to do necessary host side setup. One such setup is ``binfmt_misc``,
 for example, to make qemu-user powered cross build containers work.
 
+Most of the existing Dockerfiles were written by hand, simply by creating a
+a new ``.docker`` file under the ``tests/docker/dockerfiles/`` directory.
+This has led to an inconsistent set of packages being present across the
+different containers.
+
+Thus going forward, QEMU is aiming to automatically generate the Dockerfiles
+using the ``lcitool`` program provided by the ``libvirt-ci`` project:
+
+  https://gitlab.com/libvirt/libvirt-ci
+
+In that project, there is a ``mappings.yml`` file defining the distro native
+package names for a wide variety of third party projects. This is processed
+in combination with a project defined list of build pre-requisites to determine
+the list of native packages to install on each distribution. This can be used
+to generate dockerfiles, VM package lists and Cirrus CI variables needed to
+setup build environments across OS distributions with a consistent set of
+packages present.
+
+When preparing a patch series that adds a new build pre-requisite to QEMU,
+updates to various lcitool data files may be required.
+
+
+Adding new build pre-requisites
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In the simple case where the pre-requisite is already known to ``libvirt-ci``
+the following steps are needed
+
+ * Edit ``tests/lcitool/projects/qemu.yml`` and add the pre-requisite
+
+ * Run ``make lcitool-refresh`` to re-generate all relevant build environment
+   manifests
+
+In some cases ``libvirt-ci`` will not know about the build pre-requisite and
+thus some extra preparation steps will be required first
+
+ * Fork the ``libvirt-ci`` project on gitlab
+
+ * Edit the ``mappings.yml`` change to add an entry for the new build
+   prerequisite, listing its native package name on as many OS distros
+   as practical.
+
+ * Commit the ``mappings.yml`` change and submit a merge request to
+   the ``libvirt-ci`` project, noting in the description that this
+   is a new build pre-requisite desired for use with QEMU
+
+ * CI pipeline will run to validate that the changes to ``mappings.yml``
+   are correct, by attempting to install the newly listed package on
+   all OS distributions supported by ``libvirt-ci``.
+
+ * Once the merge request is accepted, go back to QEMU and update
+   the ``libvirt-ci`` submodule to point to a commit that contains
+   the ``mappings.yml`` update.
+
+
+Adding new OS distros
+^^^^^^^^^^^^^^^^^^^^^
+
+In some cases ``libvirt-ci`` will not know about the OS distro that is
+desired to be tested. Before adding a new OS distro, discuss the proposed
+addition:
+
+ * Send a mail to qemu-devel, copying people listed in the
+   MAINTAINERS file for ``Build and test automation``.
+
+   There are limited CI compute resources available to QEMU, so the
+   cost/benefit tradeoff of adding new OS distros needs to be considered.
+
+ * File an issue at https://gitlab.com/libvirt/libvirt-ci/-/issues
+   pointing to the qemu-devel mail thread in the archives.
+
+   This alerts other people who might be interested in the work
+   to avoid duplication, as well as to get feedback from libvirt-ci
+   maintainers on any tips to ease the addition
+
+Assuming there is agreement to add a new OS distro then
+
+ * Fork the ``libvirt-ci`` project on gitlab
+
+ * Add metadata under ``guests/lcitool/lcitool/ansible/group_vars/``
+   for the new OS distro. There might be code changes required if
+   the OS distro uses a package format not currently known. The
+   ``libvirt-ci`` maintainers can advise on this when the issue
+   is file.
+
+ * Edit the ``mappings.yml`` change to update all the existing package
+   entries, providing details of the new OS distro
+
+ * Commit the ``mappings.yml`` change and submit a merge request to
+   the ``libvirt-ci`` project, noting in the description that this
+   is a new build pre-requisite desired for use with QEMU
+
+ * CI pipeline will run to validate that the changes to ``mappings.yml``
+   are correct, by attempting to install the newly listed package on
+   all OS distributions supported by ``libvirt-ci``.
+
+ * Once the merge request is accepted, go back to QEMU and update
+   the ``libvirt-ci`` submodule to point to a commit that contains
+   the ``mappings.yml`` update.
+
+
 Tests
 ~~~~~
 
diff --git a/Makefile b/Makefile
index 5d66c35ea5..c9a049be6f 100644
--- a/Makefile
+++ b/Makefile
@@ -288,6 +288,7 @@ cscope:
 # Needed by "meson install"
 export DESTDIR
 
+include $(SRC_PATH)/tests/lcitool/Makefile.include
 include $(SRC_PATH)/tests/docker/Makefile.include
 include $(SRC_PATH)/tests/vm/Makefile.include
 
@@ -317,6 +318,7 @@ endif
 	@echo  'Test targets:'
 	$(call print-help,check,Run all tests (check-help for details))
 	$(call print-help,bench,Run all benchmarks)
+	$(call print-help,lcitool-help,Help about targets for managing build environment manifests)
 	$(call print-help,docker-help,Help about targets running tests inside containers)
 	$(call print-help,vm-help,Help about targets running tests inside VM)
 	@echo  ''
diff --git a/.gitmodules b/.gitmodules
index 08b1b48a09..84425d87e2 100644
--- a/.gitmodules
+++ b/.gitmodules
@@ -64,3 +64,6 @@
 [submodule "roms/vbootrom"]
 	path = roms/vbootrom
 	url = https://gitlab.com/qemu-project/vbootrom.git
+[submodule "tests/lcitool/libvirt-ci"]
+	path = tests/lcitool/libvirt-ci
+	url = http://gitlab.com/libvirt/libvirt-ci
diff --git a/tests/lcitool/Makefile.include b/tests/lcitool/Makefile.include
new file mode 100644
index 0000000000..cff7c0b814
--- /dev/null
+++ b/tests/lcitool/Makefile.include
@@ -0,0 +1,17 @@
+
+LCITOOL_REFRESH = $(SRC_PATH)/tests/lcitool/refresh
+
+lcitool:
+	@echo 'Manage build environment manifests'
+	@echo
+	@echo 'Available targets:'
+	@echo
+	@echo '    lcitool:             Print this help.'
+	@echo '    lcitool-refresh:     Re-generate all build environment manifests.'
+	@echo
+
+lcitool-help: lcitool
+
+lcitool-refresh:
+	$(call quiet-command, git submodule update --init $(SRC_PATH)/tests/lcitool/libvirt-ci)
+	$(call quiet-command, $(LCITOOL_REFRESH))
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
new file mode 160000
index 0000000000..29cec2153b
--- /dev/null
+++ b/tests/lcitool/libvirt-ci
@@ -0,0 +1 @@
+Subproject commit 29cec2153b9a4dbb2e66f1cbc9866a4eff519cfd
diff --git a/tests/lcitool/projects/qemu.yml b/tests/lcitool/projects/qemu.yml
new file mode 100644
index 0000000000..2e2271510e
--- /dev/null
+++ b/tests/lcitool/projects/qemu.yml
@@ -0,0 +1,115 @@
+---
+packages:
+ - alsa
+ - bash
+ - bc
+ - brlapi
+ - bzip2
+ - bzip2-libs
+ - capstone
+ - ccache
+ - clang
+ - column
+ - ctags
+ - cyrus-sasl
+ - daxctl
+ - dbus-daemon
+ - device-mapper-multipath
+ - diffutils
+ - dtrace
+ - findutils
+ - g++
+ - gcc
+ - gcovr
+ - gettext
+ - genisoimage
+ - glib2
+ - glib2-static
+ - glibc-static
+ - glusterfs
+ - gnutls
+ - gtk3
+ - hostname
+ - libaio
+ - libattr
+ - libasan
+ - libbpf
+ - libcacard
+ - libcap-ng
+ - libcurl
+ - libdrm
+ - libepoxy
+ - libfdt
+ - libffi
+ - libgcrypt
+ - libibverbs
+ - libiscsi
+ - libjemalloc
+ - libjpeg
+ - libnfs
+ - libnuma
+ - libpmem
+ - libpng
+ - librbd
+ - librdmacm
+ - libseccomp
+ - libselinux
+ - libslirp
+ - libssh
+ - libtasn1
+ - libubsan
+ - libudev
+ - liburing
+ - libusbx
+ - libvdeplug
+ - libxml2
+ - libzstd
+ - llvm
+ - lttng-ust
+ - lzo
+ - netcat
+ - nettle
+ - ninja
+ - nsis
+ - make
+ - mesa-libgbm
+ - meson
+ - ncursesw
+ - pam
+ - pcre-static
+ - perl
+ - perl-Test-Harness
+ - pixman
+ - pkg-config
+ - pulseaudio
+ - python3
+ - python3-PyYAML
+ - python3-numpy
+ - python3-opencv
+ - python3-pillow
+ - python3-pip
+ - python3-sphinx
+ - python3-sphinx-rtd-theme
+ - python3-virtualenv
+ - rpm2cpio
+ - sdl2
+ - sdl2-image
+ - sed
+ - snappy
+ - sparse
+ - spice-protocol
+ - spice-server
+ - ssh-client
+ - systemd
+ - tar
+ - tesseract
+ - tesseract-eng
+ - texinfo
+ - usbredir
+ - virglrenderer
+ - vte
+ - which
+ - xen
+ - xfsprogs
+ - zlib
+ - zlib-static
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
new file mode 100755
index 0000000000..b47e25f64b
--- /dev/null
+++ b/tests/lcitool/refresh
@@ -0,0 +1,67 @@
+#!/usr/bin/python3
+#
+# Re-generate container recipes
+#
+# This script uses the "lcitool" available from
+#
+#   https://gitlab.com/libvirt/libvirt-ci
+#
+# Copyright (c) 2020 Red Hat Inc.
+#
+# This work is licensed under the terms of the GNU GPL, version 2
+# or (at your option) any later version. See the COPYING file in
+# the top-level directory.
+
+import sys
+import os
+import subprocess
+
+from pathlib import Path
+
+if len(sys.argv) != 1:
+   print("syntax: %s" % sys.argv[0], file=sys.stderr)
+   sys.exit(1)
+
+self_dir = Path(__file__).parent
+src_dir = self_dir.parent.parent
+dockerfiles_dir = Path(src_dir, "tests", "docker", "dockerfiles")
+
+lcitool_path = Path(self_dir, "libvirt-ci", "lcitool")
+
+lcitool_cmd = [lcitool_path, "--data-dir", self_dir]
+
+def atomic_write(filename, content):
+   tmp = filename.with_suffix(filename.suffix + ".tmp")
+   try:
+      with tmp.open("w") as fp:
+         print(content, file=fp, end="")
+         tmp.rename(filename)
+   except Exception as ex:
+      tmp.unlink()
+      raise
+
+def generate(filename, cmd, trailer):
+   print("Generate %s" % filename)
+   lcitool=subprocess.run(cmd, capture_output=True)
+
+   if lcitool.returncode != 0:
+      raise Exception("Failed to generate %s: %s" % (filename, lcitool.stderr))
+
+   content = lcitool.stdout.decode("utf8")
+   if trailer is not None:
+      content += trailer
+   atomic_write(filename, content)
+
+def generate_dockerfile(host, target, cross=None, trailer=None):
+   filename = Path(src_dir, "tests", "docker", "dockerfiles", host + ".docker")
+   cmd = lcitool_cmd + ["dockerfile"]
+   if cross is not None:
+      cmd.extend(["--cross", cross])
+   cmd.extend([target, "qemu"])
+   generate(filename, cmd, trailer)
+
+try:
+   sys.exit(0)
+except Exception as ex:
+   print(str(ex), file=sys.stderr)
+   sys.exit(1)
-- 
2.30.2


