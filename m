Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C453A50ECE5
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:53:51 +0200 (CEST)
Received: from localhost ([::1]:52806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8Wc-0007ZS-RI
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8Io-0008Bn-4c
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IW-0007mb-Ib
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ts1uN9p/nQEwVhWU7ctTqCBXAIjCW69+L43U9lwrDx8=;
 b=bQagWPcnq2AXDPgEleDKBXDxOjVBsoKryv4QaCH2s2R/CMPHtUCn+H/FVRG5/PGfR/mxc0
 Kla/prNSFpwefHpsSk3BHD445M6yBSEkKW1otOc7W2815snYl0i7AJo3PGR3hDKBhcond8
 C6H4nzJwNfgmbCADM0TLjZQPvGxO1Ps=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-NpLRJFuCPVe_7u58TF2gsw-1; Mon, 25 Apr 2022 19:39:14 -0400
X-MC-Unique: NpLRJFuCPVe_7u58TF2gsw-1
Received: by mail-io1-f72.google.com with SMTP id
 m206-20020a6b3fd7000000b00657a48f1a70so7597ioa.4
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ts1uN9p/nQEwVhWU7ctTqCBXAIjCW69+L43U9lwrDx8=;
 b=FcdnRlooh8bOHiiqlOp2vBtaQOp+D72OwR9Po/xo6gTri3ztNiMrU0kThwC/h4ZcIl
 odQ+7Fhlw1GU/VPDV4Vh8JDHWASoiHQGvLrDtalo9aqEfLs/omRXrmXmrr6uyBka4639
 LdX5SglYgDf91ekkeA3Rv7Dgl/tyyy6q+9vtQBiODrJjvrzDnznC7QEUIzvqJhth8Pj3
 M805baFSAIjnBTIdHmtEilZUtgYMiWICQmjJ7L4Nt54M1HWu88LxRIoRoEEQxXmyCbsv
 858GObQeAq+Zdi3UdwUE/xbmbL2WRIttyUxVme/23iqwsZr0I/Umm9TZi5ACzB0L15GY
 bQEQ==
X-Gm-Message-State: AOAM530aTYxxl5rYyLSp7FdyCxwqCE7OtqlqfW2sM97L5SUlz4e5b9oH
 Cl2CwQorfdFmEPfsTZdv417O8HYuaPvuWyqf/Yb3SIpYjOBwfRd+LybG+hKiBvK/OHR2e3qnoqQ
 3mQyXm0LXPca/GgU/8EfXOIMwvcYUEljBuK6sa2MdSUuo4ps5Gg3hWnXLLQRUhHqZ
X-Received: by 2002:a05:6e02:c28:b0:2ca:8380:8390 with SMTP id
 q8-20020a056e020c2800b002ca83808390mr7661968ilg.174.1650929953160; 
 Mon, 25 Apr 2022 16:39:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwzjcOWZR4krks/Qum4727E1TmSS+WOU7qVgg1SNrLUNnHwnpTMnA8VLE0WwwGstCiX5HEvg==
X-Received: by 2002:a05:6e02:c28:b0:2ca:8380:8390 with SMTP id
 q8-20020a056e020c2800b002ca83808390mr7661957ilg.174.1650929952883; 
 Mon, 25 Apr 2022 16:39:12 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.39.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:39:12 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/21] tests: Add postcopy tls recovery migration test
Date: Mon, 25 Apr 2022 19:38:46 -0400
Message-Id: <20220425233847.10393-21-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

It's easy to build this upon the postcopy tls test.  Rename the old
postcopy recovery test to postcopy/recovery/plain.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 33 ++++++++++++++++++++++++++-------
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index c32b350aea..cbcf3f73a4 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1058,15 +1058,15 @@ static void test_postcopy_tls_psk(void)
     test_postcopy_common(&args);
 }
 
-static void test_postcopy_recovery(void)
+static void test_postcopy_recovery_common(MigrateStart *args)
 {
-    MigrateStart args = {
-        .hide_stderr = true,
-    };
     QTestState *from, *to;
     g_autofree char *uri = NULL;
 
-    if (migrate_postcopy_prepare(&from, &to, &args)) {
+    /* Always hide errors for postcopy recover tests since they're expected */
+    args->hide_stderr = true;
+
+    if (migrate_postcopy_prepare(&from, &to, args)) {
         return;
     }
 
@@ -1117,7 +1117,21 @@ static void test_postcopy_recovery(void)
     /* Restore the postcopy bandwidth to unlimited */
     migrate_set_parameter_int(from, "max-postcopy-bandwidth", 0);
 
-    migrate_postcopy_complete(from, to, &args);
+    migrate_postcopy_complete(from, to, args);
+}
+
+static void test_postcopy_recovery(void)
+{
+    MigrateStart args = { };
+
+    test_postcopy_recovery_common(&args);
+}
+
+static void test_postcopy_recovery_tls_psk(void)
+{
+    MigrateStart args = { .postcopy_tls = true };
+
+    test_postcopy_recovery_common(&args);
 }
 
 static void test_baddest(void)
@@ -2169,7 +2183,12 @@ int main(int argc, char **argv)
      */
     qtest_add_func("/migration/postcopy/tls/psk", test_postcopy_tls_psk);
 #endif /* CONFIG_GNUTLS */
-    qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
+    qtest_add_func("/migration/postcopy/recovery/plain",
+                   test_postcopy_recovery);
+#ifdef CONFIG_GNUTLS
+    qtest_add_func("/migration/postcopy/recovery/tls/psk",
+                   test_postcopy_recovery_tls_psk);
+#endif /* CONFIG_GNUTLS */
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
     qtest_add_func("/migration/precopy/unix/xbzrle", test_precopy_unix_xbzrle);
-- 
2.32.0


