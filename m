Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507193991F5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 19:52:45 +0200 (CEST)
Received: from localhost ([::1]:51732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loV2q-0004w7-CF
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 13:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loV1X-00033s-9W
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:51:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1loV1U-0000qs-Tr
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 13:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622656280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8EHhFfVd5D/7/erJr8lf7/JobK29KVCvN2+rSIsLnlw=;
 b=FSLRniplj0Ma7cEYWKSihOsbYeK5ZbBoFzTbXSuf+CnfDjqoQNo0L0Y++634IytPTymX8u
 yJwTQPH44jkeIC+GtV8STUf+60JJ8AYjWpYPT16V+vFWHaH0JB1NDFil125ZZyPt9yX+yF
 nvufAWiK2FgETnMgPCB2IzZ4Cqh6K7E=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-vDl_6GioM7K0PauO-ft1Bw-1; Wed, 02 Jun 2021 13:51:18 -0400
X-MC-Unique: vDl_6GioM7K0PauO-ft1Bw-1
Received: by mail-ed1-f72.google.com with SMTP id
 q18-20020a0564025192b02903888712212fso1825267edd.19
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 10:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8EHhFfVd5D/7/erJr8lf7/JobK29KVCvN2+rSIsLnlw=;
 b=jvA3SMu/rYTDUrqaIG9V5vT6TSU9SUtNQy3E379x07fotd6fBQgWr6kEYH1cVUAGws
 CJ9NoP1vrPZXiXs4wx/3OnbFWbVzY9JlBYnz9KIRo5N5QT3j52DD7/UyrWnAPLJFDvhY
 Ei8V6W+UJBmL0wNp9XyC4xDg/71cIWWMY8F4ZpK8haQ5q5eWBGxGo2vD/AQpp4sx+YyQ
 XRqh6PiIQkvCZwNGR7tMUm90jpfas3HGGBHlBeHU9AAomWlj+ePd1dMtLLSxhwoU0aRa
 obZx0U9C9HJWYzh2wL4d3QaJbtYIeeTN2AvvvrNfOhzLQ0IhCHAxHp6/lOuNjGH0B/pk
 Hhqg==
X-Gm-Message-State: AOAM532dRTkWdV1/AtR+HusjZ6CE/96hL8vTh14YFt7Jx0TbYxI70s0d
 c8XPMnydEQkrhU3rxWHx8jMBn3tahc94sm2j16ek5AG8dKxnbYAEcp7Cpy2h0Q1dkO9/C5+wZr9
 KlC5+HKsEUGFsftARkfoqN6xizupXW33yYxlrqI0Bk3zElWRWai9ta8pv0BOiBKFt
X-Received: by 2002:aa7:c042:: with SMTP id k2mr30645436edo.21.1622656276857; 
 Wed, 02 Jun 2021 10:51:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk2wIuOgIqDEkYXOr5H7YKt42y2IwHnEKZnvtjkSTsZ9B7f2bd0UDZb6rtcGlBgh+z5WxtPg==
X-Received: by 2002:aa7:c042:: with SMTP id k2mr30645420edo.21.1622656276563; 
 Wed, 02 Jun 2021 10:51:16 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id q4sm356887edv.24.2021.06.02.10.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 10:51:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 2/2] migration/rdma: Enable use of g_autoptr with struct
 rdma_cm_event
