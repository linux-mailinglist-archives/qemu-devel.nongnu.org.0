Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D8F3107B6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 10:24:43 +0100 (CET)
Received: from localhost ([::1]:36184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7xM2-0007E4-Ny
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 04:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7xGs-0002vm-Im
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:19:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7xGq-0007st-Ri
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 04:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612516760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G64qluVftubR79IHS8Olao5YRtDBf/FGxK4f6bL4vlw=;
 b=BfKfy2H1jZa5RVTaSnbI6YZ7nR+/jxRjjhaedL2e7KkZhwkBD5sEinaQ3nsHyUeDaUsbee
 BSRcdVc3LRJWB53E7i8ryH03//9b9kHtkuGXJ3KVfj9vOHGDFmTviRaDb7e32Rj/QCyfUX
 pxT3QuKLCO6HPSKjZA6QHdXMN05g7Ts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-nfUZaoMINU203eIYgoDcIg-1; Fri, 05 Feb 2021 04:19:18 -0500
X-MC-Unique: nfUZaoMINU203eIYgoDcIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85B5ACE647;
 Fri,  5 Feb 2021 09:19:17 +0000 (UTC)
Received: from thuth.com (ovpn-112-46.ams2.redhat.com [10.36.112.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0273C5D9CC;
 Fri,  5 Feb 2021 09:19:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v2 5/5] travis.yml: Move the -fsanitize=thread testing to the
 gitlab-CI
Date: Fri,  5 Feb 2021 10:18:57 +0100
Message-Id: <20210205091857.845389-6-thuth@redhat.com>
In-Reply-To: <20210205091857.845389-1-thuth@redhat.com>
References: <20210205091857.845389-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use clang-10, so we can also use the --enable-tsan configure
option instead of only passing the flag via --extra-cflags.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml |  9 +++++++++
 .travis.yml    | 51 --------------------------------------------------
 2 files changed, 9 insertions(+), 51 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 5926ec02a7..7a5c450dc9 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -453,6 +453,15 @@ clang-user:
       --extra-cflags=-fno-sanitize-recover=undefined
     MAKE_CHECK_ARGS: check
 
+tsan-build:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: ubuntu2004
+    CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10 --disable-docs
+                    --enable-fdt=system --enable-slirp=system
+    TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
+    MAKE_CHECK_ARGS: bench V=1
+
 # These targets are on the way out
 build-deprecated:
   <<: *native_build_job_definition
diff --git a/.travis.yml b/.travis.yml
index f0e2b1059c..0a4f38b9d8 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -119,57 +119,6 @@ after_script:
 jobs:
   include:
 
-
-    # Using newer GCC with sanitizers
-    - name: "GCC9 with sanitizers (softmmu)"
-      dist: bionic
-      addons:
-        apt:
-          update: true
-          sources:
-            # PPAs for newer toolchains
-            - ubuntu-toolchain-r-test
-          packages:
-            # Extra toolchains
-            - gcc-9
-            - g++-9
-            # Build dependencies
-            - libaio-dev
-            - libattr1-dev
-            - libbrlapi-dev
-            - libcap-ng-dev
-            - libgnutls28-dev
-            - libgtk-3-dev
-            - libiscsi-dev
-            - liblttng-ust-dev
-            - libnfs-dev
-            - libncurses5-dev
-            - libnss3-dev
-            - libpixman-1-dev
-            - libpng-dev
-            - librados-dev
-            - libsdl2-dev
-            - libsdl2-image-dev
-            - libseccomp-dev
-            - libspice-protocol-dev
-            - libspice-server-dev
-            - liburcu-dev
-            - libusb-1.0-0-dev
-            - libvte-2.91-dev
-            - ninja-build
-            - sparse
-            - uuid-dev
-      language: generic
-      compiler: none
-      env:
-        - COMPILER_NAME=gcc CXX=g++-9 CC=gcc-9
-        - CONFIG="--cc=gcc-9 --cxx=g++-9 --disable-linux-user"
-        - TEST_CMD=""
-      before_script:
-        - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-g3 -O0 -fsanitize=thread" || { cat config.log meson-logs/meson-log.txt && exit 1; }
-
-
     - name: "[aarch64] GCC check-tcg"
       arch: arm64
       dist: focal
-- 
2.27.0


