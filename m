Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FA94B81A8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 08:36:57 +0100 (CET)
Received: from localhost ([::1]:36600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKErw-0007ga-OL
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 02:36:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDpN-0005bs-19
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nKDpK-0006Yz-KM
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 01:30:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644993010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9vJa4o2k4N8buai+eLYbslIYkZ3adJj7UP7RVfT+0Ck=;
 b=ih5MoROUM3ukJoPPjj6dAbPUAaDP1vC9S/RCZDsqg7+wf13nMF41QJXS8nYU0eOk82oJuX
 Jd350/1X1/sUruZZHWETEQQdak6MW2KH43u9Gl72C9lomMJMtXZCQdvn56b36gy8uI47+O
 1gF7yGYkeqPcIoC8ziakIdKUc7+V+Sg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-JjuLV8ExPXCcHoYUXgkmhQ-1; Wed, 16 Feb 2022 01:30:06 -0500
X-MC-Unique: JjuLV8ExPXCcHoYUXgkmhQ-1
Received: by mail-pj1-f69.google.com with SMTP id
 jf17-20020a17090b175100b001b90cf26a4eso952716pjb.3
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 22:30:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9vJa4o2k4N8buai+eLYbslIYkZ3adJj7UP7RVfT+0Ck=;
 b=1Lu/yeTrhddIgpg23UIZS5XGuzt2pmFHUsVBtkuR6L/H1zHOZzXrT30twWbFIcvmwG
 esEJ+AHSorKZ+YVcOF+MBMshAVkJUqk62kvhuhB0ol9NBuR5G6dtwaHxkw2B29Ck14hi
 yL6Mb9edx7qf4hhPYOOnOetg4+hbZxRrpKT7NupG6zHuff4bEhpAyBsCaqgGS6RZ5Y8A
 v44VUa9K1ICB9k2p8QbSeSpUhUtfE6FLHxcU3bf3Mdpx70XbX2OOIRM6UWi33iL2TD3l
 jIpmW5R4C+aqFhml3k3GnvjLip9Axd8LinxL11PomE29JxGh0G1SXU4LWOJVix8aeDv2
 viUQ==
X-Gm-Message-State: AOAM531lAtCY7nT8UzPwOIusQO97b84qaG8nEJkmXnZvP6LLHMosXcdZ
 9/gGLaP0ymzRVE5M49Wp7RbPkcF+BPwbIvoTN+wDU/On8VElgUPOSJAP60gRzMN1DPApRxNb0LS
 RTglvoRISEKBfrIYEdEvJ2Kcwa1nhwurvdXP/X1Hf4OiYNjexuu9VkaBMFdmr8nEm
X-Received: by 2002:a17:903:248:b0:14f:139f:191f with SMTP id
 j8-20020a170903024800b0014f139f191fmr1104647plh.71.1644993005136; 
 Tue, 15 Feb 2022 22:30:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx16iTkgqr1X+tJPD0XcvOSGfVzjdjNZFMwjSOdbFhnySO5GZ6TWsehg9JvK3lyQf6BYb5+0Q==
X-Received: by 2002:a17:903:248:b0:14f:139f:191f with SMTP id
 j8-20020a170903024800b0014f139f191fmr1104615plh.71.1644993004749; 
 Tue, 15 Feb 2022 22:30:04 -0800 (PST)
Received: from localhost.localdomain ([64.64.123.81])
 by smtp.gmail.com with ESMTPSA id 17sm42104657pfl.175.2022.02.15.22.29.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Feb 2022 22:30:04 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/20] migration: Add migration_incoming_transport_cleanup()
Date: Wed, 16 Feb 2022 14:28:03 +0800
Message-Id: <20220216062809.57179-15-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220216062809.57179-1-peterx@redhat.com>
References: <20220216062809.57179-1-peterx@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a helper to cleanup the transport listener.

When do it, we should also null-ify the cleanup hook and the data, then it's
even safe to call it multiple times.

Move the socket_address_list cleanup altogether, because that's a mirror of the
listener channels and only for the purpose of query-migrate.  Hence when
someone wants to cleanup the listener transport, it should also want to cleanup
the socket list too, always.

No functional change intended.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 22 ++++++++++++++--------
 migration/migration.h |  1 +
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index b2e6446457..6bb321cdd3 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -279,6 +279,19 @@ MigrationIncomingState *migration_incoming_get_current(void)
     return current_incoming;
 }
 
+void migration_incoming_transport_cleanup(MigrationIncomingState *mis)
+{
+    if (mis->socket_address_list) {
+        qapi_free_SocketAddressList(mis->socket_address_list);
+        mis->socket_address_list = NULL;
+    }
+
+    if (mis->transport_cleanup) {
+        mis->transport_cleanup(mis->transport_data);
+        mis->transport_data = mis->transport_cleanup = NULL;
+    }
+}
+
 void migration_incoming_state_destroy(void)
 {
     struct MigrationIncomingState *mis = migration_incoming_get_current();
@@ -299,10 +312,8 @@ void migration_incoming_state_destroy(void)
         g_array_free(mis->postcopy_remote_fds, TRUE);
         mis->postcopy_remote_fds = NULL;
     }
-    if (mis->transport_cleanup) {
-        mis->transport_cleanup(mis->transport_data);
-    }
 
+    migration_incoming_transport_cleanup(mis);
     qemu_event_reset(&mis->main_thread_load_event);
 
     if (mis->page_requested) {
@@ -310,11 +321,6 @@ void migration_incoming_state_destroy(void)
         mis->page_requested = NULL;
     }
 
-    if (mis->socket_address_list) {
-        qapi_free_SocketAddressList(mis->socket_address_list);
-        mis->socket_address_list = NULL;
-    }
-
     yank_unregister_instance(MIGRATION_YANK_INSTANCE);
 }
 
diff --git a/migration/migration.h b/migration/migration.h
index d677a750c9..f17ccc657c 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -166,6 +166,7 @@ struct MigrationIncomingState {
 
 MigrationIncomingState *migration_incoming_get_current(void);
 void migration_incoming_state_destroy(void);
+void migration_incoming_transport_cleanup(MigrationIncomingState *mis);
 /*
  * Functions to work with blocktime context
  */
-- 
2.32.0


