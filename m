Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADD055558D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 22:56:42 +0200 (CEST)
Received: from localhost ([::1]:35212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o47Oz-0007qr-Hr
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 16:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IL-0002pe-Kn
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1o47IJ-0004Iz-TZ
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 16:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655930987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=540YHl4vbNEoceJeIl9C/p7RZrCYqlHgo1ki0gch8bM=;
 b=adnb3KoFcscYiiBJCzgrLrmfVWIxL28TfIekHHkYeLtsWzi84McKkLPvsx4mU2p7Dia9Dc
 RRBXiCE2WNcnuLrIIFyb5F6UKgzG0lDjHqmJGKWUx3JikZryCtSg++J49u4RddqYpUreX1
 N4zdnmf9dzZEQUtxI27ZrxlogIZGxaA=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-aRju-fNDOu-zmISBvJeuBA-1; Wed, 22 Jun 2022 16:49:46 -0400
X-MC-Unique: aRju-fNDOu-zmISBvJeuBA-1
Received: by mail-il1-f199.google.com with SMTP id
 p12-20020a056e02144c00b002d196a4d73eso11703204ilo.18
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 13:49:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=540YHl4vbNEoceJeIl9C/p7RZrCYqlHgo1ki0gch8bM=;
 b=UT5eMCaX9uaWeLyu1DoZeSwuHx+TEiBZ4A1Osx7WRgHzfaJZMHqoyFWt56f/WQf6Pi
 /jOYj+qD9W1/5NSY2Jp56EB/iQurVRQ/MvekLB6S/etCOFmtGEsJCwF/1k+ybxoncSO5
 6EdNOMIpEz/mievhKo8CqlokEy3nDgQWjwz/Ab7jV7a+ggKxuCqMmBU0B+AuYW/PAqfq
 wRzn2/JWELe5izqsBNSy9jxteFT1YoQL/ZQGHmHzrPCreOkE+QVbhz6MP0cb1olpVTDJ
 rr1K002E+SegmEewyHuCHV8K/CjnrpC02JsMXlwRA19KIPnRxkPTc28tllsGJ2xDtz9h
 uaZA==
X-Gm-Message-State: AJIora8ExDh56HEal0qDR4bYT0YDLHwXVfbj8Q6FAAJ5wcVhYhZLmnM0
 7uE2Y3lruRwZOCXaAx1EblnFO3y6odiZT4WGmFkJ5eEdxpdEbx0Kl1B7fMj4KhIrleW6D7VZBJ5
 uyW5LgdbmS11s374HUbGNyKfZ0otyWHjoncG0mrqzTbJPOoA6++BT1Gz2W4h8WsWs
X-Received: by 2002:a02:cc0c:0:b0:339:c46a:e5dd with SMTP id
 n12-20020a02cc0c000000b00339c46ae5ddmr3177137jap.104.1655930985184; 
 Wed, 22 Jun 2022 13:49:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sj0ZMrVhz7VWXmN54uCbtmy68yIMFGvS40alcP5ZDtNmY3A/3ZVSOJ3/WbLw45Q7Od+oqX0A==
X-Received: by 2002:a02:cc0c:0:b0:339:c46a:e5dd with SMTP id
 n12-20020a02cc0c000000b00339c46ae5ddmr3177121jap.104.1655930984933; 
 Wed, 22 Jun 2022 13:49:44 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 b44-20020a0295af000000b0032b3a7817a7sm8920323jai.107.2022.06.22.13.49.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Jun 2022 13:49:44 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Subject: [PATCH v8 08/15] migration: Add helpers to detect TLS capability
Date: Wed, 22 Jun 2022 16:49:13 -0400
Message-Id: <20220622204920.79061-9-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220622204920.79061-1-peterx@redhat.com>
References: <20220622204920.79061-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add migrate_channel_requires_tls() to detect whether the specific channel
requires TLS, leveraging the recently introduced migrate_use_tls().  No
functional change intended.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/channel.c   | 9 ++-------
 migration/migration.c | 1 +
 migration/multifd.c   | 4 +---
 migration/tls.c       | 9 +++++++++
 migration/tls.h       | 4 ++++
 5 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/migration/channel.c b/migration/channel.c
index 90087d8986..1b0815039f 100644
--- a/migration/channel.c
+++ b/migration/channel.c
@@ -38,9 +38,7 @@ void migration_channel_process_incoming(QIOChannel *ioc)
     trace_migration_set_incoming_channel(
         ioc, object_get_typename(OBJECT(ioc)));
 
-    if (migrate_use_tls() &&
-        !object_dynamic_cast(OBJECT(ioc),
-                             TYPE_QIO_CHANNEL_TLS)) {
+    if (migrate_channel_requires_tls_upgrade(ioc)) {
         migration_tls_channel_process_incoming(s, ioc, &local_err);
     } else {
         migration_ioc_register_yank(ioc);
@@ -70,10 +68,7 @@ void migration_channel_connect(MigrationState *s,
         ioc, object_get_typename(OBJECT(ioc)), hostname, error);
 
     if (!error) {
-        if (s->parameters.tls_creds &&
-            *s->parameters.tls_creds &&
-            !object_dynamic_cast(OBJECT(ioc),
-                                 TYPE_QIO_CHANNEL_TLS)) {
+        if (migrate_channel_requires_tls_upgrade(ioc)) {
             migration_tls_channel_connect(s, ioc, hostname, &error);
 
             if (!error) {
diff --git a/migration/migration.c b/migration/migration.c
index e10f0400ef..fe77c7d0ef 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -48,6 +48,7 @@
 #include "trace.h"
 #include "exec/target_page.h"
 #include "io/channel-buffer.h"
+#include "io/channel-tls.h"
 #include "migration/colo.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
diff --git a/migration/multifd.c b/migration/multifd.c
index 684c014c86..1e49594b02 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -831,9 +831,7 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
         migrate_get_current()->hostname, error);
 
     if (!error) {
-        if (migrate_use_tls() &&
-            !object_dynamic_cast(OBJECT(ioc),
-                                 TYPE_QIO_CHANNEL_TLS)) {
+        if (migrate_channel_requires_tls_upgrade(ioc)) {
             multifd_tls_channel_connect(p, ioc, &error);
             if (!error) {
                 /*
diff --git a/migration/tls.c b/migration/tls.c
index 32c384a8b6..73e8c9d3c2 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -166,3 +166,12 @@ void migration_tls_channel_connect(MigrationState *s,
                               NULL,
                               NULL);
 }
+
+bool migrate_channel_requires_tls_upgrade(QIOChannel *ioc)
+{
+    if (!migrate_use_tls()) {
+        return false;
+    }
+
+    return !object_dynamic_cast(OBJECT(ioc), TYPE_QIO_CHANNEL_TLS);
+}
diff --git a/migration/tls.h b/migration/tls.h
index de4fe2cafd..98e23c9b0e 100644
--- a/migration/tls.h
+++ b/migration/tls.h
@@ -37,4 +37,8 @@ void migration_tls_channel_connect(MigrationState *s,
                                    QIOChannel *ioc,
                                    const char *hostname,
                                    Error **errp);
+
+/* Whether the QIO channel requires further TLS handshake? */
+bool migrate_channel_requires_tls_upgrade(QIOChannel *ioc);
+
 #endif
-- 
2.32.0


