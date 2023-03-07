Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E5B6AD804
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:10:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRRw-0007iF-TJ; Tue, 07 Mar 2023 02:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRRu-0007fP-Nt
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRRs-0005Q9-VZ
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:09:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678172964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5CMCl2JjTELXTa5KpkdlpXcP847k3hharxbwSeHZoG0=;
 b=dxro8nKpEyJ8OE6T0djN25UHfPapEyG7fxBLBgKwX0YW/mEmH+VML9/ZdeOqKVkC2Igqbh
 ais1klMVz9451pVjUGyICmQET8X0lMbsnNzyBaNsvgL4Y8OWB2+fpt9jPQ335RVRmpabGV
 oCdtVEtFomuEjNpBa6XOD5yTJzDSjsQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-NC8T2UVQOcS7WkSixof9Nw-1; Tue, 07 Mar 2023 02:09:23 -0500
X-MC-Unique: NC8T2UVQOcS7WkSixof9Nw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AFBBF3810B37;
 Tue,  7 Mar 2023 07:09:22 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C51F840C10FA;
 Tue,  7 Mar 2023 07:09:20 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 09/51] e1000e: Use more constant definitions
Date: Tue,  7 Mar 2023 15:07:34 +0800
Message-Id: <20230307070816.34833-10-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
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

The definitions of SW Semaphore Register were copied from:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/net/ethernet/intel/e1000e/defines.h?h=v6.0.9#n374

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000_regs.h  |  7 +++++++
 hw/net/e1000e_core.c | 49 +++++++++++++++++++++++++++----------------------
 2 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index 3f6b5d0..6a36573 100644
--- a/hw/net/e1000_regs.h
+++ b/hw/net/e1000_regs.h
@@ -525,6 +525,13 @@
 #define M88E1000_PHY_VCO_REG_BIT8  0x100 /* Bits 8 & 11 are adjusted for */
 #define M88E1000_PHY_VCO_REG_BIT11 0x800    /* improved BER performance */
 
+/* SW Semaphore Register */
+#define E1000_SWSM_SMBI         0x00000001 /* Driver Semaphore bit */
+#define E1000_SWSM_SWESMBI      0x00000002 /* FW Semaphore bit */
+#define E1000_SWSM_DRV_LOAD     0x00000008 /* Driver Loaded Bit */
+
+#define E1000_SWSM2_LOCK        0x00000002 /* Secondary driver semaphore bit */
+
 /* Interrupt Cause Read */
 #define E1000_ICR_TXDW          0x00000001 /* Transmit desc written back */
 #define E1000_ICR_TXQE          0x00000002 /* Transmit Queue empty */
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index e6fc85e..6a4da72 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1022,10 +1022,11 @@ e1000e_receive_filter(E1000ECore *core, const uint8_t *buf, int size)
 
     if (e1000x_is_vlan_packet(buf, core->mac[VET]) &&
         e1000x_vlan_rx_filter_enabled(core->mac)) {
-        uint16_t vid = lduw_be_p(buf + 14);
-        uint32_t vfta = ldl_le_p((uint32_t *)(core->mac + VFTA) +
-                                 ((vid >> 5) & 0x7f));
-        if ((vfta & (1 << (vid & 0x1f))) == 0) {
+        uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(buf)->h_tci);
+        uint32_t vfta =
+            ldl_le_p((uint32_t *)(core->mac + VFTA) +
+                     ((vid >> E1000_VFTA_ENTRY_SHIFT) & E1000_VFTA_ENTRY_MASK));
+        if ((vfta & (1 << (vid & E1000_VFTA_ENTRY_BIT_SHIFT_MASK))) == 0) {
             trace_e1000e_rx_flt_vlan_mismatch(vid);
             return false;
         } else {
@@ -1679,16 +1680,13 @@ e1000e_rx_fix_l4_csum(E1000ECore *core, struct NetRxPkt *pkt)
     }
 }
 
