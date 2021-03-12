Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E20F3395FA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:16:16 +0100 (CET)
Received: from localhost ([::1]:36172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmKd-00039o-9N
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:16:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWF-0007Mo-1p
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lKlWC-0000eS-U2
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:24:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615569848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l2bWP9aI2Klknc3gKnUmWw+Ss+qoM5cSP7xG5mri9H4=;
 b=h5oz81/EaFzRPMEijohSV7cITC2kz7o4nxROEChQqmCv8Cted7RxgzS+nOmjxNsqAzKP0G
 WmujAGtn7QEWId6slOuB0S6eO9CG3RGKjyzqdxFNa1RLKG/7AZGNmVN5MM6xDAusVuxXqO
 nZFz/CcHYN/RN1OMBnm412iHjT72y0E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-nIs7G4XFPIytWpVqkVnezA-1; Fri, 12 Mar 2021 12:24:05 -0500
X-MC-Unique: nIs7G4XFPIytWpVqkVnezA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5B06C100C661;
 Fri, 12 Mar 2021 17:24:04 +0000 (UTC)
Received: from thuth.com (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B51319744;
 Fri, 12 Mar 2021 17:24:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/9] gitlab-ci.yml: Move build-tools-and-docs-debian to a
 better place
Date: Fri, 12 Mar 2021 18:23:50 +0100
Message-Id: <20210312172356.968219-4-thuth@redhat.com>
In-Reply-To: <20210312172356.968219-1-thuth@redhat.com>
References: <20210312172356.968219-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "build-tools-and-docs-debian" job had been added in between
the "check-system-debian" and the "accepance-system-debian" jobs
and thus separates the jobs that belong together. Move it away,
to the end of the file, next to the "pages" job that depends on it.
And while we're at it, also add a proper "needs:" line to the
job so that it can be started as soon as possible instead of always
waiting for the previous stage to finish.

Message-Id: <20210311142211.1547864-2-thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


