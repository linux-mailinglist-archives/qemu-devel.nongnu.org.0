Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D1029026F
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 12:05:32 +0200 (CEST)
Received: from localhost ([::1]:51094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTMc7-000149-1j
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 06:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTMXT-0006kb-5Q
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 06:00:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30342)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kTMXP-0001BL-MV
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 06:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602842435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m9lf7lv/r1Q719LJTCGam8FRxE8cvLXVsU6WwO6sqws=;
 b=CYynsgSIfwZ0bvGEXkOBGE9/E4ozLk2GhIaV3rPsI6e/wJbs7YcUuAD0dxrWMRLUfhBfH2
 g2ouyXBeFnIVJHCbMAm4fKhe3yn2ZuYhGTH4wRPxH+Z7Gw8/3kM2NaLifznCOnt4tb2l5r
 UMPhtBvd+Ug+0sy9rx6jxR43yxh1u/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-Ialk4xC2O322l6m4Z2aTSQ-1; Fri, 16 Oct 2020 06:00:33 -0400
X-MC-Unique: Ialk4xC2O322l6m4Z2aTSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39E2D18BA288
 for <qemu-devel@nongnu.org>; Fri, 16 Oct 2020 10:00:32 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 078665D9D5
 for <qemu-devel@nongnu.org>; Fri, 16 Oct 2020 10:00:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ci: include configure and meson logs in all jobs if configure
 fails
Date: Fri, 16 Oct 2020 06:00:31 -0400
Message-Id: <20201016100031.1557275-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/16 03:57:19
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .cirrus.yml    | 6 +++---
 .gitlab-ci.yml | 6 +++---
 .travis.yml    | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index e099da0fec..81a2960b1a 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -13,7 +13,7 @@ freebsd_12_task:
   script:
     - mkdir build
     - cd build
-    - ../configure --enable-werror || { cat config.log; exit 1; }
+    - ../configure --enable-werror || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
     - gmake -j$(sysctl -n hw.ncpu) check V=1
 
@@ -27,7 +27,7 @@ macos_task:
     - cd build
     - ../configure --python=/usr/local/bin/python3 --enable-werror
                    --extra-cflags='-Wno-error=deprecated-declarations'
-                   || { cat config.log; exit 1; }
+                   || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
     - gmake check V=1
 
@@ -41,7 +41,7 @@ macos_xcode_task:
     - mkdir build
     - cd build
     - ../configure --extra-cflags='-Wno-error=deprecated-declarations'
-                   --enable-werror --cc=clang || { cat config.log; exit 1; }
+                   --enable-werror --cc=clang || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
     - gmake check V=1
 
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 8ffd415ca5..66ad7aa5c2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -32,7 +32,7 @@ include:
         ../configure --enable-werror $CONFIGURE_ARGS --target-list="$TARGETS" ;
       else
         ../configure --enable-werror $CONFIGURE_ARGS ;
-      fi
+      fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - make -j"$JOBS"
     - if test -n "$MAKE_CHECK_ARGS";
       then
@@ -229,7 +229,7 @@ build-tcg-disabled:
   script:
     - mkdir build
     - cd build
-    - ../configure --disable-tcg --audio-drv-list=""
+    - ../configure --disable-tcg --audio-drv-list="" || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - make -j"$JOBS"
     - make check-unit
     - make check-qapi-schema
@@ -322,7 +322,7 @@ build-tci:
     - mkdir build
     - cd build
     - ../configure --enable-tcg-interpreter
-        --target-list="$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; done)"
+        --target-list="$(for tg in $TARGETS; do echo -n ${tg}'-softmmu '; done)" || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - make -j"$JOBS"
     - make run-tcg-tests-x86_64-softmmu
     - make tests/qtest/boot-serial-test tests/qtest/cdrom-test tests/qtest/pxe-test
diff --git a/.travis.yml b/.travis.yml
index d7bfbb8bfe..a3d78171ca 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -95,7 +95,7 @@ before_install:
 # Configure step - may be overridden
 before_script:
   - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-  - ${SRC_DIR}/configure ${BASE_CONFIG} ${CONFIG} || { cat config.log && exit 1; }
+  - ${SRC_DIR}/configure ${BASE_CONFIG} ${CONFIG} || { cat config.log meson-logs/meson-log.txt && exit 1; }
 
 # Main build & test - rarely overridden - controlled by TEST_CMD
 script:
@@ -199,7 +199,7 @@ jobs:
       compiler: clang
       before_script:
         - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-fsanitize=undefined -Werror" || { cat config.log && exit 1; }
+        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-fsanitize=undefined -Werror" || { cat config.log meson-logs/meson-log.txt && exit 1; }
 
 
     - name: "Clang (other-softmmu)"
@@ -298,7 +298,7 @@ jobs:
         - TEST_CMD=""
       before_script:
         - mkdir -p ${BUILD_DIR} && cd ${BUILD_DIR}
-        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-g3 -O0 -fsanitize=thread" || { cat config.log && exit 1; }
+        - ${SRC_DIR}/configure ${CONFIG} --extra-cflags="-g3 -O0 -fsanitize=thread" || { cat config.log meson-logs/meson-log.txt && exit 1; }
 
 
     # Run check-tcg against linux-user
@@ -530,7 +530,7 @@ jobs:
         - ls -l ${SRC_DIR}/qemu-${QEMU_VERSION}.tar.bz2
         - tar -xf ${SRC_DIR}/qemu-${QEMU_VERSION}.tar.bz2 && cd qemu-${QEMU_VERSION}
         - mkdir -p release-build && cd release-build
-        - ../configure ${BASE_CONFIG} ${CONFIG} || { cat config.log && exit 1; }
+        - ../configure ${BASE_CONFIG} ${CONFIG} || { cat config.log meson-logs/meson-log.txt && exit 1; }
         - make install
   allow_failures:
     - env: UNRELIABLE=true
-- 
2.26.2