-/* Min. octets in an ethernet frame sans FCS */
-#define MIN_BUF_SIZE 60
-
 ssize_t
 e1000e_receive_iov(E1000ECore *core, const struct iovec *iov, int iovcnt)
 {
-    static const int maximum_ethernet_hdr_len = (14 + 4);
+    static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
 
     uint32_t n = 0;
-    uint8_t min_buf[MIN_BUF_SIZE];
+    uint8_t min_buf[ETH_ZLEN];
     struct iovec min_iov;
     uint8_t *filter_buf;
     size_t size, orig_size;
@@ -2627,7 +2625,7 @@ static uint32_t
 e1000e_mac_swsm_read(E1000ECore *core, int index)
 {
     uint32_t val = core->mac[SWSM];
-    core->mac[SWSM] = val | 1;
+    core->mac[SWSM] = val | E1000_SWSM_SMBI;
     return val;
 }
 
@@ -3092,8 +3090,8 @@ static const readops e1000e_macreg_readops[] = {
     [IP4AT ... IP4AT + 6]  = e1000e_mac_readreg,
     [RA ... RA + 31]       = e1000e_mac_readreg,
     [WUPM ... WUPM + 31]   = e1000e_mac_readreg,
-    [MTA ... MTA + 127]    = e1000e_mac_readreg,
-    [VFTA ... VFTA + 127]  = e1000e_mac_readreg,
+    [MTA ... MTA + E1000_MC_TBL_SIZE - 1] = e1000e_mac_readreg,
+    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1]  = e1000e_mac_readreg,
     [FFMT ... FFMT + 254]  = e1000e_mac_readreg,
     [FFVT ... FFVT + 254]  = e1000e_mac_readreg,
     [MDEF ... MDEF + 7]    = e1000e_mac_readreg,
@@ -3245,8 +3243,8 @@ static const writeops e1000e_macreg_writeops[] = {
     [IP4AT ... IP4AT + 6]    = e1000e_mac_writereg,
     [RA + 2 ... RA + 31]     = e1000e_mac_writereg,
     [WUPM ... WUPM + 31]     = e1000e_mac_writereg,
-    [MTA ... MTA + 127]      = e1000e_mac_writereg,
-    [VFTA ... VFTA + 127]    = e1000e_mac_writereg,
+    [MTA ... MTA + E1000_MC_TBL_SIZE - 1] = e1000e_mac_writereg,
+    [VFTA ... VFTA + E1000_VLAN_FILTER_TBL_SIZE - 1]    = e1000e_mac_writereg,
     [FFMT ... FFMT + 254]    = e1000e_set_4bit,
     [FFVT ... FFVT + 254]    = e1000e_mac_writereg,
     [PBM ... PBM + 10239]    = e1000e_mac_writereg,
@@ -3276,7 +3274,7 @@ static const uint16_t mac_reg_access[E1000E_MAC_SIZE] = {
     [TDH_A]   = 0x0cf8, [TDT_A]   = 0x0cf8, [TIDV_A] = 0x0cf8,
     [TDFH_A]  = 0xed00, [TDFT_A]  = 0xed00,
     [RA_A ... RA_A + 31]      = 0x14f0,
-    [VFTA_A ... VFTA_A + 127] = 0x1400,
+    [VFTA_A ... VFTA_A + E1000_VLAN_FILTER_TBL_SIZE - 1] = 0x1400,
     [RDBAL0_A ... RDLEN0_A] = 0x09bc,
     [TDBAL_A ... TDLEN_A]   = 0x0cf8,
     /* Access options */
@@ -3433,13 +3431,20 @@ e1000e_phy_reg_init[E1000E_PHY_PAGES][E1000E_PHY_PAGE_SIZE] = {
 
         [MII_PHYID1]            = 0x141,
         [MII_PHYID2]            = E1000_PHY_ID2_82574x,
-        [MII_ANAR]              = 0xde1,
-        [MII_ANLPAR]            = 0x7e0,
-        [MII_ANER]              = BIT(2),
-        [MII_ANNP]              = BIT(0) | BIT(13),
-        [MII_CTRL1000]          = BIT(8) | BIT(9) | BIT(10) | BIT(11),
-        [MII_STAT1000]          = 0x3c00,
-        [MII_EXTSTAT]           = BIT(12) | BIT(13),
+        [MII_ANAR]              = MII_ANAR_CSMACD | MII_ANAR_10 |
+                                  MII_ANAR_10FD | MII_ANAR_TX |
+                                  MII_ANAR_TXFD | MII_ANAR_PAUSE |
+                                  MII_ANAR_PAUSE_ASYM,
+        [MII_ANLPAR]            = MII_ANLPAR_10 | MII_ANLPAR_10FD |
+                                  MII_ANLPAR_TX | MII_ANLPAR_TXFD |
+                                  MII_ANLPAR_T4 | MII_ANLPAR_PAUSE,
+        [MII_ANER]              = MII_ANER_NP,
+        [MII_ANNP]              = 1 | MII_ANNP_MP,
+        [MII_CTRL1000]          = MII_CTRL1000_HALF | MII_CTRL1000_FULL |
+                                  MII_CTRL1000_PORT | MII_CTRL1000_MASTER,
+        [MII_STAT1000]          = MII_STAT1000_HALF | MII_STAT1000_FULL |
+                                  MII_STAT1000_ROK | MII_STAT1000_LOK,
+        [MII_EXTSTAT]           = MII_EXTSTAT_1000T_HD | MII_EXTSTAT_1000T_FD,
 
         [PHY_COPPER_CTRL1]      = BIT(5) | BIT(6) | BIT(8) | BIT(9) |
                                   BIT(12) | BIT(13),
-- 
2.7.4


