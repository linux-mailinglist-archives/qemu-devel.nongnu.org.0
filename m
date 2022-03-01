Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BED8C4C87A6
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:18:08 +0100 (CET)
Received: from localhost ([::1]:54470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOydz-0003Aq-Oy
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:18:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3T-0004Kh-Hm
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3R-0008GO-Jd
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124020;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6TAoGPC83WG2WE9uR3fdoGBug6yf6QOx7nZQCRz0NcE=;
 b=Q+7PIlQ0r6YqsqJf4MJgroWg/FqWJfsDIpE9AgCkTj5aCvnbg0FMzgdVhgAh+WursZR9si
 qXUEJn8HMnxp8cdN886T+cKDp1X6dwaCPaQjzG1PC+rsfc4x3A8KrjIIvojPT/QUtXApdj
 tdzMtlCxT21a+EyvQEoqGieCRQ3qIEY=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-WL3FOHRENfWnZor6p4wMRw-1; Tue, 01 Mar 2022 03:40:20 -0500
X-MC-Unique: WL3FOHRENfWnZor6p4wMRw-1
Received: by mail-pj1-f69.google.com with SMTP id
 p5-20020a17090a748500b001bee6752974so140315pjk.8
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6TAoGPC83WG2WE9uR3fdoGBug6yf6QOx7nZQCRz0NcE=;
 b=TUsNJHHLzwv95CzdNh3zpS0aq0NrlUyu2SXzsPO2nUp+NxEPvuWWI4e/TCVR/P1Vn1
 mw6oWNLZyfMXtwCopDIQaXxDiT0rKs71w1vHd5j/3epnCkpQA2OMSF5U57oxJrUldPsB
 x9P4hch1cAdJWmiZCGRUvj6aMqm4T2FSzDbvV5lRx7sBpkqyUzoOZLAjy8qMc5E3Nzvi
 wbKPJYn1pg72Z0HFb36gvaenGbnJ7YRYwx/3N7ILfQEo2PqmLArGm3KdCInFApK4CYOj
 hWb90EeD6mMMGaAjRLf7nFZyaMLLd0iiF3/Dlw2zELK7WORvM+wSyq0rPS8MKigbmEPs
 TfWA==
X-Gm-Message-State: AOAM533g+wwk9oK2RSczqmKcj/CHZdHgrH7OnlR0Y4+q0PtPTuoQraN9
 LopqOyUy+ghXGc6M6mx2+6Y8/OIiVpZDtTSvxCZcS9Yac/R0yVw3fYI51Hxy1qaYkpKnL+BABIc
 pLZQL1zYuuHR48a8DHpZgKLi5bLKy4milCgWjVx2FE914LDKPgAbzlw6eIr2OV9TN
X-Received: by 2002:aa7:81c3:0:b0:4f2:6d3f:6158 with SMTP id
 c3-20020aa781c3000000b004f26d3f6158mr26364367pfn.82.1646124018652; 
 Tue, 01 Mar 2022 00:40:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwq7FZgTqBlkOhdhz2NkPC8xaZ7IqE+dRb+pqhwfce/6oRmXZXRMCeUvLJbgLNv8VrUpTVSWg==
X-Received: by 2002:aa7:81c3:0:b0:4f2:6d3f:6158 with SMTP id
 c3-20020aa781c3000000b004f26d3f6158mr26364334pfn.82.1646124018224; 
 Tue, 01 Mar 2022 00:40:18 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.40.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:17 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 16/25] migration: Add postcopy-preempt capability
Date: Tue,  1 Mar 2022 16:39:16 +0800
Message-Id: <20220301083925.33483-17-peterx@redhat.com>
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
index 16086897aa..4c22bad304 100644
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
 
@@ -2622,6 +2634,15 @@ bool migrate_background_snapshot(void)
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
@@ -4232,6 +4253,8 @@ static Property migration_properties[] = {
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
index 5975a0e104..50878b5f3b 100644
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


