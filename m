Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527A84EDCBF
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:25:44 +0200 (CEST)
Received: from localhost ([::1]:57632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwgB-0002V9-Dk
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:25:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQL-0002I1-8S
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQH-0001NO-Gd
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qMQ8LRtoG4NBh/wSkWUaxdpYn6HvLjx1HvsHm6HlNw=;
 b=G5nf78ZU67qblUNSKJyWlZgqGPyVvgnH47yqneAp0I2gw+XR+LThLUvdYKIEqxQ0DXBiTA
 nvPM6woBCTikUDqIubFvqSzBFuEJtb8cSSDqD+Wj3ipUzXfqnzkG4vWAfbSaovEuRmvfag
 L4ckRgCcsrnIaB88ZpD7YeYbCu4iJ8I=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-9oqoht7tOC6O_GeSpNKeLw-1; Thu, 31 Mar 2022 11:09:15 -0400
X-MC-Unique: 9oqoht7tOC6O_GeSpNKeLw-1
Received: by mail-qt1-f197.google.com with SMTP id
 h11-20020a05622a170b00b002e0769b9018so20288899qtk.14
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1qMQ8LRtoG4NBh/wSkWUaxdpYn6HvLjx1HvsHm6HlNw=;
 b=Gvqg/I4o6QwG+iALGKnwCHGz234ig5l/vFFscKEMLIb5s2yudr5QwXc1Qz7xuYdu3U
 im3769DrZRo/6B8bjQd/5iD6FjGcpJa1FGc5S7ZxMlByEw5fhRauuTbyjELIo+y4zW6z
 AmCyO8kUlO4kVMBl2IFDrQ+B5+osyNeH/VE9VKpibZlxRffx/NLQwck4BMv4dbk2JnEo
 zSgIxZixUp7lfVCFDVbXBG5p0OJbWJIM088YYu3nO4C5MXsd+MMrPNU96F8OZOBBQco4
 nlcNuCXPdsBcZtyLTRX4CTDbfQTv1eC2iCe4zjLo4zzWb82xTsTb+nV1UwU/7uWVPrmX
 pTbA==
X-Gm-Message-State: AOAM531chPw8OwMi3j+b4jM4UNLRBaVjtyiLhBmZRylayizYfQD3MUHN
 FTifhWaCTGUYIoNNaj1OCXaL+jpB6ZJUGKAErJmhzIwINVWRdNnPtHAlplCWesypTOAiP+SZCU4
 fKA2W45gjfB0JRAXQcJVEXWY7Zd3r2s/GxLNW6OnwMwOLXiqIgTa4+R9Z4oVAvKnl
X-Received: by 2002:a05:6214:21a5:b0:440:f3b8:d0aa with SMTP id
 t5-20020a05621421a500b00440f3b8d0aamr4093951qvc.61.1648739354562; 
 Thu, 31 Mar 2022 08:09:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYw6u36LH1OfTB/EeT7CvW70MsOxI+4vTlw6W5AOo3+h8Cl7SSDok6hZfoOHKIuv0QFiKJyA==
X-Received: by 2002:a05:6214:21a5:b0:440:f3b8:d0aa with SMTP id
 t5-20020a05621421a500b00440f3b8d0aamr4093902qvc.61.1648739354074; 
 Thu, 31 Mar 2022 08:09:14 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.09.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:09:13 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 14/19] migration: Add helpers to detect TLS capability
Date: Thu, 31 Mar 2022 11:08:52 -0400
Message-Id: <20220331150857.74406-15-peterx@redhat.com>
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
index ee3df9e229..899084f993 100644
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
@@ -4251,6 +4252,22 @@ void migration_global_dump(Monitor *mon)
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
-- 
2.32.0


