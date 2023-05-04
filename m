Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A286F7150
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:42:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucpx-0002Qz-PC; Thu, 04 May 2023 13:33:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1puYjw-0003r2-Ms
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:11:20 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1puYjn-0002u7-46
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:11:20 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230504131107euoutp0279f6b631befc40ee1b79913047fd9429~b8tFyMXJJ2011320113euoutp02q
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 13:11:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230504131107euoutp0279f6b631befc40ee1b79913047fd9429~b8tFyMXJJ2011320113euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683205867;
 bh=NlbjXQhXA2SqRfqTxBz4d6WC+pasPzHbWpuvFkc6ubI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Fpq69HMC3JHd0I760/cUDMaCYBgLdO6MGywJjzZh0ChTopbhhSzPWwOjyyDbvi7NV
 12A8ZtMluLYoDeWKmGl2MSl/YhRQ8g1ehsW9DwBKm7KpMJag3wX1ik/Ydd8nozVI1E
 X5XL9UijXPslJ41pN4wn5VMHmissyk8cJhIaEeo8=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230504131106eucas1p208bc1dacf92ba853ae3e01f2a0d5443b~b8tFbB3l21552015520eucas1p2u;
 Thu,  4 May 2023 13:11:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 46.54.35386.AEEA3546; Thu,  4
 May 2023 14:11:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230504131106eucas1p1714e019395c941f51155c0e9ae52a66b~b8tFFTwoi0733607336eucas1p1v;
 Thu,  4 May 2023 13:11:06 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230504131106eusmtrp1ae21abc6840aaef53bc1834aa4ec3df0~b8tFEmUTM2656226562eusmtrp1Y;
 Thu,  4 May 2023 13:11:06 +0000 (GMT)
X-AuditID: cbfec7f4-cdfff70000028a3a-7e-6453aeea7eae
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 5F.0E.14344.AEEA3546; Thu,  4
 May 2023 14:11:06 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230504131105eusmtip139f214decce03ee2f3c11626363ea75c~b8tEkVbDi2036220362eusmtip1V;
 Thu,  4 May 2023 13:11:05 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v4 2/5] igb: rename E1000E_RingInfo_st
