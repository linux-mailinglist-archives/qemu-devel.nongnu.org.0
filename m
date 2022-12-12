Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D81649FCA
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 14:15:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4iQP-0001jc-0G; Mon, 12 Dec 2022 08:00:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPY-0001Cz-HI
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:00:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p4iPW-0000ei-SL
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 08:00:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670849998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htkU7SVOcGM/+ZnC/Z5yotiRrBUBCT+Uwz5tvqkgeq4=;
 b=KYbCwkNdATRf+rtp1sMwr94gcL2BvwWivgWSWjijEG4MpVhfulZorr1e471HzWpOFKroV5
 ZVvseJcpfeOrDkeroYd7MQ6/X8lFUAzLasvZydCnmrMASpQjmprvC5zHLNumaHtElYwIVb
 G3KIAh7SYntMYi7UrsMCw3L8pn4L76w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-KFmbeHVtPIC8br4POBD07A-1; Mon, 12 Dec 2022 07:59:57 -0500
X-MC-Unique: KFmbeHVtPIC8br4POBD07A-1
Received: by mail-wm1-f72.google.com with SMTP id
 c126-20020a1c3584000000b003cfffcf7c1aso4156033wma.0
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 04:59:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=htkU7SVOcGM/+ZnC/Z5yotiRrBUBCT+Uwz5tvqkgeq4=;
 b=Tt6f3kzqNhvNEhRly3BXPXRirBeS7GwUQxNNCfsohTMoQ2EW0XJN6Ydts3N/gPe6vG
 mxBFeGePp0Iqss3flOLwhDX4Q79j6A+4aCvVAR8iee5MC7GZGKD9doiJisLlI4Q7yqY3
 +ACt2DzQ7xVyauNrz2O3Jsi3ys1S7i5kDQp0vESI4M0cx4kz90cKTOa2sSgxWhVWtd77
 1LWf65iSj1MsBqBW3yK8vWG5IWm+9EPlS7Y+lc2Srk67Vuf9acS69JnQRcIm+AefKmYW
 UpyQwqhdP1tKjU6fa2kBSBp5Qm3lXcfT4Euu1G+MgSlKLSn9NQJ/ymadAMxRAqOsWkiK
 g/aQ==
X-Gm-Message-State: ANoB5pnUhNMJpNEJmWqx498X/wdWakYWMp/e4JrRWrq2rO8oGwojUnz8
 oX+L9NhsXeuwUOt33rx2yHXezewCdGVR8xfExJAWzxHMi+DqMV/9YOzxd9r72reWOpwVWcdhXhD
 fKTcw7xGFYXUNiku3VBdlPzuakNLKzctrcch8TZUjomyDDlBPJDPvV+IXyGBWtuKskWY=
X-Received: by 2002:a05:600c:310e:b0:3cf:a39f:eb2a with SMTP id
 g14-20020a05600c310e00b003cfa39feb2amr12545058wmo.11.1670849995307; 
 Mon, 12 Dec 2022 04:59:55 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4vR4yuOZcoZutIbG7hq+wY0zkU9iiPima3l1djnTdoOahbFbAL4AFfV2AhHFSEsEJIwcF7Ug==
X-Received: by 2002:a05:600c:310e:b0:3cf:a39f:eb2a with SMTP id
 g14-20020a05600c310e00b003cfa39feb2amr12545039wmo.11.1670849994942; 
 Mon, 12 Dec 2022 04:59:54 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c4f0800b003cf54b77bfesm9566039wmq.28.2022.12.12.04.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 04:59:54 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	eesposit@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 11/15] block-backend: make queued_requests thread-safe
Date: Mon, 12 Dec 2022 13:59:16 +0100
Message-Id: <20221212125920.248567-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212125920.248567-1-pbonzini@redhat.com>
References: <20221212125920.248567-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Protect quiesce_counter and queued_requests with a QemuMutex, so that
they are protected from concurrent access in the main thread (for example
blk_root_drained_end() reached from bdrv_drain_all()) and in the iothread
(where any I/O operation will call blk_inc_in_flight()).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c | 44 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 627d491d4155..fdf82f1f1599 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -23,6 +23,7 @@
 #include "qapi/error.h"
 #include "qapi/qapi-events-block.h"
 #include "qemu/id.h"
+#include "qemu/thread.h"
 #include "qemu/main-loop.h"
 #include "qemu/option.h"
 #include "trace.h"
