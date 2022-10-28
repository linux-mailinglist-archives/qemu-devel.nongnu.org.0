Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09646112A9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 15:27:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooPLw-0002Me-CS; Fri, 28 Oct 2022 09:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKm-0001KW-I7
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooPKk-0005KX-Eq
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 09:23:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666963416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wk03lK5jdsc7QT1Rksxl7qwA43EAuSZh6g9GBrYVsm8=;
 b=RSuvGkk2wSBFiHUpZa15ge9ahQ3nx1Vge0MZi+VIZUeZPmQK2cvv8B4/JGPJ0Pv8/Qwx+6
 b2e7eEHFzJu8YTgAwady6ObC09B/KUvO5bMvAF7TxE/JF+IXnJp+VJChXC4UsR2i6OC3tj
 I/sCqaiNPyfgaI5hkOHHhKrr/3cU1x4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-j-oVUagrM2SrF6b_jb-P3Q-1; Fri, 28 Oct 2022 09:23:34 -0400
X-MC-Unique: j-oVUagrM2SrF6b_jb-P3Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 420A13817A79;
 Fri, 28 Oct 2022 13:23:34 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0889E1121319;
 Fri, 28 Oct 2022 13:23:32 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 16/21] tests/qtest: device-plug-test: Reverse the usage of
 double/single quotes
Date: Fri, 28 Oct 2022 15:22:59 +0200
Message-Id: <20221028132304.829103-17-thuth@redhat.com>
In-Reply-To: <20221028132304.829103-1-thuth@redhat.com>
References: <20221028132304.829103-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

The usage of double/single quotes in test_q35_pci_unplug_json_request()
should be reversed to work on both win32 and non-win32 platforms:

- The value of -device parameter needs to be surrounded by "" as
  Windows does not drop '' when passing it to QEMU which causes
  QEMU command line option parser failure.
- The JSON key/value pairs need to be surrounded by '' to make the
  JSON parser happy on Windows.

Fixes: a12f1a7e56b7 ("tests/x86: Add subtest with 'q35' machine type to device-plug-test")
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221028045736.679903-5-bin.meng@windriver.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/device-plug-test.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 3f44f731d1..5a6afa2b57 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -112,16 +112,16 @@ static void test_pci_unplug_json_request(void)
 
 static void test_q35_pci_unplug_json_request(void)
 {
-    const char *port = "-device '{\"driver\": \"pcie-root-port\", "
-                                      "\"id\": \"p1\"}'";
+    const char *port = "-device \"{'driver': 'pcie-root-port', "
+                                  "'id': 'p1'}\"";
 
-    const char *bridge = "-device '{\"driver\": \"pcie-pci-bridge\", "
-                                   "\"id\": \"b1\", "
-                                   "\"bus\": \"p1\"}'";
+    const char *bridge = "-device \"{'driver': 'pcie-pci-bridge', "
+                                    "'id': 'b1', "
+                                    "'bus': 'p1'}\"";
 
-    const char *device = "-device '{\"driver\": \"virtio-mouse-pci\", "
-                                   "\"bus\": \"b1\", "
-                                   "\"id\": \"dev0\"}'";
+    const char *device = "-device \"{'driver': 'virtio-mouse-pci', "
+                                    "'bus': 'b1', "
+                                    "'id': 'dev0'}\"";
 
     QTestState *qtest = qtest_initf("-machine q35 %s %s %s",
                                     port, bridge, device);
-- 
2.31.1


