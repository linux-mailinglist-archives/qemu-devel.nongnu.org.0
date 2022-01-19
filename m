Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF09A493653
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 09:28:18 +0100 (CET)
Received: from localhost ([::1]:43592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA6KH-0008N0-K4
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 03:28:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA63N-0007T6-ET
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nA638-0001Oa-ST
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:10:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642579833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6oq1adDfhZSwTXz9bHotu+7SyhrS/0oPNY1GQjeZV4=;
 b=OCVJzyjdiDiIiEtABGpELyDWv6a9N8S7GTcVt++eFCFfjFOczNAdbRrCfY3Oz8MAbgncZj
 WGieqapjd2yK9pogzC2S0YreX6k772hINTD92cWy2vp5Xi+71kmI5myovO2qcAh7GQ9Pdl
 b+krBENv0rdDPR3feQpngT7/DWO89ug=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-452-O5xeOtseOi6m668XGAuMvg-1; Wed, 19 Jan 2022 03:10:32 -0500
X-MC-Unique: O5xeOtseOi6m668XGAuMvg-1
Received: by mail-wm1-f72.google.com with SMTP id
 f7-20020a1cc907000000b0034b63f314ccso1329038wmb.6
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 00:10:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6oq1adDfhZSwTXz9bHotu+7SyhrS/0oPNY1GQjeZV4=;
 b=1a1HzawUTl1dMqJO727CrC4hoa6UYQoBJcyvfJmPAKNTAS4UeG+iPZlYGFiYuqbFdf
 +0M1wpO6gzW1gm3qzpTPnVfUG2D1BjUDeDHIAjDQIMbdjYAKttOJWeiTLLmuqbAXgT7i
 aOWCiSucYEmfZC2eWFB/wfcDczhBedKzVQmdKOM1x1I35vQmBF4v1R5uXI5ivoWib9XI
 QjPe8Nl5YhVg6xLgTnFfNc5a63PmDAYUP89estTvHRMdgO5GB2A3R8EZ7w+Xa7P99dBb
 EOjNOO9KPxl/ckICORKITyPccKzEmDA3OIo3laEiwwn0RoK1MaweoEUcP0L3DsrCfkYT
 oEsw==
X-Gm-Message-State: AOAM530kpSPGbOfkJB0/Tz4Kryz9JyjSDIGkzaV8q+HbbUOBdhoh5Wsa
 xCpjB8c1CoWj/cXsJBENQWmR8zAjiJzX/MLZcTq+n8HCLLp1brMwMb0u6trhP0k4gqrlPX6vLmv
 N9UvtLlIbCIQzxu6WIuU6NffOJT2v2oDS8iUWR4ZiWk8w8JX74Ga9nz5pNZ43rfmo
X-Received: by 2002:a05:600c:28cc:: with SMTP id
 h12mr2303618wmd.18.1642579830131; 
 Wed, 19 Jan 2022 00:10:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBuPn0xaYRF5x/f76lglgXVjY6Z7eL9CB/h4lLV85Zi1zgMs0Tq53xC5qUWw1NAsO+AaYrmw==
X-Received: by 2002:a05:600c:28cc:: with SMTP id
 h12mr2303594wmd.18.1642579829761; 
 Wed, 19 Jan 2022 00:10:29 -0800 (PST)
Received: from localhost.localdomain ([85.203.46.175])
 by smtp.gmail.com with ESMTPSA id a20sm4351606wmb.27.2022.01.19.00.10.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 19 Jan 2022 00:10:29 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 12/15] migration: Move migrate_allow_multifd and helpers
 into migration.c
Date: Wed, 19 Jan 2022 16:09:26 +0800
Message-Id: <20220119080929.39485-13-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119080929.39485-1-peterx@redhat.com>
References: <20220119080929.39485-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This variable, along with its helpers, is used to detect whether multiple
channel will be supported for migration.  In follow up patches, there'll be
other capability that requires multi-channels.  Hence move it outside multifd
specific code and make it public.  Meanwhile rename it from "multifd" to
"multi_channels" to show its real meaning.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 22 +++++++++++++++++-----
 migration/migration.h |  3 +++
 migration/multifd.c   | 19 ++++---------------
 migration/multifd.h   |  2 --
 4 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 252ce1eaec..15a48b548a 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -180,6 +180,18 @@ static int migration_maybe_pause(MigrationState *s,
                                  int new_state);
 static void migrate_fd_cancel(MigrationState *s);
 
