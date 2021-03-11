Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB214337595
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:25:13 +0100 (CET)
Received: from localhost ([::1]:56886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMFU-00055t-UW
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKMD0-0001UV-T7
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:22:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKMCu-0003fZ-Ov
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:22:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615472551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=59UYqawuM2kT8SX9wDj+2cOuVfeiUzcd6cnjTA70Qvk=;
 b=NpjyWrny+XlSm+LvYt9rXR1Q60ceFU4ZtrfxzhaQ5HeaLjuSuSfrY8c6d6jvhiBl4NevwA
 72R4mAwzIHPYQZlP66DrbmCBbqQlhVNX5TTsozB+U3DELkcK9QSSV1WCQBtxcgqnZBnt6R
 SqggxgubiBroZ6P4zo0SYQrYCaE4RKw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-Bj_5IL0_M4ei1eycWM1KKg-1; Thu, 11 Mar 2021 09:22:28 -0500
X-MC-Unique: Bj_5IL0_M4ei1eycWM1KKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE2B418D6A39;
 Thu, 11 Mar 2021 14:22:26 +0000 (UTC)
Received: from thuth.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AEB372BFF1;
 Thu, 11 Mar 2021 14:22:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 3/4] gitlab-ci.yml: Merge one of the coroutine jobs with the
 tcg-disabled job
Date: Thu, 11 Mar 2021 15:22:10 +0100
Message-Id: <20210311142211.1547864-4-thuth@redhat.com>
In-Reply-To: <20210311142211.1547864-1-thuth@redhat.com>
References: <20210311142211.1547864-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our gitlab-ci got quite slow in the past weeks, due to the immense amount
of jobs that we have, so we should try to reduce the number of jobs.
Since we already have a job that builds without TCG, we can merge
one of the "build-coroutine" jobs with it to get rid of at least one
job.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a98f5674d6..45303cafdd 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -366,6 +366,8 @@ build-disabled:
 # Xen accelerator is not detected / selected. As result it build the
 # i386-softmmu and x86_64-softmmu with KVM being the single accelerator
 # available.
+# Also use a different coroutine implementation (which is only really of
+# interest to KVM users, i.e. with TCG disabled)
 build-tcg-disabled:
   <<: *native_build_job_definition
   needs:
@@ -375,7 +377,8 @@ build-tcg-disabled:
   script:
     - mkdir build
     - cd build
-    - ../configure --disable-tcg --audio-drv-list="" || { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - ../configure --disable-tcg --audio-drv-list="" --with-coroutine=ucontext
+      || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - make -j"$JOBS"
     - make check-unit
     - make check-qapi-schema
@@ -569,15 +572,6 @@ build-tci:
 
 # Alternate coroutines implementations are only really of interest to KVM users
 # However we can't test against KVM on Gitlab-CI so we can only run unit tests
-build-coroutine-ucontext:
-  <<: *native_build_job_definition
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --with-coroutine=ucontext --disable-tcg
-    MAKE_CHECK_ARGS: check-unit
-
 build-coroutine-sigaltstack:
   <<: *native_build_job_definition
   needs:
-- 
2.27.0


