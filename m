Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3274ECF18
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:51:11 +0200 (CEST)
Received: from localhost ([::1]:56202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZgDe-0000xk-CR
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:51:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2N-00062N-0q
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2L-0005Gm-Bb
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1qMQ8LRtoG4NBh/wSkWUaxdpYn6HvLjx1HvsHm6HlNw=;
 b=fC7fK7uRpCLAdklIU3pK/lu+Z3DIGqtZLqBSau/46sk3/wdOY8+CjJeZVWUdixM9vgVQfr
 g46oagtHeGaTyWHtH1btgntzgwA+j9Hqdh1GJOHDbUuZzb8LM/GiG/AGfvU16Uxk0Q29x5
 uZNsq7GqTrSW1WewT2eebo9pVbj2ggM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-628-ffBmkmTePPS7vvM6GiRQNg-1; Wed, 30 Mar 2022 17:39:27 -0400
X-MC-Unique: ffBmkmTePPS7vvM6GiRQNg-1
Received: by mail-qv1-f69.google.com with SMTP id
 t16-20020ad44850000000b00440e0f2a561so17051941qvy.11
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1qMQ8LRtoG4NBh/wSkWUaxdpYn6HvLjx1HvsHm6HlNw=;
 b=TNhl2CAHNKNm0neMPR/+vnN0kTrR+QkSpYZ3zdIcTI8v4RJsN3DauISCqxhPPz2++m
 DObUw2pod4gT/2JBMqzdIwpTsJNn/6EXX0tRRLZMzyUb1SaqqEAt7Y8eKS+sSOXs8LJ8
 Wg2GetN95n1bFrvz0C0Xif3eRnh5Eg4uHG7ND2rHJ3mWJWkDe0RA5rg1QWCut8VZ6lG+
 VDrhAWBPL7uEKtqCXqpt0xneyw4LBpBEMLU14G5XwZkvnZJ3i0ebxLhRAXBqYw+oMCbz
 lgZiYEJW+blCt7NR+Y927gVH+ibbXJOi0jw6nlJ7ZDYZ6k4eajS60TqQywX5JiwZjRGK
 r03A==
X-Gm-Message-State: AOAM532l6toBZ9ohOjK3Ie9aNQ0sPdkdVsgmDrqs8vcvDsw59nqLETVg
 5TyC7wr5Z5PEkbBp/NOIhuJRMzptyTIOobQjh8iOzpgqAl9GAmh2pIacNRsXZjKDluh705rWMj7
 /zmPEi97mFiC9xLnx4WmFvHRJ6SJiK7v8hrMGJ4UBNoaK6x4x6UPJLelnvfk1a6GM
X-Received: by 2002:ad4:5b8f:0:b0:443:5663:12ad with SMTP id
 15-20020ad45b8f000000b00443566312admr1168410qvp.93.1648676366878; 
 Wed, 30 Mar 2022 14:39:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1OGP4dHDEi9AA5hh9Yna9MKaPUDHRt7yCe9wjCpC8Yw1iVmUORjtIzAMOxI9Dj2BbLbnhng==
X-Received: by 2002:ad4:5b8f:0:b0:443:5663:12ad with SMTP id
 15-20020ad45b8f000000b00443566312admr1168389qvp.93.1648676366564; 
 Wed, 30 Mar 2022 14:39:26 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:26 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/19] migration: Add helpers to detect TLS capability
Date: Wed, 30 Mar 2022 17:39:04 -0400
Message-Id: <20220330213908.26608-16-peterx@redhat.com>
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


