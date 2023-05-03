Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD456F54A6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:27:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8ki-0004gz-Sa; Wed, 03 May 2023 05:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu8kh-0004ge-6R
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu8ke-0002nU-4R
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:26:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E4P9/Comv2W+9H69u3LnQkSLu/Ua9tCZaXw7xoUFIfw=;
 b=fQPWYNQmofQPVF32yzMXU7Mly0dfNZuuCVXPV/O7fPZHs+rHfTMgcqdWBwriivIBWn5D/Z
 33xNRogxdwddKfILKwZ6mHos53EmrjPTwurpBqU1qkj38ut7Si3Z4OkIeMQphZ2ta/7pJ8
 MxpjS+JeGG2U0eGhoVPj7lea/zCajks=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-209-Ctalv4poMImfyz6516us7w-1; Wed, 03 May 2023 05:26:18 -0400
X-MC-Unique: Ctalv4poMImfyz6516us7w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B20B83C11783;
 Wed,  3 May 2023 09:26:17 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CFAAE492C3E;
 Wed,  3 May 2023 09:26:16 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras <leobras@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PULL 8/8] migration: Drop unused parameter for
 migration_tls_client_create()
Date: Wed,  3 May 2023 11:26:06 +0200
Message-Id: <20230503092606.9415-9-quintela@redhat.com>
In-Reply-To: <20230503092606.9415-1-quintela@redhat.com>
References: <20230503092606.9415-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It is not needed since we moved the accessor for tls properties to
options.c.

Suggested-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 migration/multifd.c      | 2 +-
 migration/postcopy-ram.c | 2 +-
 migration/tls.c          | 5 ++---
 migration/tls.h          | 3 +--
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 4a2e1a47ce..4e71c19292 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -821,7 +821,7 @@ static void multifd_tls_channel_connect(MultiFDSendParams *p,
     const char *hostname = s->hostname;
     QIOChannelTLS *tioc;
 
-    tioc = migration_tls_client_create(s, ioc, hostname, errp);
+    tioc = migration_tls_client_create(ioc, hostname, errp);
     if (!tioc) {
         return;
     }
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 75aa276bb1..5615ec29eb 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1632,7 +1632,7 @@ postcopy_preempt_send_channel_new(QIOTask *task, gpointer opaque)
     }
 
     if (migrate_channel_requires_tls_upgrade(ioc)) {
-        tioc = migration_tls_client_create(s, ioc, s->hostname, &local_err);
+        tioc = migration_tls_client_create(ioc, s->hostname, &local_err);
         if (!tioc) {
             goto out;
         }
diff --git a/migration/tls.c b/migration/tls.c
index d4a76cf590..fa03d9136c 100644
--- a/migration/tls.c
+++ b/migration/tls.c
@@ -114,8 +114,7 @@ static void migration_tls_outgoing_handshake(QIOTask *task,
     object_unref(OBJECT(ioc));
 }
 
-QIOChannelTLS *migration_tls_client_create(MigrationState *s,
-                                           QIOChannel *ioc,
+QIOChannelTLS *migration_tls_client_create(QIOChannel *ioc,
                                            const char *hostname,
                                            Error **errp)
 {
@@ -141,7 +140,7 @@ void migration_tls_channel_connect(MigrationState *s,
 {
     QIOChannelTLS *tioc;
 
-    tioc = migration_tls_client_create(s, ioc, hostname, errp);
+    tioc = migration_tls_client_create(ioc, hostname, errp);
     if (!tioc) {
         return;
     }
diff --git a/migration/tls.h b/migration/tls.h
index 98e23c9b0e..5797d153cb 100644
--- a/migration/tls.h
+++ b/migration/tls.h
@@ -28,8 +28,7 @@ void migration_tls_channel_process_incoming(MigrationState *s,
                                             QIOChannel *ioc,
                                             Error **errp);
 
-QIOChannelTLS *migration_tls_client_create(MigrationState *s,
-                                           QIOChannel *ioc,
+QIOChannelTLS *migration_tls_client_create(QIOChannel *ioc,
                                            const char *hostname,
                                            Error **errp);
 
-- 
2.40.0


