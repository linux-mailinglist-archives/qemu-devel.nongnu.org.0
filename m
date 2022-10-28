Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A425B611AC4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 21:19:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUrB-0001h2-Cg; Fri, 28 Oct 2022 15:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUr9-0001gK-Ml
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:27 -0400
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1ooUr7-00031p-VN
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 15:17:27 -0400
X-IronPort-RemoteIP: 209.85.166.72
X-IronPort-MID: 234246958
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gqyh9q2HqAN1WcGkb/bD5WJzkn2cJEfYwER7XKvMYLTBsI5bpzdTz
 2ZJDDqBPqnYYTGjKYxxPo63pE0C657Sz9NmTgVlqSg9HnlHl5H5CIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg74s9JIGjhMsfja8Ek/5K+aVA4w5TTSW9ga5DcyqFFIVPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuAon/Bovv8+lrKWhRiroz6ZGBiuVIPM0SWuSWukwRpukoN2FvwXm8M49mBt4gZJ
 NygLvVcQy9wVkHHsL11vxW1j0iSlECJkVPKCSHXjCCd86HJW2fNgMV+Hn0kBNdCxPYvJURC/
 vMkCT9YO3hvh8ruqF66Yuxlh8BmLc6yeY1A4DdvyjbWCftgSpfGK0nIzYUAjXFg24YXQ6iYO
 JBxhTlHNXwsZzVGPkcRBIgWlvrui3XiG9FdgAjO+fBrvTmOnGSd1pDfNuDLf86gff8NoX/Jm
 3jD5US6D0wVYYn3JT2ttyjEavX0tTr2XZ9XGLCm+/pChlqVyWoOThoMWjOGTeKRj0e/X5deL
 BVR9HV066c180OvQ5/2WBjQTGO4gyPwkuF4S4USgDxhAIKIi+pFLgDolgJ8VeE=
IronPort-HdrOrdr: A9a23:lS81N699174/9W5qNu5uk+DiI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7FZniFhILCFvAA0WKN+UyGJwTOssJbyK
 d8Y+xfJbTLfD5HZB/BkWyF+gAbsb26zJw=
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Oct 2022 15:17:25 -0400
Received: by mail-io1-f72.google.com with SMTP id
 y10-20020a5d914a000000b00688fa7b2252so4976441ioq.0
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 12:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jrn1MlV7oDqgvI2AhpwJLKmem1HXG/IdQlij5K5LJU0=;
 b=LO8iEZHtP1b9chiKmYu+aYJXeMNXcFWp7oNFeDKvlF0Ar8JbqyWorbHEP5eIpOem6Y
 jhBvnbOfzY84F3LD1r1rGxcO05tg6FpsnNj6eXX4cUCn+CTQJXJHt7RonhV0Mf1b1L4O
 lV2yXK50eQ84JQZRRTQB19Eb/JsYAAzFFIGF6efPLg10iZyS85eyMVR1FV1ePPAkp/Qs
 l46fG0DUfbDNo8szxJaNptV4H7esvgNS+1ElY0D+kLDKve65WcCvhrsh13JDxIY49oMo
 iwxxNa7DaWaS5CsyBs27G3JREq3UowWik6qAscctymNokQMVZkIUiFsbzBbXjUzeZrn8
 n90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jrn1MlV7oDqgvI2AhpwJLKmem1HXG/IdQlij5K5LJU0=;
 b=3v8SyQaOiFWkVLf/fu0HJHKIC/miBEFYoPyXEUusCX1tUjoXZ03ZDxC2Bo2XERFBHg
 u5oxxkbUmxOhsec8o+Dqwbt3DkYkz4eCcnD2jU5ouG3B3fs37mFCnv64AFTOK0Udp0sD
 omtHtCSLVub4i76p0zp6DHjHLVWK/crZ/1G/jBUD10q2Bq3SqvCf2UDHXivBno9/nJ2m
 vJV/YZ1LUp0dE7b01L5+By5DInv3cUJ2ggZCBaducpusACRE+/Cr4RqU5ozvgyLfwcAx
 9SwBw2yuBdNDIvntyZOus/2466m0dRKNQl4q3xt66zGJ7WKPuEwHvtfrUo9HRhnRvP9W
 cPSQ==
X-Gm-Message-State: ACrzQf2EAXUjZUdnDo89H0589WPRZPeHPKkbuoOu8M1kDU8Q8RTUkhVJ
 bad1CO7o4k76qXnurLDl5x9vzi86JQBBF7QraceQvP+C6e8VlrM77i5MdD9j5h9f2FigmKfGi1M
 ZwXbsFy9afoyJlcbSkx1QfwcjBYipOg==
