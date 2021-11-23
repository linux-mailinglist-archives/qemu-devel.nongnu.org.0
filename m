Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DC945AACF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 19:06:46 +0100 (CET)
Received: from localhost ([::1]:56702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpaBp-0002si-Bb
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 13:06:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZxO-0006iA-CV
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mpZxJ-0006uO-P2
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 12:51:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637689904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QsUNeNLFSLYp4nJ7yL11BiCZE3+fOy2UmxWfLNk/85I=;
 b=f0b87UmcUruXAN3SDwGG5ZXRTXJlBrI1suWKWAaW/WmEin9jsKtoM4d7tYwdBnvtv/7xyx
 IwuWS4lgrC3wXNbgpGOC9+wtGNi6gGEyBc4cMiCt3z1joZKQrtEcgEqiGQZuICbvxxHB07
 bPSSzjF/weu5iJY+qDpmdsgiwNdDWm0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-Zrt7LQLwNJ-e1Mggtt10aw-1; Tue, 23 Nov 2021 12:51:43 -0500
X-MC-Unique: Zrt7LQLwNJ-e1Mggtt10aw-1
Received: by mail-wm1-f71.google.com with SMTP id
 g11-20020a1c200b000000b003320d092d08so8803445wmg.9
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 09:51:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QsUNeNLFSLYp4nJ7yL11BiCZE3+fOy2UmxWfLNk/85I=;
 b=S9nfzZas2POoOP/cyo0mr4AEJ/FO0eD4GdgCRsqAIkVocZYGh54VA76rPqxCLw7LxG
 Dd4LMv2JQsrtWePtGz2Dz+XF03k5ytdJgdDfdSH8POcu/YjJczLf3aiPz+u6JQujkWfg
 pX+SudmvBZfayOuzvXDqsPD3iSNXvkEIYR/TXM58eZPleZveWOTdScwAWtt7LHxd4X0j
 LSkT51oeZcV4fWGG+Lj3s7mgUYhkq164eAiRMJVbHG/LP/83yF9WherVc4W6hAb1CBBq
 zZNb749VFOBIJmMqo6GLhkQeoE3A5N7yADujtzY+rw05Pe8BI1Ac/FrTFL3LRi5NOdOr
 XhsA==
X-Gm-Message-State: AOAM531h/xkRRA2ZjqxcjhuU3gzgRTomPBVPYSgIcnaFljsE8T2c0MgE
 vPDwT4vLe1p+NZ0LLBuGHiRVgc5w7XvKFAeYuAxUZIcqVW1SIqrxFvHQjcmyrMFK0hmrembGJqR
 g8HCx1U35kHAgA7AUJKi7116+wmqMx0fdGrdkbTSLrGKuD7JTc59qP2QoTyk383MmMzs=
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr8458766wrt.103.1637689901345; 
 Tue, 23 Nov 2021 09:51:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOzG9Z7hcNkMDvl6nTFrokkFseElSoq9fR94IW0Zy+tVX2Ftrvs8KCX3ZK0D1G3AAM/D5DTg==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr8458709wrt.103.1637689900943; 
 Tue, 23 Nov 2021 09:51:40 -0800 (PST)
Received: from localhost (static-233-86-86-188.ipcom.comunitel.net.
 [188.86.86.233])
 by smtp.gmail.com with ESMTPSA id t1sm14785805wre.32.2021.11.23.09.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 09:51:40 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/23] multifd: Use normal pages array on the send side
