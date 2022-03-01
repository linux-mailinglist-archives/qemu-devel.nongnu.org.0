Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A55B4C8748
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:03:18 +0100 (CET)
Received: from localhost ([::1]:37136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyPd-0007gc-HI
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:03:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3A-00048A-Li
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy38-0007y3-SX
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZXUvDOAZVCZx2PDK+m45rb6PvTxxwhcJ0/eKmX4lZqw=;
 b=SUSCRc4Ajntj6sYUO9avOuX1sJIXJOQRltgEoF8QBYLDS8KR+3xOUNFvkzH7/ZzqjGuBSd
 F9xe6BWTKFNkb5QTcG4EHf31nxcA6BU+eNpSJEQV2PScVquW7MvGre8hfJyUW4O47cn4Ue
 5M10sHvJuzZF2Za9bWgoD5iQGKwWGFM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-B-r03E_HO62t223aYsJysw-1; Tue, 01 Mar 2022 03:40:01 -0500
X-MC-Unique: B-r03E_HO62t223aYsJysw-1
Received: by mail-pl1-f198.google.com with SMTP id
 w13-20020a1709027b8d00b0014fb4f012d3so5939944pll.12
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZXUvDOAZVCZx2PDK+m45rb6PvTxxwhcJ0/eKmX4lZqw=;
 b=rPFjNtUrXu6MDPKUtwRRVklriuUKYNV139zCspQE5njLqzCezTaT9GtDtHXql6VVW0
 HppS6qhNszyLqK4V/qQMKKEER0/+sVCVBVkbroWV4Bsj70AMHv+yG54bwf9JcPWX3PhT
 7J0r5FtJmZCOg+eQMWAeytj0fK+J9gm1UVgcX65irZzIMOFakQhBqoBeurwUei1Ufn5W
 t5Ti7jnD/XTCVnXxt8Ozhq0Os0fLhiSpHH2vCnusN13luDP+4ar7FBZoQr9wqGUzcjJF
 kwG1lOjeOVIawvwjhPmbPI5TcIs3UrJAhRW8rxz99HeYHDWaT2oNf3fdB4pwGlg89PCk
 dl9Q==
X-Gm-Message-State: AOAM5334jQuM0eJ8kLvEFBLozBab7TjaL0KLRZiTv+zhZlvKuq8AwLH/
 7rJM+zAiWCFY/fPV6iGN7FOkj4z2oixSiU4z3tjtQSe1u742bOksKffpU4pOBJQPwGF22svzPRP
 3kaz+mhegFe83i4Vey0FzYaSQJ2MMzQgOJMZ/Cq35XA55OLN/t5Uf8rSg8gyxMGkr
X-Received: by 2002:a63:6442:0:b0:362:ad55:f5e5 with SMTP id
 y63-20020a636442000000b00362ad55f5e5mr20533626pgb.180.1646123999891; 
 Tue, 01 Mar 2022 00:39:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx+XmbDpBTAO+fNhOZUfh7tdYxE0EFdQ/qqLtIuvt5J153NKwwbmf3Zs4wou3RQsei0UMlcnA==
X-Received: by 2002:a63:6442:0:b0:362:ad55:f5e5 with SMTP id
 y63-20020a636442000000b00362ad55f5e5mr20533601pgb.180.1646123999488; 
 Tue, 01 Mar 2022 00:39:59 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.39.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:39:59 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/25] migration: Move migrate_allow_multifd and helpers
 into migration.c
Date: Tue,  1 Mar 2022 16:39:09 +0800
Message-Id: <20220301083925.33483-10-peterx@redhat.com>
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

This variable, along with its helpers, is used to detect whether multiple
channel will be supported for migration.  In follow up patches, there'll be
other capability that requires multi-channels.  Hence move it outside multifd
specific code and make it public.  Meanwhile rename it from "multifd" to
"multi_channels" to show its real meaning.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 22 +++++++++++++++++-----
 migration/migration.h |  3 +++
 migration/multifd.c   | 19 ++++---------------
 migration/multifd.h   |  2 --
 4 files changed, 24 insertions(+), 22 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index bcc385b94b..6e4cc9cc87 100644
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
@@ -1255,7 +1267,7 @@ static bool migrate_caps_check(bool *cap_list,
 
     /* incoming side only */
     if (runstate_check(RUN_STATE_INMIGRATE) &&
-        !migrate_multifd_is_allowed() &&
+        !migrate_multi_channels_is_allowed() &&
         cap_list[MIGRATION_CAPABILITY_MULTIFD]) {
         error_setg(errp, "multifd is not supported by current protocol");
         return false;
@@ -2313,11 +2325,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
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
index d8b9850eae..d677a750c9 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -429,4 +429,7 @@ void migration_cancel(const Error *error);
 void populate_vfio_info(MigrationInfo *info);
 void postcopy_temp_page_reset(PostcopyTmpPage *tmp_page);
 
+bool migrate_multi_channels_is_allowed(void);
+void migrate_protocol_allow_multi_channels(bool allow);
+
 #endif
diff --git a/migration/multifd.c b/migration/multifd.c
index 76b57a7177..180586dcde 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -517,7 +517,7 @@ void multifd_save_cleanup(void)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
+    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
         return;
     }
     multifd_send_terminate_threads(NULL);
@@ -858,17 +858,6 @@ cleanup:
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
@@ -879,7 +868,7 @@ int multifd_save_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
-    if (!migrate_multifd_is_allowed()) {
+    if (!migrate_multi_channels_is_allowed()) {
         error_setg(errp, "multifd is not supported by current protocol");
         return -1;
     }
@@ -980,7 +969,7 @@ int multifd_load_cleanup(Error **errp)
 {
     int i;
 
-    if (!migrate_use_multifd() || !migrate_multifd_is_allowed()) {
+    if (!migrate_use_multifd() || !migrate_multi_channels_is_allowed()) {
         return 0;
     }
     multifd_recv_terminate_threads(NULL);
@@ -1129,7 +1118,7 @@ int multifd_load_setup(Error **errp)
     if (!migrate_use_multifd()) {
         return 0;
     }
-    if (!migrate_multifd_is_allowed()) {
+    if (!migrate_multi_channels_is_allowed()) {
         error_setg(errp, "multifd is not supported by current protocol");
         return -1;
     }
diff --git a/migration/multifd.h b/migration/multifd.h
index 4dda900a0b..636e599395 100644
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