X-Received: by 2002:a05:6602:1606:b0:6bc:e979:17fe with SMTP id
 x6-20020a056602160600b006bce97917femr563439iow.114.1666984644713; 
 Fri, 28 Oct 2022 12:17:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4jxb3bs7ljOGEUrge6j48TR5UxTsQ1a1+/N95Gs0UIk/4bZYn4hU5nmwclyS3jpAXDGSJ5QQ==
X-Received: by 2002:a05:6602:1606:b0:6bc:e979:17fe with SMTP id
 x6-20020a056602160600b006bce97917femr563410iow.114.1666984644485; 
 Fri, 28 Oct 2022 12:17:24 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a056e021c0500b002fff117027dsm1878505ilh.13.2022.10.28.12.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 12:17:24 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bin Meng <bin.meng@windriver.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>
Subject: [PATCH v3 6/7] xhci: switch to guarded DMA accesses
Date: Fri, 28 Oct 2022 15:16:47 -0400
Message-Id: <20221028191648.964076-7-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20221028191648.964076-1-alxndr@bu.edu>
References: <20221028191648.964076-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 hw/usb/hcd-xhci.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/usb/hcd-xhci.c b/hw/usb/hcd-xhci.c
index 8299f35e66..2621dde7ea 100644
--- a/hw/usb/hcd-xhci.c
+++ b/hw/usb/hcd-xhci.c
@@ -494,7 +494,7 @@ static inline void xhci_dma_read_u32s(XHCIState *xhci, dma_addr_t addr,
 
     assert((len % sizeof(uint32_t)) == 0);
 
-    if (dma_memory_read(xhci->as, addr, buf, len,
+    if (dma_memory_read_guarded(DEVICE(xhci), xhci->as, addr, buf, len,
                         MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
                       __func__);
@@ -521,7 +521,7 @@ static inline void xhci_dma_write_u32s(XHCIState *xhci, dma_addr_t addr,
     for (i = 0; i < n; i++) {
         tmp[i] = cpu_to_le32(buf[i]);
     }
-    if (dma_memory_write(xhci->as, addr, tmp, len,
+    if (dma_memory_write_guarded(DEVICE(xhci), xhci->as, addr, tmp, len,
                          MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
                       __func__);
@@ -632,8 +632,8 @@ static void xhci_write_event(XHCIState *xhci, XHCIEvent *event, int v)
                                ev_trb.status, ev_trb.control);
 
     addr = intr->er_start + TRB_SIZE*intr->er_ep_idx;
-    if (dma_memory_write(xhci->as, addr, &ev_trb, TRB_SIZE,
-                         MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+    if (dma_memory_write_guarded(DEVICE(xhci), xhci->as, addr, &ev_trb,
+                TRB_SIZE, MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
                       __func__);
         xhci_die(xhci);
@@ -698,8 +698,8 @@ static TRBType xhci_ring_fetch(XHCIState *xhci, XHCIRing *ring, XHCITRB *trb,
 
     while (1) {
         TRBType type;
-        if (dma_memory_read(xhci->as, ring->dequeue, trb, TRB_SIZE,
-                            MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+        if (dma_memory_read_guarded(DEVICE(xhci), xhci->as, ring->dequeue, trb,
+                    TRB_SIZE, MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
                           __func__);
             return 0;
@@ -750,8 +750,8 @@ static int xhci_ring_chain_length(XHCIState *xhci, const XHCIRing *ring)
 
     do {
         TRBType type;
-        if (dma_memory_read(xhci->as, dequeue, &trb, TRB_SIZE,
-                        MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+        if (dma_memory_read_guarded(DEVICE(xhci), xhci->as, dequeue, &trb,
+                    TRB_SIZE, MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
                           __func__);
             return -1;
@@ -820,8 +820,8 @@ static void xhci_er_reset(XHCIState *xhci, int v)
         xhci_die(xhci);
         return;
     }
-    if (dma_memory_read(xhci->as, erstba, &seg, sizeof(seg),
-                    MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+    if (dma_memory_read_guarded(DEVICE(xhci), xhci->as, erstba, &seg,
+                sizeof(seg), MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory access failed!\n",
                       __func__);
         xhci_die(xhci);
@@ -2445,8 +2445,8 @@ static TRBCCode xhci_get_port_bandwidth(XHCIState *xhci, uint64_t pctx)
     /* TODO: actually implement real values here */
     bw_ctx[0] = 0;
     memset(&bw_ctx[1], 80, xhci->numports); /* 80% */
-    if (dma_memory_write(xhci->as, ctx, bw_ctx, sizeof(bw_ctx),
-                     MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
+    if (dma_memory_write_guarded(DEVICE(xhci), xhci->as, ctx, bw_ctx,
+                sizeof(bw_ctx), MEMTXATTRS_UNSPECIFIED) != MEMTX_OK) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: DMA memory write failed!\n",
                       __func__);
         return CC_TRB_ERROR;
-- 
2.27.0


