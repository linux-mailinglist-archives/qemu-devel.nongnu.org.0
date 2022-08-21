Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8323C59B3C6
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Aug 2022 14:35:47 +0200 (CEST)
Received: from localhost ([::1]:34848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oPkB8-00023H-44
	for lists+qemu-devel@lfdr.de; Sun, 21 Aug 2022 08:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zheyuma97@gmail.com>)
 id 1oPk5W-0007GL-As
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 08:29:58 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zheyuma97@gmail.com>)
 id 1oPk5U-0008L7-Mq
 for qemu-devel@nongnu.org; Sun, 21 Aug 2022 08:29:58 -0400
Received: by mail-pl1-x62b.google.com with SMTP id v23so2420342plo.9
 for <qemu-devel@nongnu.org>; Sun, 21 Aug 2022 05:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=qQjSa45CAi1rDOX1xs/rbbydhZ1R94nL2HiC4WOgLLw=;
 b=Yp8lEbI4wdZ3VLxQR+9JuiZTZ1fPX0/StTEFroOSGHdQ/JtvstH5hDlMuAmqJdo7+H
 wn1SAzGmBjwlSQfRLzkcuKQwO5fJHIRrJpJWwQI1mS6P+8MOYz4zZzAqV7PpBwQme+9b
 dp+fWWGtgJPx3eWAGjSBfruAo89cJ4tIWSmkBZ7D9l0s97ooOWJ2kocadNaKs2r9Rp1z
 g/jnVJweqs7Lo+H0nG0o3oZWY1XzfCMhNa6GD2CgaPjBEHny4W3IZrlgqzSEkVAE0gon
 VZ5ff69bT8vreaSPg8a/gnD/IJFlgvWGFyNPZVJEPcY6vhVTsVjjmuRuwguvGnzT/ROF
 wBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=qQjSa45CAi1rDOX1xs/rbbydhZ1R94nL2HiC4WOgLLw=;
 b=19JRMGBFH27WQ3xQydpkNfxaXWTshkE15Q5Q4zYvwYiuxVeLhsNVGcYlHCNkqfDf15
 79AYK3yDUtpStBQ3m+zHZXsHe4lOvmfK3CbxNNS3QTUUxtuym0NfDiebplLtgpbskQby
 4CZgm2aGNE9qvONPIaRbQgThhcnSLpWJQ/0QYoZyMeOf6JuWgzv7u9u93D9U3Oy/YEft
 YmrXN+B3wBFLwTUMBcAXUD/1Me64zD8JJMoBfQq9506E9+B4d7+0tmOkA/TTwTXzM86t
 G336R2XYqzDM7gqrdilfLIvEwRKIJEKvstBVmKk34yrFGU6qOOvex7sbbWJ3KU8aMIvy
 AoUg==
X-Gm-Message-State: ACgBeo3kmxa5iB9W7vQaeUzh6rmu6tV0BOjapd6mSM2reNMQ1CRvS5SM
 l5RTuKmTVfgrqOEAdhBRJA==
X-Google-Smtp-Source: AA6agR4r67Edwf7UF1YNJbLq5x/J3Y13vh7DJPdJjNoiqU170DTpqFOr/tLIx44aXx3IA+lo3prWDQ==
X-Received: by 2002:a17:90b:4f8e:b0:1f4:ed30:d286 with SMTP id
 qe14-20020a17090b4f8e00b001f4ed30d286mr18470845pjb.66.1661084994803; 
 Sun, 21 Aug 2022 05:29:54 -0700 (PDT)
Received: from localhost.localdomain ([144.202.91.207])
 by smtp.gmail.com with ESMTPSA id
 c6-20020aa79526000000b005365aee486bsm2473636pfp.192.2022.08.21.05.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Aug 2022 05:29:54 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: svens@stackframe.org,
	jasowang@redhat.com
Cc: qemu-devel@nongnu.org,
	Zheyu Ma <zheyuma97@gmail.com>
Subject: [PATCH] net: tulip: Restrict DMA engine to memories
Date: Sun, 21 Aug 2022 20:29:43 +0800
Message-Id: <20220821122943.835058-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=zheyuma97@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The DMA engine is started by I/O access and then itself accesses the
I/O registers, triggering a reentrancy bug.

The following log can reveal it:
==5637==ERROR: AddressSanitizer: stack-overflow
    #0 0x5595435f6078 in tulip_xmit_list_update qemu/hw/net/tulip.c:673
    #1 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13
    #2 0x559544637f86 in memory_region_write_accessor qemu/softmmu/memory.c:492:5
    #3 0x5595446379fa in access_with_adjusted_size qemu/softmmu/memory.c:554:18
    #4 0x5595446372fa in memory_region_dispatch_write qemu/softmmu/memory.c
    #5 0x55954468b74c in flatview_write_continue qemu/softmmu/physmem.c:2825:23
    #6 0x559544683662 in flatview_write qemu/softmmu/physmem.c:2867:12
    #7 0x5595446833f3 in address_space_write qemu/softmmu/physmem.c:2963:18
    #8 0x5595435fb082 in dma_memory_rw_relaxed /home/mzy/truman/third_party/qemu/include/sysemu/dma.h:87:12
    #9 0x5595435fb082 in dma_memory_rw /home/mzy/truman/third_party/qemu/include/sysemu/dma.h:130:12
    #10 0x5595435fb082 in dma_memory_write /home/mzy/truman/third_party/qemu/include/sysemu/dma.h:171:12
    #11 0x5595435fb082 in stl_le_dma /home/mzy/truman/third_party/qemu/include/sysemu/dma.h:272:1
    #12 0x5595435fb082 in stl_le_pci_dma /home/mzy/truman/third_party/qemu/include/hw/pci/pci.h:910:1
    #13 0x5595435fb082 in tulip_desc_write qemu/hw/net/tulip.c:101:9
    #14 0x5595435f7e3d in tulip_xmit_list_update qemu/hw/net/tulip.c:706:9
    #15 0x5595435f204a in tulip_write qemu/hw/net/tulip.c:805:13

Fix this bug by restricting the DMA engine to memories regions.

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 hw/net/tulip.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 097e905bec..b9e42c322a 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -70,7 +70,7 @@ static const VMStateDescription vmstate_pci_tulip = {
 static void tulip_desc_read(TULIPState *s, hwaddr p,
         struct tulip_descriptor *desc)
 {
-    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+    const MemTxAttrs attrs = { .memory = true };
 
     if (s->csr[0] & CSR0_DBO) {
         ldl_be_pci_dma(&s->dev, p, &desc->status, attrs);
@@ -88,7 +88,7 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
 static void tulip_desc_write(TULIPState *s, hwaddr p,
         struct tulip_descriptor *desc)
 {
-    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+    const MemTxAttrs attrs = { .memory = true };
 
     if (s->csr[0] & CSR0_DBO) {
         stl_be_pci_dma(&s->dev, p, desc->status, attrs);
-- 
2.25.1


