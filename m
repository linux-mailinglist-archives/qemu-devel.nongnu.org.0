Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C45774ECF05
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:48:26 +0200 (CEST)
Received: from localhost ([::1]:47778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgAz-0003iK-Se
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:48:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2F-0005om-MX
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2E-0005FE-4r
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVKNqyq4weVAvwWKRPYdQpiVnLIi/a9PNfjk/yWRalU=;
 b=VdrlNLxD0COPrikT7XAx7RcoHvZpnfeBpHDgtbUYYnwFNJWA4FaJ1/nJ4Y26kWEGhGn2dl
 alLEOKLfwfTEhRSOORx4x8gPrUu8aOgiGxMBKQJrTz/+KIUktBXJ/3RsO1Wxiduv0LMQS5
 KHJaNgS6BAor7qYmyBPYHm4/nu4htng=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-47-Dl9VVmRYOzygusRFUI3RIA-1; Wed, 30 Mar 2022 17:39:19 -0400
X-MC-Unique: Dl9VVmRYOzygusRFUI3RIA-1
Received: by mail-qv1-f71.google.com with SMTP id
 fw9-20020a056214238900b0043522aa5b81so17043063qvb.21
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TVKNqyq4weVAvwWKRPYdQpiVnLIi/a9PNfjk/yWRalU=;
 b=ewQbY3Y28SBYBVbFn0UxvbG7VAlxe7WtQOKb6CA/Klpi7IeYIxvCleqV9wTPWixILZ
 fr4e2opP7f158hS9noCxor+/GKg64+xHTZnzbvKfaLByEoyu+62oqoYBG8Sx4ZZmWtMg
 0thmmQ9U7iNWsmZCfz8It8V2W7OP5B8pKANxFoh2XZK/CQQE0yotVsMz8crDBf8capyl
 Vix0gQf376kRYJXk+gmh6uEJd9tukDpLWiu1QWHO2vQxdOJF9nldzPl8UHbyCc5fpQX3
 5yRlTW7hEh7bAqOTBa6Dkr6Li9eB+HwoBj9KWe5I46KZA07oclabeh/V6ytAccQgS0ry
 6o5A==
X-Gm-Message-State: AOAM530s94htCUvJBpo5tJ7+iTdRQ8SbbAvADs/SnyI8HlSKOhnyFKvK
 8dV7JB9e15YqtwiewTYlfEYBRg5ch36P/OGkCk6eyT5AGmA0GZPWOzKmQo26MX5GsIxqgV7i+wj
 UTrLBdPFGqMHQdjTjtJVq6f9ZxQmg5HpNnrC+oUeIjQoRpSsTpFYpoxi7mGkT5TtO
X-Received: by 2002:a05:620a:4556:b0:67e:b485:7b1f with SMTP id
 u22-20020a05620a455600b0067eb4857b1fmr1328197qkp.200.1648676359071; 
 Wed, 30 Mar 2022 14:39:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxr6M/o6kVeODRBrohbBvomp8VKcC/To+k3Nb11bEK5z9HnnQUGPktuNMXOX45fGsAlFtkFiA==
X-Received: by 2002:a05:620a:4556:b0:67e:b485:7b1f with SMTP id
 u22-20020a05620a455600b0067eb4857b1fmr1328169qkp.200.1648676358572; 
 Wed, 30 Mar 2022 14:39:18 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:18 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/19] migration: Allow migrate-recover to run multiple
 times
Date: Wed, 30 Mar 2022 17:38:56 -0400
Message-Id: <20220330213908.26608-8-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Previously migration didn't have an easy way to cleanup the listening
transport, migrate recovery only allows to execute once.  That's done with a
trick flag in postcopy_recover_triggered.

Now the facility is already there.

Drop postcopy_recover_triggered and instead allows a new migrate-recover to
release the previous listener transport.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 13 ++-----------
 migration/migration.h |  1 -
 migration/savevm.c    |  3 ---
 3 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 8ecf78f2c7..21fcf5102f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2164,11 +2164,8 @@ void qmp_migrate_recover(const char *uri, Error **errp)
         return;
     }
 
-    if (qatomic_cmpxchg(&mis->postcopy_recover_triggered,
-                       false, true) == true) {
-        error_setg(errp, "Migrate recovery is triggered already");
-        return;
-    }
+    /* If there's an existing transport, release it */
+    migration_incoming_transport_cleanup(mis);
 
     /*
      * Note that this call will never start a real migration; it will
@@ -2176,12 +2173,6 @@ void qmp_migrate_recover(const char *uri, Error **errp)
      * to continue using that newly established channel.
      */
     qemu_start_incoming_migration(uri, errp);
-
-    /* Safe to dereference with the assert above */
-    if (*errp) {
-        /* Reset the flag so user could still retry */
-        qatomic_set(&mis->postcopy_recover_triggered, false);
-    }
 }
 
 void qmp_migrate_pause(Error **errp)
diff --git a/migration/migration.h b/migration/migration.h
index f17ccc657c..a863032b71 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -139,7 +139,6 @@ struct MigrationIncomingState {
     struct PostcopyBlocktimeContext *blocktime_ctx;
 
     /* notify PAUSED postcopy incoming migrations to try to continue */
-    bool postcopy_recover_triggered;
     QemuSemaphore postcopy_pause_sem_dst;
     QemuSemaphore postcopy_pause_sem_fault;
 
diff --git a/migration/savevm.c b/migration/savevm.c
index 02ed94c180..d9076897b8 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2589,9 +2589,6 @@ static bool postcopy_pause_incoming(MigrationIncomingState *mis)
 
     assert(migrate_postcopy_ram());
 
-    /* Clear the triggered bit to allow one recovery */
-    mis->postcopy_recover_triggered = false;
-
     /*
      * Unregister yank with either from/to src would work, since ioc behind it
      * is the same
-- 
2.32.0


