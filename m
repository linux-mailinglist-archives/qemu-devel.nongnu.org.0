Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8CE477240
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:53:47 +0100 (CET)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqGY-000716-3T
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:53:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxpzt-0001dQ-MT
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxpzr-0004VC-DZ
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639658189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nTVrnVlKHO/lU2wTxpBZUhczYmkS2pwPKBwt8gEo7s=;
 b=FEhEm+tWMeKZG9srcFSoTK0Q04Rgga0YlXFjNO70kQwuwnv/YKC+uFYRXX73i/RyruP4Eh
 sT8t8W1cCkjqoh+sgSBC0R7H/lj4NvkXf6ZQdcaUFJzeMpef8U1P38qn6caOjDuI+B7gMm
 T9Jrwhz5vpsuhOEsuSkyEM5MKmHtHhE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-s2TcWbjFMkq6mGvcEyQeXg-1; Thu, 16 Dec 2021 07:36:29 -0500
X-MC-Unique: s2TcWbjFMkq6mGvcEyQeXg-1
Received: by mail-wr1-f71.google.com with SMTP id
 x20-20020adfbb54000000b001a0d044e20fso2606492wrg.11
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7nTVrnVlKHO/lU2wTxpBZUhczYmkS2pwPKBwt8gEo7s=;
 b=MWoRfNr9YNYDDTjtQ5WMI3EIxu/m49ycdEjlofCP5rJWjVLls7GMh6u7ymUmZViHZO
 4GDww5m9uvRnHYKAtQTiHBj8h8L3hM4QEdcJt2ih6pI9bfgqRWEB0T6vAlgaHx7m3zhI
 kYHKUtlJMOhDUniY2ti2BU43Vs0rHmQ/4kjfkM/l8VTpmXr07AVIT4iaqHO7NR8Jy/vQ
 wztBB9tnJ89e+rjG9jB8KxZNTNOLWXuCGVUJUCAmqbPoDbWnTNAk2sl35fX1cVwtOWwk
 wg16qvYcrbiQ9VngvSAq9MUfKuTP2IMMATgpfFv3789IIkHvRHnun2EuV3/2iRKOdWCP
 pP5w==
X-Gm-Message-State: AOAM533xidfeMJxfypdTGzqoF1TzR0WvLZv3FUsKXTX9m79u9JUXAhZb
 veZwECAl2kPNkQ+cRPzo1RKIX+ARXf13aTAsg65+iymoyFS8RN3OMMLuNBdSY3arnIgjvCaOFM1
 TDu1Xbg6E8gdQApqUAEBXW3PzGtkE+CjbVuCx7K00NLV/6YIgFUcnsTeU2X6tdhJ4
X-Received: by 2002:a5d:540f:: with SMTP id g15mr6091262wrv.126.1639658187568; 
 Thu, 16 Dec 2021 04:36:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPK6hAJ5tfrBHQrpN0z9sWZpZCuwATKNaN0+Xfmz8qbJ7PecPnnNNPda1KDyr7K+lVOUuAnA==
X-Received: by 2002:a5d:540f:: with SMTP id g15mr6091229wrv.126.1639658187372; 
 Thu, 16 Dec 2021 04:36:27 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id u13sm8723859wmq.14.2021.12.16.04.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:36:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/8] dma: Let dma_buf_rw() take MemTxAttrs argument
Date: Thu, 16 Dec 2021 13:35:54 +0100
Message-Id: <20211216123558.799425-5-philmd@redhat.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Let devices specify transaction attributes when calling dma_buf_rw().

Keep the default MEMTXATTRS_UNSPECIFIED in the 2 callers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 softmmu/dma-helpers.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7f37548394e..fa81d2b386c 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -295,7 +295,7 @@ BlockAIOCB *dma_blk_write(BlockBackend *blk,
 
 
 static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
-                           DMADirection dir)
+                           DMADirection dir, MemTxAttrs attrs)
 {
     uint8_t *ptr = buf;
     uint64_t resid;
@@ -307,8 +307,7 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
     while (len > 0) {
         ScatterGatherEntry entry = sg->sg[sg_cur_index++];
         int32_t xfer = MIN(len, entry.len);
-        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir,
-                      MEMTXATTRS_UNSPECIFIED);
+        dma_memory_rw(sg->as, entry.base, ptr, xfer, dir, attrs);
         ptr += xfer;
         len -= xfer;
         resid -= xfer;
@@ -319,12 +318,14 @@ static uint64_t dma_buf_rw(void *buf, int32_t len, QEMUSGList *sg,
 
 uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_FROM_DEVICE,
+                      MEMTXATTRS_UNSPECIFIED);
 }
 
 uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg)
 {
-    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE);
+    return dma_buf_rw(ptr, len, sg, DMA_DIRECTION_TO_DEVICE,
+                      MEMTXATTRS_UNSPECIFIED);
 }
 
 void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,
-- 
2.33.1


