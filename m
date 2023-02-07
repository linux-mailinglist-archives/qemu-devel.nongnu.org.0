Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD84268E1C3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 21:16:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPUN5-0006u4-UC; Tue, 07 Feb 2023 15:15:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPUMr-0006qS-Dn
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:15:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPUMp-0007P9-Kn
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 15:15:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675800902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4J3MiOnnGyo/Ghsqm0B27kNfTdgnxT2iDxhmVbuZH2s=;
 b=gB0F2yF3mWLWwrxsMmmMKXQvyceWUMGdhxFGN/CyOzlq7HyXnPAPXGQcDZiZq8lL4SMrPh
 +VmvuUhWEV3pQHsj1klqq+O2I1x1Pbn9ZmJzYLQyQ/UVj28l99rSV5c90q85q9q+Pg9vLT
 JYY5oxflJocasu5mo43rIUOZbA+TOS4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-AyzzjOJ8MiWNZPzpFEJv_A-1; Tue, 07 Feb 2023 15:15:00 -0500
X-MC-Unique: AyzzjOJ8MiWNZPzpFEJv_A-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF12529A9CAC;
 Tue,  7 Feb 2023 20:14:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73A30492B21;
 Tue,  7 Feb 2023 20:14:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 2/5] gitlab-ci.d/buildtest: Remove aarch64-softmmu from the
 build-system-ubuntu job
Date: Tue,  7 Feb 2023 21:14:44 +0100
Message-Id: <20230207201447.566661-3-thuth@redhat.com>
In-Reply-To: <20230207201447.566661-1-thuth@redhat.com>
References: <20230207201447.566661-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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

aarch64-softmmu is also checked on the same version of Ubuntu in the
gcov job, so it is redundant to check again in the normal ubuntu job.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 8f332fc36f..8fff961b44 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -42,7 +42,7 @@ build-system-ubuntu:
   variables:
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-capstone
-    TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
+    TARGETS: alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
   artifacts:
-- 
2.31.1


