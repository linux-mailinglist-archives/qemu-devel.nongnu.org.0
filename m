Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA1F115E88
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Dec 2019 21:36:07 +0100 (CET)
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idgoA-0004QC-9S
	for lists+qemu-devel@lfdr.de; Sat, 07 Dec 2019 15:36:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43411)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bilalwasim676@gmail.com>) id 1idgn8-0003mD-Vm
 for qemu-devel@nongnu.org; Sat, 07 Dec 2019 15:35:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bilalwasim676@gmail.com>) id 1idgn7-0001Ui-8r
 for qemu-devel@nongnu.org; Sat, 07 Dec 2019 15:35:02 -0500
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:37481)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bilalwasim676@gmail.com>)
 id 1idgn6-0001Rv-U8; Sat, 07 Dec 2019 15:35:01 -0500
Received: by mail-lf1-x143.google.com with SMTP id b15so7810226lfc.4;
 Sat, 07 Dec 2019 12:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hNUjK1+kYweHU8biayWEpHSVMZrIN26jACvApJZkpdE=;
 b=VPBbK9IyFG5K/UJfCwODJChg8RrMQG25q9eJMV+phx8QbZvWZlXp1cP4pTLoWJP5vS
 i/SAJ+suo4rP5hAFgKsl9f6Wac2QYL2ix4s6PjitslZEG78WCcI/ix8Whs63PO2o3gCm
 8hhLlreJdfYQxdCT9fVCeRLyHnkeGYSEVXBXIDy8AOe5X5Jtdyw7naQjT+KGQnVPNj6R
 DIIwg18zR6N1uWtdbqqTd2CE02uPlXV/yYSJAJshZHh+KT2pZo/eodCg7CVsOQF0Xien
 om3mgQhBX+eRc5+lmFqLZ8cx0gmASO8YgJnTJYxJQ/PTNyvH6CA0IeO/POoV04AUn19v
 hTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hNUjK1+kYweHU8biayWEpHSVMZrIN26jACvApJZkpdE=;
 b=n2595SvkgzERxwnkoLT6RD/3fmj4YytfDWWBLA9PimNQoldoJ1ND2jXvTBO8q2WnZt
 F7empJbKtV7aks6UKJTe+IWSyd8C5n0T89sxDKBnqEaGrz6nUckZ1B45DW0/mGQh+hLR
 Safeb6b0FyPpTA8c0tjWGUrBCCV5VMR4SefBxxFPaVlCOb1bsiEOv522OqPpFIrSj4XT
 3ZtIFgZrRo6Em+wFcg2kpgXN8rXC2Za/bi14bOn6WA3Nbln8yZ4Zb0lyCjFk4oMDEWex
 6sWxvYnJzuQjq/8jNAZy/fBQfB4a9dDQSBWt76SuN1S0O3ZN72uTxCGIM8jXqXx+Age7
 dzuw==
X-Gm-Message-State: APjAAAURKtlHQj/rQVxG7QI2ICWCnitES08LN/CSZzg2sd4ZwYXzRe1B
 DrdmdQDA5aUmTlpn1XOVl33A36ZKG10=
X-Google-Smtp-Source: APXvYqxO64tgaFZCigNrkJ0Mi2hObj9KNiF2/azEUf0U/wAtBCj4yqtpTRw9N+PGEPHMNcTl98wuuA==
X-Received: by 2002:ac2:5a48:: with SMTP id r8mr11090826lfn.179.1575750898705; 
 Sat, 07 Dec 2019 12:34:58 -0800 (PST)
Received: from PKL-BWASIM-LT.mgc.mentorg.com
 (static-host202-147-173-53.link.net.pk. [202.147.173.53])
 by smtp.gmail.com with ESMTPSA id c9sm7579815ljd.28.2019.12.07.12.34.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 Dec 2019 12:34:57 -0800 (PST)
From: bilalwasim676@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH] Adding support for MAC filtering in the FEC IP implementation.
Date: Sun,  8 Dec 2019 01:34:50 +0500
Message-Id: <20191207203450.6304-1-bilalwasim676@gmail.com>
X-Mailer: git-send-email 2.19.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::143
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, philmd@redhat.com, jasowang@redhat.com,
 qemu-arm@nongnu.org, Bilal Wasim <bilal_wasim@mentor.com>,
 Bilal Wasim <bilalwasim676@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bilal Wasim <bilal_wasim@mentor.com>

