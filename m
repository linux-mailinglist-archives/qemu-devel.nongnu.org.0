Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D27257E35F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 17:05:13 +0200 (CEST)
Received: from localhost ([::1]:37056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEuDI-0001ZS-87
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 11:05:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oEu5Z-0000TT-9J
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 10:57:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oEu5W-0007db-BY
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 10:57:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658501829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d2vT62F++U5vroIS8grk6pJEAjuGIeWf8eLQZjjVbYU=;
 b=aJEfbrdGsFnGazcb4w1PBV9rzbApbacoH6pk1D3Yki12XmRUGYCj0dB1TYUp8qiRkotibW
 +is2nw8CHjha9YGvzU18mVKUH/6rapiOFcu1+ZsW2BvHJrTjCc8xFeu0hQW6qpVA8i6pGg
 ZlvyVZC/u+F4axGU9CAkTwsP41hQ/VE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-yRvb51h2NeiDyTlgwMIdAg-1; Fri, 22 Jul 2022 10:57:00 -0400
X-MC-Unique: yRvb51h2NeiDyTlgwMIdAg-1
Received: by mail-qk1-f197.google.com with SMTP id
 bk21-20020a05620a1a1500b006b5c24695a4so3894870qkb.15
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 07:57:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d2vT62F++U5vroIS8grk6pJEAjuGIeWf8eLQZjjVbYU=;
 b=ZNkXUnwhd+i52m4a+Dl5qjmUKHeTyaVNHSYHKc+3vWCBoY4wBC1pERfrbKSmpHd5Jr
 IEvUpIHlpfPbiOtBdrruIiepRYDRChSeIesanc+cavN6zEZn58ex/c2AfKJyQFD7WAx4
 QYYGLCEUlsoGrVudT183EZ3HJrY748ttBDvZ7GQ0lYH8+Vnu/xEWNiCdKdbPJ9lSk8zi
 5SwKsIL3o7gXDEUan/orjP3I3ZLYKfywQghTDptkNagwyEpbORtTQa6KRPd4m0GRlJpP
 Hr6jkmGuwR0rLd+BG6GgkvuClhMCUD+UCanj1hIzr8PRoXQ+m7QejbBwSB2akYS3TyyU
 dkYg==
X-Gm-Message-State: AJIora818e+RcHYs2VoUAAHytMnXEgSPibCmQ/rlTmcRZY28dCSOv/yt
 kC82jJxWROyZ14RFO3Hn2Oog7hySIl+z5WTYnAl9wHYwcFAmYhNFcCeW/9vGgXIFxTiZq+oB6QK
 +XL3Cp/nzw1cuMMNqsI7I9sYFnaPFLRb6biWnOBEX1yAFTGXHDGxCCg0J6tbOqnMB
X-Received: by 2002:a05:622a:38f:b0:305:1ea5:4a7 with SMTP id
 j15-20020a05622a038f00b003051ea504a7mr391002qtx.291.1658501819498; 
 Fri, 22 Jul 2022 07:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1thiuJ+qswoFD4xFAbtCp6301Qhl4BG715LvRUPntW3DB4hPVDO2Lzevw1yzcZGkVK4biCqew==
X-Received: by 2002:a05:622a:38f:b0:305:1ea5:4a7 with SMTP id
 j15-20020a05622a038f00b003051ea504a7mr390973qtx.291.1658501819146; 
 Fri, 22 Jul 2022 07:56:59 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a37e307000000b006b5e6dac3b0sm3291429qki.128.2022.07.22.07.56.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 22 Jul 2022 07:56:58 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v2 1/2] migration-test: Use migrate_ensure_converge() for
 auto-converge
Date: Fri, 22 Jul 2022 10:56:53 -0400
Message-Id: <20220722145654.81103-2-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220722145654.81103-1-peterx@redhat.com>
References: <20220722145654.81103-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 71595a74fd..dd50aa600c 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
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


