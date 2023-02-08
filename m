Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3376768F857
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 20:50:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPqRg-0000jc-So; Wed, 08 Feb 2023 14:49:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPqRU-0000WQ-5K
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:49:20 -0500
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1pPqRS-00029s-Oy
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 14:49:19 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B549A204C8;
 Wed,  8 Feb 2023 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675885756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2g1+kQhjpByv+mFsWvtFRGNKbGq3IAYJvv3KGAB81A=;
 b=ULu2fQegugbCDaDfh2yLGTDkheG0QtWVzwnOEMs/OPo9AtqKFxt6omlpFXq/keTPN9EpOw
 dzfDus49wjMQSq5meEThAtf0tS2mcKguKkYcfYIxvBVbrg05Hq7QChYxiWJGbYR3WzNOl+
 yqvisKHctFY6d3zhy6nEQwoo7r74pH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675885756;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2g1+kQhjpByv+mFsWvtFRGNKbGq3IAYJvv3KGAB81A=;
 b=AmrPCQoN5HLapTuyp16Ch6r1HxnAoP1wn6wq2CrQWGwa5Y+UDhMuW8gcjvx9oBBAif51an
 A5xaasgeX8wBE9BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6469913425;
 Wed,  8 Feb 2023 19:49:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qNSQC7v842OZIwAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 08 Feb 2023 19:49:15 +0000
From: Fabiano Rosas <farosas@suse.de>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 06/12] test/qtest: Fix coding style in device-plug-test.c
Date: Wed,  8 Feb 2023 16:46:54 -0300
Message-Id: <20230208194700.11035-7-farosas@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230208194700.11035-1-farosas@suse.de>
References: <20230208194700.11035-1-farosas@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:67c:2178:6::1d; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

We should not mix declarations and statements in QEMU code.

Signed-off-by: Fabiano Rosas <farosas@suse.de>
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
2.35.3


