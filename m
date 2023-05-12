Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98842700C31
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:44:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUwJ-0005Sd-Pe; Fri, 12 May 2023 11:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUwI-0005SU-0c
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:44:14 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUw0-0007jb-8e
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:44:13 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230512154350euoutp029c5c1f9a2a5ae85936479971110643ca~eb8t-rg2h0258602586euoutp02_
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 15:43:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230512154350euoutp029c5c1f9a2a5ae85936479971110643ca~eb8t-rg2h0258602586euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683906230;
 bh=EWsco+cJ7x7/FUF1IEPdzJA/MQGvkaw07RGP4KOVkTE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RShz7pdvN1nOE7+TLV4Li7m1Re7xx3HiCxGvEf8PqZM1gWe9bYIn1zbyswRttvT/E
 9vtUSCRfhA4x4EUn2CnjYt2Ya2p5S7yeeTcgxYo5KACdZ/PN4h3CRIoV12u9Yc1+G2
 VuJSeeX9zbr9ngcJH07bu673z3qi/zDBo82u797k=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230512154350eucas1p1cc604b6c42b2495c6d49eb81a99ce882~eb8t3ySaW3053030530eucas1p1A;
 Fri, 12 May 2023 15:43:50 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 3C.B0.37758.6BE5E546; Fri, 12
 May 2023 16:43:50 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230512154349eucas1p13a45e562689049eec9f7dbf225b682d0~eb8tOgyIa2348523485eucas1p10;
 Fri, 12 May 2023 15:43:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230512154349eusmtrp16d215e0174b5fb3a04ccedac9c3e2db6~eb8tOC9WT1998019980eusmtrp1z;
 Fri, 12 May 2023 15:43:49 +0000 (GMT)
X-AuditID: cbfec7f5-7ffff7000002937e-f4-645e5eb6acd9
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 81.73.10549.5BE5E546; Fri, 12
 May 2023 16:43:49 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230512154349eusmtip13b1e7d8dac3c87ae0308ccea9b93b8e4~eb8sr4bZD1630116301eusmtip1E;
 Fri, 12 May 2023 15:43:49 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v6 2/7] igb: rename E1000E_RingInfo_st
Date: Fri, 12 May 2023 17:43:30 +0200
Message-Id: <20230512154335.2536-3-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42LZduznOd1tcXEpBo//Clp8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1igu
 m5TUnMyy1CJ9uwSujAdHJjEXTIur+H9jHWsD40+vLkZODgkBE4mzb/pYuhi5OIQEVjBK3Luy
 lB3C+cIosXv9UjYI5zOjxIsZz1lgWhasb2KESCxnlGj938UM4bQzSbw7/JYJpIpNwEzi0Zd5
 rF2MHBwiAsYSH9vFQcLMAqkSR/8cBBskDFRyeEofmM0ioCrx98AsdhCbV8BJ4v6itWwQy+Ql
 Zl76zg4yhlPAWWLeCiGIEkGJkzOfsECMlJdo3job7AQJgS0cEkcnzAVbKyHgInH0WRLEGGGJ
 V8e3sEPYMhKnJ/dA/VIu8fPsNnaI3hZGiT1TJ0MVWUtc2voTbA6zgKbE+l36EGFHiZk3mxkh
 xvNJ3HgrCHECn8SkbdOZIcK8Eh1tQhDVOhLfNs1kgwhLSSy8UQcR9pC41XuYfQKj4iwkv8xC
 8ssshLULGJlXMYqnlhbnpqcWG+ellusVJ+YWl+al6yXn525iBCaX0/+Of93BuOLVR71DjEwc
 jIcYJTiYlUR43y6JThHiTUmsrEotyo8vKs1JLT7EKM3BoiTOq217MllIID2xJDU7NbUgtQgm
 y8TBKdXAtNb8MzP/yUOv19m1zqpl/8VjL8Akp9AbvmgHG+vVjSf+7F49ozHjrOi9v9rLZvsW
 KidVXU1L5BI2OTGhwOgayw23ds9VTm4+tgfOHurxTNF4s3Qtm8Y8Z5uKha2pq5+sYH51+2jw
 +lNHfzSWKhlwcXtLl5U9rgw8YKVZ92mB7Z+9+5p71WpmPNl4N2TJ1K7L7Sdm+eWvXh3pf/Zf
 m9XihI8fu2vn58lfi754bUP4jKmTp1f1Rd9+IvDo5h3r2pqkcqkS2++LX3348c9sp2fWbB1+
 nVq/xBBltbQXk7L2CjVZ9h9/76JrxJPMYB11XiPf1PC2/Rx+Ll2fd3ue7ZuVtf2ARXOt/s99
 lf///nx8WomlOCPRUIu5qDgRACdQrhqdAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFLMWRmVeSWpSXmKPExsVy+t/xu7pb4+JSDNonKVp8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1ig9
 m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jAdHJjEX
 TIur+H9jHWsD40+vLkZODgkBE4kF65sYuxi5OIQEljJK7Ft1nB0iISWxr+c/lC0s8edaFxtE
 USuTxJHls1lBEmwCZhKPvswDsjk4RARMJZ7tlQQJMwtkSpx+tY8NxBYGKjk8pY8FxGYRUJX4
 e2AW2ExeASeJ+4vWskHMl5eYeek7O8gYTgFniXkrhEDCQkAlN/sWMEGUC0qcnPmEBWK8vETz
 1tnMExgFZiFJzUKSWsDItIpRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwErYd+7l5B+O8Vx/1
 DjEycTAeYpTgYFYS4X27JDpFiDclsbIqtSg/vqg0J7X4EKMp0NkTmaVEk/OBsZhXEm9oZmBq
 aGJmaWBqaWasJM7rWdCRKCSQnliSmp2aWpBaBNPHxMEp1cDU8zhHvsizg6XlDNPXHzeOh/xd
 Yln9rUuJ8eCUukWnWh68v5BebtQp8En+7uFqseD3GpWfCj5dWPtDfsYkq4Ov+ds0S2tzzZWP
 v/19ekLCo/vME5l3zFiXeiDpvaC4wbXdSi+1jSWTjrFolwYkenjdYpJRP3LOqYz113yP5Nk3
 TQ/GSFfeaubUSp3Scqjfp/da756s2PLyb5d/ngh4qPNq6ep9zC9WTmDw3j4j6ZFcwrXPnYV7
 jvZNCtGKybxrvMjq3+7VbzKtjCT3rdqtHL7qsZijCVfLtjot2w/vWgstWqQ9PHp8qgRvLZ19
 zOHp139xWtySR1gONJyzu3Lp/W2XO128EfwiD70eh27dmvNdiaU4I9FQi7moOBEAe51eBQ0D
 AAA=
