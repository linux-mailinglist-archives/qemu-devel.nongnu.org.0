Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83892493666
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:35:28 +0100 (CET)
Received: from localhost ([::1]:52270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6RD-0006B2-KQ
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:35:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA63Q-0007Wd-8C
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA63N-0001Pk-8t
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DMzUc77KxXCbJobFky9F7XYbxJfA3c/ZqHxZ4FS5G0E=;
 b=J4keMbvxsfRMlKGdEZjfrEpumomBhy2KbAkXdmBdwBc0MWJUxrfvdIRAyD3LMKBzC3/Qfn
 GKtwMUqFgjXxmznH62hJm60hIPyKclFRWozCss6ybX5s4aLr+DyWlGrBxXKmkhGNnADuIZ
 VMvuPggQwdu1Ecx3OW0Y6fOR5bXCzUU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-Eawx3yc3Ngih6CUxBsUTRg-1; Wed, 19 Jan 2022 03:10:43 -0500
X-MC-Unique: Eawx3yc3Ngih6CUxBsUTRg-1
Received: by mail-wm1-f72.google.com with SMTP id
 n14-20020a7bcbce000000b003488820f0d9so1323544wmi.8
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:10:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DMzUc77KxXCbJobFky9F7XYbxJfA3c/ZqHxZ4FS5G0E=;
 b=pbii5znAL77IU2pkMRCBYdSAPt5d92D9MBfZEltAHxMOl4kuYIoyAAswTRX9dbP0cP
 SvyGbPaSiz01jMEIAxKSyo0V8tR2qoLr10PPDR6gv3UceivTTawosBZ61KhidBiXEBQY
 M0AR39pgJAnbVDqxCkLzWvZePe7rN1hoQThXxyRyJf3k4FBYOpLj1PgC6GQIVahsgfYo
 EjbgG3IVwqriMmB7J35eLIdnsCZ7dUzxT9yMfTdoz5T5bic3ylRsz143GbN59/2Gocej
 WqZO+10mmQ8itXHcLufG+qsbnn+EAfXpkz+GY4STinlLQ7sfCtSk/G5aJIsCTZPKodem
 tTEg==
X-Gm-Message-State: AOAM532QjRMWQsRH2ufYWOIoZZzP5GOwxehuNFxothRN/zI8+O+cJ5e5
 45u/mf8jr8p4iAWEht7Ukpt+VYWH88NlqS9QA6W1Ih2Rt/jV8PTcrS6s/eRStETMQZ+fylU9rgf
 r4WBaNoQwsoTCUFb8LZD0nLE0y7wPxYOjFIZiddnFUEeDELFOzzdhUtaELMVXjc74
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr17836084wry.165.1642579842256; 
 Wed, 19 Jan 2022 00:10:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJys4Yr09AYXaBCEOZ4tRV8Vi8PQP8EDS+OVXrtI8++8Pf5kj5RimFTAV37Vy/qSyWs04pJTOA==
X-Received: by 2002:a05:6000:2ac:: with SMTP id
 l12mr17836064wry.165.1642579842061; 
 Wed, 19 Jan 2022 00:10:42 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.10.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:10:41 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 15/15] tests: Add postcopy preempt test
Date: Wed, 19 Jan 2022 16:09:29 +0800
Message-Id: <20220119080929.39485-16-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119080929.39485-1-peterx@redhat.com>
References: <20220119080929.39485-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7b42f6fd90..93ff43bb3f 100644
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
@@ -719,6 +725,20 @@ static void test_postcopy(void)
     migrate_postcopy_complete(from, to);
 }
 
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
 static void test_postcopy_recovery(void)
 {
     MigrateStart *args = migrate_start_new();
@@ -1458,6 +1478,7 @@ int main(int argc, char **argv)
     module_call_init(MODULE_INIT_QOM);
 
     qtest_add_func("/migration/postcopy/unix", test_postcopy);
+    qtest_add_func("/migration/postcopy/preempt", test_postcopy_preempt);
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix", test_precopy_unix);
-- 
2.32.0


