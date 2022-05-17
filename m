Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 352BD52AC73
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 22:06:36 +0200 (CEST)
Received: from localhost ([::1]:51178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nr3Sf-0000rd-Gu
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 16:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KP-0003JS-H1
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nr3KN-0002Nb-RS
 for qemu-devel@nongnu.org; Tue, 17 May 2022 15:57:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652817475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n4rMKjuTyfhTVXUA8wvX7gj3znv0/0tqZWPjdoSb1aU=;
 b=A8rUA8hDAYg1TldmouSfA61Ue8opupPCosx4Kwdp76B3OIo4r2C2HVMrM4hXPtpzVcwnra
 hU+2nMdzIXge5t3fPBZPRuHVa52UWcWwLmBHMm/ZFAJaSdyHrqUV+8mvDJ5FIsPjxsjO+d
 MvEi+0jmE09AWRzBH2YIJOXkq9Zbg6A=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-RFRfhprNM52Y6f-mK3U4mA-1; Tue, 17 May 2022 15:57:54 -0400
X-MC-Unique: RFRfhprNM52Y6f-mK3U4mA-1
Received: by mail-il1-f198.google.com with SMTP id
 x3-20020a056e021bc300b002d13f8bad89so32645ilv.18
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 12:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n4rMKjuTyfhTVXUA8wvX7gj3znv0/0tqZWPjdoSb1aU=;
 b=Wi2Gx/zzL3coYIycGw0dkj+Q8gHVnif2KoWuzlgSLBwijLl7A7SQ00wrokLNJdJevg
 qflCxokyeE349MEc5cwCQ3cZ1LY0GcHx6Nea4C2z002ixuUvak3sBf7BL0xCqh+ksieL
 X78getlPeUKSCfycG4VHBT9lhJLGyt3HdS6Ig3CptEhZ0VgbTupk7Gr1meHoI5JecGhY
 OUjvKM5G/hIws4LVjj87uiCEWChJST0HjA93naMv9DhRXZBsRXAMiGHVSVQgzkF5KNeo
 WiuwMLTDBOzKn6K6OvkkxCHIYwQR/Z35ErNJjNbtPlEm49QpxJeJmiopVaovNvcbulxh
 R1qg==
X-Gm-Message-State: AOAM531x0WCbGFerNNvfaPmgiusz/d6M/r8SMJkN1lIgPEfPWJ3FDCWy
 StzLgz+LFzcUD+qnptJg35xm2SOwnXtKZbkRe+VyY4A5+aqjlxDRhAsMd8RJfebcCXn41K9d070
 +BusBkTzaedsp2yt+4DCIbrxq6ePtEtQ6tkOi5gDLDvQTk690QNBqpM83s1qX9mZv
X-Received: by 2002:a05:6e02:1aae:b0:2d1:258d:b5bd with SMTP id
 l14-20020a056e021aae00b002d1258db5bdmr5537004ilv.218.1652817473146; 
 Tue, 17 May 2022 12:57:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2Rvnl1WRx5+VzVflp+R/LGFuBR8SyCEV9/WOoaasBhbCqfMnNrkrsjniFeWa8tXBgj0AgKw==
X-Received: by 2002:a05:6e02:1aae:b0:2d1:258d:b5bd with SMTP id
 l14-20020a056e021aae00b002d1258db5bdmr5536988ilv.218.1652817472808; 
 Tue, 17 May 2022 12:57:52 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a056e020b4f00b002d125725709sm59575ilu.28.2022.05.17.12.57.51
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 May 2022 12:57:52 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v6 11/13] tests: Add postcopy tls migration test
Date: Tue, 17 May 2022 15:57:28 -0400
Message-Id: <20220517195730.32312-12-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220517195730.32312-1-peterx@redhat.com>
References: <20220517195730.32312-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We just added TLS tests for precopy but not postcopy.  Add the
corresponding test for vanilla postcopy.

Rename the vanilla postcopy to "postcopy/plain" because all postcopy tests
will only use unix sockets as channel.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 50 +++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d33e8060f9..e8304aa454 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -481,6 +481,10 @@ typedef struct {
     bool only_target;
     /* Use dirty ring if true; dirty logging otherwise */
     bool use_dirty_ring;
+    /* Whether use TLS channels for postcopy test? */
+    bool postcopy_tls;
+    /* Used only if postcopy_tls==true, to cache the data object */
+    void *postcopy_tls_data;
     const char *opts_source;
     const char *opts_target;
 } MigrateStart;
@@ -980,6 +984,10 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
         return -1;
     }
 
+    if (args->postcopy_tls) {
+        args->postcopy_tls_data = test_migrate_tls_psk_start_match(from, to);
+    }
+
     migrate_set_capability(from, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
@@ -1004,7 +1012,8 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     return 0;
 }
 
-static void migrate_postcopy_complete(QTestState *from, QTestState *to)
+static void migrate_postcopy_complete(QTestState *from, QTestState *to,
+                                      MigrateStart *args)
 {
     wait_for_migration_complete(from);
 
@@ -1015,19 +1024,38 @@ static void migrate_postcopy_complete(QTestState *from, QTestState *to)
         read_blocktime(to);
     }
 
+    if (args->postcopy_tls) {
+        assert(args->postcopy_tls_data);
+        test_migrate_tls_psk_finish(from, to, args->postcopy_tls_data);
+        args->postcopy_tls_data = NULL;
+    }
+
     test_migrate_end(from, to, true);
 }
 
-static void test_postcopy(void)
+static void test_postcopy_common(MigrateStart *args)
 {
-    MigrateStart args = {};
     QTestState *from, *to;
 
-    if (migrate_postcopy_prepare(&from, &to, &args)) {
+    if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
     }
     migrate_postcopy_start(from, to);
-    migrate_postcopy_complete(from, to);
+    migrate_postcopy_complete(from, to, args);
+}
+
+static void test_postcopy(void)
+{
+    MigrateStart args = { };
+
+    test_postcopy_common(&args);
+}
+
+static void test_postcopy_tls_psk(void)
+{
+    MigrateStart args = { .postcopy_tls = true };
+
+    test_postcopy_common(&args);
 }
 
 static void test_postcopy_recovery(void)
@@ -1089,7 +1117,7 @@ static void test_postcopy_recovery(void)
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
 
-    migrate_postcopy_complete(from, to);
+    migrate_postcopy_complete(from, to, &args);
 }
 
 static void test_baddest(void)
@@ -2133,7 +2161,15 @@ int main(int argc, char **argv)
 
     module_call_init(MODULE_INIT_QOM);
 
-    qtest_add_func("/migration/postcopy/unix", test_postcopy);
+    qtest_add_func("/migration/postcopy/plain", test_postcopy);
+#ifdef CONFIG_GNUTLS
+    /*
+     * NOTE: psk test is enough for postcopy, as other types of TLS
+     * channels are tested under precopy.  Here what we want to test is the
+     * general postcopy path that has TLS channel enabled.
+     */
+    qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
+#endif /* CONFIG_GNUTLS */
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
-- 
2.32.0


