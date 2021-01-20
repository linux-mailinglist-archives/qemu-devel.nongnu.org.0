Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AA02FD3DF
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:25:51 +0100 (CET)
Received: from localhost ([::1]:58010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FMk-0008MN-Es
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:25:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFe-0000LW-Qy
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25106)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFV-0007jz-Nl
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611155893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fgMHt08Iel3umUrdfF7cKpnrqvpGYPuSLVrfKdmyq5k=;
 b=iMCLZP/tlBA5yI/Q/X6Nisrfl2KRw7gljL7DSULXHE59fRdzbCPpHguFTcXkUdW046hguQ
 XSyNAQjFEUVnIylyJ3MjajEfX1v1SJeKXstMNLshtiqlADs8s77MMCjI8C6xprsGgg0/pw
 RNIuutB3s1G1a/uCkjiixCIPkk15WDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-Fhpb85GOMM2hAgTHIuxW9A-1; Wed, 20 Jan 2021 10:18:11 -0500
X-MC-Unique: Fhpb85GOMM2hAgTHIuxW9A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D9C11800D41;
 Wed, 20 Jan 2021 15:18:10 +0000 (UTC)
Received: from thuth.com (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 122E160C6A;
 Wed, 20 Jan 2021 15:18:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 10/14] gitlab-ci: Add alpine to pipeline
Date: Wed, 20 Jan 2021 16:17:47 +0100
Message-Id: <20210120151751.520597-11-thuth@redhat.com>
In-Reply-To: <20210120151751.520597-1-thuth@redhat.com>
References: <20210120151751.520597-1-thuth@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

[thuth: Enable "make check" tests, too, after tests/check-block.sh got fixed]

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-Id: <20210118063808.12471-10-jiaxun.yang@flygoat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/containers.yml |  5 +++++
 .gitlab-ci.yml              | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 910754a699..90fac85ce4 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -28,6 +28,11 @@
     - if: '$CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
     - if: '$CI_COMMIT_REF_NAME == "testing/next"'
 
+amd64-alpine-container:
+  <<: *container_job_definition
+  variables:
+    NAME: alpine
+
 amd64-centos7-container:
   <<: *container_job_definition
   variables:
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 203b1671c4..de3a3d25b5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -72,6 +72,39 @@ include:
     - cd build
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
 
+build-system-alpine:
+  <<: *native_build_job_definition
+  variables:
+    IMAGE: alpine
+    TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
+      moxie-softmmu microblazeel-softmmu mips64el-softmmu
+    MAKE_CHECK_ARGS: check-build
+    CONFIGURE_ARGS: --enable-docs
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - .git-submodule-status
+      - build
+
+check-system-alpine:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-alpine
+      artifacts: true
+  variables:
+    IMAGE: alpine
+    MAKE_CHECK_ARGS: check
+
+acceptance-system-alpine:
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-alpine
+      artifacts: true
+  variables:
+    IMAGE: alpine
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
+
 build-system-ubuntu:
   <<: *native_build_job_definition
   variables:
-- 
2.27.0


