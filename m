Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0038364B06
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:13:57 +0200 (CEST)
Received: from localhost ([::1]:56382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaHM-0005ZQ-9O
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZQ-0000Pa-D1; Mon, 19 Apr 2021 15:28:32 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:39969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZF-0005IH-5Y; Mon, 19 Apr 2021 15:28:32 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id D364921DB;
 Mon, 19 Apr 2021 15:28:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 19 Apr 2021 15:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=IO3jatR9SBcfm
 zQEnj43xGjAfCpBIopBD+hYP2tHoDs=; b=bX0zsKbS39qvbyqCYlh3VUCgWvs/4
 3GNdOmxuSHxza2PJxWS//D94LEHuutHarT0T26M3oMbz2qSgTyQLu6LfaIPxMvPm
 5gKW1OOBi0MBmUHOSYPRZw1MJendy25oEeo26gdI6BzGk9ZvQIPe1ngqyvKKFDl0
 GzMaC+kTLmbfdzFTnIHSxiJQDkDej1h7b8TwjNosLROoTrcBymRNsBhr9Pp2vxmi
 vLFz8c3V7d5b5uTwq6ickXmwgzEGKfAMAhxdqhsYj4AUOUXcOtU6pviL/OS1xfoY
 tbnofEZNGCGyWcXSC26BEZihzYTmCUhusD2ezWIj8g69+JlEYOO1uz2lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=IO3jatR9SBcfmzQEnj43xGjAfCpBIopBD+hYP2tHoDs=; b=gc7BHBBp
 FWFUGEQL6U577x3wvgaMSSQp8CRHd6pu64d936LUNSko6tgNmHKFizJ8pk+UBoH3
 6+MFY2m6t1ZMgJDK0ChdavTf8m1dY36eh2/qC6VXscSKgCxi9yrVaTPN478Hdhbj
 lRzv6NeS4CjY/gpp3275JC4jyXiYUiI+QjXUO8B88R755TZ77uwIsaCWeCWjdxCg
 o9hTQwhOjZ2KhjMqayNMehzddW9vo/VhS2aHPu0Ly/K3uuBrIT1LbnhStWUl5Lqt
 0V6Brgr7SX5r5bY8yNOC6yEdXJ16qSP8RN86yX07fj0h16DKDxl1b4dHM9AINdjB
 hQ7kY4QlO8yIug==
X-ME-Sender: <xms:ztl9YPQes7uHh9FpQ3PfCOpZlzhaIofK9qTR1ZLDFyZ4rJs3E00PKQ>
 <xme:ztl9YFX5ftwoe0GejqtmKHwTmzjruxOeh9IP5Pef0J6col2gsfhJ1LTLCNfMdw4fM
 f2iuCgQefVUp3mpm2U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ztl9YB8HT8ftrZRx0jxClTbyihEnJOOrXAtuEaOBGCY7n--EsbzIuQ>
 <xmx:ztl9YF1zW5IDB_g53FafRz3dOnuMX4DfDQqUg9RWUbc1AraPCHN4Bg>
 <xmx:ztl9YGfBhgGIdq414MKX04uyhkNP3DPFTRFAgeNWwEf9M3kOHiGxTQ>
 <xmx:ztl9YFxXVyM745xgzwILFpx5cLRLTG44G-DGHjSLOKKhnl_QXj38Bg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7FEEB1080057;
 Mon, 19 Apr 2021 15:28:13 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/14] hw/block/nvme: cache lba and ms sizes
Date: Mon, 19 Apr 2021 21:27:55 +0200
Message-Id: <20210419192801.62255-9-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

There is no need to look up the lba size and metadata size in the LBA
Format structure everytime we want to use it. And we use it a lot.

Cache the values in the NvmeNamespace and update them if the namespace
is formatted.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h     | 37 ++++-------------------------------
 hw/block/nvme-dif.c | 45 ++++++++++++++++++-------------------------
 hw/block/nvme-ns.c  | 26 +++++++++++++------------
 hw/block/nvme.c     | 47 ++++++++++++++++++---------------------------
 4 files changed, 56 insertions(+), 99 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index d9bee7e5a05c..dc065e57b509 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -109,6 +109,8 @@ typedef struct NvmeNamespace {
     int64_t      size;
     int64_t      mdata_offset;
     NvmeIdNs     id_ns;
+    NvmeLBAF     lbaf;
+    size_t       lbasz;
     const uint32_t *iocs;
     uint8_t      csi;
     uint16_t     status;
@@ -146,36 +148,14 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
     return 0;
 }
 
