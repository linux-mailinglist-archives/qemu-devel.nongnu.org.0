Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CAA53CA31
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 14:49:47 +0200 (CEST)
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx6kL-0002Pi-O7
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 08:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx6iz-0001kA-05
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 08:48:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx6iw-0003Pt-0x
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 08:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654260496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=mrY06Vww5lg9zIhQJ8rkB0qybutztvYUtWjhZ19b2co=;
 b=DvURqQmuJnW1LygX608v3dl0e2JSUGuxM332S0aANKR2/bdGQoqTZM4Xo/SYMYVDhz1KY8
 wgofTEslm6N3bqcgKMROgT3ubs7p8JmPk1GEsMJCKZwOEbIUP0vidlhCxuCiZrcBeN/xqY
 8QI+0DD1JlPmHRkVkDogZYcnCsgNBrE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-HAut_R2MP2a5qt4CGA7KWw-1; Fri, 03 Jun 2022 08:48:13 -0400
X-MC-Unique: HAut_R2MP2a5qt4CGA7KWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 37445101A54E;
 Fri,  3 Jun 2022 12:48:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C9A82166B26;
 Fri,  3 Jun 2022 12:48:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH] gitlab-ci: Fix the build-cfi-aarch64 and
 build-cfi-ppc64-s390x jobs
Date: Fri,  3 Jun 2022 14:48:09 +0200
Message-Id: <20220603124809.70794-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

The job definitions recently got a second "variables:" section by
accident and thus are failing now if one tries to run them. Merge
the two sections into one again to fix the issue.

And while we're at it, bump the timeout here (70 minutes are currently
not enough for the aarch64 job). The jobs are marked as manual anyway,
so if the user starts them, they want to see their result for sure and
then it's annoying if the job timeouts too early.

Fixes: e312d1fdbb ("gitlab: convert build/container jobs to .base_job_template")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 I wonder whether we should remove the build-cfi-aarch64 job instead.
 When I tried to run it during the past months, it was always failing
 for me. This time, I tried to bump the timeout while I was at it,
 and it takes longer than 80 minutes here to finish - so I asume
 nobody ever ran this successfully in the last months... Is anybody
 using this job at all? I think if we want to have CFI coverage here,
 it should get replaced by a custom runner job that runs on a more
 beefy machine... (the ppc64-s390x job is fine by the way, it often
 only runs a little bit longer than 60 minutes - I still bumped the
 timeout here, too, just to be on the safe side)

 .gitlab-ci.d/buildtest.yml | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index ecac3ec50c..baaa0ebb87 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -355,16 +355,15 @@ build-cfi-aarch64:
       --enable-safe-stack --enable-slirp=git
     TARGETS: aarch64-softmmu
     MAKE_CHECK_ARGS: check-build
-  timeout: 70m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-  variables:
     # FIXME: This job is often failing, likely due to out-of-memory problems in
     # the constrained containers of the shared runners. Thus this is marked as
     # skipped until the situation has been solved.
     QEMU_JOB_SKIPPED: 1
+  timeout: 90m
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
 
 check-cfi-aarch64:
   extends: .native_test_job_template
@@ -396,16 +395,15 @@ build-cfi-ppc64-s390x:
       --enable-safe-stack --enable-slirp=git
     TARGETS: ppc64-softmmu s390x-softmmu
     MAKE_CHECK_ARGS: check-build
-  timeout: 70m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-  variables:
     # FIXME: This job is often failing, likely due to out-of-memory problems in
     # the constrained containers of the shared runners. Thus this is marked as
     # skipped until the situation has been solved.
     QEMU_JOB_SKIPPED: 1
+  timeout: 80m
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
 
 check-cfi-ppc64-s390x:
   extends: .native_test_job_template
-- 
2.31.1


