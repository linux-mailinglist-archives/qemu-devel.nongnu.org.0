Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C625057BC24
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 18:57:40 +0200 (CEST)
Received: from localhost ([::1]:39832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oED11-0007uT-VP
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 12:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oECwB-0000wN-6z
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 12:52:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oECw5-000320-Sy
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 12:52:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658335953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PtU3lLesfiUyZuCq6B6+f080Ignczx+P882hTIdTIs=;
 b=N465YOswLmmdq5zp1ppjRFHoI9qNWJehviMvJJmGpjP4FNbppNr+L6RxyuZrpEZMIEwvTA
 ocYVl8AzEveqo/Nay2bqvVwvav4RwAWNw9E2MmQ/V2FjhJGi4oyeKWejq8qM9rM9pYOVZx
 C1+uMSle5lyCKVm7q3cPYul/X4ltyQc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-OmBH9v3DMceR4dqU1La2Wg-1; Wed, 20 Jul 2022 12:52:14 -0400
X-MC-Unique: OmBH9v3DMceR4dqU1La2Wg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B63FA80029D;
 Wed, 20 Jul 2022 16:52:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 416591121319;
 Wed, 20 Jul 2022 16:52:12 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 3/3] gitlab: drop 'containers-layer2' stage
Date: Wed, 20 Jul 2022 17:51:59 +0100
Message-Id: <20220720165159.2036205-4-berrange@redhat.com>
In-Reply-To: <20220720165159.2036205-1-berrange@redhat.com>
References: <20220720165159.2036205-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since we express dependancies via a 'needs' clause, we don't need to
split container builds into separate stages. GitLab happily lets jobs
depend on other jobs in the same stage and will run them when possible.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/container-cross.yml | 24 ++++++++++++------------
 .gitlab-ci.d/stages.yml          |  1 -
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index b7963498a3..505b267542 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -1,20 +1,20 @@
 alpha-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-alpha-cross
 
 amd64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-amd64-cross
 
 amd64-debian-user-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-all-test-cross
@@ -65,21 +65,21 @@ hexagon-cross-container:
 
 hppa-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-hppa-cross
 
 m68k-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-m68k-cross
 
 mips64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips64-cross
@@ -92,7 +92,7 @@ mips64el-debian-cross-container:
 
 mips-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips-cross
@@ -105,7 +105,7 @@ mipsel-debian-cross-container:
 
 powerpc-test-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian11-container']
   variables:
     NAME: debian-powerpc-test-cross
@@ -127,7 +127,7 @@ riscv64-debian-cross-container:
 # we can however build TCG tests using a non-sid base
 riscv64-debian-test-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian11-container']
   variables:
     NAME: debian-riscv64-test-cross
@@ -140,21 +140,21 @@ s390x-debian-cross-container:
 
 sh4-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sh4-cross
 
 sparc64-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sparc64-cross
 
 tricore-debian-cross-container:
   extends: .container_job_template
-  stage: containers-layer2
+  stage: containers
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-tricore-cross
diff --git a/.gitlab-ci.d/stages.yml b/.gitlab-ci.d/stages.yml
index f50826018d..f92f57a27d 100644
--- a/.gitlab-ci.d/stages.yml
+++ b/.gitlab-ci.d/stages.yml
@@ -3,6 +3,5 @@
 #  - test (for test stages, using build artefacts from a build stage)
 stages:
   - containers
-  - containers-layer2
   - build
   - test
-- 
2.36.1