Date: Thu,  4 May 2023 15:10:52 +0200
Message-Id: <20230504131055.11767-3-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504131055.11767-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduznOd1X64JTDO69VrP4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFFc
 NimpOZllqUX6dglcGbenXWEtOG9asabzI2MD40GtLkZODgkBE4l3r38wgthCAisYJR5cd+hi
 5AKyvzBKHPu0ggnC+cwoMfFUKxNMx9SrZ6ESyxkl1ty7ywbhtDNJPJz5AKyKTcBM4tGXeaxd
 jBwcIgLGEh/bxUHCzAKpEkf/HGQBsYWBSm7O+8UIUsIioCpx4agPSJhXwFniwINzzBC75CVm
 XvrODmJzCrhIbJk2gRWiRlDi5MwnLBAj5SWat85mBjlBQmALh8Sq21fZQGZKADVMecULMUdY
 4tXxLewQtozE6ck9LBB2ucTPs9vYIXpbGCX2TJ0MVWQtcWnrT7DzmQU0Jdbv0ocY6Shx/WE6
 hMknceOtIMQFfBKTtk1nhgjzSnS0CUHM0JH4tmkm1C1SEgtv1EGEPSTmHdjOOIFRcRaSV2Yh
 eWUWwtYFjMyrGMVTS4tz01OLjfJSy/WKE3OLS/PS9ZLzczcxAhPL6X/Hv+xgXP7qo94hRiYO
 xkOMEhzMSiK8Hwr9UoR4UxIrq1KL8uOLSnNSiw8xSnOwKInzatueTBYSSE8sSc1OTS1ILYLJ
 MnFwSjUw+VvP3Z6sxVhpZnC5YFqXxvZ1z+6/nKW1fNP+S1umKcyY3ZH099SOGzVnJvWGM+wM
 uzhJa05j6/pGnw0/JbYXOKrw37vxbv/lb0JJbPw7LMMZV9xe2GQkZVq/9VhDVc6+88frj7ts
 TLb4GTjvYviezlsb9prxaYcEiTgE9lXm6rxfn6QqvraslvlV7+cdycdea/Ju5OWZHHrg4Uun
 RQKrVRuEE3e+zJ6/oX/X2Un+Gi17/pd0uh7Z76N5wzjAgCPMoXRWq0y6UFPXu7Zc0xOWod0t
 U79qL1ugxJT4ytmnsNZHepuIWalJn+kykyj2qNcpPEGPp4XuacuXuu7NfZDzxVd59nVad8tZ
 mgqMOBqUWIozEg21mIuKEwEaZ0wkmwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFLMWRmVeSWpSXmKPExsVy+t/xu7qv1gWnGFx9LGDx+dRadotllz4z
 WTTOn8NqsfXqD3aL4707WCx6N71gcmDzOPH2IKvHhUfnmD2eXNvM5PF+31U2j74tqxgDWKP0
 bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0Mm5Pu8Ja
 cN60Yk3nR8YGxoNaXYycHBICJhJTr55l6mLk4hASWMooceTNDGaIhJTEvp7/7BC2sMSfa11s
 EEWtTBJ/LzSxgCTYBMwkHn2Zx9rFyMEhImAq8WyvJEiYWSBT4vSrfWwgtjBQyc15vxhBSlgE
 VCUuHPUBCfMKOEsceHAOapW8xMxL38FWcQq4SGyZNoEVxBYCqjlx/AcbRL2gxMmZT1ggxstL
 NG+dzTyBUWAWktQsJKkFjEyrGEVSS4tz03OLjfSKE3OLS/PS9ZLzczcxAiNh27GfW3Ywrnz1
 Ue8QIxMH4yFGCQ5mJRHeD4V+KUK8KYmVValF+fFFpTmpxYcYTYHOnsgsJZqcD4zFvJJ4QzMD
 U0MTM0sDU0szYyVxXs+CjkQhgfTEktTs1NSC1CKYPiYOTqkGpjr3y9rKOYdsZxuK11x6FXzB
 ZJf0QcuLi7J471bcvPdC67F6KutFtQsZh1Q+ZX39xij40KA262TiVjHlXWnB3300pyg799zi
 fxc9kWPfkxVLOZUXyehP+Gv94ktt9OFt5zbc6Vt6y2rSgqAonj2Hn+dvep/R/eVNxCRxo22T
 iouUxXin9V1cfGpN90EulaPLQ3/ar9lfFdd1I9nxb/2Uw18DVvmc3FXA6tbyuSArcdVCftvU
 Q6JXDGsKbmS0PdyVeUH7curLsz9s82fMSLUpKo6eOUE1l83o9GGJdTeS0puT/3x65ttqIrXQ
 MMns54/DdR4ak7oqZm5ibM/8He15NDJkRscFy91hBumx7X+l2pVYijMSDbWYi4oTAUnYcOIN
 AwAA
X-CMS-MailID: 20230504131106eucas1p1714e019395c941f51155c0e9ae52a66b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230504131106eucas1p1714e019395c941f51155c0e9ae52a66b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230504131106eucas1p1714e019395c941f51155c0e9ae52a66b
References: <20230504131055.11767-1-t.dzieciol@partner.samsung.com>
 <CGME20230504131106eucas1p1714e019395c941f51155c0e9ae52a66b@eucas1p1.samsung.com>
Received-SPF: none client-ip=210.118.77.12;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Rename E1000E_RingInfo_st and E1000E_RingInfo according to qemu typdefs guide.

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/igb_core.c | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 012eb1e1b9..b6031dea24 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -694,24 +694,24 @@ static uint32_t igb_rx_wb_eic(IGBCore *core, int queue_idx)
     return (ent & E1000_IVAR_VALID) ? BIT(ent & 0x1f) : 0;
 }
 
-typedef struct E1000E_RingInfo_st {
+typedef struct E1000ERingInfo {
     int dbah;
     int dbal;
     int dlen;
     int dh;
     int dt;
     int idx;
-} E1000E_RingInfo;
+} E1000ERingInfo;
 
 static inline bool
