Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE9758407A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 16:01:03 +0200 (CEST)
Received: from localhost ([::1]:60802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH44U-0001LB-Uu
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 10:01:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oH3fg-0002If-Rx
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oH3ff-0003im-9Q
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659015322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tPRF2p8u4YeKt/QnPOCCUvF+2lq30TjQVJm1xC0AP3s=;
 b=GLsUu3PzZKIE2ssnk0mJ/iZeNQYaWUAjrpGt3QA415P4e1Ww8HObHEZc3OKkEWSflomTsf
 xI6zaYCSCvPLplGpZ6PCxflXBNPKjvEEyPOmUOcdFM2BPfc9JoydiDO+/sZh6TuQzJin5X
 iEsbtqL0UokyGcl57+x79QELkIfadSk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-50-kDR077bjNj65GCpLVHiLyQ-1; Thu, 28 Jul 2022 09:35:21 -0400
X-MC-Unique: kDR077bjNj65GCpLVHiLyQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 f20-20020a05620a409400b006b5fc740485so1459486qko.12
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:35:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tPRF2p8u4YeKt/QnPOCCUvF+2lq30TjQVJm1xC0AP3s=;
 b=Z2RrDCDdHUIorEA47tJUGyfQGwttqNJtbmzr6W6jz0ptQouPARXrLwOsrk3KkI9rsC
 vQUUVwDhdpUkGvM+xCLkd4Gm0V0f73umD8XixiTWTedQem5QqMr1b2aBUG1o76UOipO8
 nWrFzrpn9LBZxKEHPi7/DtgGsjNPprjrfKpc9JFwBkSz2iP38mhZi4dctwyhVYbGjZdm
 F67Swc3RkK5M1Sj9YKQ/CCbrOj9ySsS4I3/bcE36N/ZH70IE5bCDqvgIYC3cGma9trHn
 n0AmzGQ3/OWAMPv5uM4Y/kh7LPzMZL/NTKorbaS2QcJsmBgwD9QVcjx/6922z8cawR2C
 YB0A==
X-Gm-Message-State: AJIora/NL/aCAGbZLyP4aTbKGbJzOG4L0Z+qh+bCif+Gcrom4clAyN8h
 OhF0/2PK3UCvQzvtxWAZEO4xVy6ira2dbFY68hQdrDICQAAvcVI+x2bSoqPGGKpo0EHQzzBlceF
 xtK7yT7f8n8ZvSxxqt5yWZO0v2XMtWhnZwKT3ENmcuMWJoHX7ANM5RNzBTQuWV98C
X-Received: by 2002:ac8:5705:0:b0:31e:f49b:ed27 with SMTP id
 5-20020ac85705000000b0031ef49bed27mr23010057qtw.16.1659015320658; 
 Thu, 28 Jul 2022 06:35:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1taF0L0tY7IXZfZJ/8zcJ0vZnOkK15tOSh+dbDBQKBhcWQ6gZhN5dc0gZf5OBYMKSYSZakv3Q==
X-Received: by 2002:ac8:5705:0:b0:31e:f49b:ed27 with SMTP id
 5-20020ac85705000000b0031ef49bed27mr23010017qtw.16.1659015320324; 
 Thu, 28 Jul 2022 06:35:20 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a05620a448a00b006b618e006ffsm553876qkp.2.2022.07.28.06.35.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Jul 2022 06:35:19 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 1/2] migration-test: Use migrate_ensure_converge() for
 auto-converge
Date: Thu, 28 Jul 2022 09:35:15 -0400
Message-Id: <20220728133516.92061-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220728133516.92061-1-peterx@redhat.com>
References: <20220728133516.92061-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Thomas reported that auto-converge test will timeout on MacOS CI gatings.
Use the migrate_ensure_converge() helper too in the auto-converge as when
Daniel reworked the other test cases.

Since both max_bandwidth / downtime_limit will not be used for converge
calculations, make it simple by removing the remaining check, then we can
completely remove both variables altogether, since migrate_ensure_converge
is used the remaining check won't make much sense anyway.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Reported-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 71595a74fd..c1e002087d 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -1768,7 +1768,7 @@ static void test_migrate_auto_converge(void)
     g_autofree char *uri = g_strdup_printf("unix:%s/migsocket", tmpfs);
     MigrateStart args = {};
     QTestState *from, *to;
-    int64_t remaining, percentage;
+    int64_t percentage;
 
     /*
      * We want the test to be stable and as fast as possible.
@@ -1776,14 +1776,6 @@ static void test_migrate_auto_converge(void)
      * so we need to decrease a bandwidth.
      */
     const int64_t init_pct = 5, inc_pct = 50, max_pct = 95;
-    const int64_t max_bandwidth = 400000000; /* ~400Mb/s */
-    const int64_t downtime_limit = 250; /* 250ms */
-    /*
-     * We migrate through unix-socket (> 500Mb/s).
-     * Thus, expected migration speed ~= bandwidth limit (< 500Mb/s).
-     * So, we can predict expected_threshold
-     */
-    const int64_t expected_threshold = max_bandwidth * downtime_limit / 1000;
 
     if (test_migrate_start(&from, &to, uri, &args)) {
         return;
@@ -1818,8 +1810,7 @@ static void test_migrate_auto_converge(void)
     /* The first percentage of throttling should be equal to init_pct */
     g_assert_cmpint(percentage, ==, init_pct);
     /* Now, when we tested that throttling works, let it converge */
-    migrate_set_parameter_int(from, "downtime-limit", downtime_limit);
-    migrate_set_parameter_int(from, "max-bandwidth", max_bandwidth);
+    migrate_ensure_converge(from);
 
     /*
      * Wait for pre-switchover status to check last throttle percentage
@@ -1830,11 +1821,6 @@ static void test_migrate_auto_converge(void)
     /* The final percentage of throttling shouldn't be greater than max_pct */
     percentage = read_migrate_property_int(from, "cpu-throttle-percentage");
     g_assert_cmpint(percentage, <=, max_pct);
-
-    remaining = read_ram_property_int(from, "remaining");
-    g_assert_cmpint(remaining, <,
-                    (expected_threshold + expected_threshold / 100));
-
     migrate_continue(from, "pre-switchover");
 
     qtest_qmp_eventwait(to, "RESUME");
@@ -1842,7 +1828,6 @@ static void test_migrate_auto_converge(void)
     wait_for_serial("dest_serial");
     wait_for_migration_complete(from);
 
-
     test_migrate_end(from, to, true);
 }
 
-- 
2.32.0