-static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
-{
-    NvmeIdNs *id_ns = &ns->id_ns;
-    return &id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
-}
-
-static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
-{
-    return nvme_ns_lbaf(ns)->ds;
-}
-
-/* convert an LBA to the equivalent in bytes */
 static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
 {
-    return lba << nvme_ns_lbads(ns);
-}
-
-static inline size_t nvme_lsize(NvmeNamespace *ns)
-{
-    return 1 << nvme_ns_lbads(ns);
-}
-
-static inline uint16_t nvme_msize(NvmeNamespace *ns)
-{
-    return nvme_ns_lbaf(ns)->ms;
+    return lba << ns->lbaf.ds;
 }
 
 static inline size_t nvme_m2b(NvmeNamespace *ns, uint64_t lba)
 {
-    return nvme_msize(ns) * lba;
+    return ns->lbaf.ms * lba;
 }
 
 static inline bool nvme_ns_ext(NvmeNamespace *ns)
@@ -183,15 +163,6 @@ static inline bool nvme_ns_ext(NvmeNamespace *ns)
     return !!NVME_ID_NS_FLBAS_EXTENDED(ns->id_ns.flbas);
 }
 
-/* calculate the number of LBAs that the namespace can accomodate */
-static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
-{
-    if (nvme_msize(ns)) {
-        return ns->size / (nvme_lsize(ns) + nvme_msize(ns));
-    }
-    return ns->size >> nvme_ns_lbads(ns);
-}
-
 static inline NvmeZoneState nvme_get_zone_state(NvmeZone *zone)
 {
     return zone->d.zs >> 4;
diff --git a/hw/block/nvme-dif.c b/hw/block/nvme-dif.c
index e269d275ebed..c72e43195abf 100644
--- a/hw/block/nvme-dif.c
+++ b/hw/block/nvme-dif.c
@@ -44,20 +44,18 @@ void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
                                  uint32_t reftag)
 {
     uint8_t *end = buf + len;
-    size_t lsize = nvme_lsize(ns);
-    size_t msize = nvme_msize(ns);
     int16_t pil = 0;
 
     if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-        pil = nvme_msize(ns) - sizeof(NvmeDifTuple);
+        pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
     }
 
-    trace_pci_nvme_dif_pract_generate_dif(len, lsize, lsize + pil, apptag,
-                                          reftag);
+    trace_pci_nvme_dif_pract_generate_dif(len, ns->lbasz, ns->lbasz + pil,
+                                          apptag, reftag);
 