This addition ensures that the IP does NOT boot up in
promiscuous mode by default, and so the software only receives the desired
packets(Unicast, Broadcast, Unicast / Multicast hashed) by default. The
software running on-top of QEMU can also modify these settings and disable
reception of broadcast frames or make the IP receive all packets (PROM mode).
This patch greatly reduces the number of packets received by the software
running on-top of the QEMU model. Tested with the armv7-a SABRE_LITE machine.
Testing included running a custom OS with IPv4 / IPv6 support. Hashing and
filtering of packets is tested to work well. Skeleton taken from the
CADENCE_GEM IP and hash generation algorithm from the Linux Kernel.

Signed-off-by: Bilal Wasim <bilalwasim676@gmail.com>
---
 hw/net/imx_fec.c         | 108 ++++++++++++++++++++++++++++++++++++++-
 include/hw/net/imx_fec.h |  12 +++++
 2 files changed, 119 insertions(+), 1 deletion(-)

diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
index bd99236864..dc39f1f597 100644
--- a/hw/net/imx_fec.c
+++ b/hw/net/imx_fec.c
@@ -419,6 +419,80 @@ static void imx_enet_write_bd(IMXENETBufDesc *bd, dma_addr_t addr)
     dma_memory_write(&address_space_memory, addr, bd, sizeof(*bd));
 }
 