-igb_ring_empty(IGBCore *core, const E1000E_RingInfo *r)
+igb_ring_empty(IGBCore *core, const E1000ERingInfo *r)
 {
     return core->mac[r->dh] == core->mac[r->dt] ||
                 core->mac[r->dt] >= core->mac[r->dlen] / E1000_RING_DESC_LEN;
 }
 
 static inline uint64_t
-igb_ring_base(IGBCore *core, const E1000E_RingInfo *r)
+igb_ring_base(IGBCore *core, const E1000ERingInfo *r)
 {
     uint64_t bah = core->mac[r->dbah];
     uint64_t bal = core->mac[r->dbal];
@@ -720,13 +720,13 @@ igb_ring_base(IGBCore *core, const E1000E_RingInfo *r)
 }
 
 static inline uint64_t
-igb_ring_head_descr(IGBCore *core, const E1000E_RingInfo *r)
+igb_ring_head_descr(IGBCore *core, const E1000ERingInfo *r)
 {
     return igb_ring_base(core, r) + E1000_RING_DESC_LEN * core->mac[r->dh];
 }
 
 static inline void
-igb_ring_advance(IGBCore *core, const E1000E_RingInfo *r, uint32_t count)
+igb_ring_advance(IGBCore *core, const E1000ERingInfo *r, uint32_t count)
 {
     core->mac[r->dh] += count;
 
@@ -736,7 +736,7 @@ igb_ring_advance(IGBCore *core, const E1000E_RingInfo *r, uint32_t count)
 }
 
 static inline uint32_t
-igb_ring_free_descr_num(IGBCore *core, const E1000E_RingInfo *r)
+igb_ring_free_descr_num(IGBCore *core, const E1000ERingInfo *r)
 {
     trace_e1000e_ring_free_space(r->idx, core->mac[r->dlen],
                                  core->mac[r->dh],  core->mac[r->dt]);
@@ -755,13 +755,13 @@ igb_ring_free_descr_num(IGBCore *core, const E1000E_RingInfo *r)
 }
 
 static inline bool
-igb_ring_enabled(IGBCore *core, const E1000E_RingInfo *r)
+igb_ring_enabled(IGBCore *core, const E1000ERingInfo *r)
 {
     return core->mac[r->dlen] > 0;
 }
 
 typedef struct IGB_TxRing_st {
-    const E1000E_RingInfo *i;
+    const E1000ERingInfo *i;
     struct igb_tx *tx;
 } IGB_TxRing;
 
