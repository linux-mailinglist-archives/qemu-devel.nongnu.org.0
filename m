Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2572D2DFC75
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 14:54:01 +0100 (CET)
Received: from localhost ([::1]:41714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krLdO-0007QR-Ku
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 08:53:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krLVC-0005Uc-Nb
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:45:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1krLVB-0003bq-25
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 08:45:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608558328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ky9ZI/Be6v8cyM1N11xoljc7y1E89nK8L1fh6C4xK3Y=;
 b=D7xqn6AY/OE2SQELm9INjj49e4fkcsVphz8iHkG6vNKgJRkg1C31ySy/FPZ6yksCxHGAUW
 0mtD9N59mlBZ7E4HZ23gBlDFouyd/I9jFv0SDaoXyu7MI6QZs3LzuvGM7UiG76tPV7qayt
 3xJfyvb5zveNUxU6EM6pVFrU55a0Rf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-a0nKbkx0MgGAZqTp69IKsg-1; Mon, 21 Dec 2020 08:45:24 -0500
X-MC-Unique: a0nKbkx0MgGAZqTp69IKsg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CF8910054FF;
 Mon, 21 Dec 2020 13:45:23 +0000 (UTC)
Received: from thuth.com (ovpn-113-232.ams2.redhat.com [10.36.113.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 962435D9CA;
 Mon, 21 Dec 2020 13:45:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 5/5] gitlab-ci: Archive logs of acceptance tests
Date: Mon, 21 Dec 2020 14:45:04 +0100
Message-Id: <20201221134504.764-6-thuth@redhat.com>
In-Reply-To: <20201221134504.764-1-thuth@redhat.com>
References: <20201221134504.764-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wainer dos Santos Moschetta <wainersm@redhat.com>

Keep the logs of acceptance tests for two days on GitLab. If you want
to make it available for more time, click on the 'Keep' button on
the Job page at web UI.

By default GitLab will archive artifacts only if the job succeed.
Instead let's keep it on both success and failure, so it gives the
opportunity to the developer/maintainer to check the error logs
as well as to the logs of CANCEL tests (not shown on the job logs).

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201211183827.915232-4-wainersm@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 85aa20ffde..bf3df843e2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -49,8 +49,12 @@ include:
       - ${CI_PROJECT_DIR}/avocado-cache
     policy: pull-push
   artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    when: always
+    expire_in: 2 days
     paths:
       - build/tests/results/latest/results.xml
+      - build/tests/results/latest/test-results
     reports:
       junit: build/tests/results/latest/results.xml
   before_script:
-- 
2.27.0


