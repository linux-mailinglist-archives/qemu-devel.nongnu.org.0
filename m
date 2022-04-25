Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1520050ECD4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:48:50 +0200 (CEST)
Received: from localhost ([::1]:35824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8Rl-0004UK-5d
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IJ-00072n-OM
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IH-0007k1-Qr
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CT/FgeDFU3KaQ+xOqXSypN9L0YEqphcA8dJYQb7JqyY=;
 b=cPHojK0HdG6RRuFtVEqeJYTTmmN81b3ewBq1sxe9rj55VOHoA7Tps6W+P79FDsZj89XrSn
 SZPFHfpEFQDf8N7yhyjqFahcjxGhmsNI7hhCYz39Q+uAiJusH1f6BvUOAXJ1LH8iiLUbLi
 HooEqAsDj1rEOJ8xMVJ85btjOrIijN8=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-MD15zIeMMCmQCQdnhwBfyA-1; Mon, 25 Apr 2022 19:38:59 -0400
X-MC-Unique: MD15zIeMMCmQCQdnhwBfyA-1
Received: by mail-io1-f71.google.com with SMTP id
 k20-20020a5e9314000000b00649d55ffa67so12528367iom.20
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:38:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CT/FgeDFU3KaQ+xOqXSypN9L0YEqphcA8dJYQb7JqyY=;
 b=YFIE/EHNu+8SEIlzgYe9blWzBAt5YJ4kKJx4VWk21isEVyXarRXZzzgjrRwYmA7TVw
 mIJu7tacYNbpI8oXT4RHCUJEcEy+Z2mLAMKOBseSaYrRsXSxd6EQFvS5XoLusm9R0JY2
 vO5mXrnsIEyIUh4R5NEf28gVijionJrpEwWrjV/N+jLz0epSgvu4LNL4Kv8BPh26ZxMZ
 NGU61qBp12BCvmnwSVRyffiRYPYBgPaHa/sXnyH2eHaLQmYhwSXbDDRQjwTFCtStJb/3
 isfrMkn66Yqv3WtA+m8S9Bgx/GOzrG/A8nSUnGh26dul6jiLvnbj/kenZzCaB9vUlBMx
 W7mg==
X-Gm-Message-State: AOAM532qb2KzSlNETMyt41Sp/gcRhdBwgwzIvuoA/E/tz/7b8AUyu8o+
 vBawhxpy/ZarpU7YiDPLc2hdEzthHgK96T9rc0glC/fYDaCrDd/E2jn0qJPcV/zRJc4tkouNF+K
 2tCzmeo8NtCDIe0ArcWvBVlvSu0V8hYOJ1RE7Ah5TIcezAh1xjmKYP2w5ER9AyR4w
X-Received: by 2002:a05:6602:1481:b0:657:2836:587c with SMTP id
 a1-20020a056602148100b006572836587cmr8419801iow.194.1650929939132; 
 Mon, 25 Apr 2022 16:38:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcaZHM9xnjrIVPoYdaI1vWPpxbJ8WogWHNTCMdjAR0BFlnQTuVPbtnFu6wz/cXDF0xZuBdMw==
X-Received: by 2002:a05:6602:1481:b0:657:2836:587c with SMTP id
 a1-20020a056602148100b006572836587cmr8419786iow.194.1650929938890; 
 Mon, 25 Apr 2022 16:38:58 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.38.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:38:58 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/21] tests: add multifd migration tests of TLS with x509
 credentials
Date: Mon, 25 Apr 2022 19:38:34 -0400
Message-Id: <20220425233847.10393-9-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Daniel P. Berrangé <berrange@redhat.com>

This validates that we correctly handle multifd migration success
and failure scenarios when using TLS with x509 certificates. There
are quite a few different scenarios that matter in relation to
hostname validation, but we skip a couple as we can assume that
the non-multifd coverage applies to some extent.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-test.c | 127 +++++++++++++++++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index f47e4797e2..5ea0b9360a 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1832,6 +1832,48 @@ test_migrate_multifd_tcp_tls_psk_start_mismatch(QTestState *from,
     return test_migrate_tls_psk_start_mismatch(from, to);
 }
 
