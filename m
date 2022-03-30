Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155A4ECEF0
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:44:17 +0200 (CEST)
Received: from localhost ([::1]:39602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZg6w-0006aT-Ss
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:44:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2I-0005vb-C0
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2G-0005Fd-FH
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLFazjM2d/7k3yDS8eU700zmkV3N78vq83O/0EL3Xg8=;
 b=fy2nFrP3v4Pcw+CTmBsUsTfLfEgW0oiBiJHGQ595goBGgAcJ1E7VnIZFEfY3y26LPBRHKl
 bZqh2XOY6zDPYBvwIXv8idbfmoM89a94V+7NQXmMvNgpNAQxFXiKb+PTA48hm3XsHOQe3d
 FAb24+HFBFcaJR8NeUHY6fwldHhBXQE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-336-U7BR2CtxPuuLAN8ZaZ4I-A-1; Wed, 30 Mar 2022 17:39:20 -0400
X-MC-Unique: U7BR2CtxPuuLAN8ZaZ4I-A-1
Received: by mail-qt1-f198.google.com with SMTP id
 z18-20020ac84552000000b002e201c79cd4so18478038qtn.2
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pLFazjM2d/7k3yDS8eU700zmkV3N78vq83O/0EL3Xg8=;
 b=iXJyKVTYAIyKQAmO4YB1DvCYFvNgFWoYOgGMVymNsu8FBz/txk01t6LgpaaSt4aeQr
 /kGMAgKFZDB2GH4fZAL9jAlJxRl8SM129hXeu3WHzcJDeuoo39qlEE7E8RqfRdguWajw
 2TgfWvxIxOVJTJFm7Q0Vcga9rf2rC8x0MlBtboyOQCAu9z8XRhwLtyjVPSdaBcn7mxaD
 +v4fFPThC0XuZ7caASsFRLMZEo+KGWQsknaYI3zL90/Q3/GTv9YMvuZD1iTaRYmpfK84
 csV5jf+Rw4KFPGTaP1uCSZTEXqbc5nYf0R0YV9fRPi75BDB1KCCLWZIFgH8dfOXcjDmy
 VYTw==
X-Gm-Message-State: AOAM531s46kpYI4nUdCPdo5QRCazvyASkA0ymeDZWojHx/t1oZE3aaRj
 OSYao/vegebq8RaMUHPhEbd9bP0KKTeUJ/xHx066L6OKBWpKqApi5rF70RzvWXkk5xWrxvwmavS
 /BEBIch5vvwl3Uaq3CPrsM0SbksHYwtlHqWmt81kWWjOQsJZXlWquBO47DGuOGsio
X-Received: by 2002:a05:620a:28cc:b0:67d:b5f0:8d49 with SMTP id
 l12-20020a05620a28cc00b0067db5f08d49mr1285852qkp.100.1648676359813; 
 Wed, 30 Mar 2022 14:39:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIvkbKyCKTpSWb1uIuRsfOyqcWLHcPzCcQgYoOBxyyrY8OzWrQaX7T4mh2rDpQaJ1fqD5gfg==
X-Received: by 2002:a05:620a:28cc:b0:67d:b5f0:8d49 with SMTP id
 l12-20020a05620a28cc00b0067db5f08d49mr1285832qkp.100.1648676359469; 
 Wed, 30 Mar 2022 14:39:19 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:19 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/19] migration: Add postcopy-preempt capability
Date: Wed, 30 Mar 2022 17:38:57 -0400
Message-Id: <20220330213908.26608-9-peterx@redhat.com>
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


