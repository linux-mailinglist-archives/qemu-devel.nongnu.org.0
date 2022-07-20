Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CE557B306
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 10:33:52 +0200 (CEST)
Received: from localhost ([::1]:48882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE59T-0003dJ-13
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 04:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE54l-0008Mr-T5
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:28:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oE54k-0004LO-2T
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:28:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658305737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IQAgNIBG+VV6cYy/COnZZFABIFZxiB6FiYMgngP8dPE=;
 b=L+rhCevFy+JkZoaObTcZrbDkf1SUdwPqhfCqlntTfwXTfU0YwkB/42jAs+IKSE1utQDPTP
 mH0frLWKb3zdbf2E807/Mf3aQguWvJrgUNQPb86kr/txwhX0tjB7WEs3NpcB7Fy1Lb3sAh
 GxeMLMgniS2Lx//EIT8d7+6v4WgIrBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-n11bUWfJNpKLcrFXaZK0OA-1; Wed, 20 Jul 2022 04:28:50 -0400
X-MC-Unique: n11bUWfJNpKLcrFXaZK0OA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEDD4811E84;
 Wed, 20 Jul 2022 08:28:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.158])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFFFEC2812B;
 Wed, 20 Jul 2022 08:28:48 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, alex.bennee@linaro.org, f4bug@amsat.org,
 thuth@redhat.com, iii@linux.ibm.com, peter.maydell@linaro.org
Subject: [PATCH] Revert "gitlab: disable accelerated zlib for s390x"
Date: Wed, 20 Jul 2022 09:28:44 +0100
Message-Id: <20220720082844.6700-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

This reverts commit 309df6acb29346f89e1ee542b1986f60cab12b87.
With Ilya's 'multifd: Copy pages before compressing them with zlib'
in the latest migration series, this shouldn't be a problem any more.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml | 12 ------------
 .travis.yml                                        |  6 ++----
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index 9f1fe9e7dc..03e74c97db 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -8,8 +8,6 @@ ubuntu-20.04-s390x-all-linux-static:
  tags:
  - ubuntu_20.04
  - s390x
- variables:
-    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
  - if: "$S390X_RUNNER_AVAILABLE"
@@ -29,8 +27,6 @@ ubuntu-20.04-s390x-all:
  tags:
  - ubuntu_20.04
  - s390x
- variables:
-    DFLTCC: 0
  timeout: 75m
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -48,8 +44,6 @@ ubuntu-20.04-s390x-alldbg:
  tags:
  - ubuntu_20.04
  - s390x
- variables:
-    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
@@ -71,8 +65,6 @@ ubuntu-20.04-s390x-clang:
  tags:
  - ubuntu_20.04
  - s390x
- variables:
-    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
@@ -93,8 +85,6 @@ ubuntu-20.04-s390x-tci:
  tags:
  - ubuntu_20.04
  - s390x
- variables:
-    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
@@ -114,8 +104,6 @@ ubuntu-20.04-s390x-notcg:
  tags:
  - ubuntu_20.04
  - s390x
- variables:
-    DFLTCC: 0
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
diff --git a/.travis.yml b/.travis.yml
index 4fdc9a6785..fb3baabca9 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -218,7 +218,6 @@ jobs:
         - TEST_CMD="make check check-tcg V=1"
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
         - UNRELIABLE=true
-        - DFLTCC=0
       script:
         - BUILD_RC=0 && make -j${JOBS} || BUILD_RC=$?
         - |
@@ -258,7 +257,7 @@ jobs:
       env:
         - CONFIG="--disable-containers --audio-drv-list=sdl --disable-user
                   --target-list-exclude=${MAIN_SOFTMMU_TARGETS}"
-        - DFLTCC=0
+
     - name: "[s390x] GCC (user)"
       arch: s390x
       dist: focal
@@ -270,7 +269,7 @@ jobs:
           - ninja-build
       env:
         - CONFIG="--disable-containers --disable-system"
-        - DFLTCC=0
+
     - name: "[s390x] Clang (disable-tcg)"
       arch: s390x
       dist: focal
@@ -304,4 +303,3 @@ jobs:
         - CONFIG="--disable-containers --disable-tcg --enable-kvm
                   --disable-tools --host-cc=clang --cxx=clang++"
         - UNRELIABLE=true
-        - DFLTCC=0
-- 
2.36.1


