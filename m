Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1886A4C8747
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:03:12 +0100 (CET)
Received: from localhost ([::1]:36800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyPV-0007RG-0g
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:03:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy4T-0005do-TP
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:41:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy4S-0008RE-AG
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:41:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lerOqNBKq7I7gR+BYtu9C6JMejBVtKQ6XmvGsCpkV5o=;
 b=HCGAMOhq4edx7AUbhL0HGGe4KL9eDqzWALnyaW4ZyhXlbnGjgOqBXHufQK7DN7dJ7iAXCj
 Z/DHE9Swe40yHuOjmx/V3aDl2YVS6dXUaaSZwxEQaFx5qZt0hHEgg1ZstF//N8iAQCX0QF
 6y26+7sQKWsvFvumLS2O6Dfa2OWlPYU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-1jZdpb3DOqmCIHDlRBKHfA-1; Tue, 01 Mar 2022 03:40:42 -0500
X-MC-Unique: 1jZdpb3DOqmCIHDlRBKHfA-1
Received: by mail-pl1-f197.google.com with SMTP id
 n12-20020a170902e54c00b0015011534fa3so5951695plf.9
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lerOqNBKq7I7gR+BYtu9C6JMejBVtKQ6XmvGsCpkV5o=;
 b=eNCILbq0QShANfBdpP5YUsMtkFvGDCD2gvdFRdaoZu5WEtXHZ3G2XA2mFgpL7jtY9+
 o29mgbxLoqcvTq4/zWxwiJUyFw7MfXqmeEgPK9KMWmRc2bMhSUBWah9oyfMgkOf+HXZ7
 lmGMvF5W7NEo5Mb1E/jn82xbSlg0Yktmbbs/bDna1mpkvK3VUuHT32VVlhZSr3Txpi5w
 /NxYeevL4H56NHjCmLs9LU2K39aDrNdl4qMVWN79frQUIheHoGxwubL20iHNTpi01Riz
 43kxiUhR4pEEbFdPSnmY5thqYa/jlWpmgmNqhJycgY1lh1Uz38kLz+O7nKE1gMybpeJN
 y03Q==
X-Gm-Message-State: AOAM530FjpHsp373x7xjs/a7/4tlmWMOxWoCahqUl63wtZA8SMWckw+j
 yU9Lu9mUlHWwJ89GL/Ykl5yCiyjweGj4f4fayTYGC45al8XcpUY6Nh6Gp66SQxZDVZq0exjqPSZ
 HXSzSg39nV7mMFwzbc906MhzUZjd5IoV5JmnvljYfuzvEupgrVfETPCWnLcPduJng
X-Received: by 2002:a17:90a:a42:b0:1bd:1985:5182 with SMTP id
 o60-20020a17090a0a4200b001bd19855182mr15033208pjo.5.1646124041204; 
 Tue, 01 Mar 2022 00:40:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeH5hX2wAhlpz6Qx6fKgwDGI5j0/YCiD2LQQLPuGJl4PzaoNSD1eAXMTdifUhKJ5X+8LNEHg==
X-Received: by 2002:a17:90a:a42:b0:1bd:1985:5182 with SMTP id
 o60-20020a17090a0a4200b001bd19855182mr15033185pjo.5.1646124040772; 
 Tue, 01 Mar 2022 00:40:40 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.40.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:40 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 24/25] tests: Add postcopy preempt test
Date: Tue,  1 Mar 2022 16:39:24 +0800
Message-Id: <20220301083925.33483-25-peterx@redhat.com>
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

Two tests are added: a normal postcopy preempt test, and a recovery test.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 41 ++++++++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7b42f6fd90..09a9ce4401 100644
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
@@ -663,6 +664,8 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
                                     MigrateStart *args)
 {
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
+    /* NOTE: args will be freed in test_migrate_start(), cache it */
+    bool postcopy_preempt = args->postcopy_preempt;
     QTestState *from, *to;
 
     if (test_migrate_start(&from, &to, uri, args)) {
@@ -673,6 +676,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
     migrate_set_capability(to, "postcopy-ram", true);
     migrate_set_capability(to, "postcopy-blocktime", true);
 
+    if (postcopy_preempt) {
+        migrate_set_capability(from, "postcopy-preempt", true);
+        migrate_set_capability(to, "postcopy-preempt", true);
+    }
+
     /* We want to pick a speed slow enough that the test completes
      * quickly, but that it doesn't complete precopy even on a slow
      * machine, so also set the downtime.
@@ -719,13 +727,29 @@ static void test_postcopy(void)
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
@@ -781,6 +805,16 @@ static void test_postcopy_recovery(void)
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
@@ -1458,7 +1492,10 @@ int main(int argc, char **argv)
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


