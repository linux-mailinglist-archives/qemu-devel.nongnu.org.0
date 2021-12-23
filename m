Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A47647E31D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:20:04 +0100 (CET)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0N4l-0001wj-CB
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:20:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mjn-00014f-0E
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:58:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mjk-0000s7-6c
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ClHQDmTSxQ/cumSM1yZjo1Fs51nTIVwwLPVpnYX4XM=;
 b=LDGu42JJjTXk95e2zEEvfPIluhOWTz/f2VvPwUdcsPEKGC9KrxrNMR5xfwzHrnViXFitgM
 huX39skq0kQw+ytnIMUIyhpZ9KBGTepcvrWFb/lM7WW1K7HLZXVUUmKNK3hesjWGtr8vV8
 iHMOYV/wMeekBCcYkEb8yTbAgnGqTBw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-421-n5u9VM9gP9SCM9ml-CJArg-1; Thu, 23 Dec 2021 06:58:18 -0500
X-MC-Unique: n5u9VM9gP9SCM9ml-CJArg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adf9b8d000000b001a2aa837f8dso1224768wrc.3
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ClHQDmTSxQ/cumSM1yZjo1Fs51nTIVwwLPVpnYX4XM=;
 b=lD0bqq8N1enGe8DGTwGJuP7CasOd+xY2A1HV0z5XlxqZxICoZvfzbjgdjUNQGTggGt
 BVh5f7RrwhezID9b432vsRj/aXQNl2CPxYsDX9qgRTlxh71bNmw2KQSWsb0N4B6jwLx8
 LiOWQ5/uwDg/E6HGMthBpzUH+K+RtmkPxnGsSwwc5cuZixF2mtP51R7qDBAi68n04PWI
 Oh5EHhz28DkYkCg1LQpywD6w61LWH/u+kIBAcV3i43kN8GWoRipOm9a1ZigbflSHs9O3
 dK/qKYb6RrHosZCuM6wpOVzUXPuYN2qwXLGz3hieKCUoawWVyqPq3ZOCj+jX6TprTtEs
 RFqQ==
X-Gm-Message-State: AOAM5325P2u033Io/c70bXDGsktt7VOM6tzRpG9wo4rrdOVNZ6IOdjL4
 VntH3CkTtrvywy9SX0dV7Jn9oqcc4gXoJxlTRfSsxwVdT6abY6h/FB5ZuZopY3jpUnI9vk72ax+
 YMAIL7daYqZjv9FgNNhqCKJ1ZwOjuT55nPeF+ZF1/mQYXYZbJwg7+otPHahx7hyem
X-Received: by 2002:a05:6000:1b03:: with SMTP id
 f3mr1586601wrz.58.1640260697146; 
 Thu, 23 Dec 2021 03:58:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6LSqx1lAlM4+O12ZG1CQBNVmSMJr77+J1lVAQwAJwQDWGU/cO4bMwt8j/YsG4wFiR5IFe5A==
X-Received: by 2002:a05:6000:1b03:: with SMTP id
 f3mr1586546wrz.58.1640260696852; 
 Thu, 23 Dec 2021 03:58:16 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id k31sm4610764wms.21.2021.12.23.03.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:58:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/23] dma: Let pci_dma_rw() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:40 +0100
Message-Id: <20211223115554.3155328-10-philmd@redhat.com>
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

Let devices specify transaction attributes when calling pci_dma_rw().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
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


