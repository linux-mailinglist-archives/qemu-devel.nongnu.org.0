Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C881F6B3ACF
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 10:39:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paZAQ-0002s0-C0; Fri, 10 Mar 2023 04:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZAM-0002qx-GC
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:35:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1paZAK-0008HL-EB
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 04:35:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678440955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VL/UxLT3aZudZwEehKXhpd+R4LYDsw/o8HQmVZsqFIs=;
 b=G9W8x8QZ134UKWFzgkC4sOqaLrmHY4JAo3gPQJcnM3z8FZfUn1SYCat6vCdhsdkt3xF1OE
 TpY9QpKvEHN5I83wRSnvJdD0Nq/4aGA+1WRPqgc12eFj6NWQMZdsi4lHcCkOqyDgIVCRwp
 UZvYN+aS6lubEKnNun5JZFoIkFn7N+k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-TfKgJOADM9mVY9TKJXSWPA-1; Fri, 10 Mar 2023 04:35:53 -0500
X-MC-Unique: TfKgJOADM9mVY9TKJXSWPA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CB90101A521;
 Fri, 10 Mar 2023 09:35:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-41.pek2.redhat.com [10.72.12.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEC0540BC781;
 Fri, 10 Mar 2023 09:35:50 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL V2 08/44] e1000: Use more constant definitions
Date: Fri, 10 Mar 2023 17:34:50 +0800
Message-Id: <20230310093526.30828-9-jasowang@redhat.com>
In-Reply-To: <20230310093526.30828-1-jasowang@redhat.com>
References: <20230310093526.30828-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Akihiko Odaki <akihiko.odaki@daynix.com>

The definitions for E1000_VFTA_ENTRY_SHIFT, E1000_VFTA_ENTRY_MASK, and
E1000_VFTA_ENTRY_BIT_SHIFT_MASK were copied from:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/intel/e1000/e1000_hw.h?h=v6.0.9#n306

The definitions for E1000_NUM_UNICAST, E1000_MC_TBL_SIZE, and
E1000_VLAN_FILTER_TBL_SIZE were copied from:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/intel/e1000/e1000_hw.h?h=v6.0.9#n707

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000.c         | 50 ++++++++++++++++++++++++++++----------------------
 hw/net/e1000_regs.h    |  9 +++++++++
 hw/net/e1000x_common.c |  5 +++--
 hw/net/e1000x_common.h |  2 +-
 4 files changed, 41 insertions(+), 25 deletions(-)

diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 0925a99..d9d048f 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -43,8 +43,6 @@
 #include "trace.h"
 #include "qom/object.h"
 
