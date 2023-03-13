Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E366B7A03
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 15:12:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbitQ-0005dS-KT; Mon, 13 Mar 2023 10:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbitM-0005Wy-3T
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:11:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbitI-0006cH-Cp
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678716667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MYl6zo2YFTzCRQbEr7TLJNfqD/29rvsOVKUOlTuU2Nw=;
 b=JLDFC/63EHAflcV96GczobdKnTpgIAH31nX3Pa56qfNiw5vMar4d1kXacy2jaFHvTUA2HF
 IUI2oekcvosiNYbhCkIbvpqnr9Y2HGG6L6L8Jx1xH5IzdpVK9TKIKJgpML9EHdaM+H3CXo
 6wbLcRH6v5hEjv4GKD+PbX2nejmDNro=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-QD9_E6CPM4qFR4GdcXCcGg-1; Mon, 13 Mar 2023 10:11:03 -0400
X-MC-Unique: QD9_E6CPM4qFR4GdcXCcGg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A79C1C04187;
 Mon, 13 Mar 2023 14:11:03 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 68A5A1121315;
 Mon, 13 Mar 2023 14:11:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 3/5] gitlab-ci.d/buildtest: Rework the target list of
 build-system-alpine
Date: Mon, 13 Mar 2023 15:10:55 +0100
Message-Id: <20230313141057.230810-4-thuth@redhat.com>
In-Reply-To: <20230313141057.230810-1-thuth@redhat.com>
References: <20230313141057.230810-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

Message-Id: <20230309164850.109882-1-thuth@redhat.com>
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


