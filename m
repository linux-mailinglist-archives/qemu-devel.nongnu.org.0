Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B9833757F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 15:24:17 +0100 (CET)
Received: from localhost ([::1]:52874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKMEb-0003Pq-05
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 09:24:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKMCy-0001T8-TK
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:22:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKMCs-0003eA-R0
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 09:22:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615472548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KipaR9uybeRPFWxKWwERVr/KQTqixEPRTJ1E+RHHtBw=;
 b=KyLtjZm93S7vG8lhxJjmomKWdDbl4KRAbpF1Am/Wp/2EaooZH4ipYOuqVCTDP9DUw1qlEH
 ZK9BKZiCl63wJ9zRXm/sl780d5DxZIqghhCkip4Unz8mC883vaCLNzaqacAq5/jq0FfW68
 RHjMDEgc+Vx8tPbXLLRG5GzLbwhTQNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-fKecgFwCOVml_q1OS5Dd-A-1; Thu, 11 Mar 2021 09:22:24 -0500
X-MC-Unique: fKecgFwCOVml_q1OS5Dd-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78C1518D6A2C;
 Thu, 11 Mar 2021 14:22:23 +0000 (UTC)
Received: from thuth.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F236B2B175;
 Thu, 11 Mar 2021 14:22:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/4] gitlab-ci.yml: Move build-tools-and-docs-debian to a
 better place
Date: Thu, 11 Mar 2021 15:22:08 +0100
Message-Id: <20210311142211.1547864-2-thuth@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "build-tools-and-docs-debian" job had been added in between
the "check-system-debian" and the "accepance-system-debian" jobs
and thus separates the jobs that belong together. Move it away,
to the end of the file, next to the "pages" job that depends on it.
And while we're at it, also add a proper "needs:" line to the
job so that it can be started as soon as possible instead of always
waiting for the previous stage to finish.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 07202f6ffb..871ea45a5f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -167,19 +167,6 @@ check-system-debian:
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
-# No targets are built here, just tools, docs, and unit tests. This
-# also feeds into the eventual documentation deployment steps later
-build-tools-and-docs-debian:
-  <<: *native_build_job_definition
-  variables:
-    IMAGE: debian-amd64
-    MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
-    CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
-
 acceptance-system-debian:
   <<: *native_test_job_definition
   needs:
@@ -746,6 +733,21 @@ build-libvhost-user:
     - meson
     - ninja
 
+# No targets are built here, just tools, docs, and unit tests. This
+# also feeds into the eventual documentation deployment steps later
+build-tools-and-docs-debian:
+  <<: *native_build_job_definition
+  needs:
+    job: amd64-debian-container
+  variables:
+    IMAGE: debian-amd64
+    MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
+    CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+
 # Prepare for GitLab pages deployment. Anything copied into the
 # "public" directory will be deployed to $USER.gitlab.io/$PROJECT
 pages:
-- 
2.27.0