@@ -85,6 +86,8 @@ struct BlockBackend {
     NotifierList remove_bs_notifiers, insert_bs_notifiers;
     QLIST_HEAD(, BlockBackendAioNotifier) aio_notifiers;
 
+    /* Protected by quiesce_lock.  */
+    QemuMutex quiesce_lock;
     int quiesce_counter;
     CoQueue queued_requests;
 
@@ -372,6 +375,7 @@ BlockBackend *blk_new(AioContext *ctx, uint64_t perm, uint64_t shared_perm)
 
     block_acct_init(&blk->stats);
 
+    qemu_mutex_init(&blk->quiesce_lock);
     qemu_co_queue_init(&blk->queued_requests);
     notifier_list_init(&blk->remove_bs_notifiers);
     notifier_list_init(&blk->insert_bs_notifiers);
@@ -490,6 +494,7 @@ static void blk_delete(BlockBackend *blk)
     assert(QLIST_EMPTY(&blk->insert_bs_notifiers.notifiers));
     assert(QLIST_EMPTY(&blk->aio_notifiers));
     QTAILQ_REMOVE(&block_backends, blk, link);
+    qemu_mutex_destroy(&blk->quiesce_lock);
     drive_info_del(blk->legacy_dinfo);
     block_acct_cleanup(&blk->stats);
     g_free(blk);
@@ -1451,11 +1456,25 @@ void blk_inc_in_flight(BlockBackend *blk)
 {
     IO_CODE();
     qatomic_inc(&blk->in_flight);
-    if (!blk->disable_request_queuing) {
-        /* TODO: this is not thread-safe! */
+
+    /*
+     * Avoid a continuous stream of requests from AIO callbacks, which
+     * call a user-provided callback while blk->in_flight is elevated,
+     * if the BlockBackend is being quiesced.
+     *
+     * This initial test does not have to be perfect: a race might
+     * cause an extra I/O to be queued, but sooner or later a nonzero
+     * quiesce_counter will be observed.
+     */
+    if (!blk->disable_request_queuing && qatomic_read(&blk->quiesce_counter)) {
+        /*
+         * ... on the other hand, it is important that the final check and
+	 * the wait are done under the lock, so that no wakeups are missed.
+         */
+        QEMU_LOCK_GUARD(&blk->quiesce_lock);
         while (blk->quiesce_counter) {
             qatomic_dec(&blk->in_flight);
-            qemu_co_queue_wait(&blk->queued_requests, NULL);
+            qemu_co_queue_wait(&blk->queued_requests, &blk->quiesce_lock);
             qatomic_inc(&blk->in_flight);
         }
     }
@@ -2542,7 +2561,8 @@ static void blk_root_drained_begin(BdrvChild *child)
     BlockBackend *blk = child->opaque;
     ThrottleGroupMember *tgm = &blk->public.throttle_group_member;
 
-    if (++blk->quiesce_counter == 1) {
+    qatomic_set(&blk->quiesce_counter, blk->quiesce_counter + 1);
+    if (blk->quiesce_counter == 1) {
         if (blk->dev_ops && blk->dev_ops->drained_begin) {
             blk->dev_ops->drained_begin(blk->dev_opaque);
         }
@@ -2560,6 +2580,7 @@ static bool blk_root_drained_poll(BdrvChild *child)
 {
     BlockBackend *blk = child->opaque;
     bool busy = false;
+
     assert(blk->quiesce_counter);
 
     if (blk->dev_ops && blk->dev_ops->drained_poll) {
@@ -2576,14 +2597,21 @@ static void blk_root_drained_end(BdrvChild *child)
     assert(blk->public.throttle_group_member.io_limits_disabled);
     qatomic_dec(&blk->public.throttle_group_member.io_limits_disabled);
 
-    if (--blk->quiesce_counter == 0) {
+    qemu_mutex_lock(&blk->quiesce_lock);
+    qatomic_set(&blk->quiesce_counter, blk->quiesce_counter - 1);
+    if (blk->quiesce_counter == 0) {
+        /* After this point, new I/O will not sleep on queued_requests.  */
+        qemu_mutex_unlock(&blk->quiesce_lock);
+
         if (blk->dev_ops && blk->dev_ops->drained_end) {
             blk->dev_ops->drained_end(blk->dev_opaque);
         }
-        while (qemu_co_enter_next(&blk->queued_requests, NULL)) {
-            /* Resume all queued requests */
-        }
+
+        /* Now resume all queued requests */
+        qemu_mutex_lock(&blk->quiesce_lock);
+        qemu_co_enter_all(&blk->queued_requests, &blk->quiesce_lock);
     }
+    qemu_mutex_unlock(&blk->quiesce_lock);
 }
 
 bool blk_register_buf(BlockBackend *blk, void *host, size_t size, Error **errp)
-- 
2.38.1


