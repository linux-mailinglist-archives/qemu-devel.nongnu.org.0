Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 345312D7EDB
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:53:08 +0100 (CET)
Received: from localhost ([::1]:56156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnXO-0007ED-Sr
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knnJf-0005wI-Hl
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:38:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knnJd-0007pR-4K
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607711927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XY5EsdH3REq88DO76zxJfh0rPr8g0PUwwcu7odYnLjE=;
 b=HqVC0igkPThh31zzojpEoZda6CjEMv/hG5V9yPIA+Yes8d9G69gde+njAoU6LPqaRSFEGb
 pwTb7NTtShoxieHqiDwC9D5ACbr2sPw4ATr/In6wKjn4yZhL3gD4bdZp2EGFU2ePkxNISB
 roA30dkRG3AN9P4WxJm9vSU/qf51m5E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-6u7i7JNCPf6Q5LSKPOkAvw-1; Fri, 11 Dec 2020 13:38:45 -0500
X-MC-Unique: 6u7i7JNCPf6Q5LSKPOkAvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7934801817;
 Fri, 11 Dec 2020 18:38:44 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E5D410429F3;
 Fri, 11 Dec 2020 18:38:42 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] gitlab-ci: Archive logs of acceptance tests
Date: Fri, 11 Dec 2020 15:38:27 -0300
Message-Id: <20201211183827.915232-4-wainersm@redhat.com>
In-Reply-To: <20201211183827.915232-1-wainersm@redhat.com>
References: <20201211183827.915232-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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
Cc: willianr@redhat.com, alex.bennee@linaro.org, thuth@redhat.com,
 philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Keep the logs of acceptance tests for two days on GitLab. If you want
to make it available for more time, click on the 'Keep' button on
the Job page at web UI.

By default GitLab will archive artifacts only if the job succeed.
Instead let's keep it on both success and failure, so it gives the
opportunity to the developer/maintainer to check the error logs
as well as to the logs of CANCEL tests (not shown on the job logs).

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
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
2.28.0


