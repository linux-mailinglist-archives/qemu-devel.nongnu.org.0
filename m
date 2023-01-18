Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 491B4671ABE
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 12:35:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI6is-0004pa-6y; Wed, 18 Jan 2023 06:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6iE-0004WE-Du
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pI6iB-0007Ww-7x
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 06:34:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674041673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rUI1av7f0g2uExD1Lyu4RFY+EhVO3FgxXyfRbXgNyd8=;
 b=i/UnBfiJQg95rW3ie//cUBrVcRNheBKn2cPdBI19jfsp6mVOgmcI2f4Jn0o2XdHlMFx9/p
 6qx6e+s49fbb6s5af8Cy/mvDZ9ggqKAA0SrPa7fM8brzguRAc9lJaW5xE3VPNzG9iPnqnr
 MDACAppGgMlgH0L1LQEoIFR9+l3M5zM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-GGsCyTCJPMu3Am_Lx8QVyQ-1; Wed, 18 Jan 2023 06:34:28 -0500
X-MC-Unique: GGsCyTCJPMu3Am_Lx8QVyQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B587857D0D;
 Wed, 18 Jan 2023 11:34:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7109A492B00;
 Wed, 18 Jan 2023 11:34:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 6/9] tests/qtest/e1000e-test: Fix the code style
Date: Wed, 18 Jan 2023 12:34:15 +0100
Message-Id: <20230118113418.1650416-7-thuth@redhat.com>
In-Reply-To: <20230118113418.1650416-1-thuth@redhat.com>
References: <20230118113418.1650416-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

igb implementation first starts off by copying e1000e code. Correct the
code style before that.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230114035919.35251-19-akihiko.odaki@daynix.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/e1000e-test.c   | 2 +-
 tests/qtest/libqos/e1000e.c | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/e1000e-test.c b/tests/qtest/e1000e-test.c
index 3fc92046be..b63a4d3c91 100644
--- a/tests/qtest/e1000e-test.c
+++ b/tests/qtest/e1000e-test.c
@@ -1,4 +1,4 @@
- /*
+/*
  * QTest testcase for e1000e NIC
  *
  * Copyright (c) 2015 Ravello Systems LTD (http://ravellosystems.com)
diff --git a/tests/qtest/libqos/e1000e.c b/tests/qtest/libqos/e1000e.c
index 37c794b130..b90eb2d5e0 100644
--- a/tests/qtest/libqos/e1000e.c
+++ b/tests/qtest/libqos/e1000e.c
@@ -222,8 +222,10 @@ static void e1000e_register_nodes(void)
         .device_id = E1000_DEV_ID_82574L,
     };
 
-    /* FIXME: every test using this node needs to setup a -netdev socket,id=hs0
-     * otherwise QEMU is not going to start */
+    /*
+     * FIXME: every test using this node needs to setup a -netdev socket,id=hs0
+     * otherwise QEMU is not going to start
+     */
     QOSGraphEdgeOptions opts = {
         .extra_device_opts = "netdev=hs0",
     };
-- 
2.31.1