+/*
+ * Calculate a FEC MAC Address hash index
+ */
+static unsigned calc_mac_hash(const uint8_t *mac, uint8_t mac_length)
+{
+    uint32_t crc = -1;
+    int i;
+
+    while (mac_length --) {
+        crc ^= *mac++;
+        for (i = 0; i < 8; i++) {
+            crc = (crc >> 1) ^ ((crc & 1) ? CRCPOLY_LE : 0);
+        }
+    }
+
+    /* only upper 6 bits (FEC_HASH_BITS) are used
+     * which point to specific bit in the hash registers
+     */
+    return ((crc >> (32 - FEC_HASH_BITS)) & 0x3f);
+}
+
+/*
+ * fec_mac_address_filter:
+ * Accept or reject this destination address?
+ */
+static int fec_mac_address_filter(IMXFECState *s, const uint8_t *packet)
+{
+    const uint8_t broadcast_addr[] = { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };
+    uint32_t addr1, addr2;
+    uint8_t  hash;
+
+    /* Promiscuous mode? */
+    if (s->regs[ENET_RCR] & ENET_RCR_PROM) {
+        return (FEC_RX_PROMISCUOUS_ACCEPT); /* Accept all packets in promiscuous mode (even if bc_rej is set). */
+    }
+
+    /* Broadcast packet? */
+    if (!memcmp(packet, broadcast_addr, 6)) {
+        /* Reject broadcast packets? */
+        if (s->regs[ENET_RCR] & ENET_RCR_BC_REJ) {
+            return (FEC_RX_REJECT);
+        }
+        return (FEC_RX_BROADCAST_ACCEPT); /* Accept packets from broadcast address. */
+    }
+
+    /* Accept packets -w- hash match? */
+    hash = calc_mac_hash(packet, 6);
+
+    /* Accept packets -w- multicast hash match? */
+    if ((packet[0] & 0x01) == 0x01) {
+        /* See if the computed hash matches a set bit in either GAUR / GALR register. */
+        if (((hash < 32) && (s->regs[ENET_GALR] & (1 << hash)))
+                || ((hash > 31) && (s->regs[ENET_GAUR] & (1 << (hash-32))))) {
+            return (FEC_RX_MULTICAST_HASH_ACCEPT); /* Accept multicast hash enabled address. */
+        }
+    } else {
+        /* See if the computed hash matches a set bit in either IAUR / IALR register. */
+        if (((hash < 32) && (s->regs[ENET_IALR] & (1 << hash)))
+                || ((hash > 31) && (s->regs[ENET_IAUR] & (1 << (hash-32))))) {
+            return (FEC_RX_UNICAST_HASH_ACCEPT); /* Accept multicast hash enabled address. */
+        }
+    }
+
+    /* Match Unicast address. */
+    addr1  = g_htonl(s->regs[ENET_PALR]);
+    addr2  = g_htonl(s->regs[ENET_PAUR]);
+    if (!(memcmp(packet, (uint8_t *) &addr1, 4) || memcmp(packet+4, (uint8_t *) &addr2, 2))) {
+        return (FEC_RX_UNICAST_ACCEPT); /* Accept packet because it matches my unicast address. */
+    }
+
+    /* Return -1 because we do NOT support MAC address filtering.. */
+    return (FEC_RX_REJECT);
+}
+
 static void imx_eth_update(IMXFECState *s)
 {
     /*
@@ -984,7 +1058,7 @@ static void imx_eth_write(void *opaque, hwaddr offset, uint64_t value,
     case ENET_IALR:
     case ENET_GAUR:
     case ENET_GALR:
-        /* TODO: implement MAC hash filtering.  */
+        s->regs[index] |= value;
         break;
     case ENET_TFWR:
         if (s->is_fec) {
@@ -1066,8 +1140,16 @@ static ssize_t imx_fec_receive(NetClientState *nc, const uint8_t *buf,
     uint32_t buf_addr;
     uint8_t *crc_ptr;
     unsigned int buf_len;
+    int maf;
     size_t size = len;
 
+    /* Is this destination MAC address "for us" ? */
+    maf = fec_mac_address_filter(s, buf);
+    if (maf == FEC_RX_REJECT)
+    {
+        return (FEC_RX_REJECT);
+    }
+
     FEC_PRINTF("len %d\n", (int)size);
 
     if (!s->regs[ENET_RDAR]) {
@@ -1133,6 +1215,14 @@ static ssize_t imx_fec_receive(NetClientState *nc, const uint8_t *buf,
         } else {
             s->regs[ENET_EIR] |= ENET_INT_RXB;
         }
+
+        /* Update descriptor based on the "maf" flag. */
+        if (maf == FEC_RX_BROADCAST_ACCEPT) {
+            bd.flags |= ENET_BD_BC; /* The packet is destined for the "broadcast" address. */
+        } else if (maf == FEC_RX_MULTICAST_HASH_ACCEPT) {
+            bd.flags |= ENET_BD_MC; /* The packet is destined for a "multicast" address. */
+        }
+
         imx_fec_write_bd(&bd, addr);
         /* Advance to the next descriptor.  */
         if ((bd.flags & ENET_BD_W) != 0) {
@@ -1159,8 +1249,16 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
     uint8_t *crc_ptr;
     unsigned int buf_len;
     size_t size = len;
+    int maf;
     bool shift16 = s->regs[ENET_RACC] & ENET_RACC_SHIFT16;
 
+    /* Is this destination MAC address "for us" ? */
+    maf = fec_mac_address_filter(s, buf);
+    if (maf == FEC_RX_REJECT)
+    {
+        return (FEC_RX_REJECT);
+    }
+
     FEC_PRINTF("len %d\n", (int)size);
 
     if (!s->regs[ENET_RDAR]) {
@@ -1254,6 +1352,14 @@ static ssize_t imx_enet_receive(NetClientState *nc, const uint8_t *buf,
                 s->regs[ENET_EIR] |= ENET_INT_RXB;
             }
         }
+
+        /* Update descriptor based on the "maf" flag. */
+        if (maf == FEC_RX_BROADCAST_ACCEPT) {
+            bd.flags |= ENET_BD_BC; /* The packet is destined for the "broadcast" address. */
+        } else if (maf == FEC_RX_MULTICAST_HASH_ACCEPT) {
+            bd.flags |= ENET_BD_MC; /* The packet is destined for a "multicast" address. */
+        }
+
         imx_enet_write_bd(&bd, addr);
         /* Advance to the next descriptor.  */
         if ((bd.flags & ENET_BD_W) != 0) {
diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
index 7b3faa4019..d38c8fe0e8 100644
--- a/include/hw/net/imx_fec.h
+++ b/include/hw/net/imx_fec.h
@@ -275,4 +275,16 @@ typedef struct IMXFECState {
     uint8_t frame[ENET_MAX_FRAME_SIZE];
 } IMXFECState;
 
+/* FEC address filtering defines. */
+#define FEC_RX_REJECT                   (-1)
+#define FEC_RX_PROMISCUOUS_ACCEPT       (-2)
+#define FEC_RX_BROADCAST_ACCEPT         (-3)
+#define FEC_RX_MULTICAST_HASH_ACCEPT    (-4)
+#define FEC_RX_UNICAST_HASH_ACCEPT      (-5)
+#define FEC_RX_UNICAST_ACCEPT           (-6)
+
+/* FEC hash filtering defines.*/
+#define CRCPOLY_LE                      0xedb88320
+#define FEC_HASH_BITS                    6    /* #bits in hash */
+
 #endif
-- 
2.19.1.windows.1


