Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CE033757C
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:24:02 +0100 (CET)
Received: from localhost ([::1]:51522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMEL-0002qO-2J
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKMCy-0001TA-V6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:22:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKMCu-0003fd-PS
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:22:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615472551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yvuv+//bg3lavqtySYSTPCS/fs0OVB90YHQ16QmnxCs=;
 b=FMI2e4OSsMJQJlmqS1RtEvGVXk5W4teysHavcbQrA0pHXvzW/t3FOh9dTVugduiRQaBO/u
 p/BLRujPqFbYEFTcztM0b/PbINm+GLvZ/nr1LEEEbs0TtLJkckEgHYRMS8WG4J95cpuQ7J
 VNBgWdZEORoTAoqAFdWuB1PYhPMCEos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-J32ff5gjPxam2eT8t9iKdg-1; Thu, 11 Mar 2021 09:22:30 -0500
X-MC-Unique: J32ff5gjPxam2eT8t9iKdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E596A100C660;
 Thu, 11 Mar 2021 14:22:28 +0000 (UTC)
Received: from thuth.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84D9518AAB;
 Thu, 11 Mar 2021 14:22:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 4/4] gitlab-ci.yml: Merge check-crypto-old jobs into the
 build-crypto-old jobs
Date: Thu, 11 Mar 2021 15:22:11 +0100
Message-Id: <20210311142211.1547864-5-thuth@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Both, the build-crypto-old and the check-crypto-old jobs finish reasonably
fast, and the build artifacts are only used for the single corresponding
check jobs, so there is no reason for doing the check step in a separate
job here. Thus let's stop wasting artifacts space and job scheduler over-
head by simply merging the test step into the build jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 45 ++++-----------------------------------------
 1 file changed, 4 insertions(+), 41 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 45303cafdd..0ada3dbb90 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -585,7 +585,7 @@ build-coroutine-sigaltstack:
 #
 # These jobs test old gcrypt and nettle from RHEL7
 # which had some API differences.
-build-crypto-old-nettle:
+crypto-old-nettle:
   <<: *native_build_job_definition
   needs:
     job: amd64-centos7-container
@@ -593,22 +593,9 @@ build-crypto-old-nettle:
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle
-    MAKE_CHECK_ARGS: check-build
-  artifacts:
-    paths:
-      - build
-
-check-crypto-old-nettle:
-  <<: *native_test_job_definition
-  needs:
-    - job: build-crypto-old-nettle
-      artifacts: true
-  variables:
-    IMAGE: centos7
     MAKE_CHECK_ARGS: check
 
-
-build-crypto-old-gcrypt:
+crypto-old-gcrypt:
   <<: *native_build_job_definition
   needs:
     job: amd64-centos7-container
@@ -616,22 +603,9 @@ build-crypto-old-gcrypt:
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt
-    MAKE_CHECK_ARGS: check-build
-  artifacts:
-    paths:
-      - build
-
-check-crypto-old-gcrypt:
-  <<: *native_test_job_definition
-  needs:
-    - job: build-crypto-old-gcrypt
-      artifacts: true
-  variables:
-    IMAGE: centos7
     MAKE_CHECK_ARGS: check
 
-
-build-crypto-only-gnutls:
+crypto-only-gnutls:
   <<: *native_build_job_definition
   needs:
     job: amd64-centos7-container
@@ -639,20 +613,9 @@ build-crypto-only-gnutls:
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
     CONFIGURE_ARGS: --disable-nettle --disable-gcrypt --enable-gnutls
-    MAKE_CHECK_ARGS: check-build
-  artifacts:
-    paths:
-      - build
-
-check-crypto-only-gnutls:
-  <<: *native_test_job_definition
-  needs:
-    - job: build-crypto-only-gnutls
-      artifacts: true
-  variables:
-    IMAGE: centos7
     MAKE_CHECK_ARGS: check
 
+
 # We don't need to exercise every backend with every front-end
 build-trace-multi-user:
   <<: *native_build_job_definition
-- 
2.27.0


