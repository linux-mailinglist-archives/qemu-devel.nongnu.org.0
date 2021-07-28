Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C868D3D8920
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 09:53:02 +0200 (CEST)
Received: from localhost ([::1]:52534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8eNB-0001Kz-Cp
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 03:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8eMD-0000g3-CD
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:52:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8eM9-0001Yw-OS
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 03:52:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627458714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ROoRTngxtsGwmUqfS/WpbSiITd6M+YuEDxhYpOoUu5w=;
 b=UJsJfto9RaDVhZS0Vq6UrQ6mydfIZQOO2EPWYhs1tDdRwJo9ajL0pNVEt106GCBaJSwaNH
 m+c2blmDHQIcpZ/61YtwGstdb7eLFEMiEF0V0ufMHoaUVp1cTGj0gNqyTgf9CQ9xznsOUN
 vfAKWSNaHfnhQcO85j1vuHpcEfNazys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-Y54ZOk6POSinzkSKukZUqw-1; Wed, 28 Jul 2021 03:51:53 -0400
X-MC-Unique: Y54ZOk6POSinzkSKukZUqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2474C801B3C;
 Wed, 28 Jul 2021 07:51:52 +0000 (UTC)
Received: from thuth.com (ovpn-112-113.ams2.redhat.com [10.36.112.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52D031007606;
 Wed, 28 Jul 2021 07:51:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci.d/buildtest: Mark the aarch64 and ppc64-s390x CFI
 jobs as manual
Date: Wed, 28 Jul 2021 09:51:41 +0200
Message-Id: <20210728075141.400816-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
 Daniele Buono <dbuono@linux.vnet.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two jobs are currently failing very often - the linker seems to
get killed due to out-of-memory problems. Since apparently nobody has
currently an idea how to fix that nicely, let's mark the jobs as manual
for the time being until someone comes up with a proper fix.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 63f1903f07..3537c6f1a1 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -416,6 +416,12 @@ build-cfi-aarch64:
     expire_in: 2 days
     paths:
       - build
+  rules:
+    # FIXME: This job is often failing, likely due to out-of-memory problems in
+    # the constraint containers of the shared runners. Thus this is marked as
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
+    # the constraint containers of the shared runners. Thus this is marked as
+    # manual until the situation has been solved.
+    - when: manual
+      allow_failure: true
 
 check-cfi-ppc64-s390x:
   extends: .native_test_job_template
-- 
2.27.0


