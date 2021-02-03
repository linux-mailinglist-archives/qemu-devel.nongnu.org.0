Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA7930D8EB
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 12:41:12 +0100 (CET)
Received: from localhost ([::1]:55162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7GX1-0002AK-JS
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 06:41:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7GPG-0002A4-Vb
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:33:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7GPD-0004ym-Iy
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 06:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612351986;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ambayBEhm9Y1rpHdfh39O4J+a1kFG8HGBWxjWfL80I=;
 b=UiUIhaZbEMzO3BWZzxGwst8X8H3LhxIruMhVVTrWKFbuoobi+lG3huJfcE6npQ1K/AUPF9
 zh8nKl1PDwpDJvWEcxLQfLQnLGPoScGP/krMld4HzVdIYdgwN/h5wgj9wbveqscugm5u4k
 fFWYoZdH0epEnSsLQJa9GnKb7TX+YkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-COIMXomPNHa1J7AUwL5eQA-1; Wed, 03 Feb 2021 06:33:04 -0500
X-MC-Unique: COIMXomPNHa1J7AUwL5eQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA25C809DCC;
 Wed,  3 Feb 2021 11:33:03 +0000 (UTC)
Received: from thuth.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3F40960C66;
 Wed,  3 Feb 2021 11:33:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 6/6] travis.yml: Move the -fsanitize=thread compile-testing to
 the gitlab-CI
Date: Wed,  3 Feb 2021 12:32:43 +0100
Message-Id: <20210203113243.280883-7-thuth@redhat.com>
In-Reply-To: <20210203113243.280883-1-thuth@redhat.com>
References: <20210203113243.280883-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

It's only about compile-testing (there is too much noise when running
the tests), so let's simply add the -fsanitize=thread flag to a job that
only compiles the sources. The "build-gprof-gcov" seems to be a good
candidate.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml |  1 +
 .travis.yml    | 51 --------------------------------------------------
 2 files changed, 1 insertion(+), 51 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4654798523..e5c86e38c4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -484,6 +484,7 @@ build-gprof-gcov:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-gprof --enable-gcov
+                    --extra-cflags=-fsanitize=thread
     MAKE_CHECK_ARGS: build-tcg
     TARGETS: aarch64-softmmu mips64-softmmu ppc64-softmmu
              riscv64-softmmu s390x-softmmu x86_64-softmmu
diff --git a/.travis.yml b/.travis.yml
index b3fc72f561..18e62f282f 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -120,57 +120,6 @@ after_script:
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


