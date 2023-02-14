Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE36469626F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:26:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtOX-00081v-DN; Tue, 14 Feb 2023 06:22:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtOR-0007sO-Om
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtOC-0002Ny-Hz
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qe7a2aGWYQpAKccN1WxYVT/DsbvqX8in3IWprtkArgQ=;
 b=fKxt4vGL+1eJY4POFeDdhykpRqilDqsEzfs0dSE+xz/SWaE8NIHemSimTrE8t7Flb91P3g
 Sk2VOft0Q2/ir+rBI6xO+gLo0nT55rFTW95ymlOmRTbWARUDK2hraKWjkCfgJ2YzgEqdgI
 8aa2J3IzUCh5/K837BN9U5ftkK5tH5I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-XKEr7VF2Maq3Xs4IiZKm-A-1; Tue, 14 Feb 2023 06:22:13 -0500
X-MC-Unique: XKEr7VF2Maq3Xs4IiZKm-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95B16181E3EE;
 Tue, 14 Feb 2023 11:22:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEA3A40B40C9;
 Tue, 14 Feb 2023 11:22:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>
Subject: [PULL 13/22] test/qtest: Fix coding style in device-plug-test.c
Date: Tue, 14 Feb 2023 12:21:39 +0100
Message-Id: <20230214112148.646077-14-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
References: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

From: Fabiano Rosas <farosas@suse.de>

We should not mix declarations and statements in QEMU code.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
Message-Id: <20230208194700.11035-7-farosas@suse.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/device-plug-test.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/device-plug-test.c b/tests/qtest/device-plug-test.c
index 5a6afa2b57..4f92617335 100644
--- a/tests/qtest/device-plug-test.c
+++ b/tests/qtest/device-plug-test.c
@@ -64,6 +64,7 @@ static void process_device_remove(QTestState *qtest, const char *id)
 
 static void test_pci_unplug_request(void)
 {
+    QTestState *qtest;
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
@@ -71,8 +72,8 @@ static void test_pci_unplug_request(void)
         machine_addition = "-machine pc";
     }
 
-    QTestState *qtest = qtest_initf("%s -device virtio-mouse-pci,id=dev0",
-                                    machine_addition);
+    qtest = qtest_initf("%s -device virtio-mouse-pci,id=dev0",
+                        machine_addition);
 
     process_device_remove(qtest, "dev0");
 
@@ -94,6 +95,7 @@ static void test_q35_pci_unplug_request(void)
 
 static void test_pci_unplug_json_request(void)
 {
+    QTestState *qtest;
     const char *arch = qtest_get_arch();
     const char *machine_addition = "";
 
@@ -101,7 +103,7 @@ static void test_pci_unplug_json_request(void)
         machine_addition = "-machine pc";
     }
 
-    QTestState *qtest = qtest_initf(
+    qtest = qtest_initf(
         "%s -device \"{'driver': 'virtio-mouse-pci', 'id': 'dev0'}\"",
         machine_addition);
 
-- 
2.31.1


