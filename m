Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD705258F27
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Sep 2020 15:33:20 +0200 (CEST)
Received: from localhost ([::1]:56416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kD6PX-0001UR-QR
	for lists+qemu-devel@lfdr.de; Tue, 01 Sep 2020 09:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kD6Nn-0000BG-Hp
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 09:31:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kD6Ne-00078E-L2
 for qemu-devel@nongnu.org; Tue, 01 Sep 2020 09:31:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598967081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jfiJaCGA/z5WItVxMA62Zm0TCE7izQj3rhltW+lc2HE=;
 b=FvdpxAFjjovGB2OA5Hx0qfRG4T/Y/4hftptFJspNC8/Y/dIDPytc55mJ4/CzhUbKZJN3E9
 EmgBk6UwB5MvQDCDFF+Ze2XpARMPYBXzX2Xi/MecoPHzhybSsfezpB8wUnQfxMi7K4vLVx
 NNUeM1UefqMi+nBUFvOLjUNSt98FEqw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-9QUk1cWVMwSA3v6kU6n4yw-1; Tue, 01 Sep 2020 09:31:19 -0400
X-MC-Unique: 9QUk1cWVMwSA3v6kU6n4yw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FE08100854A;
 Tue,  1 Sep 2020 13:31:18 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-215.ams2.redhat.com
 [10.36.114.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0416E5D9CC;
 Tue,  1 Sep 2020 13:31:06 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] gitlab: expand test coverage for crypto builds
Date: Tue,  1 Sep 2020 14:30:50 +0100
Message-Id: <20200901133050.381844-3-berrange@redhat.com>
In-Reply-To: <20200901133050.381844-1-berrange@redhat.com>
References: <20200901133050.381844-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/01 01:27:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Most jobs test the latest nettle library. This adds explicit coverage
for latest gcrypt using Fedora, and old gcrypt and nettle using
CentOS-7. The latter does a minimal tools-only build, as we only need to
validate that the crypto code builds and unit tests pass. Finally a job
disabling both nettle and gcrypt is provided to validate that gnutls
still works.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.yml                          | 69 +++++++++++++++++++++++++
 tests/docker/dockerfiles/centos7.docker |  2 +
 tests/docker/dockerfiles/centos8.docker |  1 +
 3 files changed, 72 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index b7967b9a13..a74b16ff04 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -130,6 +130,7 @@ build-system-fedora:
   <<: *native_build_job_definition
   variables:
     IMAGE: fedora
+    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle
     TARGETS: tricore-softmmu unicore32-softmmu microblaze-softmmu mips-softmmu
       xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -160,6 +161,7 @@ build-system-centos:
   <<: *native_build_job_definition
   variables:
     IMAGE: centos8
+    CONFIGURE_ARGS: --disable-nettle --enable-gcrypt
     TARGETS: ppc64-softmmu lm32-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
@@ -196,6 +198,7 @@ build-disabled:
       --disable-guest-agent --disable-curses --disable-libxml2 --disable-tpm
       --disable-qom-cast-debug --disable-spice --disable-vhost-vsock
       --disable-vhost-net --disable-vhost-crypto --disable-vhost-user
+      --disable-nettle --disable-gcrypt --disable-gnutls
     TARGETS: i386-softmmu ppc64-softmmu mips64-softmmu i386-linux-user
     MAKE_CHECK_ARGS: check-qtest SPEED=slow
 
@@ -271,3 +274,69 @@ build-tci:
       done
     - QTEST_QEMU_BINARY="./qemu-system-x86_64" ./tests/qtest/pxe-test
     - QTEST_QEMU_BINARY="./qemu-system-s390x" ./tests/qtest/pxe-test -m slow
+
+# Most jobs test latest gcrypt or nettle builds
+#
+# These jobs test old gcrypt and nettle from RHEL7
+# which had some API differences.
+build-crypto-old-nettle:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: centos7
+    TARGETS: x86_64-softmmu x86_64-linux-user
+    CONFIGURE_ARGS: --disable-gcrypt --enable-nettle
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    paths:
+      - build
+
+check-crypto-old-nettle:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-crypto-old-nettle
+      artifacts: true
+  variables:
+    IMAGE: centos7
+    MAKE_CHECK_ARGS: check
+
+
+build-crypto-old-gcrypt:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: centos7
+    TARGETS: x86_64-softmmu x86_64-linux-user
+    CONFIGURE_ARGS: --disable-nettle --enable-gcrypt
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    paths:
+      - build
+
+check-crypto-old-gcrypt:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-crypto-old-gcrypt
+      artifacts: true
+  variables:
+    IMAGE: centos7
+    MAKE_CHECK_ARGS: check
+
+
+build-crypto-only-gnutls:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: centos7
+    TARGETS: x86_64-softmmu x86_64-linux-user
+    CONFIGURE_ARGS: --disable-nettle --disable-gcrypt --enable-gnutls
+    MAKE_CHECK_ARGS: check-build
+  artifacts:
+    paths:
+      - build
+
+check-crypto-only-gnutls:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-crypto-only-gnutls
+      artifacts: true
+  variables:
+    IMAGE: centos7
+    MAKE_CHECK_ARGS: check
diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index e197acdc3c..46277773bf 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -15,9 +15,11 @@ ENV PACKAGES \
     gettext \
     git \
     glib2-devel \
+    gnutls-devel \
     libaio-devel \
     libepoxy-devel \
     libfdt-devel \
+    libgcrypt-devel \
     librdmacm-devel \
     libzstd-devel \
     lzo-devel \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 9852c5b9ee..f435616d6a 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -13,6 +13,7 @@ ENV PACKAGES \
     glib2-devel \
     libaio-devel \
     libepoxy-devel \
+    libgcrypt-devel \
     lzo-devel \
     make \
     mesa-libEGL-devel \
-- 
2.26.2


