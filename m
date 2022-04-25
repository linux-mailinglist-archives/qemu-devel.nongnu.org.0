Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D195350ECDA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:51:21 +0200 (CEST)
Received: from localhost ([::1]:44384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8UC-0001ot-VV
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:51:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8Id-0007kZ-Cr
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IV-0007mV-Nr
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QH87Re7xe36gxEh/hBeSf4W8MAZ344BFMLvEumNToms=;
 b=IRhrzRD/LaEdPgVZnD8kzD7QLOMomDSODO877qF8f2r83+8GlZggqVuTwQ4I3nHTMjWKji
 o5xFWrPMzJ4pZxgTJjmW7Q5gzzqhcCZvUSgirbkMTaZd0HZdFfNVN+8LCWk6zvR/F38tCv
 NQJLGvze4LJllrpOIIlrBIjk1+odwdw=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-JUYsyVQmNcmTQ4FNrsD7ug-1; Mon, 25 Apr 2022 19:39:12 -0400
X-MC-Unique: JUYsyVQmNcmTQ4FNrsD7ug-1
Received: by mail-io1-f70.google.com with SMTP id
 y20-20020a5e8714000000b0065494b96af2so12522483ioj.10
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QH87Re7xe36gxEh/hBeSf4W8MAZ344BFMLvEumNToms=;
 b=FtC9mrfb4rdvrxG/gb72Ne7Z3T5pwBipApHMWh1gD9uuXpz9DRgZEuHbXu/EkIr8+X
 Ry5J7wZ3AvkzZ2Uenngmgn3Rk/3CslU0oY4RUT+6AT0ipvqFqzfueEEsqLuD/nzRcAK9
 r6yYDyTj8GgrbHcmLdwZJMeW/UTqhx77YB0jj27K0DBkd5J5PROcurNjyR7hMTGiF01s
 f2hsEC44Vbf1XTxVaQWDch0Y4ZZSJaRuucYDrANjTunQzmF1zSz6SfByWIQIzvarA51i
 D7qXaJG7YAVCO0tYNOL0CjnW6ajqTxyuDOfMQc0mvUazKfcO5Q6ySx0WWuo2rOfMQHuP
 rvAw==
X-Gm-Message-State: AOAM530g2hvdIbOn+kYqr+lhYmYdCVUXe89qFEI2oi/3QF+JVUyBXk+R
 kOzdFt7F2jVWr5rH0hL4PynoGpTfebZpmq7v3TpRmvqtdUlLhZ6rbaWOG2cEYOa3T1N4GyEdUP5
 8orhSag3fTFik8kLqS1tMjtD2l8fdx6vansxvH8JN58GJoq+uToHGqIpkUuoy621d
X-Received: by 2002:a05:6638:40a5:b0:326:3bad:fe1 with SMTP id
 m37-20020a05663840a500b003263bad0fe1mr8945138jam.127.1650929951901; 
 Mon, 25 Apr 2022 16:39:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+wJjjhgl7pOQ0uCaqDLOJNgFng51Bolxom7+1yLBA9rsYP140DvnEZCabCBZhfPO2MkhhFw==
X-Received: by 2002:a05:6638:40a5:b0:326:3bad:fe1 with SMTP id
 m37-20020a05663840a500b003263bad0fe1mr8945122jam.127.1650929951644; 
 Mon, 25 Apr 2022 16:39:11 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.39.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:39:11 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 19/21] tests: Add postcopy tls migration test
Date: Mon, 25 Apr 2022 19:38:45 -0400
Message-Id: <20220425233847.10393-20-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, T_SCC_BODY_TEXT_LINE=-0.01, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
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
index d9f444ea14..c32b350aea 100644
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
@@ -2132,7 +2160,15 @@ int main(int argc, char **argv)
 
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


