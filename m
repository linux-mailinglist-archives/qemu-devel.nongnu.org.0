Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF122148E4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jul 2020 23:34:10 +0200 (CEST)
Received: from localhost ([::1]:32944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrpnV-0006Ga-Fj
	for lists+qemu-devel@lfdr.de; Sat, 04 Jul 2020 17:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrpli-0003uR-1w
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 17:32:18 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44805
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrplf-0004EL-9Z
 for qemu-devel@nongnu.org; Sat, 04 Jul 2020 17:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593898334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZvMbUnGJQt3yoRlltFf6Mt/5GWmmjKBAstpoETHPIqo=;
 b=Q4rYskHDN9Sbxu7xmNQzQhvEukeTTIoSQkXhHtiNOX9U+BpkOKCdRkDvKyI7Itd4L0FWOe
 NgpiXPMYu6UZ9qLXzY5TuHsdRQyKg+QT/Ylcs+STU4wlxxynEKZ5d2JnAfgZ8CUF7hBkC9
 lhSVx3c/DlkrYVEgh2S5lLc5eGCvrCI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-ztPYlj5NMGiYjNzwbqv1CQ-1; Sat, 04 Jul 2020 17:32:11 -0400
X-MC-Unique: ztPYlj5NMGiYjNzwbqv1CQ-1
Received: by mail-wm1-f71.google.com with SMTP id h25so23696569wmb.0
 for <qemu-devel@nongnu.org>; Sat, 04 Jul 2020 14:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZvMbUnGJQt3yoRlltFf6Mt/5GWmmjKBAstpoETHPIqo=;
 b=QrkTpXVqvBcN3qcyTFFFNXBUCA3h84DYzSL6RmnVpPR0xqS1WP74Pvgr5L7zD/MJyH
 uP4pgLLlxXgWj72ocbBN9innmleqgoQtxnhLxCSHstH+W//HgROWxQQwq7ENmHdLkVha
 n85lod7TKphzRJ2joTM4uW3jbS+snrRIy4HtKDEsW0XzeQcalHAqf136R61/k8ZnC81t
 eA0yNjm25wdCScyAFB7wzuAN5qY9Pea48jTmPkq9lm9ODxJAT9JCjxKY13OLKGJ6Fyue
 WR/7cf8iL5AwX6FQPzVN32wx2E5BXcigYXH3gPyPX36mRbjseAJ8g8xOAlSSjnNrfOBC
 s43A==
X-Gm-Message-State: AOAM533OtcBMHPTKP5CsDM1q/KlaLR4MQojRt7hOlxrGZG5z4/uB+Iae
 Al9m8sjy35WPd625jX9QdPcy4FKrMKEsMbg/yqoLVW+quAUlrIpkW+kV3ukhxpEFFwqGxnAQeC3
 Z9rzLLRFeAiRb6HQ=
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr45943913wrw.204.1593898330320; 
 Sat, 04 Jul 2020 14:32:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmfOos5AcAD4AVipgWUBldTMoGPydw+5QMhjoFwpX9lrNRjRcyIX9DpmkRr9mhboMXQoiXlw==
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr45943895wrw.204.1593898329994; 
 Sat, 04 Jul 2020 14:32:09 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id c25sm5781528wml.18.2020.07.04.14.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 14:32:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v3 16/16] block/nvme: Use per-queuepair IRQ notifier and AIO
 context
Date: Sat,  4 Jul 2020 23:30:51 +0200
Message-Id: <20200704213051.19749-17-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704213051.19749-1-philmd@redhat.com>
References: <20200704213051.19749-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 17:28:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to use multiple queues on the same hardware,
we need to have each queuepair able to receive IRQ
notifications in the correct AIO context.

The AIO context and the notification handler have to be proper
to each queue, not to the block driver. Move aio_context and
irq_notifier from BDRVNVMeState to NVMeQueuePair.

Before this patch, only the admin queuepair had an EventNotifier
and was checking all queues when notified by IRQ.
After this patch, each queuepair (admin or io) is hooked with its
own IRQ notifier up to VFIO.

