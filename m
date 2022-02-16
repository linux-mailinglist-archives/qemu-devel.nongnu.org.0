Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26AD4B8728
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 12:53:44 +0100 (CET)
Received: from localhost ([::1]:59952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKIsR-00056P-NZ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 06:53:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKIq3-0003qW-OZ
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:51:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nKIq0-0006Jf-MT
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 06:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645012271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lpeYTVl0ECjb01sFL2Wdvbl2w9I/w65PBjJ6q+TnPjw=;
 b=W8YdijFk1FgyPM02XrOpvMROpW9oy7xarcJOI1FJ/p/bfepFP6Y74VDVj+K0pMNH5z57Sx
 J8hGaivuJynPbjFxXr7ocrUvAhF5BQIwcwro+83yftX6tPfdobI7woTlMZoBG9T5C5etRh
 5mbWHXyHkLOu+kInyojqxg6D238SvvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213--oHR07_6NpGXqpDvt7YmzA-1; Wed, 16 Feb 2022 06:51:08 -0500
X-MC-Unique: -oHR07_6NpGXqpDvt7YmzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B460C1124C40;
 Wed, 16 Feb 2022 11:51:06 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E98C86FB87;
 Wed, 16 Feb 2022 11:51:03 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests/tcg/s390x: Build tests with debian11
Date: Wed, 16 Feb 2022 12:51:02 +0100
Message-Id: <20220216115102.206129-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We need a newer compiler to build upcoming tests that test for z15
features with -march=z15. So let's do it similar to arm64 and powerpc,
using an environment based on debian11 to build tests only.

Cc: Thomas Huth <thuth@redhat.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>
Cc: Beraldo Leal <bleal@redhat.com>
Cc: David Miller <dmiller423@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 .gitlab-ci.d/container-cross.yml                    |  7 +++++++
 tests/docker/Makefile.include                       |  3 ++-
 .../dockerfiles/debian-s390x-test-cross.docker      | 13 +++++++++++++
 tests/tcg/configure.sh                              |  2 +-
 4 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 tests/docker/dockerfiles/debian-s390x-test-cross.docker

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index a3b5b90552..f8544750ea 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -146,6 +146,13 @@ s390x-debian-cross-container:
   variables:
     NAME: debian-s390x-cross
 
+s390x-test-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian11-container']
+  variables:
+    NAME: debian-s390x-test-cross
+
 sh4-debian-cross-container:
   extends: .container_job_template
   stage: containers-layer2
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index f1a0c5db7a..b77f6088d9 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -210,6 +210,7 @@ docker-image-debian-arm64-test-cross: docker-image-debian11
 docker-image-debian-microblaze-cross: docker-image-debian10
 docker-image-debian-nios2-cross: docker-image-debian10
 docker-image-debian-powerpc-test-cross: docker-image-debian11
+docker-image-debian-s390x-test-cross: docker-image-debian11
 
 # These images may be good enough for building tests but not for test builds
 DOCKER_PARTIAL_IMAGES += debian-alpha-cross
@@ -219,7 +220,7 @@ DOCKER_PARTIAL_IMAGES += debian-hppa-cross
 DOCKER_PARTIAL_IMAGES += debian-m68k-cross debian-mips64-cross
 DOCKER_PARTIAL_IMAGES += debian-microblaze-cross
 DOCKER_PARTIAL_IMAGES += debian-nios2-cross
-DOCKER_PARTIAL_IMAGES += debian-sh4-cross debian-sparc64-cross
+DOCKER_PARTIAL_IMAGES += debian-s390x-test-cross debian-sh4-cross debian-sparc64-cross
 DOCKER_PARTIAL_IMAGES += debian-tricore-cross
 DOCKER_PARTIAL_IMAGES += debian-xtensa-cross
 DOCKER_PARTIAL_IMAGES += fedora-cris-cross
diff --git a/tests/docker/dockerfiles/debian-s390x-test-cross.docker b/tests/docker/dockerfiles/debian-s390x-test-cross.docker
new file mode 100644
index 0000000000..26435287b6
--- /dev/null
+++ b/tests/docker/dockerfiles/debian-s390x-test-cross.docker
@@ -0,0 +1,13 @@
+#
+# Docker s390x cross-compiler target (tests only)
+#
+# This docker target builds on the debian Bullseye base image.
+#
+FROM qemu/debian11
+
+# Add the foreign architecture we want and install dependencies
+RUN dpkg --add-architecture s390x
+RUN apt update && \
+    DEBIAN_FRONTEND=noninteractive eatmydata \
+        apt install -y --no-install-recommends \
+        crossbuild-essential-s390x gcc-10-s390x-linux-gnu
diff --git a/tests/tcg/configure.sh b/tests/tcg/configure.sh
index 763e9b6ad8..3f00f9307f 100755
--- a/tests/tcg/configure.sh
+++ b/tests/tcg/configure.sh
@@ -185,7 +185,7 @@ for target in $target_list; do
       ;;
     s390x-*)
       container_hosts=x86_64
-      container_image=debian-s390x-cross
+      container_image=debian-s390x-test-cross
       container_cross_cc=s390x-linux-gnu-gcc
       ;;
     sh4-*)
-- 
2.34.1


