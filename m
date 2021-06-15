Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C0C3A8827
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:57:17 +0200 (CEST)
Received: from localhost ([::1]:34684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltDJM-0003v0-I6
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltDHh-0001wt-1k
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:55:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltDHe-0004G1-Q2
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:55:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623779730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SQdHEsrkL9L9ny9KaNd0CwETbAXSirv2mFrCCT74s9I=;
 b=OrSJlmmRUvNd0AyAu4IA6kQCiE6Y+z5KWstwQsahDAg2m5JyFcosiZLNk5uqDrAahL/ewM
 f0ufBhx6XKefUehqEo/ouevpWj+g821VnmNUo+wxe1UEAUkzQnNiHp34nambk3tMWRHYeH
 ykpwT5Ymp8JhU0Nu4oz3CRithT/0lfg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-Bx7zC9_pNTCw58aGC3j5jQ-1; Tue, 15 Jun 2021 13:55:29 -0400
X-MC-Unique: Bx7zC9_pNTCw58aGC3j5jQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 n3-20020a0cee630000b029020e62abfcbdso102590qvs.16
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SQdHEsrkL9L9ny9KaNd0CwETbAXSirv2mFrCCT74s9I=;
 b=KQMbyOOhugOfLDJZPzgbBQbId6eCd4UbNY6RgVeTMAzepinJrMRy3j+UoPYcnWjyxS
 nl7Gxq/yrbU7qOUc/4arhWZS9y/Mi5lB0ixyTFGfT8l2xQciXZazdaXsEEX1cMY583Cb
 zL2I+jttCfPunMOYMea5KFIcfJnjEbA54qmmNQJAwzzrPz+cj7MFsOWPX6phYlx7OPz/
 K3VvPS8YwL8dwgI2H2LcK95DvuseuaunvvGJU1pvEBT2GnTtfzPUIXrc0noJukUc3KD7
 PEl9z59HuzsWxqXD1c+EwIkP3uRXjE61UZH8ediFA/qZ+6paNL9Aw03nQMOSFj+joMLl
 iTmw==
X-Gm-Message-State: AOAM530fMBNNsP8YbsOXY43iipECQq9Q/jZxJ4S/WQ/c5QKEnzRloWCf
 Ti7Q+8WxVvysJZubbamvv0pwVTosws3bdp1qmXwrMr4E43kthaHoZZyc9COEpT3t8k1HhqbIZMc
 LDFOawJIJDQ0Dw4GpMa8aOM0boIPYCFOCUY3F0gL6pUyKWzv+YfWjGdG6hXgAaoCc
X-Received: by 2002:a05:622a:18e:: with SMTP id
 s14mr829038qtw.69.1623779728480; 
 Tue, 15 Jun 2021 10:55:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJQrrCRqEiTVj0ODkiRy8x9OgFRUNmQNOSixJJIvVaDMP4jTFZNCHHsiUDcJhe6Vrf+HMtYg==
X-Received: by 2002:a05:622a:18e:: with SMTP id
 s14mr829016qtw.69.1623779728177; 
 Tue, 15 Jun 2021 10:55:28 -0700 (PDT)
Received: from t490s.redhat.com
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id d81sm12908578qke.32.2021.06.15.10.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 10:55:27 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] tests: migration-test: Add dirty ring test
Date: Tue, 15 Jun 2021 13:55:23 -0400
Message-Id: <20210615175523.439830-3-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615175523.439830-1-peterx@redhat.com>
References: <20210615175523.439830-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add dirty ring test if kernel supports it.  Add the dirty ring parameter on
source should be mostly enough, but let's change the dest too to make them
match always.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 58 ++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index d9225f58d4d..9ef6b471353 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -27,6 +27,10 @@
 #include "migration-helpers.h"
 #include "tests/migration/migration-test.h"
 
