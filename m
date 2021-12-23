Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CB247E33E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 13:30:11 +0100 (CET)
Received: from localhost ([::1]:41832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0NEY-000055-Fq
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 07:30:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mlz-0004vr-GI
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:00:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n0Mlx-0001R4-9k
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 07:00:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640260835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9pReE1QJ5vxBRMRDloIuGc8yeeo3MgjkQ39UWuGBPOY=;
 b=RBwwbjlhFo+Q8shguLRHnCtBBxMHErq1LNDudc98l91R8K4EtCzDlzg618Cj8sQwJep2YC
 GYVJoHypiA5ShOC2ytSiKGbDlXu1Wd+iFKlxhK1SzSzPwe1gEp8wbP54nFtdmrX98n2nMe
 etEhacYE2HAFiw3tfGiG6vCNsCYC1r4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-341-94xg_yp8OjeJA1B53SktcA-1; Thu, 23 Dec 2021 07:00:34 -0500
X-MC-Unique: 94xg_yp8OjeJA1B53SktcA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j207-20020a1c23d8000000b00345b181302eso4563338wmj.1
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 04:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9pReE1QJ5vxBRMRDloIuGc8yeeo3MgjkQ39UWuGBPOY=;
 b=w9zNVKeQ89AbJbUqdRRnmKVpkgqIaiiiFafbgUkEXH0fCPZXX3BBwAOeYMiKKi1esU
 9U2tRXvI7HKIWG4G++VEJZRYXG04yChn0qOTgl+MOBG7xXpc5vU57TaxDQburJ9y+UbN
 rwXyiY3SVWw16iZ2m5cgY4ZVNByZA+4Rq9Hj1+TiziMdVkMxa4PlycAfLxazCvrMPOKT
 /0wlfpTnSojYw9JqexnkKGaISpOitSGMqtmAOWRUTrRYfXsusI5+E8TkCbiMRf/jEr/a
 CcTWZkv3p7jSXPPxE1Z2TKveilxnHb6J18A/rRakqNDTsguSX034iD9isDXW93Lmn2Vj
 jNIA==
X-Gm-Message-State: AOAM530M5nQTB92spv4QROqu+bfukH/Uymllg4On/wn7XvXkOyOYU+fF
 wV56PP3wEN9ORh25s5y2Ue3vfChA77SxU6634X9KcAM77Fasd6G8n79xR1TBVY8u/cn6+O9WODn
 dqMZjKzi6bZhIL9UHUkLC1ombvJ7nDaNqk/4zfoVH+2r2mSjDZQnbSi9CZrw/O6Sk
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr1584960wrg.31.1640260832954; 
 Thu, 23 Dec 2021 04:00:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/DQ1hWR9qyFgUiRX1uFPfeDojVvudgj5ZvN6Va5wfFpZgZ/IESAYpz2iKee/YDWNEagse0A==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr1584902wrg.31.1640260832570; 
 Thu, 23 Dec 2021 04:00:32 -0800 (PST)
Received: from x1w.. (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id w6sm4601783wrs.52.2021.12.23.04.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Dec 2021 04:00:32 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/23] pci: Let st*_pci_dma() take MemTxAttrs argument
Date: Thu, 23 Dec 2021 12:55:51 +0100
Message-Id: <20211223115554.3155328-21-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let devices specify transaction attributes when calling st*_pci_dma().

Keep the default MEMTXATTRS_UNSPECIFIED in the few callers.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/pci/pci.h | 11 ++++++-----
 hw/audio/intel-hda.c | 10 ++++++----
 hw/net/eepro100.c    | 29 ++++++++++++++++++-----------
 hw/net/tulip.c       | 18 ++++++++++--------
 hw/scsi/megasas.c    | 15 ++++++++++-----
 hw/scsi/vmw_pvscsi.c |  3 ++-
 6 files changed, 52 insertions(+), 34 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index 8c5f2ed5054..9f51ef2c3c2 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -859,11 +859,12 @@ static inline MemTxResult pci_dma_write(PCIDevice *dev, dma_addr_t addr,
                      MEMTXATTRS_UNSPECIFIED); \
         return val; \
     }                                                                   \
