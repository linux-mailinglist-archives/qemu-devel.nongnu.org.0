Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A544F31F7F2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 12:11:26 +0100 (CET)
Received: from localhost ([::1]:36322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD3gz-0005GB-MG
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 06:11:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD3fb-0004jt-7q
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:09:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lD3fZ-0003Ge-HU
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 06:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613732996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3PPpTPyyjTX0r+E4KSZ0MFQF1WkXUpxRQwOY438LlVc=;
 b=aQX6GnZxB6NVp2pLjqocyToatlQ2tPEdbPL7UYknaLDqNdbcNVgY2+POruIqWUpnbaEsL7
 c3ROhray0TBWpAZG111yZvFgZrirqtW88Qy0H9swHauK/etzbWkkvEwPCNc2lfGd7q2DnG
 gkLU0YI0m5aescA0TtnWUCl3EM9TvX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-3qRNcBVSOGquKENtm_LgFA-1; Fri, 19 Feb 2021 06:09:54 -0500
X-MC-Unique: 3qRNcBVSOGquKENtm_LgFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E198018449E9;
 Fri, 19 Feb 2021 11:09:53 +0000 (UTC)
Received: from thuth.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F207E46E64;
 Fri, 19 Feb 2021 11:09:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] gitlab-ci: Remove unused container images
Date: Fri, 19 Feb 2021 12:09:50 +0100
Message-Id: <20210219110950.2308025-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're building a lot of containers in the gitlab-CI that we never use.
This takes away network bandwidth and CPU time from other jobs for no
use, so let's remove them for now. The individual containers could be
re-added later when we really need them.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/containers.yml | 92 -------------------------------------
 1 file changed, 92 deletions(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 90fac85ce4..233d34c59b 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -53,13 +53,6 @@ amd64-debian11-container:
   variables:
     NAME: debian11
 
-alpha-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-alpha-cross
-
 amd64-debian-cross-container:
   <<: *container_job_definition
   stage: containers-layer2
@@ -88,13 +81,6 @@ arm64-debian-cross-container:
   variables:
     NAME: debian-arm64-cross
 
-arm64-test-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian11-container']
-  variables:
-    NAME: debian-arm64-test-cross
-
 armel-debian-cross-container:
   <<: *container_job_definition
   stage: containers-layer2
@@ -109,27 +95,6 @@ armhf-debian-cross-container:
   variables:
     NAME: debian-armhf-cross
 
-hppa-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-hppa-cross
-
-m68k-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-m68k-cross
-
-mips64-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-mips64-cross
-
 mips64el-debian-cross-container:
   <<: *container_job_definition
   stage: containers-layer2
@@ -151,20 +116,6 @@ mipsel-debian-cross-container:
   variables:
     NAME: debian-mipsel-cross
 
-powerpc-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-powerpc-cross
-
-ppc64-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-ppc64-cross
-
 ppc64el-debian-cross-container:
   <<: *container_job_definition
   stage: containers-layer2
@@ -172,13 +123,6 @@ ppc64el-debian-cross-container:
   variables:
     NAME: debian-ppc64el-cross
 
-riscv64-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-riscv64-cross
-
 s390x-debian-cross-container:
   <<: *container_job_definition
   stage: containers-layer2
@@ -186,37 +130,6 @@ s390x-debian-cross-container:
   variables:
     NAME: debian-s390x-cross
 
-sh4-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-sh4-cross
-
-sparc64-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-sparc64-cross
-
-tricore-debian-cross-container:
-  <<: *container_job_definition
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-tricore-cross
-
-xtensa-debian-cross-container:
-  <<: *container_job_definition
-  variables:
-    NAME: debian-xtensa-cross
-
-cris-fedora-cross-container:
-  <<: *container_job_definition
-  variables:
-    NAME: fedora-cris-cross
-
 amd64-fedora-container:
   <<: *container_job_definition
   variables:
@@ -237,11 +150,6 @@ win64-fedora-cross-container:
   variables:
     NAME: fedora-win64-cross
 
-amd64-ubuntu1804-container:
-  <<: *container_job_definition
-  variables:
-    NAME: ubuntu1804
-
 amd64-ubuntu2004-container:
   <<: *container_job_definition
   variables:
-- 
2.27.0


