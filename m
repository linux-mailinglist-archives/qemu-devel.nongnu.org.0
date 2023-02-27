Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761906A40CC
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:38:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbo8-0005QE-VQ; Mon, 27 Feb 2023 06:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbo0-0005Oc-Np
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbny-0005ce-M0
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BvdedQHE2XFHgWmaM09tYUZ1I/EqK7zCoouJXMb+WOQ=;
 b=FVJMK9/L6/oUnkmcviTR3TFSEPX4KaK6Ig6gpuQ3wRVB1IPQA6MFDcJYFr2BF/AKrq1lLd
 CkpKcjOp3BjmMNYjpmp/oGezUK/h5czcIyl+8wOrce91n+PimDj0pGicx7sdma+hfCk9HQ
 syFCeaeyECBYyuFqMMnG2kciECaZxgA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-100-MinSBph2ONq-lZQN3nh7Nw-1; Mon, 27 Feb 2023 06:36:25 -0500
X-MC-Unique: MinSBph2ONq-lZQN3nh7Nw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5462185CBE2;
 Mon, 27 Feb 2023 11:36:25 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 93A661121314;
 Mon, 27 Feb 2023 11:36:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 01/33] tests/qtest/rtl8139-test: Make the test less verbose by
 default
Date: Mon, 27 Feb 2023 12:35:49 +0100
Message-Id: <20230227113621.58468-2-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

We are facing the issues that some test logs in the gitlab CI are
too big (and thus cut off). The rtl8139-test is one of the few qtests
that prints many lines of output by default when running with V=1, so
it contributes to this problem. Almost all other qtests are silent
with V=1 and only print debug messages with V=2 and higher. Thus let's
change the rtl8139-test to behave more like the other tests and only
print the debug messages with V=2 (or higher).

Message-Id: <20230215124122.72037-1-thuth@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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