-    static inline void st##_s##_pci_dma(PCIDevice *dev,                 \
-                                        dma_addr_t addr, uint##_bits##_t val) \
-    {                                                                   \
-        st##_s##_dma(pci_get_address_space(dev), addr, val, \
-                     MEMTXATTRS_UNSPECIFIED); \
+    static inline void st##_s##_pci_dma(PCIDevice *dev, \
+                                        dma_addr_t addr, \
+                                        uint##_bits##_t val, \
+                                        MemTxAttrs attrs) \
+    { \
+        st##_s##_dma(pci_get_address_space(dev), addr, val, attrs); \
     }
 
 PCI_DMA_DEFINE_LDST(ub, b, 8);
diff --git a/hw/audio/intel-hda.c b/hw/audio/intel-hda.c
index fb3d34a4a0c..3309ae0ea18 100644
--- a/hw/audio/intel-hda.c
+++ b/hw/audio/intel-hda.c
@@ -345,6 +345,7 @@ static void intel_hda_corb_run(IntelHDAState *d)
 
 static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t response)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
     IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
     hwaddr addr;
@@ -367,8 +368,8 @@ static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t res
     ex = (solicited ? 0 : (1 << 4)) | dev->cad;
     wp = (d->rirb_wp + 1) & 0xff;
     addr = intel_hda_addr(d->rirb_lbase, d->rirb_ubase);
-    stl_le_pci_dma(&d->pci, addr + 8*wp, response);
-    stl_le_pci_dma(&d->pci, addr + 8*wp + 4, ex);
+    stl_le_pci_dma(&d->pci, addr + 8 * wp, response, attrs);
+    stl_le_pci_dma(&d->pci, addr + 8 * wp + 4, ex, attrs);
     d->rirb_wp = wp;
 
     dprint(d, 2, "%s: [wp 0x%x] response 0x%x, extra 0x%x\n",
@@ -394,6 +395,7 @@ static void intel_hda_response(HDACodecDevice *dev, bool solicited, uint32_t res
 static bool intel_hda_xfer(HDACodecDevice *dev, uint32_t stnr, bool output,
                            uint8_t *buf, uint32_t len)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     HDACodecBus *bus = HDA_BUS(dev->qdev.parent_bus);
     IntelHDAState *d = container_of(bus, IntelHDAState, codecs);
     hwaddr addr;
@@ -428,7 +430,7 @@ static bool intel_hda_xfer(HDACodecDevice *dev, uint32_t stnr, bool output,
                st->be, st->bp, st->bpl[st->be].len, copy);
 
         pci_dma_rw(&d->pci, st->bpl[st->be].addr + st->bp, buf, copy, !output,
-                   MEMTXATTRS_UNSPECIFIED);
+                   attrs);
         st->lpib += copy;
         st->bp += copy;
         buf += copy;
@@ -451,7 +453,7 @@ static bool intel_hda_xfer(HDACodecDevice *dev, uint32_t stnr, bool output,
     if (d->dp_lbase & 0x01) {
         s = st - d->st;
         addr = intel_hda_addr(d->dp_lbase & ~0x01, d->dp_ubase);
-        stl_le_pci_dma(&d->pci, addr + 8*s, st->lpib);
+        stl_le_pci_dma(&d->pci, addr + 8 * s, st->lpib, attrs);
     }
     dprint(d, 3, "dma: --\n");
 
diff --git a/hw/net/eepro100.c b/hw/net/eepro100.c
index 16e95ef9cc9..83c4431b1ad 100644
--- a/hw/net/eepro100.c
+++ b/hw/net/eepro100.c
@@ -700,6 +700,8 @@ static void set_ru_state(EEPRO100State * s, ru_state_t state)
 
 static void dump_statistics(EEPRO100State * s)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+
     /* Dump statistical data. Most data is never changed by the emulation
      * and always 0, so we first just copy the whole block and then those
      * values which really matter.
@@ -707,16 +709,18 @@ static void dump_statistics(EEPRO100State * s)
      */
     pci_dma_write(&s->dev, s->statsaddr, &s->statistics, s->stats_size);
     stl_le_pci_dma(&s->dev, s->statsaddr + 0,
-                   s->statistics.tx_good_frames);
+                   s->statistics.tx_good_frames, attrs);
     stl_le_pci_dma(&s->dev, s->statsaddr + 36,
-                   s->statistics.rx_good_frames);
+                   s->statistics.rx_good_frames, attrs);
     stl_le_pci_dma(&s->dev, s->statsaddr + 48,
-                   s->statistics.rx_resource_errors);
+                   s->statistics.rx_resource_errors, attrs);
     stl_le_pci_dma(&s->dev, s->statsaddr + 60,
-                   s->statistics.rx_short_frame_errors);
+                   s->statistics.rx_short_frame_errors, attrs);
 #if 0
