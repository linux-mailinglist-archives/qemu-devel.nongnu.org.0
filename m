Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C9B482122
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 02:02:06 +0100 (CET)
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n36J3-0001wx-7I
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 20:02:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36E7-0002NS-Mr
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:57:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n36E5-0003b2-Jx
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 19:56:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640912217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zjkq/WlHNhkvtvm4qiPoY5i0eEmAP2+gefa9oIHx13g=;
 b=ZcyIifzWa9QAhDa/B1SfoKgVTccPpx4edqiEVq+usp70c0aKgNWNXcU/you4ZTzFbCxv6k
 A5B2e9b3bXLjx+gG0/XyZIj/DMh/e4O9D9uWtXvXzvlKZMMs1U62i7wj9udSakzh+3UCM9
 HlHhC5KuFRw3RGeY+7Rh/E77XX/C+E0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-19loCYZVOmWjcr7yJFlLDA-1; Thu, 30 Dec 2021 19:56:56 -0500
X-MC-Unique: 19loCYZVOmWjcr7yJFlLDA-1
Received: by mail-ed1-f72.google.com with SMTP id
 q15-20020a056402518f00b003f87abf9c37so17983342edd.15
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 16:56:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zjkq/WlHNhkvtvm4qiPoY5i0eEmAP2+gefa9oIHx13g=;
 b=APttUfuF/GMDe5ThmPJZ9FvznaVB15Dmabh1AvsoiyubO7OFVwm2l93bopBKkinVsl
 h/iD4HRWla4bPGo+JgHJmOKJxB9kgXA3Fs5dwXv9ZFvwTEzx6aGF8tCkk493HyJ94lYM
 PJyx+WHAGH0P6zmJ3n26wYyJB3oiy2gfqKbu4kanWsDxlY9b2nXHoJjooNO6N023kYlS
 eMrrBZc9wqIgtutTuNCRxG9W3YpEOwezWrDc9MgtV7E2p6gSoJrFOpSfrEoSkuYnBXbL
 upcRLEwZWl3qrn7EWVlNfm/ljbzht5tFUy3phdAF9DagviXObKCeBJNI++o0HV3p/Agq
 eNhw==
X-Gm-Message-State: AOAM533fCaZpECsXQpW4BwZ4D+jHKmjufOIoJ2uwVRuDhmLCSg9egNWa
 dtNjzpItsuBZeTohB7oBAzxivYICDiL0RRnQJdQ8jmbT+PQxH1Frv5DBfSJK18NW7hOPFWBxyWs
 xMLcbz0hFR13r9jiEkmNNcm3dCjTFCKlwzFFBtEcLsYhLDPj8s/Cc5tXHlMh3UHI5
X-Received: by 2002:a05:6402:354d:: with SMTP id
 f13mr24653925edd.135.1640912214663; 
 Thu, 30 Dec 2021 16:56:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwS2DoI+vW0zPPUwNygRqfjoncvHEEbPwXuL0i5GC+qFNzKR0x4gr/HgGp8mj/aNopNvGMPMg==
X-Received: by 2002:a05:6402:354d:: with SMTP id
 f13mr24653898edd.135.1640912214491; 
 Thu, 30 Dec 2021 16:56:54 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id g16sm8022972ejt.202.2021.12.30.16.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 16:56:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/22] dma: Let dma_buf_rw() propagate MemTxResult
Date: Fri, 31 Dec 2021 01:55:38 +0100
Message-Id: <20211231005546.723396-15-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231005546.723396-1-philmd@redhat.com>
References: <20211231005546.723396-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dma_memory_rw() returns a MemTxResult type. Do not discard
it, return it to the caller.

Since dma_buf_rw() was previously returning the QEMUSGList
size not consumed, add an extra argument where this size
can be stored.

Update the 2 callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211223115554.3155328-14-philmd@redhat.com>
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


