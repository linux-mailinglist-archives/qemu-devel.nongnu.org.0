Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB845270B0
	for <lists+qemu-devel@lfdr.de>; Sat, 14 May 2022 12:33:24 +0200 (CEST)
Received: from localhost ([::1]:58036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npp5P-0005J4-Bh
	for lists+qemu-devel@lfdr.de; Sat, 14 May 2022 06:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npp2U-0003zF-5e
 for qemu-devel@nongnu.org; Sat, 14 May 2022 06:30:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1npp2M-0000Oy-UR
 for qemu-devel@nongnu.org; Sat, 14 May 2022 06:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652524208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BPoNDaXalKjJIq0/UPbpyMQJLkHpm4TvHFvgS/M5rts=;
 b=gusI2T1Gli+gGixqBqVrl/cH/oHUlHAQMNfi5I4qQR+h6SgVDXuuoT4j0AB6X/s2/aMSr6
 k47K5qbAw6Na1x3EId//jSj6IIhLBi/mU/bqJoXWjJWJmmFXE6rkcrgz+s+l+xBBHd0hzF
 e8ydwweL62sKpKNJQeXVak35JPCY8+0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-bdhxWJBtMTq4sEnG8AGb8A-1; Sat, 14 May 2022 06:30:03 -0400
X-MC-Unique: bdhxWJBtMTq4sEnG8AGb8A-1
Received: by mail-wm1-f71.google.com with SMTP id
 g3-20020a7bc4c3000000b0039409519611so3969120wmk.9
 for <qemu-devel@nongnu.org>; Sat, 14 May 2022 03:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BPoNDaXalKjJIq0/UPbpyMQJLkHpm4TvHFvgS/M5rts=;
 b=5rJX7/7PWXIqYGOu2zmuqMKtR0ZKLJd/LL1u+o5/sgDQ/s3HHJO3ng7Ex5uXQ3OdbO
 D/Wcu4i6dyYed09rD6MHr9X15DLT/XNbrocFLa9PNeGGpqQKIlRZg1FWEefHvjdk5p/V
 TtU8Eck2IkKAmws7fdV6WK84CDJfAupCEb+hzDWzYHEx5iaEw2e+r2APu6cOqlKKypbj
 qTJd6/eKZ2iNfnnCoghPSyQcCCnDXLcOrjFCCv3XrdpAavQ+9aC7IZknQTtPk/8pI1rI
 TayHHZmpd/owMfenEsEtwRUm+EbmDGug6W7KUPNZL9CZjDkY2MJ+YabHwueAw7VRJ9WC
 fFbg==
X-Gm-Message-State: AOAM532MvMzCt/gSu6Fgx3sxIpbjAd+V33lpTvM92L2PDpruR71Epx8r
 Cl1mTznjv4i51/p6L57pqHxqVvYFyQUrm4iDpVcnlw1oneRN2UUyq3W8S3v0Ci0ntnr1JBmND2m
 5PDY/DgjeO0ASORAJlC1XKwssObmIVVlrFnXa2xz+rqs1XZ+J6KhmAo6D+9Nz+XPgNWw=
X-Received: by 2002:adf:f0c8:0:b0:20d:137:c029 with SMTP id
 x8-20020adff0c8000000b0020d0137c029mr615468wro.363.1652524201457; 
 Sat, 14 May 2022 03:30:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNnYQEnBMyU3ZQn6VnpRvRGEC4LFtfkSr172kqLvvpzDf6qzca9HqJasKwZKRAi5AS6AX8FQ==
X-Received: by 2002:adf:f0c8:0:b0:20d:137:c029 with SMTP id
 x8-20020adff0c8000000b0020d0137c029mr615455wro.363.1652524201097; 
 Sat, 14 May 2022 03:30:01 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:e3ec:5559:7c5c:1928])
 by smtp.gmail.com with ESMTPSA id
 bi12-20020a05600c3d8c00b003942a244edbsm1495842wmb.32.2022.05.14.03.29.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 03:30:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH] block/nvme: separate nvme_get_free_req cases for
 coroutine/non-coroutine context
Date: Sat, 14 May 2022 12:29:58 +0200
Message-Id: <20220514102958.1163922-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

nvme_get_free_req has very difference semantics when called in
coroutine context (when it waits) and in non-coroutine context
(when it doesn't).  Split the two cases to make it clear what
is being requested.

Cc: qemu-block@nongnu.org
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nvme.c | 48 ++++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 01fb28aa63..092c1f2f8e 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -293,34 +293,42 @@ static void nvme_kick(NVMeQueuePair *q)
     q->need_kick = 0;
 }
 
-/* Find a free request element if any, otherwise:
- * a) if in coroutine context, try to wait for one to become available;
- * b) if not in coroutine, return NULL;
- */
-static NVMeRequest *nvme_get_free_req(NVMeQueuePair *q)
+static NVMeRequest *nvme_get_free_req_nofail_locked(NVMeQueuePair *q)
 {
     NVMeRequest *req;
 
-    qemu_mutex_lock(&q->lock);
-
-    while (q->free_req_head == -1) {
-        if (qemu_in_coroutine()) {
-            trace_nvme_free_req_queue_wait(q->s, q->index);
-            qemu_co_queue_wait(&q->free_req_queue, &q->lock);
-        } else {
-            qemu_mutex_unlock(&q->lock);
-            return NULL;
-        }
-    }
-
     req = &q->reqs[q->free_req_head];
     q->free_req_head = req->free_req_next;
     req->free_req_next = -1;
-
-    qemu_mutex_unlock(&q->lock);
     return req;
 }
 
+/* Return a free request element if any, otherwise return NULL.  */
+static NVMeRequest *nvme_get_free_req_nowait(NVMeQueuePair *q)
+{
+    QEMU_LOCK_GUARD(&q->lock);
+    if (q->free_req_head == -1) {
+        return NULL;
+    }
+    return nvme_get_free_req_nofail_locked(q);
+}
+
+/*
+ * Return a free request element if any, otherwise wait
+ * for one to become available
+ */
+static coroutine_fn NVMeRequest *nvme_get_free_req(NVMeQueuePair *q)
+{
+    QEMU_LOCK_GUARD(&q->lock);
+
+    while (q->free_req_head == -1) {
+       trace_nvme_free_req_queue_wait(q->s, q->index);
+       qemu_co_queue_wait(&q->free_req_queue, &q->lock);
+    }
+
+    return nvme_get_free_req_nofail_locked(q);
+}
+
 /* With q->lock */
 static void nvme_put_free_req_locked(NVMeQueuePair *q, NVMeRequest *req)
 {
@@ -506,7 +514,7 @@ static int nvme_admin_cmd_sync(BlockDriverState *bs, NvmeCmd *cmd)
     AioContext *aio_context = bdrv_get_aio_context(bs);
     NVMeRequest *req;
     int ret = -EINPROGRESS;
-    req = nvme_get_free_req(q);
+    req = nvme_get_free_req_nowait(q);
     if (!req) {
         return -EBUSY;
     }
-- 
2.36.0


