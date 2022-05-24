Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018AB53335D
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 00:14:20 +0200 (CEST)
Received: from localhost ([::1]:54974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntcnC-0003t4-Jk
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 18:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntcl8-0000vG-C3
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ntcl6-0005fR-LV
 for qemu-devel@nongnu.org; Tue, 24 May 2022 18:12:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653430328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7eZlnsgSO1Xy5WNYJUfpXMKSYXdgPtxg5qRn6+b+4Os=;
 b=hCGrL9nsQqbOzR6xR5NYrx8EvyG/w5tNl2naqzIZ1LHS43o0MSJANr7LY4W3l73nfpBo5W
 YdZvHTNVJLHGWB9fvExVwuRXZuzrrjLSfwfHnwLzBWgzQXutCLQEi9d6pBbNw2MCxN5LgR
 G6RanBIkrwKL3udwQ7uQaXa6tAs8R+k=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-544-hKtwJ9aDPYu7UbacGQPyXg-1; Tue, 24 May 2022 18:12:06 -0400
X-MC-Unique: hKtwJ9aDPYu7UbacGQPyXg-1
Received: by mail-il1-f198.google.com with SMTP id
 m9-20020a056e021c2900b002d13627892eso11564003ilh.20
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 15:12:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7eZlnsgSO1Xy5WNYJUfpXMKSYXdgPtxg5qRn6+b+4Os=;
 b=uO76azpChfUk/CKiHAcrWr+ys3fs5X/MZPZIFdeUbzNJtYrJkgUr6Qru7/uMp5hyJN
 6/KdtCuj3gcxq0gNsY5Grboik2E6IpOq01wfAH2eNZf4uuTlStMJLAKXYVBKWrSwIevD
 Qw4qdBvdcd85IDy0mmi+vbHvBOR7E8lANvldydg42mR/PnDPuKtzWIfnO2a9hqv58Zo1
 WjHMptHTjNc329RQ0wOwG8FntLXqCdsBiYFY4gksYX4pUrWEbBS6+qWIEACxNWj/VXPS
 8aleka8DWuiSuG5nCDQ4JMzXHluUCTLRy10s5j+8xWUTskYqgRGisOfzhBCr4WzdDzj3
 +nDg==
X-Gm-Message-State: AOAM532Ff8qeEPBk8raG5SoMN+0Tre1TaBSFjZlUmjn4eEyksAZ2LL+R
 xhHGeHqA0CEMR3mBIEijGJY3g2LDuWc8Bb2K1gNt8f8vjZBhXVJfrYDSok8zvPfvgoJi+1T5MN7
 DnFc2lT2PcLzPzIAhnLOqUoAn96ePwBAh5MZFbAVk+pB7FxUE+Kd4G8aLlHvc3l8k
X-Received: by 2002:a05:6638:24ca:b0:32e:a5cb:52a5 with SMTP id
 y10-20020a05663824ca00b0032ea5cb52a5mr10893191jat.86.1653430325871; 
 Tue, 24 May 2022 15:12:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXh+SGu+QUrAe/8SyCcTlhhIHGI1YWf40cY2S6hk3DHtk+sSaehFWRx8bNWr+RLVSwKyDa0Q==
X-Received: by 2002:a05:6638:24ca:b0:32e:a5cb:52a5 with SMTP id
 y10-20020a05663824ca00b0032ea5cb52a5mr10893171jat.86.1653430325587; 
 Tue, 24 May 2022 15:12:05 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 6-20020a021d06000000b0032e2d3cc08csm3738045jaj.132.2022.05.24.15.12.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 May 2022 15:12:05 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Manish Mishra <manish.mishra@nutanix.com>, peterx@redhat.com
Subject: [PATCH v7 07/14] migration: Add helpers to detect TLS capability
Date: Tue, 24 May 2022 18:11:44 -0400
Message-Id: <20220524221151.18225-8-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524221151.18225-1-peterx@redhat.com>
References: <20220524221151.18225-1-peterx@redhat.com>
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
index a162d00fea..bf1ff1f2a5 100644
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
index f5f7a0f91f..d17f435d08 100644
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
diff --git a/migration/multifd.c b/migration/multifd.c
index 9282ab6aa4..265a169c5c 100644
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


