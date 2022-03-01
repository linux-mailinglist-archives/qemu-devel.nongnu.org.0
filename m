Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D49884C87C3
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:22:23 +0100 (CET)
Received: from localhost ([::1]:33986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyi6-0000Ip-VU
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:22:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3s-0004gb-It
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3q-0008O1-UZ
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iScz+bjSHJXZSsec6ODclid8MpYXvGhjXV9oo6c4Wa0=;
 b=eHb5tjKgpAZ9gK/huvzpa8ZM7KVHKax5Jv5rMF0YHSS35rmKeA2DlH73zsLe6Aci4LHE0Q
 qD2pqMBnqygf3y0dFPYp43FrBdgwmnLQ33e3vqMjSoh3TXNmk0RDLP/j+m0DMHKAzLJd7w
 3mdd50SeQHKToBbak0tTsVpmiWdfV4k=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-iH3__BlnMwGUSHw--ZPczg-1; Tue, 01 Mar 2022 03:40:45 -0500
X-MC-Unique: iH3__BlnMwGUSHw--ZPczg-1
Received: by mail-pl1-f197.google.com with SMTP id
 l6-20020a170903120600b0014f43ba55f3so5958090plh.11
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iScz+bjSHJXZSsec6ODclid8MpYXvGhjXV9oo6c4Wa0=;
 b=wOsfBQjqNj2SYxh/av9QmabGJAqE/t12Mlsr6e8t6/gtFpeTmZYU0h++EkW95mm151
 JnELpiaoT9t4GWonENgcEwZFszSzhBhMuT35IXB/RwTMA/5lnrjX3YvocLUjjJDVtyj+
 5rYcqtd/Jc5qF4g98RjrHHjobvcumScnWEpQPjVn4XV/OPlwX/Z6r3yWZrCZE8rUxHlY
 oVSsasNjNDi6BB7qk+Nggc7pdN8ppMiHCM8OkDQ2krvvbA51aXfDxQzFSR0hRBEFoFHJ
 yY4hO/avCa5M2OnS0V1WwNYVRSb/j9Mz2Ysmc8gZn7Rbd/Wkxe9VpY+iFhlxNcr/m4Bl
 EDBQ==
X-Gm-Message-State: AOAM531QA4wW7NJw8og5QpqN6rsCeTFJIlS4pHnwrQGzfe9ioPuV/st6
 q3kJ9LIDjbHl7O2FPduxg5nxsKDe1/1s10ts+FwyPQ+NZ/entLJn79vJcaYbX4i3T3rxEAoDFXy
 YY4hUjBdwVcn6aUcW7yyHgyDEy/ySUlB759ShKxPAFF5tV1iXTJkWheGeQJuo7Xrm
X-Received: by 2002:a05:6a00:be5:b0:4e1:9050:1e16 with SMTP id
 x37-20020a056a000be500b004e190501e16mr26316100pfu.78.1646124044208; 
 Tue, 01 Mar 2022 00:40:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSW1XpCPK3wLmJ212KpT+hOGu0zWtTtDF8mWy8PI/laH4dL3iF7J+yu/z7guawxE46IYNy+Q==
X-Received: by 2002:a05:6a00:be5:b0:4e1:9050:1e16 with SMTP id
 x37-20020a056a000be500b004e190501e16mr26316067pfu.78.1646124043766; 
 Tue, 01 Mar 2022 00:40:43 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.40.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:43 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/25] tests: Pass in MigrateStart** into
 test_migrate_start()
Date: Tue,  1 Mar 2022 16:39:25 +0800
Message-Id: <20220301083925.33483-26-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301083925.33483-1-peterx@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

test_migrate_start() will release the MigrateStart structure that passed
in, however that's not super clear to the caller because after the call
returned the pointer can still be referenced by the callers.  It can easily
be a source of use-after-free.

Let's pass in a double pointer of that, then we can safely clear the
pointer for the caller after the struct is released.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 09a9ce4401..67f0601988 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -496,7 +496,7 @@ static void migrate_start_destroy(MigrateStart *args)
 }
 
 static int test_migrate_start(QTestState **from, QTestState **to,
-                              const char *uri, MigrateStart *args)
+                              const char *uri, MigrateStart **pargs)
 {
     g_autofree gchar *arch_source = NULL;
     g_autofree gchar *arch_target = NULL;
@@ -508,6 +508,7 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     g_autofree char *shmem_path = NULL;
     const char *arch = qtest_get_arch();
     const char *machine_opts = NULL;
+    MigrateStart *args = *pargs;
     const char *memory_size;
     int ret = 0;
 
@@ -622,6 +623,8 @@ static int test_migrate_start(QTestState **from, QTestState **to,
 
 out:
     migrate_start_destroy(args);
+    /* This tells the caller that this structure is gone */
+    *pargs = NULL;
     return ret;
 }
 
@@ -668,7 +671,7 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     bool postcopy_preempt = args->postcopy_preempt;
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, uri, &args)) {
         return -1;
     }
 
@@ -822,7 +825,7 @@ static void test_baddest(void)
 
     args->hide_stderr = true;
 
-    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", args)) {
+    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", &args)) {
         return;
     }
     migrate_qmp(from, "tcp:127.0.0.1:0", "{}");
@@ -838,7 +841,7 @@ static void test_precopy_unix_common(bool dirty_ring)
 
     args->use_dirty_ring = dirty_ring;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, uri, &args)) {
         return;
     }
 
@@ -926,7 +929,7 @@ static void test_xbzrle(const char *uri)
     MigrateStart *args = migrate_start_new();
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, uri, &args)) {
         return;
     }
 
@@ -980,7 +983,7 @@ static void test_precopy_tcp(void)
     g_autofree char *uri = NULL;
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", args)) {
+    if (test_migrate_start(&from, &to, "tcp:127.0.0.1:0", &args)) {
         return;
     }
 
@@ -1025,7 +1028,7 @@ static void test_migrate_fd_proto(void)
     QDict *rsp;
     const char *error_desc;
 
-    if (test_migrate_start(&from, &to, "defer", args)) {
+    if (test_migrate_start(&from, &to, "defer", &args)) {
         return;
     }
 
@@ -1105,7 +1108,7 @@ static void do_test_validate_uuid(MigrateStart *args, bool should_fail)
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     QTestState *from, *to;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, uri, &args)) {
         return;
     }
 
@@ -1197,7 +1200,7 @@ static void test_migrate_auto_converge(void)
      */
     const int64_t expected_threshold = max_bandwidth * downtime_limit / 1000;
 
-    if (test_migrate_start(&from, &to, uri, args)) {
+    if (test_migrate_start(&from, &to, uri, &args)) {
         return;
     }
 
@@ -1266,7 +1269,7 @@ static void test_multifd_tcp(const char *method)
     QDict *rsp;
     g_autofree char *uri = NULL;
 
-    if (test_migrate_start(&from, &to, "defer", args)) {
+    if (test_migrate_start(&from, &to, "defer", &args)) {
         return;
     }
 
@@ -1352,7 +1355,7 @@ static void test_multifd_tcp_cancel(void)
 
     args->hide_stderr = true;
 
-    if (test_migrate_start(&from, &to, "defer", args)) {
+    if (test_migrate_start(&from, &to, "defer", &args)) {
         return;
     }
 
@@ -1391,7 +1394,7 @@ static void test_multifd_tcp_cancel(void)
     args = migrate_start_new();
     args->only_target = true;
 
-    if (test_migrate_start(&from, &to2, "defer", args)) {
+    if (test_migrate_start(&from, &to2, "defer", &args)) {
         return;
     }
 
-- 
2.32.0


