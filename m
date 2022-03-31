Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B084EDC88
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:15:56 +0200 (CEST)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwWh-000487-Bz
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:15:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQP-0002RI-DE
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQL-0001Oc-K7
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D7cg24gbIDVfatkh+h2kS8W8/k5egsPyKjSZg4lvrLM=;
 b=dprOq74xpGGXhFgPMIHHdMG7otrny2drNU9iq02RqHHxqLIDg14ADO3uoZfuE9i+13T+Br
 foXNQbZ4JxTwvNIMdXNGn9e7zmvItON8cfaqYqSLHNOqztB/jj3/l+eyScPZrLbhPk3ZMN
 0jdx+8MDp8wMCK8Mcls8y8uwIIGLeDE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-jN2INtwMMqG65qymQs7rXQ-1; Thu, 31 Mar 2022 11:09:19 -0400
X-MC-Unique: jN2INtwMMqG65qymQs7rXQ-1
Received: by mail-qk1-f200.google.com with SMTP id
 bj2-20020a05620a190200b005084968bb24so14967665qkb.23
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D7cg24gbIDVfatkh+h2kS8W8/k5egsPyKjSZg4lvrLM=;
 b=zTRJoSAUxjvEGbQLCQ9HEJ4a6OgyH1rinF76GG7p+zSQVllHRZfIdgw0UZuc5me5+q
 OvyHup4DL7XLl692KhGy3MGdGZaX2urJW5tuG1E63Il7GZALW8XjBMKX1rm+Fpaj5Umj
 GleaBOnIwF4tBbWxp92sgp0GuMNHxmzHmYFgDp5+B/j6eHud+DR3bNWA1oHeKAnDpgX4
 HA45qAauAgr20vluV9yz0fnyomIIbBKHh1S4zJwijZN31Iqcq+pkGhGMpDn/V2Uuz4z3
 se6m2DXUTcG2QnKlEPpK1D3eqyANMqS/i2C/7Ywgw9yjdWi+VCqe5r5SjXbN7iqAOODL
 hXGQ==
X-Gm-Message-State: AOAM531NKDtXASAto+oxlANFUEiFaZaSrAzZ43aLs+DgNJT3MQHUNi9f
 nZiQiCrYtoITsESJ2vRCt4Dcn+I9Nl7gbdje991zlwobxbkF7ZMANa/HDJr1FHmDULzkGSfHFuQ
 HM+0Igezu4q72kOa5rFys/KFVmgtfaOdtmbxvwdT5eIDbFWMFy9zbu6HtCnwRilMi
X-Received: by 2002:a05:620a:6c3:b0:67d:7694:875d with SMTP id
 3-20020a05620a06c300b0067d7694875dmr3625120qky.394.1648739359001; 
 Thu, 31 Mar 2022 08:09:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNkOItIxxGQgPdznEUgpdjs27kVOtF527qkC2hwhpd5xP4AI2DIgKcDWX4bJYay3ioA09HdQ==
X-Received: by 2002:a05:620a:6c3:b0:67d:7694:875d with SMTP id
 3-20020a05620a06c300b0067d7694875dmr3625095qky.394.1648739358710; 
 Thu, 31 Mar 2022 08:09:18 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.09.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:09:18 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 18/19] tests: Add postcopy tls recovery migration test
Date: Thu, 31 Mar 2022 11:08:56 -0400
Message-Id: <20220331150857.74406-19-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331150857.74406-1-peterx@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's easy to build this upon the postcopy tls test.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 80c4244871..7288c64e97 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1058,15 +1058,15 @@ static void test_postcopy_tls(void)
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
+static void test_postcopy_recovery_tls(void)
+{
+    MigrateStart args = { .postcopy_tls = true };
+
+    test_postcopy_recovery_common(&args);
 }
 
 static void test_baddest(void)
@@ -2164,6 +2178,7 @@ int main(int argc, char **argv)
     qtest_add_func("/migration/postcopy/recovery", test_postcopy_recovery);
 #ifdef CONFIG_GNUTLS
     qtest_add_func("/migration/postcopy/tls", test_postcopy_tls);
+    qtest_add_func("/migration/postcopy/tls/recovery", test_postcopy_recovery_tls);
 #endif /* CONFIG_GNUTLS */
     qtest_add_func("/migration/bad_dest", test_baddest);
     qtest_add_func("/migration/precopy/unix/plain", test_precopy_unix_plain);
-- 
2.32.0


