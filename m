Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926204ECEEE
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 23:43:48 +0200 (CEST)
Received: from localhost ([::1]:38228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZg6V-0005gV-Eq
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 17:43:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2B-0005gd-Vf
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZg2A-0005Ds-Bw
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:39:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648676357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2+PDhrpWKbHP/PkTW5UAcTW+ZMb1mT4D36GE2ydAWcc=;
 b=Ze9RQtQ3TBLFtQszUMaSQK9v5PQvMrIButhjXD8g3VcmoiIjCfRRy3ie9p0VYKsaZDvPlm
 0ignHFIBdvVou/20hIM+4EkmpXrKeo9k5dUV8BlNrCznozU+GzZK24/90Ao3VehKetXeDu
 avWIarGNuf0jqpBEq9+jAVL8LtRCDi4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-5NYafbMtN0CEKyXBCrJGTQ-1; Wed, 30 Mar 2022 17:39:14 -0400
X-MC-Unique: 5NYafbMtN0CEKyXBCrJGTQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 33-20020a0c8024000000b0043d17ffb0bdso17026097qva.18
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2+PDhrpWKbHP/PkTW5UAcTW+ZMb1mT4D36GE2ydAWcc=;
 b=NxD/HRsOJR6farDw6QSynhtDNatJxhEGegomO2Y3GfLIHMAtwrAXa+VcCsU1A4Y+cY
 ixhhAUpdiJ/g5yo9mzldBGDE/yPybrkrCVtsPVRvtG8Rg+Fz0W+QkWG1uaPEQmt4Dfv8
 VeEZE5W5MNG+3WpvbYQpuTG1fOmqZvUMbMvUH7IuxqqNlhWLkMSUo6A+McAW5vrvtOUb
 ijwBFvE0sddsgP7hbQDhy+cerGKLo5T7Nfh3aXvH6H7qvNhQHlBVhhZOiGh13HTBGcqm
 sbF0WTvFZqhetyAV+g1mNQ5DVljMcK9UKHPq5MH7nfLyauNQp1CLtgsLYMcB9sA5r78C
 cmqQ==
X-Gm-Message-State: AOAM533WXr9G+GLowcgIBLSydrC8ByR6v1MlzeRLt/n3jqYEjuc8cuUo
 8z7nqt2ZX+dS3Y/36Czfs3bZlPOPpN/oyDy+8KF+0GJlQ1ckVZAE5AQR1dzl4dkrnCFhqNcNR8B
 yPYYgXQJW3yeV+yQiLIX3N55/UXcq4hGD2CY8c474a0JZbH/Mgh2pRsAeCI1gZCph
X-Received: by 2002:a05:622a:11d2:b0:2e0:bbbd:5a2b with SMTP id
 n18-20020a05622a11d200b002e0bbbd5a2bmr1538366qtk.233.1648676353425; 
 Wed, 30 Mar 2022 14:39:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcc3D0KGP7s3avueC9FvjKQe8047Ad3Hyed+Cpw+XN6kdX95htY//jtMnbwcZ4uKYmkSjdEg==
X-Received: by 2002:a05:622a:11d2:b0:2e0:bbbd:5a2b with SMTP id
 n18-20020a05622a11d200b002e0bbbd5a2bmr1538343qtk.233.1648676353124; 
 Wed, 30 Mar 2022 14:39:13 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a05620a16d700b0067e98304705sm11306313qkn.89.2022.03.30.14.39.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Mar 2022 14:39:12 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/19] migration: Drop multifd tls_hostname cache
Date: Wed, 30 Mar 2022 17:38:51 -0400
Message-Id: <20220330213908.26608-3-peterx@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The hostname is cached N times, N equals to the multifd channels.

Drop that cache because after previous patch we've got s->hostname
being alive for the whole lifecycle of migration procedure.

Cc: Juan Quintela <quintela@redhat.com>
Cc: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/multifd.c | 10 +++-------
 migration/multifd.h |  2 --
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 76b57a7177..1be4ab5d17 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -542,8 +542,6 @@ void multifd_save_cleanup(void)
         qemu_sem_destroy(&p->sem_sync);
         g_free(p->name);
         p->name = NULL;
-        g_free(p->tls_hostname);
-        p->tls_hostname = NULL;
         multifd_pages_clear(p->pages);
         p->pages = NULL;
         p->packet_len = 0;
@@ -763,7 +761,7 @@ static void multifd_tls_channel_connect(MultiFDSendParams *p,
                                         Error **errp)
 {
     MigrationState *s = migrate_get_current();
-    const char *hostname = p->tls_hostname;
+    const char *hostname = s->hostname;
     QIOChannelTLS *tioc;
 
     tioc = migration_tls_client_create(s, ioc, hostname, errp);
@@ -787,7 +785,8 @@ static bool multifd_channel_connect(MultiFDSendParams *p,
     MigrationState *s = migrate_get_current();
 
     trace_multifd_set_outgoing_channel(
-        ioc, object_get_typename(OBJECT(ioc)), p->tls_hostname, error);
+        ioc, object_get_typename(OBJECT(ioc)),
+        migrate_get_current()->hostname, error);
 
     if (!error) {
         if (s->parameters.tls_creds &&
@@ -874,7 +873,6 @@ int multifd_save_setup(Error **errp)
     int thread_count;
     uint32_t page_count = MULTIFD_PACKET_SIZE / qemu_target_page_size();
     uint8_t i;
-    MigrationState *s;
 
     if (!migrate_use_multifd()) {
         return 0;
@@ -884,7 +882,6 @@ int multifd_save_setup(Error **errp)
         return -1;
     }
 
-    s = migrate_get_current();
     thread_count = migrate_multifd_channels();
     multifd_send_state = g_malloc0(sizeof(*multifd_send_state));
     multifd_send_state->params = g_new0(MultiFDSendParams, thread_count);
@@ -909,7 +906,6 @@ int multifd_save_setup(Error **errp)
         p->packet->magic = cpu_to_be32(MULTIFD_MAGIC);
         p->packet->version = cpu_to_be32(MULTIFD_VERSION);
         p->name = g_strdup_printf("multifdsend_%d", i);
-        p->tls_hostname = g_strdup(s->hostname);
         /* We need one extra place for the packet header */
         p->iov = g_new0(struct iovec, page_count + 1);
         p->normal = g_new0(ram_addr_t, page_count);
diff --git a/migration/multifd.h b/migration/multifd.h
index 4dda900a0b..3d577b98b7 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -72,8 +72,6 @@ typedef struct {
     uint8_t id;
     /* channel thread name */
     char *name;
-    /* tls hostname */
-    char *tls_hostname;
     /* channel thread id */
     QemuThread thread;
     /* communication channel */
-- 
2.32.0


