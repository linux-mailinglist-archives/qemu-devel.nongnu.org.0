Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1074B833D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 09:48:38 +0100 (CET)
Received: from localhost ([::1]:42952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKFzJ-0005Jo-6e
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 03:48:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDq1-0006v3-QU
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDpz-0006iq-7m
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644993050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pw4Ya1U/DRCke3Ko0pEWT0PjTe4tXXv9qiy5ynKCT6Y=;
 b=dns6RAGZJKpuolaFIx1uuUHcKE9Uwd/tFRMHIfEY2k87gyw1tEkBk86fBOVUFXsYTcB+V5
 FWjlVYwyho9YDBymjca0JcjyoAkl3yDyWcEkwBd1VbP2qdCHDlzGzFM0/wfZdxR1pWEaVa
 C/RdoCRVSFBJVxRRHpM2Sk+rsRwLafo=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-c27Kg6wUNk-xyq_lfq5GCg-1; Wed, 16 Feb 2022 01:30:49 -0500
X-MC-Unique: c27Kg6wUNk-xyq_lfq5GCg-1
Received: by mail-pj1-f69.google.com with SMTP id
 w3-20020a17090ac98300b001b8b914e91aso979116pjt.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Pw4Ya1U/DRCke3Ko0pEWT0PjTe4tXXv9qiy5ynKCT6Y=;
 b=qR0vnV2Hn0Y5P5+3W1OqRxGIbJpLdrfEWjqbyWhtq9slGvXbQ8mtjhUoskgldR1Yto
 UceD608grU/eVIoybJPs4vQTQ7Kz6QovuxcZ50vud3TGRMHSIpaaZGZupHPdlvO8xLZ7
 ZaNAcOg8eMgL7FcyYM2UrFDM2Np98bwavJMFi643jQnij5kji9xWxlw2k0g3w5aVPXTK
 h/XLy2bR/2Mt5OTqb210y3QuiOUqZZq3VlTzUR/jNMejAHdb+7poDoDQlKExAwcmasQv
 8EMREN/wgphG44wb0HbJxD5lM4dsLgDjFYyEDRSlt8JUMMtbVE313HgI6AmZo5N+QIUB
 LqzQ==
X-Gm-Message-State: AOAM532nTwzvAWudxFwmSInSSa0PP69neLtdIJdOwW7HvhrORhVNWExX
 1xj+pkbAXYea9ID7DeQUG8amtmB3tfuIMj4KH7j26ZdKQNLySXnUdXofj0gaJl+IRMUake2J7Vq
 CA14gVHLr65ppzFlC5+I99bT8Sg5+4QeBoALb6eu/d2fa3FetcYWJqwxGnieTRA+6
X-Received: by 2002:a17:902:d50b:b0:14d:ca2b:1b59 with SMTP id
 b11-20020a170902d50b00b0014dca2b1b59mr1513223plg.22.1644993048282; 
 Tue, 15 Feb 2022 22:30:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHYzSxqWDeB3/+WsjZoem7hQc/LsKox76x3jYm3sxHrza1nSFZVrh5zmlpcq13Hg2k4dShDw==
X-Received: by 2002:a17:902:d50b:b0:14d:ca2b:1b59 with SMTP id
 b11-20020a170902d50b00b0014dca2b1b59mr1513205plg.22.1644993047909; 
 Tue, 15 Feb 2022 22:30:47 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.30.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:30:47 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/20] tests: Add postcopy preempt test
Date: Wed, 16 Feb 2022 14:28:09 +0800
Message-Id: <20220216062809.57179-21-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two tests are added: a normal postcopy preempt test, and a recovery test.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 39 ++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7b42f6fd90..5053b40589 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -470,6 +470,7 @@ typedef struct {
      */
     bool hide_stderr;
     bool use_shmem;
+    bool postcopy_preempt;
     /* only launch the target process */
     bool only_target;
     /* Use dirty ring if true; dirty logging otherwise */
@@ -673,6 +674,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
 
+    if (args->postcopy_preempt) {
+        migrate_set_capability(from, "postcopy-preempt", true);
+        migrate_set_capability(to, "postcopy-preempt", true);
+    }
+
     /* We want to pick a speed slow enough that the test completes
      * quickly, but that it doesn't complete precopy even on a slow
      * machine, so also set the downtime.
@@ -719,13 +725,29 @@ static void test_postcopy(void)
     migrate_postcopy_complete(from, to);
 }
 
-static void test_postcopy_recovery(void)
+static void test_postcopy_preempt(void)
+{
+    MigrateStart *args = migrate_start_new();
+    QTestState *from, *to;
+
+    args->postcopy_preempt = true;
+
+    if (migrate_postcopy_prepare(&from, &to, args)) {
+        return;
+    }
+    migrate_postcopy_start(from, to);
+    migrate_postcopy_complete(from, to);
+}
+
+/* @preempt: whether to use postcopy-preempt */
+static void test_postcopy_recovery(bool preempt)
 {
     MigrateStart *args = migrate_start_new();
     QTestState *from, *to;
     g_autofree char *uri = NULL;
 
     args->hide_stderr = true;
+    args->postcopy_preempt = preempt;
 
     if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
@@ -781,6 +803,16 @@ static void test_postcopy_recovery(void)
     migrate_postcopy_complete(from, to);
 }
 
+static void test_postcopy_recovery_normal(void)
+{
+    test_postcopy_recovery(false);
+}
+
+static void test_postcopy_recovery_preempt(void)
+{
+    test_postcopy_recovery(true);
+}
+
 static void test_baddest(void)
 {
     MigrateStart *args = migrate_start_new();
@@ -1458,7 +1490,10 @@ int main(int argc, char **argv)
     module_call_init(MODULE_INIT_QOM);
 
     qtest_add_func("/migration/postcopy/unix", test_postcopy);
-    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery_normal);
+    qtest_add_func("/migration/postcopy/preempt/unix", test_postcopy_preempt);
+    qtest_add_func("/migration/postcopy/preempt/recovery",
+                   test_postcopy_recovery_preempt);
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix", test_precopy_unix);
     qtest_add_func("/migration/precopy/tcp", test_precopy_tcp);
-- 
2.32.0


