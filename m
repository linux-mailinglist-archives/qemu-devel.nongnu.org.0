Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A98F50ED08
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 01:56:10 +0200 (CEST)
Received: from localhost ([::1]:59572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj8Yr-0003ga-Oj
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 19:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8Ib-0007e9-3u
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nj8IU-0007mI-2r
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 19:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650929953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eBQDwvtmOZY5wk96SFWQkFT//BSK1OTV7nmeGyxu89o=;
 b=OKcnzMoMie9taTgmuK7O0QXx8y7K0c18zkQMYLhnhkC9liF58qzIUJQhKawi/MQbtZL7Qi
 XqxCy8dXdYtbGoCjzZ6sfXM+Pt58JvWIGyetSIKoDOsXhdcwzm0+s0yjLfuDMsFObk7r7t
 k5Bk4UjdceAGB/Gsb4faAHN+0dlhuWg=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-EPDf6R8hNkWvaQeVM97KXQ-1; Mon, 25 Apr 2022 19:39:09 -0400
X-MC-Unique: EPDf6R8hNkWvaQeVM97KXQ-1
Received: by mail-io1-f70.google.com with SMTP id
 a17-20020a056602209100b006549a9cd480so12526524ioa.15
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 16:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBQDwvtmOZY5wk96SFWQkFT//BSK1OTV7nmeGyxu89o=;
 b=3Dtew5y9O1BpPTWHJk298bix73GUe8UQ8AwQTfBiBV83rmRrIFL+RNXpKapbnU3n2p
 OPzCVyjo1fys8UOGqw5cur+5Rc0Od/h+sB3c2FBxPzG0LkiEMjBBG0Mr9UtzgYqDlsdi
 CxuWCqHFC4SGXTYvJPMLF/ptokPM6h0e6WCuoL5kGQEJJfajMxwTq+wOyhuk2x5P7EXX
 ETXFkvcui8daygVM/BmBk+cxXMkgPF2JH3WnKX1O6jjA6llL/q6FiTCvBCxXKVpEOlP3
 nR2IQx3+ArpwAimTZahHe0Rb6kk/JPmgLB1qvbIRenHM9vHgKGdvX+tgJufuaVmrEpoI
 lYow==
X-Gm-Message-State: AOAM533PIq5L84nbgWiB1GDPJGe0fHj9Sp5sBUkCvTBp/zaUHY4N0jrj
 Y5fwO0pNuAdFamHntXFSuUyThVqi1aZWv6EoSgj/Xs5Q01xXJ8zepXlk9EAvMZAo1BCnmgSKLSB
 cG84H90Q7SVCI7hV36L9jYMxOr1SbM+N6Lyz84tCJ+ZsOPVM6ECCfXuxGMHC8YGwe
X-Received: by 2002:a6b:4e12:0:b0:653:7683:2e32 with SMTP id
 c18-20020a6b4e12000000b0065376832e32mr8296072iob.165.1650929948675; 
 Mon, 25 Apr 2022 16:39:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1OKf2zwMLfWyLRHer8ilsZDHEfxPNXUOV3EHx27LvH/+LzWPFIoHo2De2sTWWO2fjh4+eBw==
X-Received: by 2002:a6b:4e12:0:b0:653:7683:2e32 with SMTP id
 c18-20020a6b4e12000000b0065376832e32mr8296061iob.165.1650929948299; 
 Mon, 25 Apr 2022 16:39:08 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a92c087000000b002cd809af4e4sm5435072ile.56.2022.04.25.16.39.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Apr 2022 16:39:07 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 16/21] migration: Add helpers to detect TLS capability
Date: Mon, 25 Apr 2022 19:38:42 -0400
Message-Id: <20220425233847.10393-17-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220425233847.10393-1-peterx@redhat.com>
References: <20220425233847.10393-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add migrate_tls_enabled() to detect whether TLS is configured.

Add migrate_channel_requires_tls() to detect whether the specific channel
requires TLS.