-    for (; buf < end; buf += lsize, mbuf += msize) {
+    for (; buf < end; buf += ns->lbasz, mbuf += ns->lbaf.ms) {
         NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
-        uint16_t crc = crc_t10dif(0x0, buf, lsize);
+        uint16_t crc = crc_t10dif(0x0, buf, ns->lbasz);
 
         if (pil) {
             crc = crc_t10dif(crc, mbuf, pil);
@@ -98,7 +96,7 @@ static uint16_t nvme_dif_prchk(NvmeNamespace *ns, NvmeDifTuple *dif,
     }
 
     if (ctrl & NVME_RW_PRINFO_PRCHK_GUARD) {
-        uint16_t crc = crc_t10dif(0x0, buf, nvme_lsize(ns));
+        uint16_t crc = crc_t10dif(0x0, buf, ns->lbasz);
 
         if (pil) {
             crc = crc_t10dif(crc, mbuf, pil);
@@ -137,8 +135,6 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
                         uint16_t appmask, uint32_t reftag)
 {
     uint8_t *end = buf + len;
-    size_t lsize = nvme_lsize(ns);
-    size_t msize = nvme_msize(ns);
     int16_t pil = 0;
     uint16_t status;
 
@@ -148,12 +144,12 @@ uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
     }
 
     if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-        pil = nvme_msize(ns) - sizeof(NvmeDifTuple);
+        pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
     }
 
-    trace_pci_nvme_dif_check(NVME_RW_PRINFO(ctrl), lsize + pil);
+    trace_pci_nvme_dif_check(NVME_RW_PRINFO(ctrl), ns->lbasz + pil);
 
-    for (; buf < end; buf += lsize, mbuf += msize) {
+    for (; buf < end; buf += ns->lbasz, mbuf += ns->lbaf.ms) {
         NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
 
         status = nvme_dif_prchk(ns, dif, buf, mbuf, pil, ctrl, apptag,
@@ -176,20 +172,18 @@ uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
     BlockBackend *blk = ns->blkconf.blk;
     BlockDriverState *bs = blk_bs(blk);
 
-    size_t msize = nvme_msize(ns);
-    size_t lsize = nvme_lsize(ns);
     int64_t moffset = 0, offset = nvme_l2b(ns, slba);
     uint8_t *mbufp, *end;
     bool zeroed;
     int16_t pil = 0;
-    int64_t bytes = (mlen / msize) * lsize;
+    int64_t bytes = (mlen / ns->lbaf.ms) << ns->lbaf.ds;
     int64_t pnum = 0;
 
     Error *err = NULL;
 
 
     if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-        pil = nvme_msize(ns) - sizeof(NvmeDifTuple);
+        pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
     }
 
     do {
@@ -211,15 +205,15 @@ uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
 
         if (zeroed) {
             mbufp = mbuf + moffset;
-            mlen = (pnum / lsize) * msize;
+            mlen = (pnum >> ns->lbaf.ds) * ns->lbaf.ms;
             end = mbufp + mlen;
 
-            for (; mbufp < end; mbufp += msize) {
+            for (; mbufp < end; mbufp += ns->lbaf.ms) {
                 memset(mbufp + pil, 0xff, sizeof(NvmeDifTuple));
             }
         }
 
-        moffset += (pnum / lsize) * msize;
+        moffset += (pnum >> ns->lbaf.ds) * ns->lbaf.ms;
         offset += pnum;
     } while (pnum != bytes);
 
@@ -289,7 +283,7 @@ static void nvme_dif_rw_check_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (ctrl & NVME_RW_PRINFO_PRACT && nvme_msize(ns) == 8) {
+    if (ctrl & NVME_RW_PRINFO_PRACT && ns->lbaf.ms == 8) {
         goto out;
     }
 
@@ -393,8 +387,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
 
         if (pract) {
             uint8_t *mbuf, *end;
-            size_t msize = nvme_msize(ns);
-            int16_t pil = msize - sizeof(NvmeDifTuple);
+            int16_t pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
 
             status = nvme_check_prinfo(ns, ctrl, slba, reftag);
             if (status) {
@@ -415,7 +408,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
                 pil = 0;
             }
 
-            for (; mbuf < end; mbuf += msize) {
+            for (; mbuf < end; mbuf += ns->lbaf.ms) {
                 NvmeDifTuple *dif = (NvmeDifTuple *)(mbuf + pil);
 
                 dif->apptag = cpu_to_be16(apptag);
@@ -434,7 +427,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
         return NVME_NO_COMPLETE;
     }
 
-    if (nvme_ns_ext(ns) && !(pract && nvme_msize(ns) == 8)) {
+    if (nvme_ns_ext(ns) && !(pract && ns->lbaf.ms == 8)) {
         mapped_len += mlen;
     }
 
@@ -468,7 +461,7 @@ uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req)
     qemu_iovec_init(&ctx->mdata.iov, 1);
     qemu_iovec_add(&ctx->mdata.iov, ctx->mdata.bounce, mlen);
 
-    if (!(pract && nvme_msize(ns) == 8)) {
+    if (!(pract && ns->lbaf.ms == 8)) {
         status = nvme_bounce_mdata(n, ctx->mdata.bounce, ctx->mdata.iov.size,
                                    NVME_TX_DIRECTION_TO_DEVICE, req);
         if (status) {
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 35c146633223..2224b497e4b5 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -31,7 +31,10 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     BlockDriverInfo bdi;
     int npdg, nlbas, ret;
 
-    nlbas = nvme_ns_nlbas(ns);
+    ns->lbaf = id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
+    ns->lbasz = 1 << ns->lbaf.ds;
+
+    nlbas = ns->size / (ns->lbasz + ns->lbaf.ms);
 
     id_ns->nsze = cpu_to_le64(nlbas);
 
@@ -39,13 +42,13 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     id_ns->ncap = id_ns->nsze;
     id_ns->nuse = id_ns->ncap;
 
-    ns->mdata_offset = nvme_l2b(ns, nlbas);
+    ns->mdata_offset = (int64_t)nlbas << ns->lbaf.ds;
 
-    npdg = ns->blkconf.discard_granularity / nvme_lsize(ns);
+    npdg = ns->blkconf.discard_granularity / ns->lbasz;
 
     ret = bdrv_get_info(blk_bs(ns->blkconf.blk), &bdi);
     if (ret >= 0 && bdi.cluster_size > ns->blkconf.discard_granularity) {
-        npdg = bdi.cluster_size / nvme_lsize(ns);
+        npdg = bdi.cluster_size / ns->lbasz;
     }
 
     id_ns->npda = id_ns->npdg = npdg - 1;
@@ -163,7 +166,6 @@ static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
 static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
 {
     uint64_t zone_size, zone_cap;
-    uint32_t lbasz = nvme_lsize(ns);
 
     /* Make sure that the values of ZNS properties are sane */
     if (ns->params.zone_size_bs) {
@@ -181,14 +183,14 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
                    "zone size %"PRIu64"B", zone_cap, zone_size);
         return -1;
     }
-    if (zone_size < lbasz) {
+    if (zone_size < ns->lbasz) {
         error_setg(errp, "zone size %"PRIu64"B too small, "
-                   "must be at least %"PRIu32"B", zone_size, lbasz);
+                   "must be at least %zuB", zone_size, ns->lbasz);
         return -1;
     }
-    if (zone_cap < lbasz) {
+    if (zone_cap < ns->lbasz) {
         error_setg(errp, "zone capacity %"PRIu64"B too small, "
-                   "must be at least %"PRIu32"B", zone_cap, lbasz);
+                   "must be at least %zuB", zone_cap, ns->lbasz);
         return -1;
     }
 
@@ -196,9 +198,9 @@ static int nvme_ns_zoned_check_calc_geometry(NvmeNamespace *ns, Error **errp)
      * Save the main zone geometry values to avoid
      * calculating them later again.
      */
-    ns->zone_size = zone_size / lbasz;
-    ns->zone_capacity = zone_cap / lbasz;
-    ns->num_zones = nvme_ns_nlbas(ns) / ns->zone_size;
+    ns->zone_size = zone_size / ns->lbasz;
+    ns->zone_capacity = zone_cap / ns->lbasz;
+    ns->num_zones = le64_to_cpu(ns->id_ns.nsze) / ns->zone_size;
 
     /* Do a few more sanity checks of ZNS properties */
     if (!ns->num_zones) {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index bcef6038ae09..fcc0fe72dc33 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -506,9 +506,7 @@ static void nvme_sg_split(NvmeSg *sg, NvmeNamespace *ns, NvmeSg *data,
                           NvmeSg *mdata)
 {
     NvmeSg *dst = data;
-    size_t size = nvme_lsize(ns);
-    size_t msize = nvme_msize(ns);
-    uint32_t trans_len, count = size;
+    uint32_t trans_len, count = ns->lbasz;
     uint64_t offset = 0;
     bool dma = sg->flags & NVME_SG_DMA;
     size_t sge_len;
@@ -540,7 +538,7 @@ static void nvme_sg_split(NvmeSg *sg, NvmeNamespace *ns, NvmeSg *data,
 
         if (count == 0) {
             dst = (dst == data) ? mdata : data;
-            count = (dst == data) ? size : msize;
+            count = (dst == data) ? ns->lbasz : ns->lbaf.ms;
         }
 
         if (sge_len == offset) {
@@ -999,7 +997,7 @@ static uint16_t nvme_map_data(NvmeCtrl *n, uint32_t nlb, NvmeRequest *req)
     uint16_t status;
 
     if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps) &&
-        (ctrl & NVME_RW_PRINFO_PRACT && nvme_msize(ns) == 8)) {
+        (ctrl & NVME_RW_PRINFO_PRACT && ns->lbaf.ms == 8)) {
         goto out;
     }
 
@@ -1182,12 +1180,9 @@ uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     uint16_t ctrl = le16_to_cpu(rw->control);
 
     if (nvme_ns_ext(ns) &&
-        !(ctrl & NVME_RW_PRINFO_PRACT && nvme_msize(ns) == 8)) {
-        size_t lsize = nvme_lsize(ns);
-        size_t msize = nvme_msize(ns);
-
-        return nvme_tx_interleaved(n, &req->sg, ptr, len, lsize, msize, 0,
-                                   dir);
+        !(ctrl & NVME_RW_PRINFO_PRACT && ns->lbaf.ms == 8)) {
+        return nvme_tx_interleaved(n, &req->sg, ptr, len, ns->lbasz,
+                                   ns->lbaf.ms, 0, dir);
     }
 
     return nvme_tx(n, &req->sg, ptr, len, dir);
@@ -1200,11 +1195,8 @@ uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
     uint16_t status;
 
     if (nvme_ns_ext(ns)) {
-        size_t lsize = nvme_lsize(ns);
-        size_t msize = nvme_msize(ns);
-
-        return nvme_tx_interleaved(n, &req->sg, ptr, len, msize, lsize, lsize,
-                                   dir);
+        return nvme_tx_interleaved(n, &req->sg, ptr, len, ns->lbaf.ms,
+                                   ns->lbasz, ns->lbasz, dir);
     }
 
     nvme_sg_unmap(&req->sg);
@@ -1831,7 +1823,7 @@ static void nvme_rw_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (nvme_msize(ns)) {
+    if (ns->lbaf.ms) {
         NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
         uint64_t slba = le64_to_cpu(rw->slba);
         uint32_t nlb = (uint32_t)le16_to_cpu(rw->nlb) + 1;
@@ -2103,7 +2095,7 @@ static void nvme_aio_zone_reset_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (nvme_msize(ns)) {
+    if (ns->lbaf.ms) {
         int64_t offset = ns->mdata_offset + nvme_m2b(ns, zone->d.zslba);
 
         blk_aio_pwrite_zeroes(ns->blkconf.blk, offset,
@@ -2172,7 +2164,7 @@ static void nvme_copy_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (nvme_msize(ns)) {
+    if (ns->lbaf.ms) {
         NvmeCopyCmd *copy = (NvmeCopyCmd *)&req->cmd;
         uint64_t sdlba = le64_to_cpu(copy->sdlba);
         int64_t offset = ns->mdata_offset + nvme_m2b(ns, sdlba);
@@ -2386,7 +2378,6 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
         uint8_t *bufp;
         uint8_t *mbufp = ctx->mdata.bounce;
         uint8_t *end = mbufp + ctx->mdata.iov.size;
-        size_t msize = nvme_msize(ns);
         int16_t pil = 0;
 
         status = nvme_dif_check(ns, ctx->data.bounce, ctx->data.iov.size,
@@ -2402,11 +2393,11 @@ static void nvme_compare_mdata_cb(void *opaque, int ret)
          * tuple.
          */
         if (!(ns->id_ns.dps & NVME_ID_NS_DPS_FIRST_EIGHT)) {
-            pil = nvme_msize(ns) - sizeof(NvmeDifTuple);
+            pil = ns->lbaf.ms - sizeof(NvmeDifTuple);
         }
 
-        for (bufp = buf; mbufp < end; bufp += msize, mbufp += msize) {
-            if (memcmp(bufp + pil, mbufp + pil, msize - pil)) {
+        for (bufp = buf; mbufp < end; bufp += ns->lbaf.ms, mbufp += ns->lbaf.ms) {
+            if (memcmp(bufp + pil, mbufp + pil, ns->lbaf.ms - pil)) {
                 req->status = NVME_CMP_FAILURE;
                 goto out;
             }
@@ -2467,7 +2458,7 @@ static void nvme_compare_data_cb(void *opaque, int ret)
         goto out;
     }
 
-    if (nvme_msize(ns)) {
+    if (ns->lbaf.ms) {
         NvmeRwCmd *rw = (NvmeRwCmd *)&req->cmd;
         uint64_t slba = le64_to_cpu(rw->slba);
         uint32_t nlb = le16_to_cpu(rw->nlb) + 1;
@@ -2715,7 +2706,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
     }
 
     bounce = bouncep = g_malloc(nvme_l2b(ns, nlb));
-    if (nvme_msize(ns)) {
+    if (ns->lbaf.ms) {
         mbounce = mbouncep = g_malloc(nvme_m2b(ns, nlb));
     }
 
@@ -2751,7 +2742,7 @@ static uint16_t nvme_copy(NvmeCtrl *n, NvmeRequest *req)
 
         bouncep += len;
 
-        if (nvme_msize(ns)) {
+        if (ns->lbaf.ms) {
             len = nvme_m2b(ns, nlb);
             offset = ns->mdata_offset + nvme_m2b(ns, slba);
 
@@ -2922,7 +2913,7 @@ static uint16_t nvme_read(NvmeCtrl *n, NvmeRequest *req)
         if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
             bool pract = ctrl & NVME_RW_PRINFO_PRACT;
 
-            if (pract && nvme_msize(ns) == 8) {
+            if (pract && ns->lbaf.ms == 8) {
                 mapped_size = data_size;
             }
         }
@@ -2999,7 +2990,7 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         if (NVME_ID_NS_DPS_TYPE(ns->id_ns.dps)) {
             bool pract = ctrl & NVME_RW_PRINFO_PRACT;
 
-            if (pract && nvme_msize(ns) == 8) {
+            if (pract && ns->lbaf.ms == 8) {
                 mapped_size -= nvme_m2b(ns, nlb);
             }
         }
-- 
2.31.1


