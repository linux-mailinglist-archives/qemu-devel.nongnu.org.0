Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371F56B2B2E
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:50:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJS4-0003lq-E7; Thu, 09 Mar 2023 11:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1paJS2-0003lh-De
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:49:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1paJS0-0006rz-Bl
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:49:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678380546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=dXj7dKCVBTKvi8T+YRubnxL4DKGAGdHX9BHZIy2pBKA=;
 b=KJDs0rUG9pH5m1ze1zyp4bAgD+r8pqH/cTIFqFp29Nm2XFEkZ+iRoB8yDVxBeiLpJdBRTz
 gYdIbYuzn3/kI25p+ciIhP6eiQGkhQLMVvMXw7yylnnPIzZtP4xQVqA+e2A1qB0odcIHFm
 iPMvenKFKB4yiYGAm3APSO4lk/lgFxo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-ILG1vHEpNmmH1Z0i6SsGYw-1; Thu, 09 Mar 2023 11:48:54 -0500
X-MC-Unique: ILG1vHEpNmmH1Z0i6SsGYw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E0AE185A7A4;
 Thu,  9 Mar 2023 16:48:54 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1405A4024CA3;
 Thu,  9 Mar 2023 16:48:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] gitlab-ci.d/buildtest: Rework the target list of
 build-system-alpine
Date: Thu,  9 Mar 2023 17:48:50 +0100
Message-Id: <20230309164850.109882-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

The target list of the build-system-alpine job is pretty much a copy
of the build-system-ubuntu job (apart from "aarch64-softmmu" which
has recently been removed from the ubuntu job in commit 6eda5ef5f8f4,
but aarch64-softmmu is still also tested in the opensuse jobs, so
we don't need to keep it here).

Let's stop wasting our CI minutes with such duplications, and focus
on testing targets instead that do not have such a great test coverage
yet: The "loongarch64-softmmu" target has never been added to our
build tests yet since it has been introduced, and the "mips64-softmmu"
target is so far only tested in jobs that lack the "avocado" testing
stage (only the little endian or 32-bit MIPS variants are tested in
jobs with avocado so far).

While we're at it, also move the avr-softmmu and mipsel-softmmu targets
from the Debian job to the alpine job, since the Debian job (and its
following test jobs) has already a long runtime compared to the others
jobs. With this movement, the runtimes should be more equally distributed
along the parallel running jobs now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 44b8275299..ba6f551752 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -9,8 +9,7 @@ build-system-alpine:
     - job: amd64-alpine-container
   variables:
     IMAGE: alpine
-    TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
-      microblazeel-softmmu mips64el-softmmu
+    TARGETS: avr-softmmu loongarch64-softmmu mips64-softmmu mipsel-softmmu
     MAKE_CHECK_ARGS: check-build
     CONFIGURE_ARGS: --enable-docs --enable-trace-backends=log,simple,syslog
 
@@ -72,8 +71,8 @@ build-system-debian:
   variables:
     IMAGE: debian-amd64
     CONFIGURE_ARGS: --with-coroutine=sigaltstack
-    TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
-      riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
+    TARGETS: arm-softmmu i386-softmmu riscv64-softmmu sh4eb-softmmu
+      sparc-softmmu xtensaeb-softmmu
     MAKE_CHECK_ARGS: check-build
 
 check-system-debian:
-- 
2.31.1


