Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6384845F1E1
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 17:29:26 +0100 (CET)
Received: from localhost ([::1]:60584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqe6G-0004up-Rz
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 11:29:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mqe4o-0002g7-4S
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:27:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mqe4k-0002oK-Ht
 for qemu-devel@nongnu.org; Fri, 26 Nov 2021 11:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637944068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nW2jbNomgcquwFrtKYJtOmWNHS0WxiWe9WKD0FNCxP0=;
 b=HwMbFJ3rwVem15rmdnuXf+jpZXqiduSNSlLxeG2mNhiTxx0Dtly9yv3jnzmJT6JKcIYRg8
 63rep0/MxbxVeSc7KL7JNuo9dsgCzSyi3k1up3n0EU5vA6wH029uTCuoDcqeHvy8UAuISr
 IxHV+fw8/dC+R4YFkr4F7DuBi38Wx4c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-tdGncI7dOquo5KYFesIfAA-1; Fri, 26 Nov 2021 11:27:45 -0500
X-MC-Unique: tdGncI7dOquo5KYFesIfAA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B8EFC85EE60;
 Fri, 26 Nov 2021 16:27:44 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DDD75F4E1;
 Fri, 26 Nov 2021 16:27:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] gitlab-ci.d/buildtest: Add jobs that run the device-crash-test
Date: Fri, 26 Nov 2021 17:27:24 +0100
Message-Id: <20211126162724.1162049-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device-crash-test script has been quite neglected in the past,
so that it bit-rot quite often. Let's add CI jobs that run this
script for at least some targets, so that this script does not
regress that easily anymore.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest.yml | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 71d0f407ad..7e1cb0b3c2 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -100,6 +100,17 @@ avocado-system-debian:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-avocado
 
+crash-test-debian:
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-debian
+      artifacts: true
+  variables:
+    IMAGE: debian-amd64
+  script:
+    - cd build
+    - scripts/device-crash-test -q ./qemu-system-i386
+
 build-system-fedora:
   extends: .native_build_job_template
   needs:
@@ -134,6 +145,18 @@ avocado-system-fedora:
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-avocado
 
+crash-test-fedora:
+  extends: .native_test_job_template
+  needs:
+    - job: build-system-fedora
+      artifacts: true
+  variables:
+    IMAGE: fedora
+  script:
+    - cd build
+    - scripts/device-crash-test -q ./qemu-system-ppc
+    - scripts/device-crash-test -q ./qemu-system-riscv32
+
 build-system-centos:
   extends: .native_build_job_template
   needs:
-- 
2.27.0


