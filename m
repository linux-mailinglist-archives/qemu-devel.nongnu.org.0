Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB30120FCB5
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 21:24:06 +0200 (CEST)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqLrR-0004Uo-R6
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 15:24:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqLiB-0007ML-HY
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 15:14:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33631
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jqLi8-0005c5-Q9
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 15:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593544468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xAix5j6fBTu5J6nPbJGKsMJBRsOhK42Lg6OcyQOGwZc=;
 b=JSKcGYF4t1pYN06U+nDCPUQoOiFyEqrRpeFyyN+cpk9RS36HLukja4fIji5YJMN7SEfWZH
 0EDeWd1k7AVJjfTMlvmLQHLxpNlhlpnHNrZW0NcdcV5mP4zcmtiX+HzUT+6WzGLYdq0ibZ
 y1gNn0vQnap2FEFPYLTN1xsnOzvoF9s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-VR0k5xBkOC2m9RzD0pTMfw-1; Tue, 30 Jun 2020 15:13:57 -0400
X-MC-Unique: VR0k5xBkOC2m9RzD0pTMfw-1
Received: by mail-wm1-f72.google.com with SMTP id t145so21419068wmt.2
 for <qemu-devel@nongnu.org>; Tue, 30 Jun 2020 12:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xAix5j6fBTu5J6nPbJGKsMJBRsOhK42Lg6OcyQOGwZc=;
 b=PmEPfiid5b27a0OMLFaOm4pOzkxQvsHbYA8x7jYXH+kN8PQ+RtqrYPRrIxN5iA3Pfm
 QWi4vsaViYUYYlSl4MFzbQuFqLXLXiHidZCCrJ0cUyaLRe+R6Q0dVkOXPwQyOWZPWR11
 q1AyYaM5AJ4aDHcqCpPxAfazxkPjLxceTBULANtn/nuBHQZ7dQJwZqSnTUT+O8XmkTtI
 JobmeB25874KMmtW8+bfjbdFbLycK4yd9LnOfR5n7kka6jZsRZos/OyGYWMPov4DucsK
 JIuBZdMzMEIlXLXvB6e020M6VklSBMDDD8Q1ELhB8MeHvm8trmvMaJmzteehTdW7Dl4f
 0Gdw==
X-Gm-Message-State: AOAM533XoWJWHRomMy8Il9oHv2FI+mY8iYg+HwQgu1JQh2mcfuf3LfWD
 wr2zmTgtGfukHDxdIMjOF1dl3kJWsXWbA/McFIeailajgkfOeVoN0passAzUp48vCCKhFuYJrgU
 oxzzDZcq2+wF9b3s=
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr22884002wrw.199.1593544436505; 
 Tue, 30 Jun 2020 12:13:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhruJ8mI3C5RCoqABBkYuxHHuvtJP8Eowyx5JB9C2yerOF6aJ6+ucGR2EFxhiO+TJ+LpjcIg==
X-Received: by 2002:a5d:4fce:: with SMTP id h14mr22883902wrw.199.1593544434428; 
 Tue, 30 Jun 2020 12:13:54 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r8sm4472994wrp.40.2020.06.30.12.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 12:13:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 07/12] block/nvme: Replace qemu_try_blockalign0 by
 qemu_try_blockalign/memset
Date: Tue, 30 Jun 2020 21:13:13 +0200
Message-Id: <20200630191318.30021-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200630191318.30021-1-philmd@redhat.com>
References: <20200630191318.30021-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 03:55:26
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

In the next commit we'll get rid of qemu_try_blockalign().
To ease review, first replace qemu_try_blockalign0() by explicit
calls to qemu_try_blockalign() and memset().

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nvme.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 7ebd5be1f3..5b0bb9a8d7 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -174,12 +174,12 @@ static void nvme_init_queue(BlockDriverState *bs, NVMeQueue *q,
 
     bytes = ROUND_UP(nentries * entry_bytes, s->page_size);
     q->head = q->tail = 0;
-    q->queue = qemu_try_blockalign0(bs, bytes);
-
+    q->queue = qemu_try_blockalign(bs, bytes);
     if (!q->queue) {
         error_setg(errp, "Cannot allocate queue");
         return;
     }
+    memset(q->queue, 0, bytes);
     r = qemu_vfio_dma_map(s->vfio, q->queue, bytes, false, &q->iova);
     if (r) {
         error_setg(errp, "Cannot map queue");
@@ -223,11 +223,12 @@ static NVMeQueuePair *nvme_create_queue_pair(BlockDriverState *bs,
     if (!q) {
         return NULL;
     }
-    q->prp_list_pages = qemu_try_blockalign0(bs,
+    q->prp_list_pages = qemu_try_blockalign(bs,
                                           s->page_size * NVME_QUEUE_SIZE);
     if (!q->prp_list_pages) {
         goto fail;
     }
+    memset(q->prp_list_pages, 0, s->page_size * NVME_QUEUE_SIZE);
     qemu_mutex_init(&q->lock);
     q->s = s;
     q->index = idx;
@@ -521,7 +522,7 @@ static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
         .cdw10 = cpu_to_le32(0x1),
     };
 
-    id = qemu_try_blockalign0(bs, sizeof(*id));
+    id = qemu_try_blockalign(bs, sizeof(*id));
     if (!id) {
         error_setg(errp, "Cannot allocate buffer for identify response");
         goto out;
@@ -531,8 +532,9 @@ static void nvme_identify(BlockDriverState *bs, int namespace, Error **errp)
         error_setg(errp, "Cannot map buffer for DMA");
         goto out;
     }
-    cmd.prp1 = cpu_to_le64(iova);
 
+    memset(id, 0, sizeof(*id));
+    cmd.prp1 = cpu_to_le64(iova);
     if (nvme_cmd_sync(bs, s->queues[QUEUE_INDEX_ADMIN], &cmd)) {
         error_setg(errp, "Failed to identify controller");
         goto out;
@@ -1282,11 +1284,11 @@ static int coroutine_fn nvme_co_pdiscard(BlockDriverState *bs,
 
     assert(s->nr_queues > 1);
 
-    buf = qemu_try_blockalign0(bs, s->page_size);
+    buf = qemu_try_blockalign(bs, s->page_size);
     if (!buf) {
         return -ENOMEM;
     }
-
+    memset(buf, 0, s->page_size);
     buf->nlb = cpu_to_le32(bytes >> s->blkshift);
     buf->slba = cpu_to_le64(offset >> s->blkshift);
     buf->cattr = 0;
-- 
2.21.3