+static bool migrate_allow_multi_channels = true;
+
+void migrate_protocol_allow_multi_channels(bool allow)
+{
+    migrate_allow_multi_channels = allow;
+}
+
+bool migrate_multi_channels_is_allowed(void)
+{
+    return migrate_allow_multi_channels;
+}
+
 static gint page_request_addr_cmp(gconstpointer ap, gconstpointer bp)
 {
     uintptr_t a = (uintptr_t) ap, b = (uintptr_t) bp;
@@ -463,12 +475,12 @@ static void qemu_start_incoming_migration(const char *uri, Error **errp)
 {
     const char *p = NULL;
 
-    migrate_protocol_allow_multifd(false); /* reset it anyway */
+    migrate_protocol_allow_multi_channels(false); /* reset it anyway */
     qapi_event_send_migration(MIGRATION_STATUS_SETUP);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multifd(true);
+        migrate_protocol_allow_multi_channels(true);
         socket_start_incoming_migration(p ? p : uri, errp);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
@@ -1252,7 +1264,7 @@ static bool migrate_caps_check(bool *cap_list,
 
     /* incoming side only */
     if (runstate_check(RUN_STATE_INMIGRATE) &&
-        !migrate_multifd_is_allowed() &&
+        !migrate_multi_channels_is_allowed() &&
         cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
         error_setg(errp, "multifd is not supported by current protocol");
         return false;
@@ -2310,11 +2322,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
         }
     }
 
-    migrate_protocol_allow_multifd(false);
+    migrate_protocol_allow_multi_channels(false);
     if (strstart(uri, "tcp:", &p) ||
         strstart(uri, "unix:", NULL) ||
         strstart(uri, "vsock:", NULL)) {
-        migrate_protocol_allow_multifd(true);
+        migrate_protocol_allow_multi_channels(true);
         socket_start_outgoing_migration(s, p ? p : uri, &local_err);
 #ifdef CONFIG_RDMA
     } else if (strstart(uri, "rdma:", &p)) {
diff --git a/migration/migration.h b/migration/migration.h
index 34b79cb961..d0c0902ec9 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -425,4 +425,7 @@ void migration_cancel(const Error *error);
 
 void populate_vfio_info(MigrationInfo *info);
 
+bool migrate_multi_channels_is_allowed(void);
+void migrate_protocol_allow_multi_channels(bool allow);
+
 #endif
diff --git a/migration/multifd.c b/migration/multifd.c
index 3242f688e5..64ca50de62 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -535,7 +535,7 @@ void multifd_save_cleanup(void)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
+    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
         return;
     }
     multifd_send_terminate_threads(NULL);
@@ -870,17 +870,6 @@ cleanup:
     multifd_new_send_channel_cleanup(p, sioc, local_err);
 }
 
-static bool migrate_allow_multifd = true;
-void migrate_protocol_allow_multifd(bool allow)
-{
-    migrate_allow_multifd = allow;
-}
-
-bool migrate_multifd_is_allowed(void)
-{
-    return migrate_allow_multifd;
-}
-
 int multifd_save_setup(Error **errp)
 {
     int thread_count;
@@ -891,7 +880,7 @@ int multifd_save_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
-    if (!migrate_multifd_is_allowed()) {
+    if (!migrate_multi_channels_is_allowed()) {
         error_setg(errp, "multifd is not supported by current protocol");
         return -1;
     }
@@ -989,7 +978,7 @@ int multifd_load_cleanup(Error **errp)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
+    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
         return 0;
     }
     multifd_recv_terminate_threads(NULL);
@@ -1138,7 +1127,7 @@ int multifd_load_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
-    if (!migrate_multifd_is_allowed()) {
+    if (!migrate_multi_channels_is_allowed()) {
         error_setg(errp, "multifd is not supported by current protocol");
         return -1;
     }
diff --git a/migration/multifd.h b/migration/multifd.h
index e57adc783b..0ed07794b6 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -13,8 +13,6 @@
 #ifndef QEMU_MIGRATION_MULTIFD_H
 #define QEMU_MIGRATION_MULTIFD_H
 
-bool migrate_multifd_is_allowed(void);
-void migrate_protocol_allow_multifd(bool allow);
 int multifd_save_setup(Error **errp);
 void multifd_save_cleanup(void);
 int multifd_load_setup(Error **errp);
-- 
2.32.0