-    stw_le_pci_dma(&s->dev, s->statsaddr + 76, s->statistics.xmt_tco_frames);
-    stw_le_pci_dma(&s->dev, s->statsaddr + 78, s->statistics.rcv_tco_frames);
+    stw_le_pci_dma(&s->dev, s->statsaddr + 76,
+                   s->statistics.xmt_tco_frames, attrs);
+    stw_le_pci_dma(&s->dev, s->statsaddr + 78,
+                   s->statistics.rcv_tco_frames, attrs);
     missing("CU dump statistical counters");
 #endif
 }
@@ -833,6 +837,7 @@ static void set_multicast_list(EEPRO100State *s)
 
 static void action_command(EEPRO100State *s)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     /* The loop below won't stop if it gets special handcrafted data.
        Therefore we limit the number of iterations. */
     unsigned max_loop_count = 16;
@@ -911,7 +916,7 @@ static void action_command(EEPRO100State *s)
         }
         /* Write new status. */
         stw_le_pci_dma(&s->dev, s->cb_address,
-                       s->tx.status | ok_status | STATUS_C);
+                       s->tx.status | ok_status | STATUS_C, attrs);
         if (bit_i) {
             /* CU completed action. */
             eepro100_cx_interrupt(s);
@@ -937,6 +942,7 @@ static void action_command(EEPRO100State *s)
 
 static void eepro100_cu_command(EEPRO100State * s, uint8_t val)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     cu_state_t cu_state;
     switch (val) {
     case CU_NOP:
@@ -986,7 +992,7 @@ static void eepro100_cu_command(EEPRO100State * s, uint8_t val)
         /* Dump statistical counters. */
         TRACE(OTHER, logout("val=0x%02x (dump stats)\n", val));
         dump_statistics(s);
-        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa005);
+        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa005, attrs);
         break;
     case CU_CMD_BASE:
         /* Load CU base. */
@@ -997,7 +1003,7 @@ static void eepro100_cu_command(EEPRO100State * s, uint8_t val)
         /* Dump and reset statistical counters. */
         TRACE(OTHER, logout("val=0x%02x (dump stats and reset)\n", val));
         dump_statistics(s);
-        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa007);
+        stl_le_pci_dma(&s->dev, s->statsaddr + s->stats_size, 0xa007, attrs);
         memset(&s->statistics, 0, sizeof(s->statistics));
         break;
     case CU_SRESUME:
@@ -1612,6 +1618,7 @@ static ssize_t nic_receive(NetClientState *nc, const uint8_t * buf, size_t size)
      * - Magic packets should set bit 30 in power management driver register.
      * - Interesting packets should set bit 29 in power management driver register.
      */
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     EEPRO100State *s = qemu_get_nic_opaque(nc);
     uint16_t rfd_status = 0xa000;
 #if defined(CONFIG_PAD_RECEIVED_FRAMES)
@@ -1726,9 +1733,9 @@ static ssize_t nic_receive(NetClientState *nc, const uint8_t * buf, size_t size)
     TRACE(OTHER, logout("command 0x%04x, link 0x%08x, addr 0x%08x, size %u\n",
           rfd_command, rx.link, rx.rx_buf_addr, rfd_size));
     stw_le_pci_dma(&s->dev, s->ru_base + s->ru_offset +
-                offsetof(eepro100_rx_t, status), rfd_status);
+                offsetof(eepro100_rx_t, status), rfd_status, attrs);
     stw_le_pci_dma(&s->dev, s->ru_base + s->ru_offset +
-                offsetof(eepro100_rx_t, count), size);
+                offsetof(eepro100_rx_t, count), size, attrs);
     /* Early receive interrupt not supported. */
 #if 0
     eepro100_er_interrupt(s);
diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index ca69f7ea5e1..1f2c79dd58b 100644
--- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -86,16 +86,18 @@ static void tulip_desc_read(TULIPState *s, hwaddr p,
 static void tulip_desc_write(TULIPState *s, hwaddr p,
         struct tulip_descriptor *desc)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
+
     if (s->csr[0] & CSR0_DBO) {
-        stl_be_pci_dma(&s->dev, p, desc->status);
-        stl_be_pci_dma(&s->dev, p + 4, desc->control);
-        stl_be_pci_dma(&s->dev, p + 8, desc->buf_addr1);
-        stl_be_pci_dma(&s->dev, p + 12, desc->buf_addr2);
+        stl_be_pci_dma(&s->dev, p, desc->status, attrs);
+        stl_be_pci_dma(&s->dev, p + 4, desc->control, attrs);
+        stl_be_pci_dma(&s->dev, p + 8, desc->buf_addr1, attrs);
+        stl_be_pci_dma(&s->dev, p + 12, desc->buf_addr2, attrs);
     } else {
-        stl_le_pci_dma(&s->dev, p, desc->status);
-        stl_le_pci_dma(&s->dev, p + 4, desc->control);
-        stl_le_pci_dma(&s->dev, p + 8, desc->buf_addr1);
-        stl_le_pci_dma(&s->dev, p + 12, desc->buf_addr2);
+        stl_le_pci_dma(&s->dev, p, desc->status, attrs);
+        stl_le_pci_dma(&s->dev, p + 4, desc->control, attrs);
+        stl_le_pci_dma(&s->dev, p + 8, desc->buf_addr1, attrs);
+        stl_le_pci_dma(&s->dev, p + 12, desc->buf_addr2, attrs);
     }
 }
 
diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 266c3d38003..65451d34e64 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -168,14 +168,16 @@ static void megasas_frame_set_cmd_status(MegasasState *s,
                                          unsigned long frame, uint8_t v)
 {
     PCIDevice *pci = &s->parent_obj;
-    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, cmd_status), v);
+    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, cmd_status),
+                v, MEMTXATTRS_UNSPECIFIED);
 }
 
 static void megasas_frame_set_scsi_status(MegasasState *s,
                                           unsigned long frame, uint8_t v)
 {
     PCIDevice *pci = &s->parent_obj;
-    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, scsi_status), v);
+    stb_pci_dma(pci, frame + offsetof(struct mfi_frame_header, scsi_status),
+                v, MEMTXATTRS_UNSPECIFIED);
 }
 
 static inline const char *mfi_frame_desc(unsigned int cmd)
@@ -542,6 +544,7 @@ static MegasasCmd *megasas_enqueue_frame(MegasasState *s,
 
 static void megasas_complete_frame(MegasasState *s, uint64_t context)
 {
+    const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
     PCIDevice *pci_dev = PCI_DEVICE(s);
     int tail, queue_offset;
 
@@ -555,10 +558,12 @@ static void megasas_complete_frame(MegasasState *s, uint64_t context)
          */
         if (megasas_use_queue64(s)) {
             queue_offset = s->reply_queue_head * sizeof(uint64_t);
-            stq_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset, context);
+            stq_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
+                           context, attrs);
         } else {
             queue_offset = s->reply_queue_head * sizeof(uint32_t);
-            stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset, context);
+            stl_le_pci_dma(pci_dev, s->reply_queue_pa + queue_offset,
+                           context, attrs);
         }
         s->reply_queue_tail = ldl_le_pci_dma(pci_dev, s->consumer_pa);
         trace_megasas_qf_complete(context, s->reply_queue_head,
@@ -572,7 +577,7 @@ static void megasas_complete_frame(MegasasState *s, uint64_t context)
         s->reply_queue_head = megasas_next_index(s, tail, s->fw_cmds);
         trace_megasas_qf_update(s->reply_queue_head, s->reply_queue_tail,
                                 s->busy);
-        stl_le_pci_dma(pci_dev, s->producer_pa, s->reply_queue_head);
+        stl_le_pci_dma(pci_dev, s->producer_pa, s->reply_queue_head, attrs);
         /* Notify HBA */
         if (msix_enabled(pci_dev)) {
             trace_megasas_msix_raise(0);
diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index cd76bd67ab7..59c3e8ba048 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -55,7 +55,8 @@
                  (m)->rs_pa + offsetof(struct PVSCSIRingsState, field)))
 #define RS_SET_FIELD(m, field, val) \
     (stl_le_pci_dma(&container_of(m, PVSCSIState, rings)->parent_obj, \
-                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), val))
+                 (m)->rs_pa + offsetof(struct PVSCSIRingsState, field), val, \
+                 MEMTXATTRS_UNSPECIFIED))
 
 struct PVSCSIClass {
     PCIDeviceClass parent_class;
-- 
2.33.1


