Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AAA4C8735
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 09:57:29 +0100 (CET)
Received: from localhost ([::1]:58540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOyK0-0002uR-5T
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 03:57:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3N-0004FJ-Pn
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3M-0008DC-6w
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mmPTCZCZTk49wlE2CkFHTKouE1bMT/b1++uEYojsNak=;
 b=bH3O+K10jLOvGBVyqDk8mmaW16mGAwzxHEVzQcmgZsOkV4LejjOFgRWrcNujXxmsZ9l81O
 UhmyHpln8KVo0pSg5NhbANxyv8N7X8mA7VF5khIJf9qazavQPdB4tqDVjo1VsRkYPwy6Wj
 9Gl11eYfknPDjCq6IoJUpuHvYIZ+470=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-GsDzzPyvM8GwGBifPta5bA-1; Tue, 01 Mar 2022 03:40:14 -0500
X-MC-Unique: GsDzzPyvM8GwGBifPta5bA-1
Received: by mail-pj1-f71.google.com with SMTP id
 m3-20020a17090a3f8300b001bd33af55f2so1211714pjc.1
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mmPTCZCZTk49wlE2CkFHTKouE1bMT/b1++uEYojsNak=;
 b=mw9l5ERFkd36h7v7L4Zw70sq5rlTzkkLcltx1mgdejQkqreeDYZPe4n2pk8UjRUqO5
 DPTMHXb2dMcEA2HTHMnsgz0XYjWZm7sTeXRYmI6Yts+a4xX8Z/fgVT29PI0NULZ+oVF2
 R3YttlAFm/yzXXYLVmAj7PG/k0X1dO9bOjXq+ZOtiEwTB4DqOo6/7cKDihnGn84KxJ5q
 +iB97MnHUPbwuzOcpfelxAf7DQvMPhlu2Dw0KIREd3CZXGg13LR91J+aS43xprKgF3CD
 fMt+ICW+kLODoxBQDwy8KD41BP8nA6SfTJTfPo32PMt9krRwWzG7wflJ6C887Xyd6EAm
 /LRw==
X-Gm-Message-State: AOAM5332VJOxnzeaErNr+hr6uQ+0M2kaamhrj4RspaDmREMFfxFnovVg
 qLKxM/P50vse4YL6tLWTW+bNs0q5LWu38BUFjW7Xt/8RLTBn2nbOwXTL5cuUEvGpzccHEZQHKaA
 gOJ+7FGa9KC3te4jZUQ/62VuWv/wgxKycpRS0zvRHpz9VQVlxtdGT8vaLhnI41rCA
X-Received: by 2002:a05:6a00:1d13:b0:4e1:7958:b59d with SMTP id
 a19-20020a056a001d1300b004e17958b59dmr25986876pfx.68.1646124013457; 
 Tue, 01 Mar 2022 00:40:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBNmb33fvj6d3x2ezOtTmnihBhAqBjq6Lffxsm8aN5WvajnQbMc/fYql+orqFlPVFBqtBzbQ==
X-Received: by 2002:a05:6a00:1d13:b0:4e1:7958:b59d with SMTP id
 a19-20020a056a001d1300b004e17958b59dmr25986851pfx.68.1646124013048; 
 Tue, 01 Mar 2022 00:40:13 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.40.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:12 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/25] migration: Add migration_incoming_transport_cleanup()
Date: Tue,  1 Mar 2022 16:39:14 +0800
Message-Id: <20220301083925.33483-15-peterx@redhat.com>
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

Add a helper to cleanup the transport listener.

When do it, we should also null-ify the cleanup hook and the data, then it's
even safe to call it multiple times.

Move the socket_address_list cleanup altogether, because that's a mirror of the
listener channels and only for the purpose of query-migrate.  Hence when
someone wants to cleanup the listener transport, it should also want to cleanup
the socket list too, always.

No functional change intended.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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


