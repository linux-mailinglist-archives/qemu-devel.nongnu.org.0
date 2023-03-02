Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00D96A866D
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:32:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlqH-0007HL-Lq; Thu, 02 Mar 2023 11:31:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXlq9-0006vk-DE
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:31:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXlq7-0006dn-QJ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iwI738OIIkLAwRHwvOimrO1YGLXhalSEzhssZIG8uVE=;
 b=KP0Fjy0kZdSV/8/iACeMPCthcGL0olA7G6dUlolUD8TUmyJrY00mqrxDyIEfbhzZxuYRnu
 dtWzk5Oe+huvgm1USHX8vSNmq3jjSplgvNq1Xjs8B+T7nSkLIIMRY0AHWqu39pwIk+ekGp
 fsLVbB6VDsU5l5vbpTElJSNVDwDn3Vk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-Jq8Nao8XNiSn3fIGaKZl_g-1; Thu, 02 Mar 2023 11:31:26 -0500
X-MC-Unique: Jq8Nao8XNiSn3fIGaKZl_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74665811E6E;
 Thu,  2 Mar 2023 16:31:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21E2C400EA93;
 Thu,  2 Mar 2023 16:31:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH v2 6/6] gitlab-ci.d/crossbuilds: Drop the 32-bit arm system
 emulation jobs
Date: Thu,  2 Mar 2023 17:31:06 +0100
Message-Id: <20230302163106.465559-7-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

Hardly anybody still uses 32-bit arm environments for running QEMU,
so let's stop wasting our scarce CI minutes with these jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 3ce51adf77..419b0c2fe1 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,13 +1,6 @@
 include:
   - local: '/.gitlab-ci.d/crossbuild-template.yml'
 
-cross-armel-system:
-  extends: .cross_system_build_job
-  needs:
-    job: armel-debian-cross-container
-  variables:
-    IMAGE: debian-armel-cross
-
 cross-armel-user:
   extends: .cross_user_build_job
   needs:
@@ -15,13 +8,6 @@ cross-armel-user:
   variables:
     IMAGE: debian-armel-cross
 
-cross-armhf-system:
-  extends: .cross_system_build_job
-  needs:
-    job: armhf-debian-cross-container
-  variables:
-    IMAGE: debian-armhf-cross
-
 cross-armhf-user:
   extends: .cross_user_build_job
   needs:
-- 
2.31.1