Date: Wed,  2 Jun 2021 19:51:04 +0200
Message-Id: <20210602175105.2522032-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210602175105.2522032-1-philmd@redhat.com>
References: <20210602175105.2522032-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since 00f2cfbbec6 ("glib: bump min required glib library version to
2.48") we can use g_auto/g_autoptr to have the compiler automatically
free an allocated variable when it goes out of scope, removing this
burden on the developers.

Per rdma_cm(7) and rdma_ack_cm_event(3) man pages:

  "rdma_ack_cm_event() - Free a communication event.

   All events which are allocated by rdma_get_cm_event() must be
   released, there should be a one-to-one correspondence between
   successful gets and acks. This call frees the event structure
   and any memory that it references."

Since the 'ack' description doesn't explicit the event is also
released (free'd), it is safer to use the GLib g_autoptr feature.
The G_DEFINE_AUTOPTR_CLEANUP_FUNC() macro expects a single word
for the type name, so add a type definition to achieve this.
Convert to use g_autoptr and remove the rdma_ack_cm_event() calls.

Inspired-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
RFC: build-tested only
---
 migration/rdma.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index b50ebb9183a..b703bf1b918 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -38,6 +38,9 @@
 #include "qom/object.h"
 #include <poll.h>
 
+typedef struct rdma_cm_event rdma_cm_event;
+G_DEFINE_AUTOPTR_CLEANUP_FUNC(rdma_cm_event, rdma_ack_cm_event)
+
 /*
  * Print and error on both the Monitor and the Log file.
  */
@@ -939,7 +942,7 @@ static int qemu_rdma_resolve_host(RDMAContext *rdma, Error **errp)
     int ret;
     struct rdma_addrinfo *res;
     char port_str[16];
-    struct rdma_cm_event *cm_event;
+    g_autoptr(rdma_cm_event) cm_event = NULL;
     char ip[40] = "unknown";
     struct rdma_addrinfo *e;
 
@@ -1007,11 +1010,11 @@ route:
         ERROR(errp, "result not equal to event_addr_resolved %s",
                 rdma_event_str(cm_event->event));
         perror("rdma_resolve_addr");
-        rdma_ack_cm_event(cm_event);
         ret = -EINVAL;
         goto err_resolve_get_addr;
     }
     rdma_ack_cm_event(cm_event);
+    cm_event = NULL;
 
     /* resolve route */
     ret = rdma_resolve_route(rdma->cm_id, RDMA_RESOLVE_TIMEOUT_MS);
@@ -1028,11 +1031,9 @@ route:
     if (cm_event->event != RDMA_CM_EVENT_ROUTE_RESOLVED) {
         ERROR(errp, "result not equal to event_route_resolved: %s",
                         rdma_event_str(cm_event->event));
-        rdma_ack_cm_event(cm_event);
         ret = -EINVAL;
         goto err_resolve_get_addr;
     }
-    rdma_ack_cm_event(cm_event);
     rdma->verbs = rdma->cm_id->verbs;
     qemu_rdma_dump_id("source_resolve_host", rdma->cm_id->verbs);
     qemu_rdma_dump_gid("source_resolve_host", rdma->cm_id);
@@ -1501,7 +1502,7 @@ static uint64_t qemu_rdma_poll(RDMAContext *rdma, uint64_t *wr_id_out,
  */
 static int qemu_rdma_wait_comp_channel(RDMAContext *rdma)
 {
-    struct rdma_cm_event *cm_event;
+    g_autoptr(rdma_cm_event) cm_event = NULL;
     int ret = -1;
 
     /*
@@ -2503,7 +2504,7 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp, bool return_path)
                                           .private_data = &cap,
                                           .private_data_len = sizeof(cap),
                                         };
-    struct rdma_cm_event *cm_event;
+    g_autoptr(rdma_cm_event) cm_event = NULL;
     int ret;
 
     /*
@@ -2544,7 +2545,6 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp, bool return_path)
     if (cm_event->event != RDMA_CM_EVENT_ESTABLISHED) {
         perror("rdma_get_cm_event != EVENT_ESTABLISHED after rdma_connect");
         ERROR(errp, "connecting to destination!");
-        rdma_ack_cm_event(cm_event);
         goto err_rdma_source_connect;
     }
     rdma->connected = true;
@@ -2564,8 +2564,6 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp, bool return_path)
 
     trace_qemu_rdma_connect_pin_all_outcome(rdma->pin_all);
 
-    rdma_ack_cm_event(cm_event);
-
     rdma->control_ready_expected = 1;
     rdma->nb_sent = 0;
     return 0;
@@ -3279,7 +3277,7 @@ static void rdma_cm_poll_handler(void *opaque)
 {
     RDMAContext *rdma = opaque;
     int ret;
-    struct rdma_cm_event *cm_event;
+    g_autoptr(rdma_cm_event) cm_event = NULL;
     MigrationIncomingState *mis = migration_incoming_get_current();
 
     ret = rdma_get_cm_event(rdma->channel, &cm_event);
@@ -3287,7 +3285,6 @@ static void rdma_cm_poll_handler(void *opaque)
         error_report("get_cm_event failed %d", errno);
         return;
     }
-    rdma_ack_cm_event(cm_event);
 
     if (cm_event->event == RDMA_CM_EVENT_DISCONNECTED ||
         cm_event->event == RDMA_CM_EVENT_DEVICE_REMOVAL) {
@@ -3317,7 +3314,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
                                             .private_data_len = sizeof(cap),
                                          };
     RDMAContext *rdma_return_path = NULL;
-    struct rdma_cm_event *cm_event;
+    g_autoptr(rdma_cm_event) cm_event = NULL;
     struct ibv_context *verbs;
     int ret = -EINVAL;
     int idx;
@@ -3328,7 +3325,6 @@ static int qemu_rdma_accept(RDMAContext *rdma)
     }
 
     if (cm_event->event != RDMA_CM_EVENT_CONNECT_REQUEST) {
-        rdma_ack_cm_event(cm_event);
         goto err_rdma_dest_wait;
     }
 
@@ -3339,7 +3335,6 @@ static int qemu_rdma_accept(RDMAContext *rdma)
     if (migrate_postcopy() && !rdma->is_return_path) {
         rdma_return_path = qemu_rdma_data_init(rdma->host_port, NULL);
         if (rdma_return_path == NULL) {
-            rdma_ack_cm_event(cm_event);
             goto err_rdma_dest_wait;
         }
 
@@ -3353,7 +3348,6 @@ static int qemu_rdma_accept(RDMAContext *rdma)
     if (cap.version < 1 || cap.version > RDMA_CONTROL_VERSION_CURRENT) {
             error_report("Unknown source RDMA version: %d, bailing...",
                             cap.version);
-            rdma_ack_cm_event(cm_event);
             goto err_rdma_dest_wait;
     }
 
@@ -3374,6 +3368,7 @@ static int qemu_rdma_accept(RDMAContext *rdma)
     verbs = cm_event->id->verbs;
 
     rdma_ack_cm_event(cm_event);
+    cm_event = NULL;
 
     trace_qemu_rdma_accept_pin_state(rdma->pin_all);
 
@@ -3441,11 +3436,9 @@ static int qemu_rdma_accept(RDMAContext *rdma)
 
     if (cm_event->event != RDMA_CM_EVENT_ESTABLISHED) {
         error_report("rdma_accept not event established");
-        rdma_ack_cm_event(cm_event);
         goto err_rdma_dest_wait;
     }
 
-    rdma_ack_cm_event(cm_event);
     rdma->connected = true;
 
     ret = qemu_rdma_post_recv_control(rdma, RDMA_WRID_READY);
-- 
2.26.3


