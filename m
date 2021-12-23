Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4DF47E31E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:20:12 +0100 (CET)
Received: from localhost ([::1]:48912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0N4t-0002J4-Qz
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:20:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0MiA-00076Q-KP
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:56:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mi7-0000cs-TZ
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 06:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jlgo6xDtAAtMm1rT3FU1HVvEVWIuXmrKi5ItJcLts/Y=;
 b=dAhNipthHWSZ4LSM2c+V2iWSmsJ1ASFjXgfgmCtHtavIj2/BFm/NkpQZiDhkFVYEL7Fk56
 jU0Yg/yyVYMKLg2JmZ8r7hKXsXusdQ9XyXfNqFm6M+VHZBfKCxrvLCs5/Ftoe2XD/z9sBF
 Ra1qG4PsazvBpfn0GkYQ0fHq0N5VL4c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-FoUuTvPJP0aKwKe3Qdj7-Q-1; Thu, 23 Dec 2021 06:56:38 -0500
X-MC-Unique: FoUuTvPJP0aKwKe3Qdj7-Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 e19-20020a05600c4e5300b003458be97976so1855581wmq.7
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 03:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlgo6xDtAAtMm1rT3FU1HVvEVWIuXmrKi5ItJcLts/Y=;
 b=vcxbw6yktJ4683INKXivAZi0y57qvUb2bZA3UhVW0eWr1Z0FJfstUDezQ5lTKkYYMC
 V5/JhAQ+N1zQs5IwGLqSqiddVa9+mLlY0WsnFqY6447QmLGaBt4MmX40sZCoiIp4/PMy
 Rc5785+nQk3GAtdokSTDTIIBKMlE3wn6MoLwQBQBNzPguCp4Ooeo0yY1FGmv7jrlnCGS
 QP2bcqz6+1F1B/ukhP+iEv21d2u2H5HnGMjGag2hDF8JgwpAE7gfftYbs11dukVAxS/M
 cIaB1BXwmib1r7xQRh/j2SpZKzNYCRBVBbthnvyrqqhrKRg7h+pvBSAxe+/iGfQeQUCx
 ZAiA==
X-Gm-Message-State: AOAM533ZpJjq6nBorBSq1BpKONpmw8Q0br9M3el/B9BoLAgJJA/55HKT
 gdaYWIseW0/D7D6GqRCJiVmPShzyQaGpDKuxirfqvSxaH0tKHxoDc4e6g80DJu00maWJqJwdS+Q
 l94uq8+30hUm9Qd6kYbWsmZsGx8kl4iTzGFizbAT9lwlkJFWOBNO9Ihuns1MeYEYu
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr1594858wry.460.1640260596873; 
 Thu, 23 Dec 2021 03:56:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+Ey7SUV9I0TKAXOWeswCAbccTjbhckL2lEPtokKvCWMagMH2a6d15O+G84UjKapKM+9469A==
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr1594799wry.460.1640260596463; 
 Thu, 23 Dec 2021 03:56:36 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id j14sm4775556wrn.88.2021.12.23.03.56.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 03:56:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/23] dma: Let dma_memory_set() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:33 +0100
Message-Id: <20211223115554.3155328-3-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
 Sven Schnelle <svens@stackframe.org>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Li Qiang <liq3ea@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling
dma_memory_set().

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210702092439.989969-3-philmd@redhat.com>
---
 include/hw/ppc/spapr_vio.h | 3 ++-
 include/sysemu/dma.h       | 3 ++-
 hw/nvram/fw_cfg.c          | 3 ++-
 softmmu/dma-helpers.c      | 5 ++---
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/ppc/spapr_vio.h b/include/hw/ppc/spapr_vio.h
index 4c45f1579fa..c90e74a67dd 100644
--- a/include/hw/ppc/spapr_vio.h
+++ b/include/hw/ppc/spapr_vio.h
@@ -111,7 +111,8 @@ static inline int spapr_vio_dma_write(SpaprVioDevice *dev, uint64_t taddr,
 static inline int spapr_vio_dma_set(SpaprVioDevice *dev, uint64_t taddr,
                                     uint8_t c, uint32_t size)
 {
-    return (dma_memory_set(&dev->as, taddr, c, size) != 0) ?
+    return (dma_memory_set(&dev->as, taddr,
+                           c, size, MEMTXATTRS_UNSPECIFIED) != 0) ?
         H_DEST_PARM : H_SUCCESS;
 }
 
diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
index 296f3b57c9c..d23516f020a 100644
--- a/include/sysemu/dma.h
+++ b/include/sysemu/dma.h
@@ -175,9 +175,10 @@ static inline MemTxResult dma_memory_write(AddressSpace *as, dma_addr_t addr,
  * @addr: address within that address space
  * @c: constant byte to fill the memory
  * @len: the number of bytes to fill with the constant byte
+ * @attrs: memory transaction attributes
  */
 MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
-                           uint8_t c, dma_addr_t len);
+                           uint8_t c, dma_addr_t len, MemTxAttrs attrs);
 
 /**
  * address_space_map: Map a physical memory region into a host virtual address.
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index c06b30de112..f7803fe3c30 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -399,7 +399,8 @@ static void fw_cfg_dma_transfer(FWCfgState *s)
              * tested before.
              */
             if (read) {
-                if (dma_memory_set(s->dma_as, dma.address, 0, len)) {
+                if (dma_memory_set(s->dma_as, dma.address, 0, len,
+                                   MEMTXATTRS_UNSPECIFIED)) {
                     dma.control |= FW_CFG_DMA_CTL_ERROR;
                 }
             }
diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
index 7d766a5e89a..1f07217ad4a 100644
--- a/softmmu/dma-helpers.c
+++ b/softmmu/dma-helpers.c
@@ -19,7 +19,7 @@
 /* #define DEBUG_IOMMU */
 
 MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
-                           uint8_t c, dma_addr_t len)
+                           uint8_t c, dma_addr_t len, MemTxAttrs attrs)
 {
     dma_barrier(as, DMA_DIRECTION_FROM_DEVICE);
 
@@ -31,8 +31,7 @@ MemTxResult dma_memory_set(AddressSpace *as, dma_addr_t addr,
     memset(fillbuf, c, FILLBUF_SIZE);
     while (len > 0) {
         l = len < FILLBUF_SIZE ? len : FILLBUF_SIZE;
-        error |= address_space_write(as, addr, MEMTXATTRS_UNSPECIFIED,
-                                     fillbuf, l);
+        error |= address_space_write(as, addr, attrs, fillbuf, l);
         len -= l;
         addr += l;
     }
-- 
2.33.1