Date: Tue, 23 Nov 2021 18:51:07 +0100
Message-Id: <20211123175113.35569-18-quintela@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211123175113.35569-1-quintela@redhat.com>
References: <20211123175113.35569-1-quintela@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h      |  8 ++++++--
 migration/multifd-zlib.c |  6 +++---
 migration/multifd-zstd.c |  6 +++---
 migration/multifd.c      | 30 +++++++++++++++++++-----------
 migration/trace-events   |  4 ++--
 5 files changed, 33 insertions(+), 21 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 7496f951a7..78e73df3ec 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -104,14 +104,18 @@ typedef struct {
     /* thread local variables */
     /* packets sent through this channel */
     uint64_t num_packets;
-    /* pages sent through this channel */
-    uint64_t num_pages;
+    /* non zero pages sent through this channel */
+    uint64_t num_normal_pages;
     /* syncs main thread and channels */
     QemuSemaphore sem_sync;
     /* buffers to send */
     struct iovec *iov;
     /* number of iovs used */
     uint32_t iovs_num;
+    /* Pages that are not zero */
+    ram_addr_t *normal;
+    /* num of non zero pages */
+    uint32_t normal_num;
     /* used for compression methods */
     void *data;
 }  MultiFDSendParams;
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index f65159392a..25ef68a548 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -106,16 +106,16 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
     int ret;
     uint32_t i;
 