+#if defined(__linux__)
+#include "linux/kvm.h"
+#endif
+
 /* TODO actually test the results and get rid of this */
 #define qtest_qmp_discard_response(...) qobject_unref(qtest_qmp(__VA_ARGS__))
 
@@ -467,6 +471,8 @@ typedef struct {
     bool use_shmem;
     /* only launch the target process */
     bool only_target;
+    /* Use dirty ring if true; dirty logging otherwise */
+    bool use_dirty_ring;
     char *opts_source;
     char *opts_target;
 } MigrateStart;
@@ -573,11 +579,13 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         shmem_opts = g_strdup("");
     }
 
-    cmd_source = g_strdup_printf("-accel kvm -accel tcg%s%s "
+    cmd_source = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
                                  "-name source,debug-threads=on "
                                  "-m %s "
                                  "-serial file:%s/src_serial "
                                  "%s %s %s %s",
+                                 args->use_dirty_ring ?
+                                 ",dirty-ring-size=4096" : "",
                                  machine_opts ? " -machine " : "",
                                  machine_opts ? machine_opts : "",
                                  memory_size, tmpfs,
@@ -587,12 +595,14 @@ static int test_migrate_start(QTestState **from, QTestState **to,
         *from = qtest_init(cmd_source);
     }
 
-    cmd_target = g_strdup_printf("-accel kvm -accel tcg%s%s "
+    cmd_target = g_strdup_printf("-accel kvm%s -accel tcg%s%s "
                                  "-name target,debug-threads=on "
                                  "-m %s "
                                  "-serial file:%s/dest_serial "
                                  "-incoming %s "
                                  "%s %s %s %s",
+                                 args->use_dirty_ring ?
+                                 ",dirty-ring-size=4096" : "",
                                  machine_opts ? " -machine " : "",
                                  machine_opts ? machine_opts : "",
                                  memory_size, tmpfs, uri,
@@ -785,12 +795,14 @@ static void test_baddest(void)
     test_migrate_end(from, to, false);
 }
 
-static void test_precopy_unix(void)
+static void test_precopy_unix_common(bool dirty_ring)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     MigrateStart *args = migrate_start_new();
     QTestState *from, *to;
 
+    args->use_dirty_ring = dirty_ring;
+
     if (test_migrate_start(&from, &to, uri, args)) {
         return;
     }
@@ -825,6 +837,18 @@ static void test_precopy_unix(void)
     test_migrate_end(from, to, true);
 }
 
+static void test_precopy_unix(void)
+{
+    /* Using default dirty logging */
+    test_precopy_unix_common(false);
+}
+
+static void test_precopy_unix_dirty_ring(void)
+{
+    /* Using dirty ring tracking */
+    test_precopy_unix_common(true);
+}
+
 #if 0
 /* Currently upset on aarch64 TCG */
 static void test_ignore_shared(void)
@@ -1369,6 +1393,29 @@ static void test_multifd_tcp_cancel(void)
     test_migrate_end(from, to2, true);
 }
 
+static bool kvm_dirty_ring_supported(void)
+{
+#if defined(__linux__)
+    int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
+
+    if (kvm_fd < 0) {
+        return false;
+    }
+
+    ret = ioctl(kvm_fd, KVM_CHECK_EXTENSION, KVM_CAP_DIRTY_LOG_RING);
+    close(kvm_fd);
+
+    /* We test with 4096 slots */
+    if (ret < 4096) {
+        return false;
+    }
+
+    return true;
+#else
+    return false;
+#endif
+}
+
 int main(int argc, char **argv)
 {
     char template[] = "/tmp/migration-test-XXXXXX";
@@ -1438,6 +1485,11 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/multifd/tcp/zstd", test_multifd_tcp_zstd);
 #endif
 
+    if (kvm_dirty_ring_supported()) {
+        qtest_add_func("/migration/dirty_ring",
+                       test_precopy_unix_dirty_ring);
+    }
+
     ret = g_test_run();
 
     g_assert_cmpint(ret, ==, 0);
-- 
2.31.1


