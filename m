Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE5752516F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 17:41:11 +0200 (CEST)
Received: from localhost ([::1]:60642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npAwA-0008Hj-BA
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 11:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApb-0006Ag-E0
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1npApY-0003QW-8I
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652369659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n28Cd9eeQ1fEIqgdq9yvf+4QfWs332/Z2K07s3gYTqs=;
 b=E3qH+TSW4na5ulbUd1kw3kd1ZXvemztW5qXcuxSTfpkILi+forNLgKhQl0q8X9Y6PDAOhx
 C7vh/bRX8EaQJS7ZAGcWWGi43k50sZXk5aVpCXmFLa9ZfSfNz3XVzlS59NCb8Le7KkJ+Qe
 6bmq9e/pXXitRIMJ+P921le6pUNCf8c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-zpnq4FnVNT6MmjjV-qHaKw-1; Thu, 12 May 2022 11:34:17 -0400
X-MC-Unique: zpnq4FnVNT6MmjjV-qHaKw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E504100F84A;
 Thu, 12 May 2022 15:34:17 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBC20401E9D;
 Thu, 12 May 2022 15:34:16 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 05/10] .gitlab-ci.d: export meson testlog.txt as an artifact
Date: Thu, 12 May 2022 17:33:56 +0200
Message-Id: <20220512153401.202863-6-kwolf@redhat.com>
In-Reply-To: <20220512153401.202863-1-kwolf@redhat.com>
References: <20220512153401.202863-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

When running 'make check' we only get a summary of progress on the
console. Fortunately meson/ninja have saved the raw test output to a
logfile. Exposing this log will make it easier to debug failures that
happen in CI.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220509124134.867431-3-berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 2c7980a4f6..dc6d67aacf 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -26,7 +26,7 @@
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
       fi
 
-.native_test_job_template:
+.common_test_job_template:
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
@@ -37,8 +37,16 @@
     # Avoid recompiling by hiding ninja with NINJA=":"
     - make NINJA=":" $MAKE_CHECK_ARGS
 
+.native_test_job_template:
+  extends: .common_test_job_template
+  artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    expire_in: 7 days
+    paths:
+      - build/meson-logs/testlog.txt
+
 .avocado_test_job_template:
-  extends: .native_test_job_template
+  extends: .common_test_job_template
   cache:
     key: "${CI_JOB_NAME}-cache"
     paths:
-- 
2.35.3


