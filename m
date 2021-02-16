Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE5A31CB43
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:39:24 +0100 (CET)
Received: from localhost ([::1]:55610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0ZW-0005Fp-5W
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:39:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC0Qo-0006D5-H6
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:30:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lC0Qi-0005fY-HO
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613482214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXllWfdR2UzOtOWnAsuMi+DpNdcLtfit06EzjR+wZLA=;
 b=VAG4pCVb9mRkF/m7sdbokESjq3K/C4cyI66OYVGNvVxPW9hzGmdfBEwQF8LytEy/UF1EnB
 2VrUMTLeRRH9hQFON49id07Q8Mrr8vgOhdH6s0PZOvKTjkRm4O3j6+fw6t1kyQULxUl0t2
 5teMoZ6FyQ2Rd5Vip9wCQZsTodZyZ1E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-Z4ktjCjhPV2tMgnJiZAWOQ-1; Tue, 16 Feb 2021 08:30:13 -0500
X-MC-Unique: Z4ktjCjhPV2tMgnJiZAWOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 120C5107ACC7;
 Tue, 16 Feb 2021 13:30:12 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-215.ams2.redhat.com
 [10.36.112.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 497245D9CC;
 Tue, 16 Feb 2021 13:30:10 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] gitlab: fix inconsistent indentation
Date: Tue, 16 Feb 2021 13:29:54 +0000
Message-Id: <20210216132954.295906-4-berrange@redhat.com>
In-Reply-To: <20210216132954.295906-1-berrange@redhat.com>
References: <20210216132954.295906-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The standard is to use 2 space indent, not 3.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.yml | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 32cc6bd4a2..870d5f83f5 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -282,14 +282,14 @@ check-system-opensuse:
     MAKE_CHECK_ARGS: check
 
 acceptance-system-opensuse:
-   <<: *native_test_job_definition
-   needs:
-     - job: build-system-opensuse
-       artifacts: true
-   variables:
-     IMAGE: opensuse-leap
-     MAKE_CHECK_ARGS: check-acceptance
-   <<: *acceptance_definition
+  <<: *native_test_job_definition
+  needs:
+    - job: build-system-opensuse
+      artifacts: true
+  variables:
+    IMAGE: opensuse-leap
+    MAKE_CHECK_ARGS: check-acceptance
+  <<: *acceptance_definition
 
 
 build-disabled:
-- 
2.29.2


