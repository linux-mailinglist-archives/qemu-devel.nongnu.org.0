Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D12682A14
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 11:13:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnd5-0002Vt-Mi; Tue, 31 Jan 2023 05:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMncr-0002Ju-Qd
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pMnck-0002UX-7G
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 05:12:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675159940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PXExB3PdM8u9CPoKaK45ZYKCFT4kwl2hc/MSqrgpR+Q=;
 b=Vz4n7wyMYEMZb5/st/F8DXXmwE0fUECkj3OpIr8Xd1vn2WqBKIWVgszay42rsTOn/TW/3i
 iaLF0GO2ABCteHpPmw7xWxotQyw7liFvhZ9YDRpc+qKJgzQ3jILChaiHWep9sPBsWcwQaF
 Fymf0YtNv97PQ0tKimQhJWx2UaT0Jg0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-wVjpMfZTPqiqxYr2kJuw6Q-1; Tue, 31 Jan 2023 05:12:16 -0500
X-MC-Unique: wVjpMfZTPqiqxYr2kJuw6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 940BB801779;
 Tue, 31 Jan 2023 10:12:15 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1D1FC15BAD;
 Tue, 31 Jan 2023 10:12:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 06/27] travis.yml: Use the libfdt from the distro instead of
 the submodule
Date: Tue, 31 Jan 2023 11:11:44 +0100
Message-Id: <20230131101205.1499867-7-thuth@redhat.com>
In-Reply-To: <20230131101205.1499867-1-thuth@redhat.com>
References: <20230131101205.1499867-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

No need to compile-test third party submodules over and over again if
we can simply use the pre-build library from the distribution instead.

By also adding --enable-fdt=system to the configure options, we can
also avoid to check out the "dtc" submodule here.

Message-Id: <20230120075330.2076773-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index fb3baabca9..788e14c08c 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -128,6 +128,7 @@ jobs:
           - libbrlapi-dev
           - libcacard-dev
           - libcap-ng-dev
+          - libfdt-dev
           - libgcrypt20-dev
           - libgnutls28-dev
           - libgtk-3-dev
@@ -149,7 +150,8 @@ jobs:
           - genisoimage
       env:
         - TEST_CMD="make check check-tcg V=1"
-        - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS} --cxx=/bin/false"
+        - CONFIG="--disable-containers --enable-fdt=system
+                  --target-list=${MAIN_SOFTMMU_TARGETS} --cxx=/bin/false"
         - UNRELIABLE=true
 
     - name: "[ppc64] GCC check-tcg"
@@ -162,6 +164,7 @@ jobs:
           - libbrlapi-dev
           - libcacard-dev
           - libcap-ng-dev
+          - libfdt-dev
           - libgcrypt20-dev
           - libgnutls28-dev
           - libgtk-3-dev
@@ -183,7 +186,8 @@ jobs:
           - genisoimage
       env:
         - TEST_CMD="make check check-tcg V=1"
-        - CONFIG="--disable-containers --target-list=ppc64-softmmu,ppc64le-linux-user"
+        - CONFIG="--disable-containers --enable-fdt=system
+                  --target-list=ppc64-softmmu,ppc64le-linux-user"
 
     - name: "[s390x] GCC check-tcg"
       arch: s390x
@@ -195,6 +199,7 @@ jobs:
           - libbrlapi-dev
           - libcacard-dev
           - libcap-ng-dev
+          - libfdt-dev
           - libgcrypt20-dev
           - libgnutls28-dev
           - libgtk-3-dev
@@ -216,7 +221,8 @@ jobs:
           - genisoimage
       env:
         - TEST_CMD="make check check-tcg V=1"
-        - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
+        - CONFIG="--disable-containers --enable-fdt=system
+                  --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
         - UNRELIABLE=true
       script:
         - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
@@ -237,6 +243,7 @@ jobs:
           - libattr1-dev
           - libcacard-dev
           - libcap-ng-dev
+          - libfdt-dev
           - libgnutls28-dev
           - libiscsi-dev
           - liblttng-ust-dev
@@ -255,8 +262,8 @@ jobs:
           # Tests dependencies
           - genisoimage
       env:
-        - CONFIG="--disable-containers --audio-drv-list=sdl --disable-user
-                  --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
+        - CONFIG="--disable-containers --enable-fdt=system --audio-drv-list=sdl
+                  --disable-user --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
 
     - name: "[s390x] GCC (user)"
       arch: s390x
@@ -281,6 +288,7 @@ jobs:
           - libbrlapi-dev
           - libcacard-dev
           - libcap-ng-dev
+          - libfdt-dev
           - libgcrypt20-dev
           - libgnutls28-dev
           - libgtk-3-dev
@@ -300,6 +308,6 @@ jobs:
           - ninja-build
       env:
         - TEST_CMD="make check-unit"
-        - CONFIG="--disable-containers --disable-tcg --enable-kvm
-                  --disable-tools --host-cc=clang --cxx=clang++"
+        - CONFIG="--disable-containers --disable-tcg --enable-kvm --disable-tools
+                  --enable-fdt=system --host-cc=clang --cxx=clang++"
         - UNRELIABLE=true
-- 
2.31.1


