Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB11566861
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:43:16 +0200 (CEST)
Received: from localhost ([::1]:55398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8g1U-0006B0-27
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwr-0006Cc-1s
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwp-0005yI-40
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmW8UbQqQ4AApkRAScaluto8oTlgQPHAozpoLlwqWgk=;
 b=imOcpy75X3eOeNo0VdkwmI2uqLRrC4juJiClyEbr1mG+TyGov6idONx08i3U6UhsgzJtj6
 n6K9AQvIirzWOPH84pZ/mFLmcb4CttQQ81E5ATDOPS7VQAdyeVqYNxNh0O/S2jOqxkk4+j
 9kKv8KhIYxvMpKCvDPro7wsgqqZ5Kic=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-0mdi6OqcMgSnLlc7nlYnQA-1; Tue, 05 Jul 2022 06:38:25 -0400
X-MC-Unique: 0mdi6OqcMgSnLlc7nlYnQA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09070811E75;
 Tue,  5 Jul 2022 10:38:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33E64492CA4;
 Tue,  5 Jul 2022 10:38:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 04/14] gitlab: tweak comments in edk2/opensbi jobs
Date: Tue,  5 Jul 2022 12:38:06 +0200
Message-Id: <20220705103816.608166-5-thuth@redhat.com>
In-Reply-To: <20220705103816.608166-1-thuth@redhat.com>
References: <20220705103816.608166-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Daniel P. Berrangé <berrange@redhat.com>

Get rid of comments stating the obvious and re-arrange remaining
comments. The opensbi split of rules for file matches is also
merged into one rule.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220629170638.520630-3-berrange@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/edk2.yml    | 14 ++++++++------
 .gitlab-ci.d/opensbi.yml | 15 ++++++++-------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index fbe763a282..905e02440f 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -1,17 +1,19 @@
 # All jobs needing docker-edk2 must use the same rules it uses.
 .edk2_job_rules:
-  rules: # Only run this job when ...
+  rules:
+    # Run if any files affecting the build output are touched
     - changes:
-        # this file is modified
         - .gitlab-ci.d/edk2.yml
-        # or the Dockerfile is modified
         - .gitlab-ci.d/edk2/Dockerfile
-        # or roms/edk2/ is modified (submodule updated)
         - roms/edk2/*
       when: on_success
-    - if: '$CI_COMMIT_REF_NAME =~ /^edk2/' # or the branch/tag starts with 'edk2'
+
+    # Run if the branch/tag starts with 'edk2'
+    - if: '$CI_COMMIT_REF_NAME =~ /^edk2/'
       when: on_success
-    - if: '$CI_COMMIT_MESSAGE =~ /edk2/i' # or last commit description contains 'EDK2'
+
+    # Run if last commit msg contains 'EDK2' (case insensitive)
+    - if: '$CI_COMMIT_MESSAGE =~ /edk2/i'
       when: on_success
 
 docker-edk2:
diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 0745ccdf10..753a003f93 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -1,18 +1,19 @@
 # All jobs needing docker-opensbi must use the same rules it uses.
 .opensbi_job_rules:
-  rules: # Only run this job when ...
+  rules:
+    # Run if any files affecting the build output are touched
     - changes:
-        # this file is modified
         - .gitlab-ci.d/opensbi.yml
-        # or the Dockerfile is modified
         - .gitlab-ci.d/opensbi/Dockerfile
-      when: on_success
-    - changes: # or roms/opensbi/ is modified (submodule updated)
         - roms/opensbi/*
       when: on_success
-    - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/' # or the branch/tag starts with 'opensbi'
+
+    # Run if the branch/tag starts with 'opensbi'
+    - if: '$CI_COMMIT_REF_NAME =~ /^opensbi/'
       when: on_success
-    - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i' # or last commit description contains 'OpenSBI'
+
+    # Run if the last commit msg contains 'OpenSBI' (case insensitive)
+    - if: '$CI_COMMIT_MESSAGE =~ /opensbi/i'
       when: on_success
 
 docker-opensbi:
-- 
2.31.1


