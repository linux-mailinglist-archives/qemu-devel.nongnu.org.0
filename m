Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DBE6E68E3
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 18:04:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ponn9-00082V-2w; Tue, 18 Apr 2023 12:02:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ponn4-000820-Ag
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:02:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ponmr-0005iq-UO
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 12:02:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681833752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=6QQgEII3hRR7ROXLNG8ciNzxG/L4VWdVAHSBEtUcI+Y=;
 b=HxJ+7Qdj9mHrfUXFkLYZeZhokYlcQehp+5hioMuKpZOCaKDEky1KEbTPobL4ldJHayghY/
 D0aADcYsOjNwkS4fHpvHow6TwdkCcT+UTnA8YFL6y/6eiUIwYj6P2L6Nf495F0JS/5rk+V
 veZ+sVNhIbUWyJoTOgr1ebTU6azWug4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-PdNuXPJ6ONSMX7eLSaFcug-1; Tue, 18 Apr 2023 12:02:30 -0400
X-MC-Unique: PdNuXPJ6ONSMX7eLSaFcug-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E211C3C1068E;
 Tue, 18 Apr 2023 16:02:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 036BA492C3E;
 Tue, 18 Apr 2023 16:02:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>
Subject: [PATCH] .gitlab-ci.d/cirrus: Drop the CI job for compiling with
 FreeBSD 12
Date: Tue, 18 Apr 2023 18:02:25 +0200
Message-Id: <20230418160225.529172-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

FreeBSD 13.0 has been released in April 2021:

 https://www.freebsd.org/releases/13.0R/announce/

According to QEMU's support policy, we stop supporting the previous
major release two years after the the new major release has been
published. So we can stop testing FreeBSD 12 in our CI now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 We should likely also update tests/vm/freebsd ... however, FreeBSD 13
 seems not to use the serial console by default anymore, so I've got
 no clue how we could use their images now... Does anybody have any
 suggestions?

 .gitlab-ci.d/cirrus.yml             | 13 -------------
 .gitlab-ci.d/cirrus/freebsd-12.vars | 16 ----------------
 tests/lcitool/refresh               |  1 -
 3 files changed, 30 deletions(-)
 delete mode 100644 .gitlab-ci.d/cirrus/freebsd-12.vars

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 502dfd612c..1507c928e5 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -44,19 +44,6 @@
   variables:
     QEMU_JOB_CIRRUS: 1
 
-x64-freebsd-12-build:
-  extends: .cirrus_build_job
-  variables:
-    NAME: freebsd-12
-    CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
-    CIRRUS_VM_IMAGE_SELECTOR: image_family
-    CIRRUS_VM_IMAGE_NAME: freebsd-12-4
-    CIRRUS_VM_CPUS: 8
-    CIRRUS_VM_RAM: 8G
-    UPDATE_COMMAND: pkg update; pkg upgrade -y
-    INSTALL_COMMAND: pkg install -y
-    TEST_TARGETS: check
-
 x64-freebsd-13-build:
   extends: .cirrus_build_job
   variables:
diff --git a/.gitlab-ci.d/cirrus/freebsd-12.vars b/.gitlab-ci.d/cirrus/freebsd-12.vars
deleted file mode 100644
index 44d8a2a511..0000000000
--- a/.gitlab-ci.d/cirrus/freebsd-12.vars
+++ /dev/null
@@ -1,16 +0,0 @@
-# THIS FILE WAS AUTO-GENERATED
-#
-#  $ lcitool variables freebsd-12 qemu
-#
-# https://gitlab.com/libvirt/libvirt-ci
-
-CCACHE='/usr/local/bin/ccache'
-CPAN_PKGS=''
-CROSS_PKGS=''
-MAKE='/usr/local/bin/gmake'
-NINJA='/usr/local/bin/ninja'
-PACKAGING_COMMAND='pkg'
-PIP3='/usr/local/bin/pip-3.8'
-PKGS='alsa-lib bash bison bzip2 ca_root_nss capstone4 ccache cdrkit-genisoimage cmocka ctags curl cyrus-sasl dbus diffutils dtc flex fusefs-libs3 gettext git glib gmake gnutls gsed gtk3 json-c libepoxy libffi libgcrypt libjpeg-turbo libnfs libslirp libspice-server libssh libtasn1 llvm lzo2 meson ncurses nettle ninja opencv pixman pkgconf png py39-numpy py39-pillow py39-pip py39-sphinx py39-sphinx_rtd_theme py39-yaml python3 rpm2cpio sdl2 sdl2_image snappy sndio socat spice-protocol tesseract usbredir virglrenderer vte3 zstd'
-PYPI_PKGS=''
-PYTHON='/usr/local/bin/python3'
diff --git a/tests/lcitool/refresh b/tests/lcitool/refresh
index c0d7ad5516..4c568242d2 100755
--- a/tests/lcitool/refresh
+++ b/tests/lcitool/refresh
@@ -182,7 +182,6 @@ try:
     #
     # Cirrus packages lists for GitLab
     #
-    generate_cirrus("freebsd-12")
     generate_cirrus("freebsd-13")
     generate_cirrus("macos-12")
 
-- 
2.31.1


