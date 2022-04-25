Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2284950ECD6
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:48:56 +0200 (CEST)
Received: from localhost ([::1]:36316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8Rr-0004pz-8F
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IL-00076u-JB
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8II-0007kG-Tf
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bA/Coxr0OviSm7/62XvQBXQFLB77tNKSIqC7Wwapa78=;
 b=YXNHgY4ri0YW0OvtYMVDndoUKfWUgCPpVpGBbsYufKcmZBegYTTBz5o1ap7PI9Koa8ZCW5
 OUEP4z6CXpuIirb5bLjXRZy9bfn1k5e10sEHTRDG8OCx8ATbIenODDCAqIQ4gVWPvxqxZs
 wBZlhlWLvIIyg0iKEXrq4CvKa2FJGR8=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-Yrxf86-UOViZkTVz5477wA-1; Mon, 25 Apr 2022 19:39:01 -0400
X-MC-Unique: Yrxf86-UOViZkTVz5477wA-1
Received: by mail-il1-f198.google.com with SMTP id
 u11-20020a056e021a4b00b002cc315db462so6944417ilv.4
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:39:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bA/Coxr0OviSm7/62XvQBXQFLB77tNKSIqC7Wwapa78=;
 b=yVJds6JZpVfXhcKgPASg9ho7p7k4SiyQfbi1J785xqmkBr3ur43KHyBMEwT5hC25WF
 sTsDZc5B4y9Fx/MbByxZ0+smuoJWryx2+AnPwMAQwz7vU75I6FzftN4rdIYBpVoBFGyH
 AjGrF/6cmCqqJQOW0azsA0OlkcaGTb/QVnagdlItZpp0BaDy7B5daXP6M7WDK8PLJneq
 fMSm+lBSJHSF0r1bfX9Ykn5+sx6KMughtng0vHEv2EuMd+o3WFZx4qXzl97wcQE/E+nO
 ylPiDxnKyVquRzn4EQEvUc/M8FpZ8kTF0tyaBehOom5j9vPkEfeIjSIwSDpf9CSbSI4e
 DQVQ==
X-Gm-Message-State: AOAM533HNgpSy96rj0f//b6t+xEwHskueAtAp7BHmpLIbmjbM5gigecp
 jLVFTIYkiXy0gpuo11wj0cd5pKyj9tQ/B67Yl8gpGo9aidSN+Eel+uxRfIl/san+81OFSM0yOlS
 ywY/+0EPOQg5Cwd1+yrynrl/+3YpPIGzOUeWiafy7Wxh7sPnEWowA64wi9cB6aGd8
X-Received: by 2002:a6b:ed06:0:b0:649:d35f:852c with SMTP id
 n6-20020a6bed06000000b00649d35f852cmr8503394iog.186.1650929940355; 
 Mon, 25 Apr 2022 16:39:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPjxXwdHJxnBWLuYC89mHFrh2h2CZq9q3isF4jIAQNuhqmuei0MQOYKWP5Fsovu5YljiSfkQ==
X-Received: by 2002:a6b:ed06:0:b0:649:d35f:852c with SMTP id
 n6-20020a6bed06000000b00649d35f852cmr8503381iog.186.1650929940113; 
 Mon, 25 Apr 2022 16:39:00 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.38.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:38:59 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/21] tests: ensure migration status isn't reported as
 failed
Date: Mon, 25 Apr 2022 19:38:35 -0400
Message-Id: <20220425233847.10393-10-peterx@redhat.com>
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

Various methods in the migration test call 'query_migrate' to fetch the
current status and then access a particular field. Almost all of these
cases expect the migration to be in a non-failed state. In the case of
'wait_for_migration_pass' in particular, if the status is 'failed' then
it will get into an infinite loop. By validating that the status is
not 'failed' the test suite will assert rather than hang when getting
into an unexpected state.

Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qtest/migration-helpers.c | 13 +++++++++++++
 tests/qtest/migration-helpers.h |  1 +
 tests/qtest/migration-test.c    |  6 +++---
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-helpers.c b/tests/qtest/migration-helpers.c
index 4ee26014b7..a6aa59e4e6 100644
--- a/tests/qtest/migration-helpers.c
+++ b/tests/qtest/migration-helpers.c
@@ -107,6 +107,19 @@ QDict *migrate_query(QTestState *who)
     return wait_command(who, "{ 'execute': 'query-migrate' }");
 }
 
+QDict *migrate_query_not_failed(QTestState *who)
+{
+    const char *status;
+    QDict *rsp = migrate_query(who);
+    status = qdict_get_str(rsp, "status");
+    if (g_str_equal(status, "failed")) {
+        g_printerr("query-migrate shows failed migration: %s\n",
+                   qdict_get_str(rsp, "error-desc"));
+    }
+    g_assert(!g_str_equal(status, "failed"));
+    return rsp;
+}
+
 /*
  * Note: caller is responsible to free the returned object via
  * g_free() after use
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index 555adafce1..d07e0fb748 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -26,6 +26,7 @@ G_GNUC_PRINTF(3, 4)
 void migrate_qmp(QTestState *who, const char *uri, const char *fmt, ...);
 
 QDict *migrate_query(QTestState *who);
+QDict *migrate_query_not_failed(QTestState *who);
 
 void wait_for_migration_status(QTestState *who,
                                const char *goal, const char **ungoals);
diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 5ea0b9360a..d9f444ea14 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -181,7 +181,7 @@ static int64_t read_ram_property_int(QTestState *who, const char *property)
     QDict *rsp_return, *rsp_ram;
     int64_t result;
 
-    rsp_return = migrate_query(who);
+    rsp_return = migrate_query_not_failed(who);
     if (!qdict_haskey(rsp_return, "ram")) {
         /* Still in setup */
         result = 0;
@@ -198,7 +198,7 @@ static int64_t read_migrate_property_int(QTestState *who, const char *property)
     QDict *rsp_return;
     int64_t result;
 
-    rsp_return = migrate_query(who);
+    rsp_return = migrate_query_not_failed(who);
     result = qdict_get_try_int(rsp_return, property, 0);
     qobject_unref(rsp_return);
     return result;
@@ -213,7 +213,7 @@ static void read_blocktime(QTestState *who)
 {
     QDict *rsp_return;
 
-    rsp_return = migrate_query(who);
+    rsp_return = migrate_query_not_failed(who);
     g_assert(qdict_haskey(rsp_return, "postcopy-blocktime"));
     qobject_unref(rsp_return);
 }
-- 
2.32.0


