Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7844ECF3F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:57:23 +0200 (CEST)
Received: from localhost ([::1]:47724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgJe-00065w-UD
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:57:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2S-00067X-9z
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2P-0005Id-Eg
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aebwCcvLCMGoglNFedm/LJowYh+slbC5rlPrkZcazGg=;
 b=i4SwK+CXHB4UnDRjJH1UsW1Di4YgAZzQjuX8SMojbEhpcVjunrGvGGyRQo1lDi6xzEB5kZ
 J/x1vRby6M/lurQ1h3NpBMuUSKogCoOnmYIj9KKTADhPrfjOT7AnN7GVJPxD03fBhZ3qcb
 HV0M0BuKbu4jnb5bmJpKr2N0gzG49e8=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-cZUlul8eNfmogssmM4yFNw-1; Wed, 30 Mar 2022 17:39:31 -0400
X-MC-Unique: cZUlul8eNfmogssmM4yFNw-1
Received: by mail-qv1-f69.google.com with SMTP id
 g1-20020ad446c1000000b00440c9327221so17076627qvw.6
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aebwCcvLCMGoglNFedm/LJowYh+slbC5rlPrkZcazGg=;
 b=zHwjykSOreFh09TH/oDjDxMqPvfN9/xiEDKmERHhUE36JV1pnH1f0aH2oSIbqLf5Qq
 /koPn3TsfkrX3IMKPjAmIZMiw/a4QcpE43rIX0Qm79ank3gbANeUm+lieQGEmxkgOccu
 vOG0FyDdYSFY/OzjMxYDVS9JJoymSlUFrKrEqy8PIIbyOoMaUxYFFmmSM2MAIX2eY5vJ
 ipoE9iHpd5/dbmTERR87r2S/YfEJaR+/ATogHNLOEl7HDiq/ZN/txvjFsmirndcF5qPP
 MP7RkVI4SMemEB35WUEnII8HqeFFPyv1TohdDyHwiMxYXXM7/0wgGNcepKkofJQ52R9Y
 egQQ==
X-Gm-Message-State: AOAM53128z74ibAGH8z/2T9RVcoKq4+WBHR7QqudlLmv+39QamDkJo9H
 iAAX8p7IwRFT4Hpe1yLgEOZmVsC2ziFDu0wRqV/UZF7Aph5ywlfXQ/GD34/DnUfdntm1Fq44H4W
 c9e24HTH9Kvp9kTKOAw8tQHCr7LCChXLSlXv7eT5fnhhi2oqDYxusemE1DDeqY0kA
X-Received: by 2002:a37:5505:0:b0:60d:9998:6dfd with SMTP id
 j5-20020a375505000000b0060d99986dfdmr1281817qkb.607.1648676370605; 
 Wed, 30 Mar 2022 14:39:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAV1QLyUve5ZaD/1cr3Klwr4Ww1K+324+UCXu8fIXGbhayhxnh2XbIs0y2yx236Jk50OlfRg==
X-Received: by 2002:a37:5505:0:b0:60d:9998:6dfd with SMTP id
 j5-20020a375505000000b0060d99986dfdmr1281794qkb.607.1648676370329; 
 Wed, 30 Mar 2022 14:39:30 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:30 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 19/19] tests: Add postcopy preempt tests
Date: Wed, 30 Mar 2022 17:39:08 -0400
Message-Id: <20220330213908.26608-20-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330213908.26608-1-peterx@redhat.com>
References: <20220330213908.26608-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Four tests are added for preempt mode:

  - Postcopy default
  - Postcopy tls
  - Postcopy recovery
  - Postcopy tls+recovery

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 49 ++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 7288c64e97..7188503ae1 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -477,6 +477,7 @@ typedef struct {
      */
     bool hide_stderr;
     bool use_shmem;
+    bool postcopy_preempt;
     /* only launch the target process */
     bool only_target;
     /* Use dirty ring if true; dirty logging otherwise */
@@ -992,6 +993,11 @@ static int migrate_postcopy_prepare(QTestState **from_ptr,
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
@@ -1058,6 +1064,25 @@ static void test_postcopy_tls(void)
     test_postcopy_common(&args);
 }
 
+static void test_postcopy_preempt(void)
+{
+    MigrateStart args = {
+        .postcopy_preempt = true,
+    };
+
+    test_postcopy_common(&args);
+}
+
+static void test_postcopy_preempt_tls(void)
+{
+    MigrateStart args = {
+        .postcopy_preempt = true,
+        .postcopy_tls = true,
+    };
+
+    test_postcopy_common(&args);
+}
+
 static void test_postcopy_recovery_common(MigrateStart *args)
 {
     QTestState *from, *to;
@@ -1134,6 +1159,24 @@ static void test_postcopy_recovery_tls(void)
     test_postcopy_recovery_common(&args);
 }
 
+static void test_postcopy_preempt_recovery(void)
+{
+    MigrateStart args = { .postcopy_preempt = true };
+
+    test_postcopy_recovery_common(&args);
+}
+
+/* This contains preempt+recovery+tls test altogether */
+static void test_postcopy_preempt_all(void)
+{
+    MigrateStart args = {
+        .postcopy_preempt = true,
+        .postcopy_tls = true,
+    };
+
+    test_postcopy_recovery_common(&args);
+}
+
 static void test_baddest(void)
 {
     MigrateStart args = {
@@ -2176,6 +2219,12 @@ int main(int argc, char **argv)
 
     qtest_add_func("/migration/postcopy/unix", test_postcopy);
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    qtest_add_func("/migration/postcopy/preempt/unix", test_postcopy_preempt);
+    qtest_add_func("/migration/postcopy/preempt/recovery",
+                   test_postcopy_preempt_recovery);
+    qtest_add_func("/migration/postcopy/preempt/tls", test_postcopy_preempt_tls);
+    qtest_add_func("/migration/postcopy/preempt/tls+recovery",
+                   test_postcopy_preempt_all);
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/postcopy/tls", test_postcopy_tls);
     qtest_add_func("/migration/postcopy/tls/recovery", test_postcopy_recovery_tls);
-- 
2.32.0


