Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA97341902
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:59:14 +0100 (CET)
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBuT-0001v6-Ou
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNBt4-0001Sx-8z
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lNBt1-00080T-86
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zx8WNsFMacu19BQTL0EGNrXFHolJcEpPFwSKh73iqis=;
 b=MyEMrGYleQl6TxZYC9fKNA1AnK9GJOfhVj0asVOaZO7xzw42V90rztxkDw5E94uXLKqmYH
 Ll7kdBSoVS4z9kNthTW/XZJ3AsI3BJAQyQgkUY5SBGChxfK51qA7PpkyiQpXOVXLip6xF+
 YXMj/0h21W0ZVJzttKJzoyYNPcJbBvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-_aOhCE5pOhSboUBkSCOq4A-1; Fri, 19 Mar 2021 05:57:40 -0400
X-MC-Unique: _aOhCE5pOhSboUBkSCOq4A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFF96800D53;
 Fri, 19 Mar 2021 09:57:39 +0000 (UTC)
Received: from thuth.com (ovpn-112-49.ams2.redhat.com [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01BA060BF1;
 Fri, 19 Mar 2021 09:57:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] gitlab-ci.yml: Merge the trace-backend testing into other jobs
Date: Fri, 19 Mar 2021 10:57:26 +0100
Message-Id: <20210319095726.45965-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our gitlab-ci got quite slow in the past weeks, due to the immense amount
of jobs that we have, so we should try to reduce the number of jobs.
There is no real good reason for having separate jobs just to test the
trace backends, we can do this just fine in other jobs, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 30 +++---------------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0cc6d53f7e..cbbd67f139 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -87,7 +87,7 @@ build-system-alpine:
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       moxie-softmmu microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
-    CONFIGURE_ARGS: --enable-docs
+    CONFIGURE_ARGS: --enable-docs --enable-trace-backends=log,simple,syslog
   artifacts:
     expire_in: 2 days
     paths:
@@ -608,7 +608,7 @@ tsan-build:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-tsan --cc=clang-10 --cxx=clang++-10 --disable-docs
-                    --enable-fdt=system --enable-slirp=system
+          --enable-trace-backends=ust --enable-fdt=system --enable-slirp=system
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
     MAKE_CHECK_ARGS: bench V=1
 
@@ -706,6 +706,7 @@ build-coroutine-sigaltstack:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --with-coroutine=sigaltstack --disable-tcg
+                    --enable-trace-backends=ftrace
     MAKE_CHECK_ARGS: check-unit
 
 # Most jobs test latest gcrypt or nettle builds
@@ -743,31 +744,6 @@ crypto-only-gnutls:
     MAKE_CHECK_ARGS: check
 
 
-# We don't need to exercise every backend with every front-end
-build-trace-multi-user:
-  <<: *native_build_job_definition
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-trace-backends=log,simple,syslog --disable-system
-
-build-trace-ftrace-system:
-  <<: *native_build_job_definition
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-trace-backends=ftrace --target-list=x86_64-softmmu
-
-build-trace-ust-system:
-  <<: *native_build_job_definition
-  needs:
-    job: amd64-ubuntu2004-container
-  variables:
-    IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu
-
 # Check our reduced build configurations
 build-without-default-devices:
   <<: *native_build_job_definition
-- 
2.27.0


