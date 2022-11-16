Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A43062C6D8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 18:51:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovMYf-0000vN-Uv; Wed, 16 Nov 2022 12:50:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovMYd-0000pl-Og
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 12:50:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ovMYU-00022a-3t
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 12:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668621027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4SaytdRnn7K9Ecso3x7UaClrtJg5qA7jzK4hi3xoOOA=;
 b=FYNZF/TTrPd53XFFSX9IH+pjGHcrf4ho8eBVNgfrYz8wBdRVSa1qxrwu/RmOmEf6lzgF8M
 ULzdDc6QE3eD67SBuW7m8AtVo+N7e/WAdkjFIZEKYD0+tMGB7DmTD8VTlvO9+3nCOMGUbc
 1TYI/Mg5LcvLTerdQJn/Tw8OLXFNbJo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-CLxRPR0DOli_a5YQ1KWyCw-1; Wed, 16 Nov 2022 12:50:24 -0500
X-MC-Unique: CLxRPR0DOli_a5YQ1KWyCw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00C3085A59D;
 Wed, 16 Nov 2022 17:50:24 +0000 (UTC)
Received: from virtlab420.virt.lab.eng.bos.redhat.com
 (virtlab420.virt.lab.eng.bos.redhat.com [10.19.152.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD9A9C2C7F3;
 Wed, 16 Nov 2022 17:50:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] ci: replace x86_64 macos-11 with aarch64 macos-12
Date: Wed, 16 Nov 2022 12:50:23 -0500
Message-Id: <20221116175023.80627-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The Cirrus CI service has announced the intent to discontinue
support for x86_64 macOS CI runners. They already have aarch64
runners available and require all projects to switch to these
images before Jan 1st 2023. The different architecture is
merely determined by the image name requested.

For aarch64 they only support macOS 12 onwards. At the same
time our support policy only guarantees the most recent 2
major versions, so macOS 12 is already technically our min
version.

https://cirrus-ci.org/blog/2022/11/08/sunsetting-intel-macos-instances/
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/cirrus.yml                              | 12 ++++++------
 .gitlab-ci.d/cirrus/{macos-11.vars => macos-12.vars} | 12 ++++++------
 tests/lcitool/libvirt-ci                             |  2 +-
 tests/lcitool/refresh                                |  2 +-
 4 files changed, 14 insertions(+), 14 deletions(-)
 rename .gitlab-ci.d/cirrus/{macos-11.vars => macos-12.vars} (74%)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index d70da61248..634a73a742 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -70,19 +70,19 @@ x64-freebsd-13-build:
     INSTALL_COMMAND: pkg install -y
     TEST_TARGETS: check
 
-x64-macos-11-base-build:
+aarch64-macos-12-base-build:
   extends: .cirrus_build_job
   variables:
-    NAME: macos-11
-    CIRRUS_VM_INSTANCE_TYPE: osx_instance
+    NAME: macos-12
+    CIRRUS_VM_INSTANCE_TYPE: macos_instance
     CIRRUS_VM_IMAGE_SELECTOR: image
-    CIRRUS_VM_IMAGE_NAME: big-sur-base
+    CIRRUS_VM_IMAGE_NAME: ghcr.io/cirruslabs/macos-monterey-base:latest
     CIRRUS_VM_CPUS: 12
     CIRRUS_VM_RAM: 24G
     UPDATE_COMMAND: brew update
     INSTALL_COMMAND: brew install
-    PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
-    PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
+    PATH_EXTRA: /opt/homebrew/ccache/libexec:/opt/homebrew/gettext/bin
+    PKG_CONFIG_PATH: /opt/homebrew/curl/lib/pkgconfig:/opt/homebrew/ncurses/lib/pkgconfig:/opt/homebrew/readline/lib/pkgconfig
     TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
 
 
diff --git a/.gitlab-ci.d/cirrus/macos-11.vars b/.gitlab-ci.d/cirrus/macos-12.vars
similarity index 74%
rename from .gitlab-ci.d/cirrus/macos-11.vars
rename to .gitlab-ci.d/cirrus/macos-12.vars
index aee9f50de6..ef9e14b373 100644
--- a/.gitlab-ci.d/cirrus/macos-11.vars
+++ b/.gitlab-ci.d/cirrus/macos-12.vars
@@ -1,16 +1,16 @@
 # THIS FILE WAS AUTO-GENERATED
 #
-#  $ lcitool variables macos-11 qemu
+#  $ lcitool variables macos-12 qemu
 #
 # https://gitlab.com/libvirt/libvirt-ci
 
-CCACHE='/usr/local/bin/ccache'
+CCACHE='/opt/homebrew/bin/ccache'
 CPAN_PKGS=''
 CROSS_PKGS=''
-MAKE='/usr/local/bin/gmake'
-NINJA='/usr/local/bin/ninja'
+MAKE='/opt/homebrew/bin/gmake'
+NINJA='/opt/homebrew/bin/ninja'
 PACKAGING_COMMAND='brew'
-PIP3='/usr/local/bin/pip3'
+PIP3='/opt/homebrew/bin/pip3'
 PKGS='bash bc bison bzip2 capstone ccache cmocka ctags curl dbus diffutils dtc flex gcovr gettext git glib gnu-sed gnutls gtk+3 jemalloc jpeg-turbo json-c libepoxy libffi libgcrypt libiscsi libnfs libpng libslirp libssh libtasn1 libusb llvm lzo make meson ncurses nettle ninja perl pixman pkg-config python3 rpm2cpio sdl2 sdl2_image snappy sparse spice-protocol tesseract texinfo usbredir vde vte3 zlib zstd'
 PYPI_PKGS='PyYAML numpy pillow sphinx sphinx-rtd-theme'
-PYTHON='/usr/local/bin/python3'
+PYTHON='/opt/homebrew/bin/python3'
diff --git a/tests/lcitool/libvirt-ci b/tests/lcitool/libvirt-ci
index d40e203631..e3eb28cf2e 160000
--- a/tests/lcitool/libvirt-ci
+++ b/tests/lcitool/libvirt-ci
@@ -1 +1 @@
-Subproject commit d40e203631eb3eacee17e8cf8fd20aa5152db62a
+Subproject commit e3eb28cf2e17fbcf7fe7e19505ee432b8ec5bbb5
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index ce0b24c0b1..fa966e4009 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -176,7 +176,7 @@ try:
     #
     generate_cirrus("freebsd-12")
     generate_cirrus("freebsd-13")
-    generate_cirrus("macos-11")
+    generate_cirrus("macos-12")
 
     sys.exit(0)
 except Exception as ex:
-- 
2.38.1


