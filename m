Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDF62FFFC7
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:08:46 +0100 (CET)
Received: from localhost ([::1]:42246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tMz-000108-E4
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2tLv-0000VH-M2
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:07:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2tLs-0006IL-JF
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:07:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611310054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YEPc4v292rvaxR+KpcUcFpoznmzw0UgPD5qxquVlvpM=;
 b=U6eMNJBSgG6v7sx4k998PRdwKL2/q8xdW8ENxOKjt1DrVU383rnP02NMmlb1Vl7JskEAjy
 GuKnrVRVyIGnFsEYTHtSFkASHQ3jCI5hCR4/juhYpj3QDdG1rrOiBpxwtsZAsYhHxmQK9+
 G3wbJkioqdX19ceiclfFzzU5lRRgR24=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-AthxwTb-NCisUy2JQuItxg-1; Fri, 22 Jan 2021 05:07:32 -0500
X-MC-Unique: AthxwTb-NCisUy2JQuItxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80EF780A5C5;
 Fri, 22 Jan 2021 10:07:31 +0000 (UTC)
Received: from thuth.com (ovpn-112-109.ams2.redhat.com [10.36.112.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 181AC5D9FC;
 Fri, 22 Jan 2021 10:07:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] gitlab-ci.yml: Use the whole tree as artifacts to speed up
 the CI
Date: Fri, 22 Jan 2021 11:07:22 +0100
Message-Id: <20210122100722.705375-1-thuth@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, our check-system-* jobs are recompiling the whole sources
again. This happens due to the fact that the jobs are checking out
the whole source tree and required submodules again, and only try
to use the "build" directory with the binaries and object files
as an artifact from the previous stage - which simply does not work
anymore (with the current version of meson). Due to some changed
time stamps, meson is always trying to rebuild the whole tree.

So instead of trying to marry a freshly checked out source tree
with the pre-built binaries in these jobs, let's simply pass the
whole source including the submodules and the build tree as artifact
to the test jobs. That way timestamps get preserved and there is
no rebuild of the sources anymore. This saves ca. 15 - 20 minutes
of precious CI cycles in each run.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 This is how a job looked like before my patch, running for 42 minutes:
 https://gitlab.com/huth/qemu/-/jobs/978432757

 And this is how it looks like afterwards - it just took 18 minutes:
 https://gitlab.com/huth/qemu/-/jobs/979500316

 .gitlab-ci.d/containers.yml |  1 +
 .gitlab-ci.yml              | 40 +++++++++++++++++++++++++------------
 2 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e2f9c99e27..d55280661f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -39,7 +39,6 @@ include:
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
     - cd build
-    - find . -type f -exec touch {} +
     - make $MAKE_CHECK_ARGS
 
 .acceptance_template: &acceptance_definition
@@ -83,8 +82,7 @@ build-system-alpine:
   artifacts:
     expire_in: 2 days
     paths:
-      - .git-submodule-status
-      - build
+      - "*"
 
 check-system-alpine:
   <<: *native_test_job_definition
@@ -92,6 +90,7 @@ check-system-alpine:
     - job: build-system-alpine
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: alpine
     MAKE_CHECK_ARGS: check
 
@@ -101,6 +100,7 @@ acceptance-system-alpine:
     - job: build-system-alpine
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: alpine
     MAKE_CHECK_ARGS: check-acceptance
   <<: *acceptance_definition
@@ -116,7 +116,7 @@ build-system-ubuntu:
   artifacts:
     expire_in: 2 days
     paths:
-      - build
+      - "*"
 
 check-system-ubuntu:
   <<: *native_test_job_definition
@@ -124,6 +124,7 @@ check-system-ubuntu:
     - job: build-system-ubuntu
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
 
@@ -133,6 +134,7 @@ acceptance-system-ubuntu:
     - job: build-system-ubuntu
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check-acceptance
   <<: *acceptance_definition
@@ -148,7 +150,7 @@ build-system-debian:
   artifacts:
     expire_in: 2 days
     paths:
-      - build
+      - "*"
 
 check-system-debian:
   <<: *native_test_job_definition
@@ -156,6 +158,7 @@ check-system-debian:
     - job: build-system-debian
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
@@ -170,7 +173,7 @@ build-tools-and-docs-debian:
   artifacts:
     expire_in: 2 days
     paths:
-      - build
+      - "*"
 
 acceptance-system-debian:
   <<: *native_test_job_definition
@@ -178,6 +181,7 @@ acceptance-system-debian:
     - job: build-system-debian
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-acceptance
   <<: *acceptance_definition
@@ -194,7 +198,7 @@ build-system-fedora:
   artifacts:
     expire_in: 2 days
     paths:
-      - build
+      - "*"
 
 check-system-fedora:
   <<: *native_test_job_definition
@@ -202,6 +206,7 @@ check-system-fedora:
     - job: build-system-fedora
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
@@ -211,6 +216,7 @@ acceptance-system-fedora:
     - job: build-system-fedora
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
   <<: *acceptance_definition
@@ -226,7 +232,7 @@ build-system-centos:
   artifacts:
     expire_in: 2 days
     paths:
-      - build
+      - "*"
 
 check-system-centos:
   <<: *native_test_job_definition
@@ -234,6 +240,7 @@ check-system-centos:
     - job: build-system-centos
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: centos8
     MAKE_CHECK_ARGS: check
 
@@ -243,6 +250,7 @@ acceptance-system-centos:
     - job: build-system-centos
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: centos8
     MAKE_CHECK_ARGS: check-acceptance
   <<: *acceptance_definition
@@ -257,7 +265,7 @@ build-system-opensuse:
   artifacts:
     expire_in: 2 days
     paths:
-      - build
+      - "*"
 
 check-system-opensuse:
   <<: *native_test_job_definition
@@ -265,6 +273,7 @@ check-system-opensuse:
     - job: build-system-opensuse
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: opensuse-leap
     MAKE_CHECK_ARGS: check
 
@@ -274,6 +283,7 @@ acceptance-system-opensuse:
      - job: build-system-opensuse
        artifacts: true
    variables:
+     GIT_CHECKOUT: "false"
      IMAGE: opensuse-leap
      MAKE_CHECK_ARGS: check-acceptance
    <<: *acceptance_definition
@@ -444,7 +454,7 @@ build-deprecated:
   artifacts:
     expire_in: 2 days
     paths:
-      - build
+      - "*"
 
 # We split the check-tcg step as test failures are expected but we still
 # want to catch the build breaking.
@@ -454,6 +464,7 @@ check-deprecated:
     - job: build-deprecated
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: debian-all-test-cross
     MAKE_CHECK_ARGS: check-tcg
   allow_failure: true
@@ -526,7 +537,7 @@ build-crypto-old-nettle:
     MAKE_CHECK_ARGS: check-build
   artifacts:
     paths:
-      - build
+      - "*"
 
 check-crypto-old-nettle:
   <<: *native_test_job_definition
@@ -534,6 +545,7 @@ check-crypto-old-nettle:
     - job: build-crypto-old-nettle
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: centos7
     MAKE_CHECK_ARGS: check
 
@@ -547,7 +559,7 @@ build-crypto-old-gcrypt:
     MAKE_CHECK_ARGS: check-build
   artifacts:
     paths:
-      - build
+      - "*"
 
 check-crypto-old-gcrypt:
   <<: *native_test_job_definition
@@ -555,6 +567,7 @@ check-crypto-old-gcrypt:
     - job: build-crypto-old-gcrypt
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: centos7
     MAKE_CHECK_ARGS: check
 
@@ -568,7 +581,7 @@ build-crypto-only-gnutls:
     MAKE_CHECK_ARGS: check-build
   artifacts:
     paths:
-      - build
+      - "*"
 
 check-crypto-only-gnutls:
   <<: *native_test_job_definition
@@ -576,6 +589,7 @@ check-crypto-only-gnutls:
     - job: build-crypto-only-gnutls
       artifacts: true
   variables:
+    GIT_CHECKOUT: "false"
     IMAGE: centos7
     MAKE_CHECK_ARGS: check
 
-- 
2.27.0


