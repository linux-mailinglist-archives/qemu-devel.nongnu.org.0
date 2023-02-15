Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1960697C04
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 13:42:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSH6K-000376-Cy; Wed, 15 Feb 2023 07:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSH6I-00036u-7S
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:41:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSH6G-00031y-MU
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 07:41:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676464886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=W2bWFXnxSXm3p6ku6c5ZTy/bxcUN8kx8nS3B4lj75KE=;
 b=Fc2bEPq3luxh3VLKqQ1UzOAhF1WCd6UXeUhrjDvr21V5uzO0qZ9Y1O0setbFCN6MwTQGo8
 GivXMLDBS7skZ3Dn/EbcSPfGq9+LnmsdAgyPZRPjJ14/TIxkfE/hfHyFuN5HPZEi18VlHr
 rWclTU8XHQaIOT15PixbBFfn6WDDjDM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-rzl0rsXNNaWsUsGzrENGPg-1; Wed, 15 Feb 2023 07:41:25 -0500
X-MC-Unique: rzl0rsXNNaWsUsGzrENGPg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D2A8884343;
 Wed, 15 Feb 2023 12:41:25 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 512122026D4B;
 Wed, 15 Feb 2023 12:41:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] tests/qtest/rtl8139-test: Make the test less verbose by
 default
Date: Wed, 15 Feb 2023 13:41:22 +0100
Message-Id: <20230215124122.72037-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

We are facing the issues that some test logs in the gitlab CI are
too big (and thus cut off). The rtl8139-test is one of the few qtests
that prints many lines of output by default when running with V=1, so
it contributes to this problem. Almost all other qtests are silent
with V=1 and only print debug messages with V=2 and higher. Thus let's
change the rtl8139-test to behave more like the other tests and only
print the debug messages with V=2 (or higher).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/rtl8139-test.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/rtl8139-test.c b/tests/qtest/rtl8139-test.c
index 8fa3313cc3..1beb83805c 100644
--- a/tests/qtest/rtl8139-test.c
+++ b/tests/qtest/rtl8139-test.c
@@ -12,6 +12,8 @@
 #include "libqos/pci-pc.h"
 #include "qemu/timer.h"
 
+static int verbosity_level;
+
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
 {
@@ -45,12 +47,16 @@ static QPCIDevice *get_device(void)
 static unsigned __attribute__((unused)) in_##name(void) \
 { \
     unsigned res = qpci_io_read##len(dev, dev_bar, (val));     \
-    g_test_message("*%s -> %x", #name, res); \
+    if (verbosity_level >= 2) { \
+        g_test_message("*%s -> %x", #name, res); \
+    } \
     return res; \
 } \
 static void out_##name(unsigned v) \
 { \
-    g_test_message("%x -> *%s", v, #name); \
+    if (verbosity_level >= 2) { \
+        g_test_message("%x -> *%s", v, #name); \
+    } \
     qpci_io_write##len(dev, dev_bar, (val), v);        \
 }
 
@@ -195,6 +201,11 @@ static void test_init(void)
 int main(int argc, char **argv)
 {
     int ret;
+    char *v_env = getenv("V");
+
+    if (v_env) {
+        verbosity_level = atoi(v_env);
+    }
 
     qtest_start("-device rtl8139");
 
-- 
2.31.1


