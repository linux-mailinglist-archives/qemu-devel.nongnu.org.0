Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD36D47723A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 13:51:20 +0100 (CET)
Received: from localhost ([::1]:50168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqEB-000261-OL
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 07:51:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxpzo-0001Wg-J6
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxpzm-0004Sg-4x
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639658185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q3jfzfAWXoz2z5mwoL5Qi09iCpO4M7rxflJUJE8g74U=;
 b=IoHX9FQdSaxtVwnlL1NdVq0EaVmM7PrkyFxkCfMUesVf/TmvGXdbC/FyXEnCrtbMMErz+M
 5vO/+cVcdUFsyOkZa4Aw2pBS+QyZswdWHV3Ff2Y1oHm1sUJf2ra2XNldlQjPHLZzhZeQP3
 cX15FR9JfPHuLAVyhsNtrxWUCoekr+Y=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-SLdR4wIVM-GwIWVYWLP_9w-1; Thu, 16 Dec 2021 07:36:24 -0500
X-MC-Unique: SLdR4wIVM-GwIWVYWLP_9w-1
Received: by mail-wr1-f72.google.com with SMTP id
 l13-20020adfbd8d000000b001a23a990dbfso756006wrh.5
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:36:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q3jfzfAWXoz2z5mwoL5Qi09iCpO4M7rxflJUJE8g74U=;
 b=CVjD4Ktq1Jqdo5Gz7gfJV19hhpen0+UWTdHP0HN4H8d7a5VIodZh4OdGPb4a6P+YLP
 ya+SN88/36hloT2BdhJZK71qCd6v1RavOfAYsKZ+SLZ2G5UZrfisVsuVeTDKtwr8NaUS
 xmEDf0HaymNkARFw6IS83eFJEne2UQGmawXVgjghyC4mz/d0BBr1k5cNHzcRonIdPmxJ
 cLsg3+mB+y85hsjvDGs/wnVDsKo9s10/hc7Ik/YNAzYZDqYDZmI82UdYnof8GuU+mmmD
 sUzO7QeTeOYzRsCMrafPJDXzh+MuxG1ElO80HM+yT+K5+fLOwxrUCIjISOYAPrNevt09
 ELgw==
X-Gm-Message-State: AOAM5315Omc8AdzAlRQoBj4lhYTn63yM5VUmb7+PzhRWUhameN0AtUEJ
 bLzru5JqzAugRQT6bYo40tedGC59GNFKQEud7maQ3v4jIpgp98sN44qjt49lJtaBqSBWsINVa4u
 KwktF/0y5YR7JgTf6n0VGWcUUCRclu22XpNcLTOgdjnIqS/xXXFIr3I03x+Atz5Wq
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr8738409wrz.286.1639658182941; 
 Thu, 16 Dec 2021 04:36:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrbMToH/xA0DjntMIzdR8zMyWWz2Dh4GXWc9kRQZGRBQmf8ZHJ3aIiX0bVgHUkgBOu0tWY5w==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr8738374wrz.286.1639658182687; 
 Thu, 16 Dec 2021 04:36:22 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id y11sm5960415wry.70.2021.12.16.04.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 04:36:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] dma: Let pci_dma_rw() take MemTxAttrs argument
Date: Thu, 16 Dec 2021 13:35:53 +0100
Message-Id: <20211216123558.799425-4-philmd@redhat.com>
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

Let devices specify transaction attributes when calling pci_dma_rw().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h | 10 ++++++----
 hw/audio/intel-hda.c |  3 ++-
 hw/scsi/esp-pci.c    |  2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 1acefc2a4c3..a751ab5a75d 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -806,10 +806,10 @@ static inline AddressSpace *pci_get_address_space(PCIDevice *dev)
  */
 static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
                                      void *buf, dma_addr_t len,
-                                     DMADirection dir)
+                                     DMADirection dir, MemTxAttrs attrs)
 {
     return dma_memory_rw(pci_get_address_space(dev), addr, buf, len,
-                         dir, MEMTXATTRS_UNSPECIFIED);
+                         dir, attrs);
 }
 
 /**
@@ -827,7 +827,8 @@ static inline MemTxResult pci_dma_rw(PCIDevice *dev, dma_addr_t addr,
 static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
                                        void *buf, dma_addr_t len)
 {
-    return pci_dma_rw(dev, addr, buf, len, DMA_DIRECTION_TO_DEVICE);
+    return pci_dma_rw(dev, addr, buf, len,
+                      DMA_DIRECTION_TO_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
 /**
@@ -845,7 +846,8 @@ static inline MemTxResult pci_dma_read(PCIDevice *dev, dma_addr_t addr,
 static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
                                         const void *buf, dma_addr_t len)
 {
-    return pci_dma_rw(dev, addr, (void *) buf, len, DMA_DIRECTION_FROM_DEVICE);
+    return pci_dma_rw(dev, addr, (void *) buf, len,
+                      DMA_DIRECTION_FROM_DEVICE, MEMTXATTRS_UNSPECIFIED);
 }
 
 #define PCI_DMA_DEFINE_LDST(_l, _s, _bits)                              \
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index 8ce9df64e3e..fb3d34a4a0c 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -427,7 +427,8 @@ static bool intel_hda_xfer(HDACodecDevice *dev, uint32_t stnr, bool output,
         dprint(d, 3, "dma: entry %d, pos %d/%d, copy %d\n",
                st->be, st->bp, st->bpl[st->be].len, copy);
 
-        pci_dma_rw(&d->pci, st->bpl[st->be].addr + st->bp, buf, copy, !output);
+        pci_dma_rw(&d->pci, st->bpl[st->be].addr + st->bp, buf, copy, !output,
+                   MEMTXATTRS_UNSPECIFIED);
         st->lpib += copy;
         st->bp += copy;
         buf += copy;
diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index dac054aeed4..1792f84cea6 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -280,7 +280,7 @@ static void esp_pci_dma_memory_rw(PCIESPState *pci, uint8_t *buf, int len,
         len = pci->dma_regs[DMA_WBC];
     }
 
-    pci_dma_rw(PCI_DEVICE(pci), addr, buf, len, dir);
+    pci_dma_rw(PCI_DEVICE(pci), addr, buf, len, dir, MEMTXATTRS_UNSPECIFIED);
 
     /* update status registers */
     pci->dma_regs[DMA_WBC] -= len;
-- 
2.33.1