+#ifdef CONFIG_TASN1
+static void *
+test_migrate_multifd_tls_x509_start_default_host(QTestState *from,
+                                                 QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_x509_start_default_host(from, to);
+}
+
+static void *
+test_migrate_multifd_tls_x509_start_override_host(QTestState *from,
+                                                  QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_x509_start_override_host(from, to);
+}
+
+static void *
+test_migrate_multifd_tls_x509_start_mismatch_host(QTestState *from,
+                                                  QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_x509_start_mismatch_host(from, to);
+}
+
+static void *
+test_migrate_multifd_tls_x509_start_allow_anon_client(QTestState *from,
+                                                      QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_x509_start_allow_anon_client(from, to);
+}
+
+static void *
+test_migrate_multifd_tls_x509_start_reject_anon_client(QTestState *from,
+                                                       QTestState *to)
+{
+    test_migrate_precopy_tcp_multifd_start_common(from, to, "none");
+    return test_migrate_tls_x509_start_reject_anon_client(from, to);
+}
+#endif /* CONFIG_TASN1 */
+
 static void test_multifd_tcp_tls_psk_match(void)
 {
     MigrateCommon args = {
@@ -1855,6 +1897,79 @@ static void test_multifd_tcp_tls_psk_mismatch(void)
     };
     test_precopy_common(&args);
 }
+
+#ifdef CONFIG_TASN1
+static void test_multifd_tcp_tls_x509_default_host(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tls_x509_start_default_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+    test_precopy_common(&args);
+}
+
+static void test_multifd_tcp_tls_x509_override_host(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tls_x509_start_override_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+    test_precopy_common(&args);
+}
+
+static void test_multifd_tcp_tls_x509_mismatch_host(void)
+{
+    /*
+     * This has different behaviour to the non-multifd case.
+     *
+     * In non-multifd case when client aborts due to mismatched
+     * cert host, the server has already started trying to load
+     * migration state, and so it exits with I/O  failure.
+     *
+     * In multifd case when client aborts due to mismatched
+     * cert host, the server is still waiting for the other
+     * multifd connections to arrive so hasn't started trying
+     * to load migration state, and thus just aborts the migration
+     * without exiting
+     */
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tls_x509_start_mismatch_host,
+        .finish_hook = test_migrate_tls_x509_finish,
+        .result = MIG_TEST_FAIL,
+    };
+    test_precopy_common(&args);
+}
+
+static void test_multifd_tcp_tls_x509_allow_anon_client(void)
+{
+    MigrateCommon args = {
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tls_x509_start_allow_anon_client,
+        .finish_hook = test_migrate_tls_x509_finish,
+    };
+    test_precopy_common(&args);
+}
+
+static void test_multifd_tcp_tls_x509_reject_anon_client(void)
+{
+    MigrateCommon args = {
+        .start = {
+            .hide_stderr = true,
+        },
+        .listen_uri = "defer",
+        .start_hook = test_migrate_multifd_tls_x509_start_reject_anon_client,
+        .finish_hook = test_migrate_tls_x509_finish,
+        .result = MIG_TEST_FAIL,
+    };
+    test_precopy_common(&args);
+}
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
 /*
@@ -2082,6 +2197,18 @@ int main(int argc, char **argv)
                    test_multifd_tcp_tls_psk_match);
     qtest_add_func("/migration/multifd/tcp/tls/psk/mismatch",
                    test_multifd_tcp_tls_psk_mismatch);
+#ifdef CONFIG_TASN1
+    qtest_add_func("/migration/multifd/tcp/tls/x509/default-host",
+                   test_multifd_tcp_tls_x509_default_host);
+    qtest_add_func("/migration/multifd/tcp/tls/x509/override-host",
+                   test_multifd_tcp_tls_x509_override_host);
+    qtest_add_func("/migration/multifd/tcp/tls/x509/mismatch-host",
+                   test_multifd_tcp_tls_x509_mismatch_host);
+    qtest_add_func("/migration/multifd/tcp/tls/x509/allow-anon-client",
+                   test_multifd_tcp_tls_x509_allow_anon_client);
+    qtest_add_func("/migration/multifd/tcp/tls/x509/reject-anon-client",
+                   test_multifd_tcp_tls_x509_reject_anon_client);
+#endif /* CONFIG_TASN1 */
 #endif /* CONFIG_GNUTLS */
 
     if (kvm_dirty_ring_supported()) {
-- 
2.32.0


