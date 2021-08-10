Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 280D33E7DC2
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 18:46:23 +0200 (CEST)
Received: from localhost ([::1]:59332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDUtR-0007vr-Jh
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 12:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDUrl-0006ry-3A
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:44:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDUrg-0006li-UW
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628613870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LcasTaIHh8DMl/rmPt3XWMhRYC6EbiK3pB69bPx5bog=;
 b=Wgn3xUKBZ1Ipl8E8VSAMUEZN9byRrIUb8ORWAoxlEP0F6SLuOJ4EcUzpnZ4KwLZ3Cl1+0D
 3zo99QP47E3Jy5haON9PHcSG6i/UGduiTyMuabdbDqPCXFbRRnWwNV7U0GGeMeiElqIW4N
 FIeLUL7A2uFKIQTozda64C82oJzSFnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-3qJ5rpRpN-WsSowThsX6IA-1; Tue, 10 Aug 2021 12:44:27 -0400
X-MC-Unique: 3qJ5rpRpN-WsSowThsX6IA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7696C1966320;
 Tue, 10 Aug 2021 16:44:26 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8AF960BF1;
 Tue, 10 Aug 2021 16:44:17 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] build: remove redundant 'check-build' make target
Date: Tue, 10 Aug 2021 17:44:16 +0100
Message-Id: <20210810164416.3981147-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 'check-build' make target was added as a way to build all the unit
test binaries, since the standard 'all' target would not trigger this.

Since the switch to meson, however, 'all' will now include the 'test'
binaries. As a result, 'check-build' is a no-op:

   $ make all check-build
   ..snip lots of output...
   make: Nothing to be done for 'check-build'.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/buildtest.yml           | 9 ---------
 .gitlab-ci.d/crossbuild-template.yml | 6 +++---
 tests/Makefile.include               | 3 ---
 3 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 903ee65f32..a210d5f2e6 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -9,7 +9,6 @@ build-system-alpine:
     IMAGE: alpine
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
-    MAKE_CHECK_ARGS: check-build
     CONFIGURE_ARGS: --enable-docs --enable-trace-backends=log,simple,syslog
   artifacts:
     expire_in: 2 days
@@ -44,7 +43,6 @@ build-system-ubuntu:
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
-    MAKE_CHECK_ARGS: check-build
   artifacts:
     expire_in: 2 days
     paths:
@@ -77,7 +75,6 @@ build-system-debian:
     CONFIGURE_ARGS: --enable-fdt=system
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
       riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
-    MAKE_CHECK_ARGS: check-build
   artifacts:
     expire_in: 2 days
     paths:
@@ -111,7 +108,6 @@ build-system-fedora:
              --enable-fdt=system --enable-slirp=system --enable-capstone=system
     TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
       xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
-    MAKE_CHECK_ARGS: check-build
   artifacts:
     expire_in: 2 days
     paths:
@@ -145,7 +141,6 @@ build-system-centos:
                     --enable-modules --enable-trace-backends=dtrace
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
-    MAKE_CHECK_ARGS: check-build
   artifacts:
     expire_in: 2 days
     paths:
@@ -177,7 +172,6 @@ build-system-opensuse:
     IMAGE: opensuse-leap
     CONFIGURE_ARGS: --enable-fdt=system
     TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
-    MAKE_CHECK_ARGS: check-build
   artifacts:
     expire_in: 2 days
     paths:
@@ -410,7 +404,6 @@ build-cfi-aarch64:
     CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
       --enable-safe-stack --enable-slirp=git
     TARGETS: aarch64-softmmu
-    MAKE_CHECK_ARGS: check-build
   timeout: 70m
   artifacts:
     expire_in: 2 days
@@ -452,7 +445,6 @@ build-cfi-ppc64-s390x:
     CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
       --enable-safe-stack --enable-slirp=git
     TARGETS: ppc64-softmmu s390x-softmmu
-    MAKE_CHECK_ARGS: check-build
   timeout: 70m
   artifacts:
     expire_in: 2 days
@@ -494,7 +486,6 @@ build-cfi-x86_64:
     CONFIGURE_ARGS: --cc=clang --cxx=clang++ --enable-cfi --enable-cfi-debug
       --enable-safe-stack --enable-slirp=git
     TARGETS: x86_64-softmmu
-    MAKE_CHECK_ARGS: check-build
   timeout: 70m
   artifacts:
     expire_in: 2 days
diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 7d3ad00a1e..03a6d42980 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -10,7 +10,7 @@
         --disable-user --target-list-exclude="arm-softmmu cris-softmmu
           i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
           mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
-    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+    - make -j$(expr $(nproc) + 1) all $MAKE_CHECK_ARGS
     - if grep -q "EXESUF=.exe" config-host.mak;
       then make installer;
       version="$(git describe --match v[0-9]*)";
@@ -32,7 +32,7 @@
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-tools --enable-${ACCEL:-kvm} $EXTRA_CONFIGURE_OPTS
-    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+    - make -j$(expr $(nproc) + 1) all $MAKE_CHECK_ARGS
 
 .cross_user_build_job:
   stage: build
@@ -43,4 +43,4 @@
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
         --disable-system
-    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+    - make -j$(expr $(nproc) + 1) all $MAKE_CHECK_ARGS
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 6e16c05f10..fa08bf3888 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -23,7 +23,6 @@ endif
 	@echo " $(MAKE) check-clean          Clean the tests and related data"
 	@echo
 	@echo "The following are useful for CI builds"
-	@echo " $(MAKE) check-build          Build most test binaris"
 	@echo " $(MAKE) get-vm-images        Downloads all images used by acceptance tests, according to configured targets (~350 MB each, 1.5 GB max)"
 	@echo
 	@echo
@@ -148,8 +147,6 @@ check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
 	@$<
 endif
 
-check-build: $(QEMU_IOTESTS_HELPERS-y)
-
 check-clean:
 	rm -rf $(TESTS_VENV_DIR) $(TESTS_RESULTS_DIR)
 
-- 
2.31.1


