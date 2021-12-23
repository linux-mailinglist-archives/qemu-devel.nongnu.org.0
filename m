Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71247E389
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:35:07 +0100 (CET)
Received: from localhost ([::1]:57436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0NJJ-0002Ke-TM
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:35:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MkV-0002JB-Jq
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:59:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MkS-000128-Th
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:59:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XDiu/1Y9UJG/Mr1Uyi7hIwmLFqroGRXmqVVQxLYL8lo=;
 b=DunWXpyQXMTV/4mQqD1DDJzBJakmxkBn7Fyb2iNkuXl0t+ixDUhVpucdYdW72kpwxI9IOz
 HGYHQ9ISiOpqlGxsqBZHWlxV9OUke004sQ/bvaburE4FiveucyM20edQCEI0xWdHJcJde+
 s9n0KxL1QdqlOaHvBtI2yNn0h431fiE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-445-7DSmB5YjO5ubMEtO9jFL1w-1; Thu, 23 Dec 2021 06:59:03 -0500
X-MC-Unique: 7DSmB5YjO5ubMEtO9jFL1w-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay41-20020a05600c1e2900b00345a568e6b2so1865697wmb.4
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:59:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDiu/1Y9UJG/Mr1Uyi7hIwmLFqroGRXmqVVQxLYL8lo=;
 b=EGXy2HG6zrHTn5lq6luHcKLJ/OE46ma29lFA+rsYPgQgG/fgyKmkI/+HP0qi87m5D+
 a1lVf57nHGbYQ3M4ll9jqXuBuMgiKblU3gIwasRFTCwoAwwLjdoRHHrwtXqHZfAtFgdl
 +UvODtkCKG6+D4a6Aufp95qVwHelZRmr/j8uxU0tZ+cW7zfHuQXpbXuAkxTdRada2TwC
 jx1/dhIJhIfTq1s16mmuJQNqwW68pJ1B2Wd8KtJLnZqefbhOFU6CPfhK5kQb3xcGj47w
 6ynVbZFRdrdA+ae7B/312YdDpha8XS2IJJ5KUsSYEZe6sHMd4xEyfloiCURYdl34uyBu
 j91w==
X-Gm-Message-State: AOAM531RFGU9pGkskufsZmVOJlI2gedGBtSJu4yx+Ia0gFT3n27zMZ05
 S/ZxGQrdzywoOIKh+eZy5PDbLcBuvOJLFRBtY/zrO4ozUkkQwOpLZqlonJklt2KKxGEOwY4DTyE
 CrrkNF3WluSWj/8/knqsQMTpIFrcfUAa9NkjDIaWotn1kgWe1NgTwADxaObZ8ZZJ7
X-Received: by 2002:a5d:64c6:: with SMTP id f6mr1468900wri.711.1640260741524; 
 Thu, 23 Dec 2021 03:59:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwnxPoqDT/k37moPDRccV+te9B75XwO+CkBI4dcJ0VLH0B//Q3K/CRWOZpRQ4Wm2X9u03Wvfg==
X-Received: by 2002:a5d:64c6:: with SMTP id f6mr1468844wri.711.1640260741252; 
 Thu, 23 Dec 2021 03:59:01 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id j13sm8693839wmq.11.2021.12.23.03.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:59:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/23] dma: Let dma_buf_rw() propagate MemTxResult
Date: Thu, 23 Dec 2021 12:55:44 +0100
Message-Id: <20211223115554.3155328-14-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211223115554.3155328-1-philmd@redhat.com>
References: <20211223115554.3155328-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
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


