Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2A54C8775
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:12:21 +0100 (CET)
Received: from localhost ([::1]:47066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyYP-0006Nz-1v
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:12:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3k-0004Wm-6A
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3i-0008MX-6Q
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wWGELbbBUsyM61ubBs61dKQWxxrQsZk2X7zAss01FCA=;
 b=fvtk6ZSb0xUOsk07tnlEl/72sQ+GTB0hk6ltMUYpeCBIPeh2BHsjEKurT9MgfyQWRfpEzK
 /tbRrlx9DvmOK5CLCzQ2QKbbFgUFgdkhe0WbGWCFAHz5W6ub64PVUTWL4msYrs2pNBnp6D
 +DHV2VIUUrCDrbd/sFvRb84mNkQ0Ou8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-R362sVgZPxOYLIshTpRjHg-1; Tue, 01 Mar 2022 03:40:36 -0500
X-MC-Unique: R362sVgZPxOYLIshTpRjHg-1
Received: by mail-pj1-f71.google.com with SMTP id
 m3-20020a17090a3f8300b001bd33af55f2so1212328pjc.1
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wWGELbbBUsyM61ubBs61dKQWxxrQsZk2X7zAss01FCA=;
 b=5R0yx5lu7o4l+KDjn6dmq45gMkPiAxpZ8z2YP9rh9j24dcDTikCWWp6UXexBjpTty9
 bAD3eqffNcL95OpoDLQYkstEtfWMtGLcWyPmYldpaJ0UQQ2Nio22RJEdmBObL/i/E4VU
 NErLaznr9XQzY4Lp1qoPfZmOOodSS7Gmsk0wdxKVr0NQ23pqxz748jeSqzZ0Ij6DYJ65
 DuPeALG0wzO5ES0ZnAdASCeNYEBPFjOi+I7m5aJpDB8G2AHW4LqfYGYkjxveLFjSf7tZ
 7t8cWUo2YwhPFV4Z7hcIfWpzqsiLh+itoKH2WkvzfsDLKFWvhj2xeztmEuuclreEiiCW
 SQLA==
X-Gm-Message-State: AOAM530Wg24uTD1PeuSSpDTmUnRBQNdz+pRg087B8Z4xkc5kB8Sgk7FC
 817KVyUUX9p0YYB/FPAEftN1I2cwGjfjJ0V51syUynCMdNdx+JpnZH7lBOeF0U0A8WpCfv/7kMk
 TfzlpRJeQ4UbyjHnXKI5sTeN9p/lnPga3hN6rQ4Kewv2/QadUChXZSUP8u0xWH3X5
X-Received: by 2002:a63:944:0:b0:374:5324:eea1 with SMTP id
 65-20020a630944000000b003745324eea1mr20964856pgj.366.1646124035467; 
 Tue, 01 Mar 2022 00:40:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmYhh6E7VjGY5Qbh+0HMxF0pxaLwc9NPrkQHwFuN1M+Z2f7/bfbUOej+a9RVBF0v6xFDqRAQ==
X-Received: by 2002:a63:944:0:b0:374:5324:eea1 with SMTP id
 65-20020a630944000000b003745324eea1mr20964832pgj.366.1646124035093; 
 Tue, 01 Mar 2022 00:40:35 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.40.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:34 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/25] migration: Add helpers to detect TLS capability
Date: Tue,  1 Mar 2022 16:39:22 +0800
Message-Id: <20220301083925.33483-23-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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

Add migrate_tls_enabled() to detect whether TLS is configured.

Add migrate_channel_requires_tls() to detect whether the specific channel
requires TLS.

No functional change intended.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/channel.c   | 10 ++--------
 migration/migration.c | 17 +++++++++++++++++
 migration/migration.h |  4 ++++
 migration/multifd.c   |  7 +------
 4 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index c4fc000a1a..85ac053275 100644
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
index cd4a150202..f30bad982c 100644
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
@@ -4246,6 +4247,22 @@ void migration_global_dump(Monitor *mon)
                    ms->clear_bitmap_shift);
 }
 
+bool migrate_tls_enabled(void)
+{
+    MigrationState *s = migrate_get_current();
+
+    return s->parameters.tls_creds && *s->parameters.tls_creds;
+}
+
+bool migrate_channel_requires_tls(QIOChannel *ioc)
+{
+    if (!migrate_tls_enabled()) {
+        return false;
+    }
+
+    return !object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS);
+}
+
 #define DEFINE_PROP_MIG_CAP(name, x)             \
     DEFINE_PROP_BOOL(name, MigrationState, enabled_capabilities[x], false)
 
diff --git a/migration/migration.h b/migration/migration.h
index 6ee520642f..8b9ad7fe31 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -436,6 +436,10 @@ bool migrate_use_events(void);
 bool migrate_postcopy_blocktime(void);
 bool migrate_background_snapshot(void);
 bool migrate_postcopy_preempt(void);
+/* Whether TLS is enabled for migration? */
+bool migrate_tls_enabled(void);
+/* Whether the QIO channel requires further TLS handshake? */
+bool migrate_channel_requires_tls(QIOChannel *ioc);
 
 /* Sending on the return path - generic and then for each message type */
 void migrate_send_rp_shut(MigrationIncomingState *mis,
diff --git a/migration/multifd.c b/migration/multifd.c
index 180586dcde..46dfcbfa1d 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -784,16 +784,11 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
                                     QIOChannel *ioc,
                                     Error *error)
 {
-    MigrationState *s = migrate_get_current();
-
     trace_multifd_set_outgoing_channel(
         ioc, object_get_typename(OBJECT(ioc)), p->tls_hostname, error);
 
     if (!error) {
-        if (s->parameters.tls_creds &&
-            *s->parameters.tls_creds &&
-            !object_dynamic_cast(OBJECT(ioc),
-                                 TYPE_QIO_CHANNEL_TLS)) {
+        if (migrate_channel_requires_tls(ioc)) {
             multifd_tls_channel_connect(p, ioc, &error);
             if (!error) {
                 /*
-- 
2.32.0


