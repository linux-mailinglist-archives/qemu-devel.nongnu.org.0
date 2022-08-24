Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 489A659F4D7
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 10:13:42 +0200 (CEST)
Received: from localhost ([::1]:57108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQlW9-0004lf-1m
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 04:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQlSE-0001nw-53
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:09:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oQlSB-00049f-7b
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 04:09:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661328573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=L5KZwnYLedjY9IOYk0Fh07/1ljSDC6l11hcWy6tHmh0=;
 b=W2i+lOGsNyw6paihTgK+QhZ7LlnHIbDOtB8OzTr0hjFaPSL4W0rp9QlPItOjlQmAKcjsP9
 TN8Pbt5TgFrR6Ln4JlrjbRIjcMXjIqJM1rICwg0VcTxmbxLpbvNtJ+vuUibKjY2vt9W95k
 JKafH2uR4XQLhPrIVtts7GQkRKnm+Js=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-fcrDR7eRNrCMfEiB1NmP4g-1; Wed, 24 Aug 2022 04:09:30 -0400
X-MC-Unique: fcrDR7eRNrCMfEiB1NmP4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2964C80231E;
 Wed, 24 Aug 2022 08:09:30 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 927D91415125;
 Wed, 24 Aug 2022 08:09:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-trivial@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH] tests/avocado: Fix trivial typo
Date: Wed, 24 Aug 2022 10:09:26 +0200
Message-Id: <20220824080926.568935-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The intention was likely to use "intend" instead of "indent" here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index ed4853c805..26ebf01440 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -508,7 +508,7 @@ def default_kernel_params(self):
 class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
     """Facilitates having a cloud-image Linux based available.
 
-    For tests that indent to interact with guests, this is a better choice
+    For tests that intend to interact with guests, this is a better choice
     to start with than the more vanilla `QemuSystemTest` class.
     """
 
-- 
2.31.1