No functional change intended.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/channel.c   | 10 ++--------
 migration/migration.c |  8 ++++++++
 migration/migration.h |  2 ++
 migration/multifd.c   |  7 +------
 migration/tls.c       |  9 +++++++++
 migration/tls.h       |  4 ++++
 6 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index c6a8dcf1d7..36e59eaeec 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -38,10 +38,7 @@ void migration_channel_process_incoming(QIOChannel *ioc)
     trace_migration_set_incoming_channel(
         ioc, object_get_typename(OBJECT(ioc)));
 
-    if (s->parameters.tls_creds &&
-        *s->parameters.tls_creds &&
-        !object_dynamic_cast(OBJECT(ioc),
-                             TYPE_QIO_CHANNEL_TLS)) {
+    if (migrate_channel_requires_tls(ioc)) {
         migration_tls_channel_process_incoming(s, ioc, &local_err);
     } else {
         migration_ioc_register_yank(ioc);
@@ -71,10 +68,7 @@ void migration_channel_connect(MigrationState *s,
         ioc, object_get_typename(OBJECT(ioc)), hostname, error);
 
     if (!error) {
-        if (s->parameters.tls_creds &&
-            *s->parameters.tls_creds &&
-            !object_dynamic_cast(OBJECT(ioc),
-                                 TYPE_QIO_CHANNEL_TLS)) {
+        if (migrate_channel_requires_tls(ioc)) {
             migration_tls_channel_connect(s, ioc, hostname, &error);
 
             if (!error) {
diff --git a/migration/migration.c b/migration/migration.c
index cd9650f2e2..71a50b5c37 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -49,6 +49,7 @@
 #include "trace.h"
 #include "exec/target_page.h"
 #include "io/channel-buffer.h"
+#include "io/channel-tls.h"
 #include "migration/colo.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
@@ -4250,6 +4251,13 @@ void migration_global_dump(Monitor *mon)
                    ms->clear_bitmap_shift);
 }
 
+bool migrate_tls_enabled(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->parameters.tls_creds && *s->parameters.tls_creds;
+}
+
 #define DEFINE_PROP_MIG_CAP(name, x)             \
     DEFINE_PROP_BOOL(name, MigrationState, enabled_capabilities[x], false)
 
diff --git a/migration/migration.h b/migration/migration.h
index 6ee520642f..db176ea749 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -436,6 +436,8 @@ bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
 bool migrate_postcopy_preempt(void);
+/* Whether TLS is enabled for migration? */
+bool migrate_tls_enabled(void);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/migration/multifd.c b/migration/multifd.c
index 9ea4f581e2..19e3c44491 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -782,17 +782,12 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
                                     QIOChannel *ioc,
                                     Error *error)
 {
-    MigrationState *s = migrate_get_current();
-
     trace_multifd_set_outgoing_channel(
         ioc, object_get_typename(OBJECT(ioc)),
         migrate_get_current()->hostname, error);
 
     if (!error) {
-        if (s->parameters.tls_creds &&
-            *s->parameters.tls_creds &&
-            !object_dynamic_cast(OBJECT(ioc),
-                                 TYPE_QIO_CHANNEL_TLS)) {
+        if (migrate_channel_requires_tls(ioc)) {
             multifd_tls_channel_connect(p, ioc, &error);
             if (!error) {
                 /*
diff --git a/migration/tls.c b/migration/tls.c
index 32c384a8b6..bd1fa01048 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -166,3 +166,12 @@ void migration_tls_channel_connect(MigrationState *s,
                               NULL,
                               NULL);
 }
+
+bool migrate_channel_requires_tls(QIOChannel *ioc)
+{
+    if (!migrate_tls_enabled()) {
+        return false;
+    }
+
+    return !object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS);
+}
diff --git a/migration/tls.h b/migration/tls.h
index de4fe2cafd..a54c1dcec7 100644
--- a/migration/tls.h
+++ b/migration/tls.h
@@ -37,4 +37,8 @@ void migration_tls_channel_connect(MigrationState *s,
                                    QIOChannel *ioc,
                                    const char *hostname,
                                    Error **errp);
+
+/* Whether the QIO channel requires further TLS handshake? */
+bool migrate_channel_requires_tls(QIOChannel *ioc);
+
 #endif
-- 
2.32.0


