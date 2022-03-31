Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5264EDC90
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:18:22 +0200 (CEST)
Received: from localhost ([::1]:41152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwZ3-00087b-Qm
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:18:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQG-000290-3u
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQD-0001Mj-Vc
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLFazjM2d/7k3yDS8eU700zmkV3N78vq83O/0EL3Xg8=;
 b=QBUaFv3Af/GRJlxHA7ySdzBrBuMH1vHiPlNtEmgl5pqxHhau2+qItcsDhQjd0qYoTFB5Y8
 PEc8tSpGREpLlKKCSG2wb0YUr9qStLOXLdbIPGprXLzWAiicR9a5p1G6plBhLLqc4i63nv
 XMy4iSt4wHRmox3KiKDZI6/wL2DYVBo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-czXO_HnoPjeFgXdVmJK4UA-1; Thu, 31 Mar 2022 11:09:08 -0400
X-MC-Unique: czXO_HnoPjeFgXdVmJK4UA-1
Received: by mail-qk1-f197.google.com with SMTP id
 d12-20020a379b0c000000b0067d8cda1aaaso14997813qke.8
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pLFazjM2d/7k3yDS8eU700zmkV3N78vq83O/0EL3Xg8=;
 b=kBb4K6zhCa6PXarvQt+ZWTFWBgKXHUlFfDBNpkXRVkdvrttVDlkxJW8Y229N4TNsWb
 ja/M+krTc8AIiucDUIf/1wZa8PHVKCYGuYkHqxaNfchcKN/tdw0hLtO6DW4YoC+ghXGQ
 tIYRJDaRRf+yl8OU7zDsH/FW76VbPzaDipnGHju4WsnTX9s4g76X1t/wf7Ru/9lVx4fu
 d+F56ySj8LujktlC9uiHQ/RrBpiIzMHhKYiY9CNA0dca9eOarfoaDxrPm5BKGs6OX+Uq
 X6oabopF1xPROHSKEXvV4hJoKSshH4QZi3moIkOgGKZwSI/7voDrL7bVQNhYz8Li5s4U
 SJLQ==
X-Gm-Message-State: AOAM530RZQPJpOL/0X9iYIg13HmfNjdYCfwu1tibgIZDfyl1uAcreO9h
 fDZ1LH3hkIQg/+4GbY+KJCex1GXNdrTLtRnQlalU0uBuZHtcdIRK0qlipnM65PQdAk+fEYTpOx7
 ItxWfmyqPflqZXxcKoNSNkEo39mXwylHfSBd60uQJSNjF9uxPvuWpnYhYHe4oMHkP
X-Received: by 2002:a37:a310:0:b0:67d:3749:16e7 with SMTP id
 m16-20020a37a310000000b0067d374916e7mr3619559qke.159.1648739347937; 
 Thu, 31 Mar 2022 08:09:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylfeRaYsO/ezB6ob0QqbPGvkV3dSAcJXvKI+Bjfc6GMPwRFocUPawtGG2MJ73FV/hcKjPytw==
X-Received: by 2002:a37:a310:0:b0:67d:3749:16e7 with SMTP id
 m16-20020a37a310000000b0067d374916e7mr3619526qke.159.1648739347529; 
 Thu, 31 Mar 2022 08:09:07 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.09.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:09:07 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/19] migration: Add postcopy-preempt capability
Date: Thu, 31 Mar 2022 11:08:46 -0400
Message-Id: <20220331150857.74406-9-peterx@redhat.com>
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

Firstly, postcopy already preempts precopy due to the fact that we do
unqueue_page() first before looking into dirty bits.

However that's not enough, e.g., when there're host huge page enabled, when
sending a precopy huge page, a postcopy request needs to wait until the whole
huge page that is sending to finish.  That could introduce quite some delay,
the bigger the huge page is the larger delay it'll bring.

This patch adds a new capability to allow postcopy requests to preempt existing
precopy page during sending a huge page, so that postcopy requests can be
serviced even faster.

