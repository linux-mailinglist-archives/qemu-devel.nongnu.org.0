Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A72477254
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:56:50 +0100 (CET)
Received: from localhost ([::1]:35286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqJV-0002pX-T1
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:56:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxq08-00029S-6b
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxq06-0004bq-08
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639658204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVs/ItDUtTUaUH7BuhHvQPHC0PdKVqniEjcG6RP0pL0=;
 b=UC7kihorAyUcvV3QgX0kmDIPhzzeM/564Q3Jp2hIBUnbuJBi/63XUOvrnHcT5r/qUhEOPa
 Pr+UjhzU1WD2ajTRKi/buaErvEgtnk6y/XK/6BugwmYGCsb4CDOtf/jVNBBp+Qg139PhdE
 wRKRgBm3vEs3NUwfUpWXN+R3mAZjj8o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-KFuK0FDuPjeznoqpgmcTZQ-1; Thu, 16 Dec 2021 07:36:43 -0500
X-MC-Unique: KFuK0FDuPjeznoqpgmcTZQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg20-20020a05600c3c9400b0033a9300b44bso10236715wmb.2
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sVs/ItDUtTUaUH7BuhHvQPHC0PdKVqniEjcG6RP0pL0=;
 b=B/YUaRWw2y+2E2PPeE0/Y79bny50LUnKQjFw27WNvsBMZW+XWE3rZB+hyvs8F9HK2A
 puXxc437VjdkQB4F7ZCNG63vigFlvrsWWC6Spcyk6W9RpeNvIewux2KkrxsrLEnCzjMp
 Z4QRR7TGZYeEyLG26CKsTIrVEleNnTTUKp9oD6+UlqN/tCOxBal1KSV53yXFTPSGYnL7
 NTCe1P5bohFpOCl4Z7cJVF1OCjxv6Wp88jSNpO+mtsTv92Adr4WucT6eGU3q7MWrRBmk
 Rh1o3/le2J6ypxMoeTVv+Waut18w+Oke2vY40JJJTkKKMkfu2kGXophohuEWfhD1HrxY
 hTAQ==
X-Gm-Message-State: AOAM530ILFcY3EdivhwNkhzTXPcftvPMaSQoRJ6BcyFUJMdKAJH+aF0C
 F67VNEqBuDS9UTMyY5Vnba0ohmWBJxB1u7Cvamu0uKyk1XHiMGJRJK5qu0VzJUWSXPSNPWZSXLe
 j7UX4OAC1rqjQZuAIF/cpkZNDnU8v0dOxo2Rw6dDFwdZk5ZkSSUk5DHe9BRXfQffq
X-Received: by 2002:a5d:4311:: with SMTP id h17mr8567145wrq.677.1639658202094; 
 Thu, 16 Dec 2021 04:36:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4AZ6EgVgfmx4C5LaKnvqF5PNDBHp+KScJwd5/UulMjh5g+OnpgvH+UrO5LF3xjMEPEmAfMw==
X-Received: by 2002:a5d:4311:: with SMTP id h17mr8567112wrq.677.1639658201813; 
 Thu, 16 Dec 2021 04:36:41 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id b19sm8834949wmb.38.2021.12.16.04.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:36:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/8] dma: Let dma_buf_rw() propagate MemTxResult
Date: Thu, 16 Dec 2021 13:35:57 +0100
Message-Id: <20211216123558.799425-8-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211216123558.799425-1-philmd@redhat.com>
References: <20211216123558.799425-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dma_memory_rw() returns a MemTxResult type. Do not discard
it, return it to the caller.

Since dma_buf_rw() was previously returning the QEMUSGList
size not consumed, add an extra argument where this size
can be stored.

Update the 2 callers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/dma-helpers.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index a391773c296..b0be1564797 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -294,12 +294,14 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 }
 
 
-static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
-                           DMADirection dir, MemTxAttrs attrs)
+static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residp,
+                              QEMUSGList *sg, DMADirection dir,
+                              MemTxAttrs attrs)
 {
     uint8_t *ptr = buf;
     uint64_t resid;
     int sg_cur_index;
+    MemTxResult res = MEMTX_OK;
 
     resid = sg->size;
     sg_cur_index = 0;
@@ -307,23 +309,34 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
+        res |= dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
         ptr += xfer;
         len -= xfer;
         resid -= xfer;
     }
 
-    return resid;
+    if (residp) {
+        *residp = resid;
+    }
+    return res;
 }
 
 uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
+    uint64_t resid;
+
+    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
+
+    return resid;
 }
 
 uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE, attrs);
+    uint64_t resid;
+
+    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_TO_DEVICE, attrs);
+
+    return resid;
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1