X-CMS-MailID: 20230512154349eucas1p13a45e562689049eec9f7dbf225b682d0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230512154349eucas1p13a45e562689049eec9f7dbf225b682d0
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230512154349eucas1p13a45e562689049eec9f7dbf225b682d0
References: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
 <CGME20230512154349eucas1p13a45e562689049eec9f7dbf225b682d0@eucas1p1.samsung.com>
Received-SPF: none client-ip=210.118.77.12;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout2.w1.samsung.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Rename E1000E_RingInfo_st and E1000E_RingInfo according to qemu typdefs guide.

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/e1000e_core.c | 34 +++++++++++++++++-----------------
 hw/net/igb_core.c    | 42 +++++++++++++++++++++---------------------
 2 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 78373d7db7..b2e54fe802 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -810,24 +810,24 @@ e1000e_txdesc_writeback(E1000ECore *core, dma_addr_t base,
     return e1000e_tx_wb_interrupt_cause(core, queue_idx);
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
-e1000e_ring_empty(E1000ECore *core, const E1000E_RingInfo *r)
+e1000e_ring_empty(E1000ECore *core, const E1000ERingInfo *r)
 {
     return core->mac[r->dh] == core->mac[r->dt] ||
                 core->mac[r->dt] >= core->mac[r->dlen] / E1000_RING_DESC_LEN;
 }
 
 static inline uint64_t
-e1000e_ring_base(E1000ECore *core, const E1000E_RingInfo *r)
+e1000e_ring_base(E1000ECore *core, const E1000ERingInfo *r)
 {
     uint64_t bah = core->mac[r->dbah];
     uint64_t bal = core->mac[r->dbal];
@@ -836,13 +836,13 @@ e1000e_ring_base(E1000ECore *core, const E1000E_RingInfo *r)
 }
 
 static inline uint64_t
-e1000e_ring_head_descr(E1000ECore *core, const E1000E_RingInfo *r)
+e1000e_ring_head_descr(E1000ECore *core, const E1000ERingInfo *r)
 {
     return e1000e_ring_base(core, r) + E1000_RING_DESC_LEN * core->mac[r->dh];
 }
 
 static inline void
-e1000e_ring_advance(E1000ECore *core, const E1000E_RingInfo *r, uint32_t count)
+e1000e_ring_advance(E1000ECore *core, const E1000ERingInfo *r, uint32_t count)
 {
     core->mac[r->dh] += count;
 
@@ -852,7 +852,7 @@ e1000e_ring_advance(E1000ECore *core, const E1000E_RingInfo *r, uint32_t count)
 }
 
 static inline uint32_t
-e1000e_ring_free_descr_num(E1000ECore *core, const E1000E_RingInfo *r)
+e1000e_ring_free_descr_num(E1000ECore *core, const E1000ERingInfo *r)
 {
     trace_e1000e_ring_free_space(r->idx, core->mac[r->dlen],
                                  core->mac[r->dh],  core->mac[r->dt]);
@@ -871,19 +871,19 @@ e1000e_ring_free_descr_num(E1000ECore *core, const E1000E_RingInfo *r)
 }
 
 static inline bool
-e1000e_ring_enabled(E1000ECore *core, const E1000E_RingInfo *r)
+e1000e_ring_enabled(E1000ECore *core, const E1000ERingInfo *r)
 {
     return core->mac[r->dlen] > 0;
 }
 
 static inline uint32_t
-e1000e_ring_len(E1000ECore *core, const E1000E_RingInfo *r)
+e1000e_ring_len(E1000ECore *core, const E1000ERingInfo *r)
 {
     return core->mac[r->dlen];
 }
 
 typedef struct E1000E_TxRing_st {
-    const E1000E_RingInfo *i;
+    const E1000ERingInfo *i;
     struct e1000e_tx *tx;
 } E1000E_TxRing;
 
@@ -896,7 +896,7 @@ e1000e_mq_queue_idx(int base_reg_idx, int reg_idx)
 static inline void
 e1000e_tx_ring_init(E1000ECore *core, E1000E_TxRing *txr, int idx)
 {
-    static const E1000E_RingInfo i[E1000E_NUM_QUEUES] = {
+    static const E1000ERingInfo i[E1000E_NUM_QUEUES] = {
         { TDBAH,  TDBAL,  TDLEN,  TDH,  TDT, 0 },
         { TDBAH1, TDBAL1, TDLEN1, TDH1, TDT1, 1 }
     };
@@ -908,13 +908,13 @@ e1000e_tx_ring_init(E1000ECore *core, E1000E_TxRing *txr, int idx)
 }
 
 typedef struct E1000E_RxRing_st {
-    const E1000E_RingInfo *i;
+    const E1000ERingInfo *i;
 } E1000E_RxRing;
 
 static inline void
 e1000e_rx_ring_init(E1000ECore *core, E1000E_RxRing *rxr, int idx)
 {
-    static const E1000E_RingInfo i[E1000E_NUM_QUEUES] = {
+    static const E1000ERingInfo i[E1000E_NUM_QUEUES] = {
         { RDBAH0, RDBAL0, RDLEN0, RDH0, RDT0, 0 },
         { RDBAH1, RDBAL1, RDLEN1, RDH1, RDT1, 1 }
     };
@@ -930,7 +930,7 @@ e1000e_start_xmit(E1000ECore *core, const E1000E_TxRing *txr)
     dma_addr_t base;
     struct e1000_tx_desc desc;
     bool ide = false;
-    const E1000E_RingInfo *txi = txr->i;
+    const E1000ERingInfo *txi = txr->i;
     uint32_t cause = E1000_ICS_TXQE;
 
     if (!(core->mac[TCTL] & E1000_TCTL_EN)) {
@@ -960,7 +960,7 @@ e1000e_start_xmit(E1000ECore *core, const E1000E_TxRing *txr)
 }
 
 static bool
-e1000e_has_rxbufs(E1000ECore *core, const E1000E_RingInfo *r,
+e1000e_has_rxbufs(E1000ECore *core, const E1000ERingInfo *r,
                   size_t total_size)
 {
     uint32_t bufs = e1000e_ring_free_descr_num(core, r);
@@ -1460,7 +1460,7 @@ e1000e_update_rx_stats(E1000ECore *core, size_t pkt_size, size_t pkt_fcs_size)
 }
 
 static inline bool
-e1000e_rx_descr_threshold_hit(E1000ECore *core, const E1000E_RingInfo *rxi)
+e1000e_rx_descr_threshold_hit(E1000ECore *core, const E1000ERingInfo *rxi)
 {
     return e1000e_ring_free_descr_num(core, rxi) ==
            e1000e_ring_len(core, rxi) >> core->rxbuf_min_shift;
@@ -1521,7 +1521,7 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
     struct iovec *iov = net_rx_pkt_get_iovec(pkt);
     size_t size = net_rx_pkt_get_total_len(pkt);
     size_t total_size = size + e1000x_fcs_len(core->mac);
-    const E1000E_RingInfo *rxi;
+    const E1000ERingInfo *rxi;
     size_t ps_hdr_len = 0;
     bool do_ps = e1000e_do_ps(core, pkt, &ps_hdr_len);
     bool is_first = true;
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