-static const uint8_t bcast[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
-
 /* #define E1000_DEBUG */
 
 #ifdef E1000_DEBUG
@@ -67,9 +65,8 @@ static int debugflags = DBGBIT(TXERR) | DBGBIT(GENERAL);
 
 #define IOPORT_SIZE       0x40
 #define PNPMMIO_SIZE      0x20000
-#define MIN_BUF_SIZE      60 /* Min. octets in an ethernet frame sans FCS */
 
-#define MAXIMUM_ETHERNET_HDR_LEN (14+4)
+#define MAXIMUM_ETHERNET_HDR_LEN (ETH_HLEN + 4)
 
 /*
  * HW models:
@@ -239,10 +236,16 @@ static const uint16_t phy_reg_init[] = {
 
     [MII_PHYID1] = 0x141,
     /* [MII_PHYID2] configured per DevId, from e1000_reset() */
-    [MII_ANAR] = 0xde1,
-    [MII_ANLPAR] = 0x1e0,
-    [MII_CTRL1000] = 0x0e00,
-    [MII_STAT1000] = 0x3c00,
+    [MII_ANAR] = MII_ANAR_CSMACD | MII_ANAR_10 |
+                 MII_ANAR_10FD | MII_ANAR_TX |
+                 MII_ANAR_TXFD | MII_ANAR_PAUSE |
+                 MII_ANAR_PAUSE_ASYM,
+    [MII_ANLPAR] = MII_ANLPAR_10 | MII_ANLPAR_10FD |
+                   MII_ANLPAR_TX | MII_ANLPAR_TXFD,
+    [MII_CTRL1000] = MII_CTRL1000_FULL | MII_CTRL1000_PORT |
+                     MII_CTRL1000_MASTER,
+    [MII_STAT1000] = MII_STAT1000_HALF | MII_STAT1000_FULL |
+                     MII_STAT1000_ROK | MII_STAT1000_LOK,
     [M88E1000_PHY_SPEC_CTRL] = 0x360,
     [M88E1000_PHY_SPEC_STATUS] = 0xac00,
     [M88E1000_EXT_PHY_SPEC_CTRL] = 0x0d60,
@@ -548,9 +551,9 @@ putsum(uint8_t *data, uint32_t n, uint32_t sloc, uint32_t css, uint32_t cse)
 static inline void
 inc_tx_bcast_or_mcast_count(E1000State *s, const unsigned char *arr)
 {
-    if (!memcmp(arr, bcast, sizeof bcast)) {
+    if (is_broadcast_ether_addr(arr)) {
         e1000x_inc_reg_if_not_full(s->mac_reg, BPTC);
-    } else if (arr[0] & 1) {
+    } else if (is_multicast_ether_addr(arr)) {
         e1000x_inc_reg_if_not_full(s->mac_reg, MPTC);
     }
 }
@@ -804,14 +807,16 @@ static int
 receive_filter(E1000State *s, const uint8_t *buf, int size)
 {
     uint32_t rctl = s->mac_reg[RCTL];
-    int isbcast = !memcmp(buf, bcast, sizeof bcast), ismcast = (buf[0] & 1);
+    int isbcast = is_broadcast_ether_addr(buf);
+    int ismcast = is_multicast_ether_addr(buf);
 
     if (e1000x_is_vlan_packet(buf, le16_to_cpu(s->mac_reg[VET])) &&
         e1000x_vlan_rx_filter_enabled(s->mac_reg)) {
-        uint16_t vid = lduw_be_p(buf + 14);
-        uint32_t vfta = ldl_le_p((uint32_t *)(s->mac_reg + VFTA) +
-                                 ((vid >> 5) & 0x7f));
-        if ((vfta & (1 << (vid & 0x1f))) == 0) {
+        uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(buf)->h_tci);
+        uint32_t vfta =
+            ldl_le_p((uint32_t *)(s->mac_reg + VFTA) +
+                     ((vid >> E1000_VFTA_ENTRY_SHIFT) & E1000_VFTA_ENTRY_MASK));
+        if ((vfta & (1 << (vid & E1000_VFTA_ENTRY_BIT_SHIFT_MASK))) == 0) {
             return 0;
         }
     }
@@ -909,7 +914,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
     uint32_t rdh_start;
     uint16_t vlan_special = 0;
     uint8_t vlan_status = 0;
-    uint8_t min_buf[MIN_BUF_SIZE];
+    uint8_t min_buf[ETH_ZLEN];
     struct iovec min_iov;
     uint8_t *filter_buf = iov->iov_base;
     size_t size = iov_size(iov, iovcnt);
@@ -1204,8 +1209,8 @@ static const readops macreg_readops[] = {
     [FFLT ... FFLT + 6]   = &mac_readreg,
     [RA ... RA + 31]      = &mac_readreg,
     [WUPM ... WUPM + 31]  = &mac_readreg,
-    [MTA ... MTA + 127]   = &mac_readreg,
-    [VFTA ... VFTA + 127] = &mac_readreg,
+    [MTA ... MTA + E1000_MC_TBL_SIZE - 1]   = &mac_readreg,
+    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1] = &mac_readreg,
     [FFMT ... FFMT + 254] = &mac_readreg,
     [FFVT ... FFVT + 254] = &mac_readreg,
     [PBM ... PBM + 16383] = &mac_readreg,
@@ -1236,8 +1241,8 @@ static const writeops macreg_writeops[] = {
     [FFLT ... FFLT + 6]   = &set_11bit,
     [RA ... RA + 31]      = &mac_writereg,
     [WUPM ... WUPM + 31]  = &mac_writereg,
-    [MTA ... MTA + 127]   = &mac_writereg,
-    [VFTA ... VFTA + 127] = &mac_writereg,
+    [MTA ... MTA + E1000_MC_TBL_SIZE - 1] = &mac_writereg,
+    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1] = &mac_writereg,
     [FFMT ... FFMT + 254] = &set_4bit,     [FFVT ... FFVT + 254] = &mac_writereg,
     [PBM ... PBM + 16383] = &mac_writereg,
 };
@@ -1603,8 +1608,9 @@ static const VMStateDescription vmstate_e1000 = {
         VMSTATE_UINT32(mac_reg[WUFC], E1000State),
         VMSTATE_UINT32(mac_reg[VET], E1000State),
         VMSTATE_UINT32_SUB_ARRAY(mac_reg, E1000State, RA, 32),
-        VMSTATE_UINT32_SUB_ARRAY(mac_reg, E1000State, MTA, 128),
-        VMSTATE_UINT32_SUB_ARRAY(mac_reg, E1000State, VFTA, 128),
+        VMSTATE_UINT32_SUB_ARRAY(mac_reg, E1000State, MTA, E1000_MC_TBL_SIZE),
+        VMSTATE_UINT32_SUB_ARRAY(mac_reg, E1000State, VFTA,
+                                 E1000_VLAN_FILTER_TBL_SIZE),
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription*[]) {
diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index 59d6eb3..3f6b5d0 100644
--- a/hw/net/e1000_regs.h
+++ b/hw/net/e1000_regs.h
@@ -1154,6 +1154,11 @@ struct e1000_data_desc {
     } upper;
 };
 
+/* Filters */
+#define E1000_NUM_UNICAST          16  /* Unicast filter entries */
+#define E1000_MC_TBL_SIZE          128 /* Multicast Filter Table (4096 bits) */
+#define E1000_VLAN_FILTER_TBL_SIZE 128 /* VLAN Filter Table (4096 bits) */
+
 /* Management Control */
 #define E1000_MANC_SMBUS_EN      0x00000001 /* SMBus Enabled - RO */
 #define E1000_MANC_ASF_EN        0x00000002 /* ASF Enabled - RO */
@@ -1202,4 +1207,8 @@ struct e1000_data_desc {
 #define E1000_IOADDR 0x00
 #define E1000_IODATA 0x04
 
+#define E1000_VFTA_ENTRY_SHIFT          5
+#define E1000_VFTA_ENTRY_MASK           0x7F
+#define E1000_VFTA_ENTRY_BIT_SHIFT_MASK 0x1F
+
 #endif /* HW_E1000_REGS_H */
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index e79d4c7..b3bbf31 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -26,6 +26,7 @@
 #include "qemu/units.h"
 #include "hw/net/mii.h"
 #include "hw/pci/pci_device.h"
+#include "net/eth.h"
 #include "net/net.h"
 
 #include "e1000x_common.h"
@@ -48,7 +49,7 @@ bool e1000x_rx_ready(PCIDevice *d, uint32_t *mac)
 
 bool e1000x_is_vlan_packet(const uint8_t *buf, uint16_t vet)
 {
-    uint16_t eth_proto = lduw_be_p(buf + 12);
+    uint16_t eth_proto = lduw_be_p(&PKT_GET_ETH_HDR(buf)->h_proto);
     bool res = (eth_proto == vet);
 
     trace_e1000x_vlan_is_vlan_pkt(res, eth_proto, vet);
@@ -67,7 +68,7 @@ bool e1000x_rx_group_filter(uint32_t *mac, const uint8_t *buf)
         }
         ra[0] = cpu_to_le32(rp[0]);
         ra[1] = cpu_to_le32(rp[1]);
-        if (!memcmp(buf, (uint8_t *)ra, 6)) {
+        if (!memcmp(buf, (uint8_t *)ra, ETH_ALEN)) {
             trace_e1000x_rx_flt_ucast_match((int)(rp - mac - RA) / 2,
                                             MAC_ARG(buf));
             return true;
diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
index 3501e48..b991d81 100644
--- a/hw/net/e1000x_common.h
+++ b/hw/net/e1000x_common.h
@@ -102,7 +102,7 @@ enum {
 static inline void
 e1000x_inc_reg_if_not_full(uint32_t *mac, int index)
 {
-    if (mac[index] != 0xffffffff) {
+    if (mac[index] != UINT32_MAX) {
         mac[index]++;
     }
 }
-- 
2.7.4