AioContexts must be identical across all queuepairs and
BlockDriverStates. Although they all have their own AioContext
pointer there is no true support for different AioContexts yet.
(For example, nvme_cmd_sync() is called with a bs argument but
AIO_WAIT_WHILE(q->aio_context, ...) uses the queuepair
aio_context so the assumption is that they match.)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v3:
- Add notifier to IO queuepairs
- Reword with Stefan help

I'd like to split this into smaller changes, but I'm not sure
if it is possible...
Maybe move EventNotifier first (keeping aio_context shared),
then move AioContext per queuepair?
---
 block/nvme.c | 102 +++++++++++++++++++++++++--------------------------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 42c0d5284f..fcf8d93fb2 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -60,6 +60,8 @@ typedef struct {
 
 typedef struct {
     QemuMutex   lock;
+    AioContext *aio_context;
+    EventNotifier irq_notifier;
 
     /* Read from I/O code path, initialized under BQL */
     BDRVNVMeState   *s;
@@ -107,7 +109,6 @@ QEMU_BUILD_BUG_ON(offsetof(NVMeRegs, doorbells) != 0x1000);
 #define QUEUE_INDEX_IO(n)   (1 + n)
 
 struct BDRVNVMeState {
-    AioContext *aio_context;
     QEMUVFIOState *vfio;
     NVMeRegs *regs;
     /* The submission/completion queue pairs.
@@ -120,7 +121,6 @@ struct BDRVNVMeState {
     /* How many uint32_t elements does each doorbell entry take. */
     size_t doorbell_scale;
     bool write_cache_supported;
-    EventNotifier irq_notifier;
 
     uint64_t nsze; /* Namespace size reported by identify command */
     int nsid;      /* The namespace id to read/write data. */
@@ -227,11 +227,17 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
     if (!q->prp_list_pages) {
         goto fail;
     }
+    r = event_notifier_init(&q->irq_notifier, 0);
+    if (r) {
+        error_setg(errp, "Failed to init event notifier");
+        goto fail;
+    }
     memset(q->prp_list_pages, 0, s->page_size * NVME_QUEUE_SIZE);
     qemu_mutex_init(&q->lock);
     q->s = s;
     q->index = idx;
     qemu_co_queue_init(&q->free_req_queue);
+    q->aio_context = aio_context;
     q->completion_bh = aio_bh_new(aio_context, nvme_process_completion_bh, q);
     r = qemu_vfio_dma_map(s->vfio, q->prp_list_pages,
                           s->page_size * NVME_NUM_REQS,
@@ -325,7 +331,7 @@ static void nvme_put_free_req_locked(NVMeQueuePair *q, NVMeRequest *req)
 static void nvme_wake_free_req_locked(NVMeQueuePair *q)
 {
     if (!qemu_co_queue_empty(&q->free_req_queue)) {
-        replay_bh_schedule_oneshot_event(q->s->aio_context,
+        replay_bh_schedule_oneshot_event(q->aio_context,
                 nvme_free_req_queue_cb, q);
     }
 }
@@ -492,7 +498,6 @@ static void nvme_cmd_sync_cb(void *opaque, int ret)
 static int nvme_cmd_sync(BlockDriverState *bs, NVMeQueuePair *q,
                          NvmeCmd *cmd)
 {
-    AioContext *aio_context = bdrv_get_aio_context(bs);
     NVMeRequest *req;
     int ret = -EINPROGRESS;
     req = nvme_get_free_req(q);
@@ -501,7 +506,7 @@ static int nvme_cmd_sync(BlockDriverState *bs, NVMeQueuePair *q,
     }
     nvme_submit_command(q, req, cmd, nvme_cmd_sync_cb, &ret);
 
-    AIO_WAIT_WHILE(aio_context, ret == -EINPROGRESS);
+    AIO_WAIT_WHILE(q->aio_context, ret == -EINPROGRESS);
     return ret;
 }
 
@@ -616,47 +621,35 @@ static bool nvme_poll_queue(NVMeQueuePair *q)
     return progress;
 }
 
-static bool nvme_poll_queues(BDRVNVMeState *s)
-{
-    bool progress = false;
-    int i;
-
-    for (i = 0; i < s->nr_queues; i++) {
-        if (nvme_poll_queue(s->queues[i])) {
-            progress = true;
-        }
-    }
-    return progress;
-}
-
 static void nvme_handle_event(EventNotifier *n)
 {
-    BDRVNVMeState *s = container_of(n, BDRVNVMeState, irq_notifier);
+    NVMeQueuePair *q = container_of(n, NVMeQueuePair, irq_notifier);
 
-    trace_nvme_handle_event(s);
+    trace_nvme_handle_event(q);
     event_notifier_test_and_clear(n);
-    nvme_poll_queues(s);
+    nvme_poll_queue(q);
 }
 
 static bool nvme_poll_cb(void *opaque)
 {
     EventNotifier *e = opaque;
-    BDRVNVMeState *s = container_of(e, BDRVNVMeState, irq_notifier);
+    NVMeQueuePair *q = container_of(e, NVMeQueuePair, irq_notifier);
 
-    trace_nvme_poll_cb(s);
-    return nvme_poll_queues(s);
+    trace_nvme_poll_cb(q);
+    return nvme_poll_queue(q);
 }
 
-static bool nvme_add_io_queue(BlockDriverState *bs, Error **errp)
+static bool nvme_add_io_queue(BlockDriverState *bs,
+                              AioContext *aio_context, Error **errp)
 {
     BDRVNVMeState *s = bs->opaque;
     int n = s->nr_queues;
     NVMeQueuePair *q;
     NvmeCmd cmd;
     int queue_size = NVME_QUEUE_SIZE;
+    int ret;
 
-    q = nvme_create_queue_pair(s, bdrv_get_aio_context(bs),
-                               n, queue_size, errp);
+    q = nvme_create_queue_pair(s, aio_context, n, queue_size, errp);
     if (!q) {
         return false;
     }
@@ -683,6 +676,17 @@ static bool nvme_add_io_queue(BlockDriverState *bs, Error **errp)
     s->queues = g_renew(NVMeQueuePair *, s->queues, n + 1);
     s->queues[n] = q;
     s->nr_queues++;
+
+    ret = qemu_vfio_pci_init_irq(s->vfio,
+                                 &s->queues[n]->irq_notifier,
+                                 VFIO_PCI_MSIX_IRQ_INDEX, errp);
+    if (ret) {
+        goto out_error;
+    }
+    aio_set_event_notifier(aio_context,
+                           &s->queues[n]->irq_notifier,
+                           false, nvme_handle_event, nvme_poll_cb);
+
     return true;
 out_error:
     nvme_free_queue_pair(q);
@@ -704,12 +708,6 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     qemu_co_queue_init(&s->dma_flush_queue);
     s->device = g_strdup(device);
     s->nsid = namespace;
-    s->aio_context = bdrv_get_aio_context(bs);
-    ret = event_notifier_init(&s->irq_notifier, 0);
-    if (ret) {
-        error_setg(errp, "Failed to init event notifier");
-        return ret;
-    }
 
     s->vfio = qemu_vfio_open_pci(device, errp);
     if (!s->vfio) {
@@ -784,12 +782,14 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
         }
     }
 
-    ret = qemu_vfio_pci_init_irq(s->vfio, &s->irq_notifier,
+    ret = qemu_vfio_pci_init_irq(s->vfio,
+                                 &s->queues[QUEUE_INDEX_ADMIN]->irq_notifier,
                                  VFIO_PCI_MSIX_IRQ_INDEX, errp);
     if (ret) {
         goto out;
     }
-    aio_set_event_notifier(bdrv_get_aio_context(bs), &s->irq_notifier,
+    aio_set_event_notifier(aio_context,
+                           &s->queues[QUEUE_INDEX_ADMIN]->irq_notifier,
                            false, nvme_handle_event, nvme_poll_cb);
 
     nvme_identify(bs, namespace, &local_err);
@@ -800,7 +800,7 @@ static int nvme_init(BlockDriverState *bs, const char *device, int namespace,
     }
 
     /* Set up command queues. */
-    if (!nvme_add_io_queue(bs, errp)) {
+    if (!nvme_add_io_queue(bs, aio_context, errp)) {
         ret = -EIO;
     }
 out:
@@ -869,12 +869,14 @@ static void nvme_close(BlockDriverState *bs)
     BDRVNVMeState *s = bs->opaque;
 
     for (i = 0; i < s->nr_queues; ++i) {
-        nvme_free_queue_pair(s->queues[i]);
+        NVMeQueuePair *q = s->queues[i];
+
+        aio_set_event_notifier(q->aio_context,
+                               &q->irq_notifier, false, NULL, NULL);
+        event_notifier_cleanup(&q->irq_notifier);
+        nvme_free_queue_pair(q);
     }
     g_free(s->queues);
-    aio_set_event_notifier(bdrv_get_aio_context(bs), &s->irq_notifier,
-                           false, NULL, NULL);
-    event_notifier_cleanup(&s->irq_notifier);
     qemu_vfio_pci_unmap_bar(s->vfio, 0, (void *)s->regs, 0, NVME_BAR_SIZE);
     qemu_vfio_close(s->vfio);
 
@@ -1086,7 +1088,7 @@ static coroutine_fn int nvme_co_prw_aligned(BlockDriverState *bs,
         .cdw12 = cpu_to_le32(cdw12),
     };
     NVMeCoData data = {
-        .ctx = bdrv_get_aio_context(bs),
+        .ctx = ioq->aio_context,
         .ret = -EINPROGRESS,
     };
 
@@ -1195,7 +1197,7 @@ static coroutine_fn int nvme_co_flush(BlockDriverState *bs)
         .nsid = cpu_to_le32(s->nsid),
     };
     NVMeCoData data = {
-        .ctx = bdrv_get_aio_context(bs),
+        .ctx = ioq->aio_context,
         .ret = -EINPROGRESS,
     };
 
@@ -1236,7 +1238,7 @@ static coroutine_fn int nvme_co_pwrite_zeroes(BlockDriverState *bs,
     };
 
     NVMeCoData data = {
-        .ctx = bdrv_get_aio_context(bs),
+        .ctx = ioq->aio_context,
         .ret = -EINPROGRESS,
     };
 
@@ -1286,7 +1288,7 @@ static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
     };
 
     NVMeCoData data = {
-        .ctx = bdrv_get_aio_context(bs),
+        .ctx = ioq->aio_context,
         .ret = -EINPROGRESS,
     };
 
@@ -1379,10 +1381,10 @@ static void nvme_detach_aio_context(BlockDriverState *bs)
 
         qemu_bh_delete(q->completion_bh);
         q->completion_bh = NULL;
-    }
 
-    aio_set_event_notifier(bdrv_get_aio_context(bs), &s->irq_notifier,
-                           false, NULL, NULL);
+        aio_set_event_notifier(bdrv_get_aio_context(bs), &q->irq_notifier,
+                               false, NULL, NULL);
+    }
 }
 
 static void nvme_attach_aio_context(BlockDriverState *bs,
@@ -1390,13 +1392,11 @@ static void nvme_attach_aio_context(BlockDriverState *bs,
 {
     BDRVNVMeState *s = bs->opaque;
 
-    s->aio_context = new_context;
-    aio_set_event_notifier(new_context, &s->irq_notifier,
-                           false, nvme_handle_event, nvme_poll_cb);
-
     for (int i = 0; i < s->nr_queues; i++) {
         NVMeQueuePair *q = s->queues[i];
 
+        aio_set_event_notifier(new_context, &q->irq_notifier,
+                               false, nvme_handle_event, nvme_poll_cb);
         q->completion_bh =
             aio_bh_new(new_context, nvme_process_completion_bh, q);
     }
-- 
2.21.3