@@ -774,7 +774,7 @@ igb_mq_queue_idx(int base_reg_idx, int reg_idx)
 static inline void
 igb_tx_ring_init(IGBCore *core, IGB_TxRing *txr, int idx)
 {
-    static const E1000E_RingInfo i[IGB_NUM_QUEUES] = {
+    static const E1000ERingInfo i[IGB_NUM_QUEUES] = {
         { TDBAH0, TDBAL0, TDLEN0, TDH0, TDT0, 0 },
         { TDBAH1, TDBAL1, TDLEN1, TDH1, TDT1, 1 },
         { TDBAH2, TDBAL2, TDLEN2, TDH2, TDT2, 2 },
@@ -800,13 +800,13 @@ igb_tx_ring_init(IGBCore *core, IGB_TxRing *txr, int idx)
 }
 
 typedef struct E1000E_RxRing_st {
-    const E1000E_RingInfo *i;
+    const E1000ERingInfo *i;
 } E1000E_RxRing;
 
 static inline void
 igb_rx_ring_init(IGBCore *core, E1000E_RxRing *rxr, int idx)
 {
-    static const E1000E_RingInfo i[IGB_NUM_QUEUES] = {
+    static const E1000ERingInfo i[IGB_NUM_QUEUES] = {
         { RDBAH0, RDBAL0, RDLEN0, RDH0, RDT0, 0 },
         { RDBAH1, RDBAL1, RDLEN1, RDH1, RDT1, 1 },
         { RDBAH2, RDBAL2, RDLEN2, RDH2, RDT2, 2 },
@@ -833,7 +833,7 @@ igb_rx_ring_init(IGBCore *core, E1000E_RxRing *rxr, int idx)
 static uint32_t
 igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
                      union e1000_adv_tx_desc *tx_desc,
-                     const E1000E_RingInfo *txi)
+                     const E1000ERingInfo *txi)
 {
     PCIDevice *d;
     uint32_t cmd_type_len = le32_to_cpu(tx_desc->read.cmd_type_len);
@@ -866,7 +866,7 @@ igb_txdesc_writeback(IGBCore *core, dma_addr_t base,
 }
 
 static inline bool
-igb_tx_enabled(IGBCore *core, const E1000E_RingInfo *txi)
+igb_tx_enabled(IGBCore *core, const E1000ERingInfo *txi)
 {
     bool vmdq = core->mac[MRQC] & 1;
     uint16_t qn = txi->idx;
@@ -883,7 +883,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
     PCIDevice *d;
     dma_addr_t base;
     union e1000_adv_tx_desc desc;
-    const E1000E_RingInfo *txi = txr->i;
+    const E1000ERingInfo *txi = txr->i;
     uint32_t eic = 0;
 
     if (!igb_tx_enabled(core, txi)) {
@@ -918,7 +918,7 @@ igb_start_xmit(IGBCore *core, const IGB_TxRing *txr)
 }
 
 static uint32_t
-igb_rxbufsize(IGBCore *core, const E1000E_RingInfo *r)
+igb_rxbufsize(IGBCore *core, const E1000ERingInfo *r)
 {
     uint32_t srrctl = core->mac[E1000_SRRCTL(r->idx) >> 2];
     uint32_t bsizepkt = srrctl & E1000_SRRCTL_BSIZEPKT_MASK;
@@ -930,7 +930,7 @@ igb_rxbufsize(IGBCore *core, const E1000E_RingInfo *r)
 }
 
 static bool
-igb_has_rxbufs(IGBCore *core, const E1000E_RingInfo *r, size_t total_size)
+igb_has_rxbufs(IGBCore *core, const E1000ERingInfo *r, size_t total_size)
 {
     uint32_t bufs = igb_ring_free_descr_num(core, r);
     uint32_t bufsize = igb_rxbufsize(core, r);
@@ -1522,7 +1522,7 @@ igb_write_to_rx_buffers(IGBCore *core,
 }
 
 static void
-igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
+igb_update_rx_stats(IGBCore *core, const E1000ERingInfo *rxi,
                     size_t pkt_size, size_t pkt_fcs_size)
 {
     eth_pkt_types_e pkt_type = net_rx_pkt_get_packet_type(core->rx_pkt);
@@ -1540,7 +1540,7 @@ igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
 }
 
 static inline bool
-igb_rx_descr_threshold_hit(IGBCore *core, const E1000E_RingInfo *rxi)
+igb_rx_descr_threshold_hit(IGBCore *core, const E1000ERingInfo *rxi)
 {
     return igb_ring_free_descr_num(core, rxi) ==
            ((core->mac[E1000_SRRCTL(rxi->idx) >> 2] >> 20) & 31) * 16;
@@ -1562,7 +1562,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
     struct iovec *iov = net_rx_pkt_get_iovec(pkt);
     size_t size = net_rx_pkt_get_total_len(pkt);
     size_t total_size = size + e1000x_fcs_len(core->mac);
-    const E1000E_RingInfo *rxi = rxr->i;
+    const E1000ERingInfo *rxi = rxr->i;
     size_t bufsize = igb_rxbufsize(core, rxi);
 
     d = pcie_sriov_get_vf_at_index(core->owner, rxi->idx % 8);
@@ -1643,7 +1643,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
 }
 
 static bool
-igb_rx_strip_vlan(IGBCore *core, const E1000E_RingInfo *rxi)
+igb_rx_strip_vlan(IGBCore *core, const E1000ERingInfo *rxi)
 {
     if (core->mac[MRQC] & 1) {
         uint16_t pool = rxi->idx % IGB_NUM_VM_POOLS;
-- 
2.25.1