-    for (i = 0; i < p->pages->num; i++) {
+    for (i = 0; i < p->normal_num; i++) {
         uint32_t available = z->zbuff_len - out_size;
         int flush = Z_NO_FLUSH;
 
-        if (i == p->pages->num - 1) {
+        if (i == p->normal_num - 1) {
             flush = Z_SYNC_FLUSH;
         }
 
         zs->avail_in = page_size;
-        zs->next_in = p->pages->block->host + p->pages->offset[i];
+        zs->next_in = p->pages->block->host + p->normal[i];
 
         zs->avail_out = available;
         zs->next_out = z->zbuff + out_size;
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 6933ba622a..61842d713e 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -121,13 +121,13 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
     z->out.size = z->zbuff_len;
     z->out.pos = 0;
 
-    for (i = 0; i < p->pages->num; i++) {
+    for (i = 0; i < p->normal_num; i++) {
         ZSTD_EndDirective flush = ZSTD_e_continue;
 
-        if (i == p->pages->num - 1) {
+        if (i == p->normal_num - 1) {
             flush = ZSTD_e_flush;
         }
-        z->in.src = p->pages->block->host + p->pages->offset[i];
+        z->in.src = p->pages->block->host + p->normal[i];
         z->in.size = page_size;
         z->in.pos = 0;
 
diff --git a/migration/multifd.c b/migration/multifd.c
index 6983ba3e7c..dbe919b764 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -89,13 +89,13 @@ static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
     MultiFDPages_t *pages = p->pages;
     size_t page_size = qemu_target_page_size();
 
-    for (int i = 0; i < p->pages->num; i++) {
-        p->iov[p->iovs_num].iov_base = pages->block->host + pages->offset[i];
+    for (int i = 0; i < p->normal_num; i++) {
+        p->iov[p->iovs_num].iov_base = pages->block->host + p->normal[i];
         p->iov[p->iovs_num].iov_len = page_size;
         p->iovs_num++;
     }
 
-    p->next_packet_size = p->pages->num * page_size;
+    p->next_packet_size = p->normal_num * page_size;
     p->flags |= MULTIFD_FLAG_NOCOMP;
     return 0;
 }
@@ -262,7 +262,7 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
 
     packet->flags = cpu_to_be32(p->flags);
     packet->pages_alloc = cpu_to_be32(p->pages->allocated);
-    packet->pages_used = cpu_to_be32(p->pages->num);
+    packet->pages_used = cpu_to_be32(p->normal_num);
     packet->next_packet_size = cpu_to_be32(p->next_packet_size);
     packet->packet_num = cpu_to_be64(p->packet_num);
 
@@ -270,9 +270,9 @@ static void multifd_send_fill_packet(MultiFDSendParams *p)
         strncpy(packet->ramblock, p->pages->block->idstr, 256);
     }
 
-    for (i = 0; i < p->pages->num; i++) {
+    for (i = 0; i < p->normal_num; i++) {
         /* there are architectures where ram_addr_t is 32 bit */
-        uint64_t temp = p->pages->offset[i];
+        uint64_t temp = p->normal[i];
 
         packet->offset[i] = cpu_to_be64(temp);
     }
@@ -556,6 +556,8 @@ void multifd_save_cleanup(void)
         p->packet = NULL;
         g_free(p->iov);
         p->iov = NULL;
+        g_free(p->normal);
+        p->normal = NULL;
         multifd_send_state->ops->send_cleanup(p, &local_err);
         if (local_err) {
             migrate_set_error(migrate_get_current(), local_err);
@@ -640,12 +642,17 @@ static void *multifd_send_thread(void *opaque)
         qemu_mutex_lock(&p->mutex);
 
         if (p->pending_job) {
-            uint32_t used = p->pages->num;
             uint64_t packet_num = p->packet_num;
             uint32_t flags = p->flags;
             p->iovs_num = 1;
+            p->normal_num = 0;
 
-            if (used) {
+            for (int i = 0; i < p->pages->num; i++) {
+                p->normal[p->normal_num] = p->pages->offset[i];
+                p->normal_num++;
+            }
+
+            if (p->normal_num) {
                 ret = multifd_send_state->ops->send_prepare(p, &local_err);
                 if (ret != 0) {
                     qemu_mutex_unlock(&p->mutex);
@@ -655,12 +662,12 @@ static void *multifd_send_thread(void *opaque)
             multifd_send_fill_packet(p);
             p->flags = 0;
             p->num_packets++;
-            p->num_pages += used;
+            p->num_normal_pages += p->normal_num;
             p->pages->num = 0;
             p->pages->block = NULL;
             qemu_mutex_unlock(&p->mutex);
 
-            trace_multifd_send(p->id, packet_num, used, flags,
+            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
                                p->next_packet_size);
 
             p->iov[0].iov_len = p->packet_len;
@@ -710,7 +717,7 @@ out:
     qemu_mutex_unlock(&p->mutex);
 
     rcu_unregister_thread();
-    trace_multifd_send_thread_end(p->id, p->num_packets, p->num_pages);
+    trace_multifd_send_thread_end(p->id, p->num_packets, p->num_normal_pages);
 
     return NULL;
 }
@@ -910,6 +917,7 @@ int multifd_save_setup(Error **errp)
         p->tls_hostname = g_strdup(s->hostname);
         /* We need one extra place for the packet header */
         p->iov = g_new0(struct iovec, page_count + 1);
+        p->normal = g_new0(ram_addr_t, page_count);
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
diff --git a/migration/trace-events b/migration/trace-events
index b48d873b8a..af8dee9af0 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -124,13 +124,13 @@ multifd_recv_sync_main_wait(uint8_t id) "channel %d"
 multifd_recv_terminate_threads(bool error) "error %d"
 multifd_recv_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %d packets %" PRIu64 " pages %" PRIu64
 multifd_recv_thread_start(uint8_t id) "%d"
-multifd_send(uint8_t id, uint64_t packet_num, uint32_t used, uint32_t flags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " pages %d flags 0x%x next packet size %d"
+multifd_send(uint8_t id, uint64_t packet_num, uint32_t normal, uint32_t flags, uint32_t next_packet_size) "channel %d packet_num %" PRIu64 " normal pages %d flags 0x%x next packet size %d"
 multifd_send_error(uint8_t id) "channel %d"
 multifd_send_sync_main(long packet_num) "packet num %ld"
 multifd_send_sync_main_signal(uint8_t id) "channel %d"
 multifd_send_sync_main_wait(uint8_t id) "channel %d"
 multifd_send_terminate_threads(bool error) "error %d"
-multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t pages) "channel %d packets %" PRIu64 " pages %"  PRIu64
+multifd_send_thread_end(uint8_t id, uint64_t packets, uint64_t normal_pages) "channel %d packets %" PRIu64 " normal pages %"  PRIu64
 multifd_send_thread_start(uint8_t id) "%d"
 multifd_tls_outgoing_handshake_start(void *ioc, void *tioc, const char *hostname) "ioc=%p tioc=%p hostname=%s"
 multifd_tls_outgoing_handshake_error(void *ioc, const char *err) "ioc=%p err=%s"
-- 
2.33.1


