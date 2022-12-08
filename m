Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0D0646C8C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 11:16:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3DwV-0005co-Q6; Thu, 08 Dec 2022 05:15:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3DwT-0005aQ-8D
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:15:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p3DwR-0001Dk-IK
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 05:15:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670494546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zf7t8JvuR5yofC48SQF+Hg89KfUlrdMSLRFnKSER8HI=;
 b=YLdy/hKORI4sXwpnDPVMo8qTR+dDbGApWso6+Fg/+/9ithi7Wo4hgG1mUdUkjsYqQRxzGQ
 QHCxVS1CaLXzGy221YujVJF8k0U841m/4r+vS4TZaOtZfj8as65g/bbf9OQCon6AKGrUGG
 tqd+gMAA/+qSr121wqzDvMJ0EAYZp0c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-443-bOzGPYuRP76ltLw91BZVxQ-1; Thu, 08 Dec 2022 05:15:34 -0500
X-MC-Unique: bOzGPYuRP76ltLw91BZVxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 22BBD1C08972;
 Thu,  8 Dec 2022 10:15:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61F86C15BA5;
 Thu,  8 Dec 2022 10:15:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-ppc@nongnu.org
Subject: [PATCH] gitlab-ci: Check building ppc64 without TCG
Date: Thu,  8 Dec 2022 11:15:27 +0100
Message-Id: <20221208101527.36873-1-thuth@redhat.com>
MIME-Version: 1.0
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

Building QEMU for ppc64 hosts with --disable-tcg used to break a couple
of times in the past, see e.g. commit a01b64cee7 ("target/ppc: Put do_rfi
under a TCG-only block") or commit 049b4ad669 ("target/ppc: Fix build
warnings when building with 'disable-tcg'"), so we should test this in
our CI to avoid such regressions.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Not sure whether we really should add new shared runner jobs ... but
 I currently also don't see a better option for this: We don't have
 any custom ppc64 runners in our CI, so the only other way to test this
 is travis - but the Travis extension for gitlab recently broke, so
 the results there are currently rather neglected, I think...

 .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index c4cd96433d..8dbbb8f881 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -112,6 +112,14 @@ cross-ppc64el-user:
   variables:
     IMAGE: debian-ppc64el-cross
 
+cross-ppc64el-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: ppc64el-debian-cross-container
+  variables:
+    IMAGE: debian-ppc64el-cross
+    EXTRA_CONFIGURE_OPTS: --disable-tcg --without-default-devices
+
 # The riscv64 cross-builds currently use a 'sid' container to get
 # compilers and libraries. Until something more stable is found we
 # allow_failure so as not to block CI.
-- 
2.31.1


