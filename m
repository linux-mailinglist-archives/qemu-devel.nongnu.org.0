Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567BA3D9F82
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:26:04 +0200 (CEST)
Received: from localhost ([::1]:37594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m91Mh-0003QK-Co
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m91JN-0005Vz-Ua
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m91JL-0007KX-P8
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627546955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=14oP5eMXJ+BWozcYu0eTbcZAMo9yFAqZo8iDBy10vpA=;
 b=h1dfSMeWnLGd8F+VnA/1VpDxfd+qIODqt9JK9UlKmqLdmK4SqzCwwFvf3M+AV8rSx/+31+
 +TmmOo1kNfGiXX8DlRmHCvxN1ALzyj17THZPHZ8F6WuTay5FDEY395L19E5FslFdWpD1u+
 ssOPKoP2keEUKIOfozvGKo2pOcMSLFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-vYmTB2fWPiuv2ooH_g36DQ-1; Thu, 29 Jul 2021 04:22:33 -0400
X-MC-Unique: vYmTB2fWPiuv2ooH_g36DQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A3021084F58;
 Thu, 29 Jul 2021 08:22:32 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECE155D9DC;
 Thu, 29 Jul 2021 08:22:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 6/9] gitlab-ci.d/buildtest: Mark the aarch64 and ppc64-s390x
 CFI jobs as manual
Date: Thu, 29 Jul 2021 10:22:08 +0200
Message-Id: <20210729082211.532572-7-thuth@redhat.com>
In-Reply-To: <20210729082211.532572-1-thuth@redhat.com>
References: <20210729082211.532572-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two jobs are currently failing very often - the linker seems to
get killed due to out-of-memory problems. Since apparently nobody has
currently an idea how to fix that nicely, let's mark the jobs as manual
for the time being until someone comes up with a proper fix.

Message-Id: <20210728075141.400816-1-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 63f1903f07..903ee65f32 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -416,6 +416,12 @@ build-cfi-aarch64:
     expire_in: 2 days
     paths:
       - build
+  rules:
+    # FIXME: This job is often failing, likely due to out-of-memory problems in
+    # the constrained containers of the shared runners. Thus this is marked as
+    # manual until the situation has been solved.
+    - when: manual
+      allow_failure: true
 
 check-cfi-aarch64:
   extends: .native_test_job_template
@@ -452,6 +458,12 @@ build-cfi-ppc64-s390x:
     expire_in: 2 days
     paths:
       - build
+  rules:
+    # FIXME: This job is often failing, likely due to out-of-memory problems in
+    # the constrained containers of the shared runners. Thus this is marked as
+    # manual until the situation has been solved.
+    - when: manual
+      allow_failure: true
 
 check-cfi-ppc64-s390x:
   extends: .native_test_job_template
-- 
2.27.0