Meanwhile to send it even faster, bypass the precopy stream by providing a
standalone postcopy socket for sending requested pages.

Since the new behavior will not be compatible with the old behavior, this will
not be the default, it's enabled only when the new capability is set on both
src/dst QEMUs.

This patch only adds the capability itself, the logic will be added in follow
up patches.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 23 +++++++++++++++++++++++
 migration/migration.h |  1 +
 qapi/migration.json   |  8 +++++++-
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 21fcf5102f..76e6ada524 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1235,6 +1235,11 @@ static bool migrate_caps_check(bool *cap_list,
             error_setg(errp, "Postcopy is not compatible with ignore-shared");
             return false;
         }
+
+        if (cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
+            error_setg(errp, "Multifd is not supported in postcopy");
+            return false;
+        }
     }
 
     if (cap_list[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT]) {
@@ -1278,6 +1283,13 @@ static bool migrate_caps_check(bool *cap_list,
         return false;
     }
 
+    if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT]) {
+        if (!cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
+            error_setg(errp, "Postcopy preempt requires postcopy-ram");
+            return false;
+        }
+    }
+
     return true;
 }
 
@@ -2627,6 +2639,15 @@ bool migrate_background_snapshot(void)
     return s->enabled_capabilities[MIGRATION_CAPABILITY_BACKGROUND_SNAPSHOT];
 }
 
+bool migrate_postcopy_preempt(void)
+{
+    MigrationState *s;
+
+    s = migrate_get_current();
+
+    return s->enabled_capabilities[MIGRATION_CAPABILITY_POSTCOPY_PREEMPT];
+}
+
 /* migration thread support */
 /*
  * Something bad happened to the RP stream, mark an error
@@ -4237,6 +4258,8 @@ static Property migration_properties[] = {
     DEFINE_PROP_MIG_CAP("x-compress", MIGRATION_CAPABILITY_COMPRESS),
     DEFINE_PROP_MIG_CAP("x-events", MIGRATION_CAPABILITY_EVENTS),
     DEFINE_PROP_MIG_CAP("x-postcopy-ram", MIGRATION_CAPABILITY_POSTCOPY_RAM),
+    DEFINE_PROP_MIG_CAP("x-postcopy-preempt",
+                        MIGRATION_CAPABILITY_POSTCOPY_PREEMPT),
     DEFINE_PROP_MIG_CAP("x-colo", MIGRATION_CAPABILITY_X_COLO),
     DEFINE_PROP_MIG_CAP("x-release-ram", MIGRATION_CAPABILITY_RELEASE_RAM),
     DEFINE_PROP_MIG_CAP("x-block", MIGRATION_CAPABILITY_BLOCK),
diff --git a/migration/migration.h b/migration/migration.h
index a863032b71..af4bcb19c2 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -394,6 +394,7 @@ int migrate_decompress_threads(void);
 bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
+bool migrate_postcopy_preempt(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/qapi/migration.json b/qapi/migration.json
index 18e2610e88..3523f23386 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -463,6 +463,12 @@
 #                       procedure starts. The VM RAM is saved with running VM.
 #                       (since 6.0)
 #
+# @postcopy-preempt: If enabled, the migration process will allow postcopy
+#                    requests to preempt precopy stream, so postcopy requests
+#                    will be handled faster.  This is a performance feature and
+#                    should not affect the correctness of postcopy migration.
+#                    (since 7.0)
+#
 # Features:
 # @unstable: Members @x-colo and @x-ignore-shared are experimental.
 #
@@ -476,7 +482,7 @@
            'block', 'return-path', 'pause-before-switchover', 'multifd',
            'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
            { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
-           'validate-uuid', 'background-snapshot'] }
+           'validate-uuid', 'background-snapshot', 'postcopy-preempt'] }
 
 ##
 # @MigrationCapabilityStatus:
-- 
2.32.0


