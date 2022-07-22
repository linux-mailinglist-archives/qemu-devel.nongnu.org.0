Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EAE57E212
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 15:09:01 +0200 (CEST)
Received: from localhost ([::1]:52346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEsOp-0001aV-3J
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 09:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEsKq-0005jB-SI
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEsKp-0000xe-6S
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:04:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658495090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wLSWqfjBhb/1ihV9VTVhdOY3bfxvwE8K4ZskLAfFylE=;
 b=gABY7eFyG3vrumtsTWxyfQWcJspJXBc8qvt1RL1VfYDHjNRIx3b3GDXeNwLQ3awfqZO+/X
 mq9Ze0Ozqx/aXzDoqYuk0jVmGKziwqDSG+eyNel1dVvG29MJYnIQN7QsW8S++yBPn3mJd/
 Ui3nEZwn1RK2TMpT7nsbmJu7h6Jj58M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-6-v3RZWDqHNMmZW5w5Zo6cDw-1; Fri, 22 Jul 2022 09:04:38 -0400
X-MC-Unique: v3RZWDqHNMmZW5w5Zo6cDw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 411EA101A586;
 Fri, 22 Jul 2022 13:04:38 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2136492C3B;
 Fri, 22 Jul 2022 13:04:36 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 3/3] gitlab: drop 'containers-layer2' stage
Date: Fri, 22 Jul 2022 14:04:31 +0100
Message-Id: <20220722130431.2319019-4-berrange@redhat.com>
In-Reply-To: <20220722130431.2319019-1-berrange@redhat.com>
References: <20220722130431.2319019-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

Acked-by: Thomas Huth <thuth@redhat.com>
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


