Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EBF364B18
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:22:48 +0200 (CEST)
Received: from localhost ([::1]:44370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaPv-00040U-MY
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZH-0000Nk-0J; Mon, 19 Apr 2021 15:28:24 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:38873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ6-0005HB-GI; Mon, 19 Apr 2021 15:28:21 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 70A2921D6;
 Mon, 19 Apr 2021 15:28:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Apr 2021 15:28:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=FyWOe1hRBm8gk
 TjL9YzJ2+Obth5ZO1ha6nO+1udHwnA=; b=SjKfzcVXjgk3h+aO4NLZMqQAItCKv
 fy0mb2Prw+NzMFvNZJAyuMP4mqivdoc9J52zpIdoAPg2GnJwEInfurh5RdtPGy8e
 FW6cdudQkuzDToUKPlpvDS6wC3Z1MGXTPl/N/i8pNBr6rDMpN99lGNYcs4viNe8z
 dfQPg2tWkJIqJUgWBe3yz9u+b/O7SEJLXgyUmn0dt+VOPT5mksBcpSQMjllT2pDm
 TBDVrocCgXrJzrYLB3xJTxL5aBMgXZZRNIyjNB4Xx4OEwqkI0menbXgKmIysQK2V
 ccdAUjBj1l/KcwAcMxNpd55nLC2Os19hFQZ0EWH2llgAjQgIMBfP+ZY4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=FyWOe1hRBm8gkTjL9YzJ2+Obth5ZO1ha6nO+1udHwnA=; b=Dnet0nVf
 nMxXfKc8eCjUYEYZ2Mebg8z+0YfDGm2gUcNB7NccTWIB/+eDMPuoE9+Ub+iQsySg
 wKSHmCWjDJea4fNCrq1uQNPTZN0IWCOc4nTjA0LFOOc3K3TGR6Kbxge2dOvvfMLp
 sNR7W5I3ZVhMfxNDeAwvYDhOMmyBguLgUcwQ57VbEf6s7Mm7zDVdlcoPkgknpV01
 NNhAhjl8l3MQTEkCs93/Kt/JAHzo5SB6IY6OF+BKX5zxM/KeTaAbYVeOJiKYN/8P
 Ou3AK2IMgq71GVURJVSPRZzTcnilJ+OWv/f73eGg7ZpOstiEQtxVTwciKEhQg2sp
 Jpr5aNaIvsiNDA==
X-ME-Sender: <xms:ydl9YA49GWX7Y5XEFwFoWAVthRCWqoFc6TCLGxchDgADb5JMykGevg>
 <xme:ydl9YP3aunvYLVdmYD2wuhu5SKCAAu8Z13VoLZ4fkA2cZRNj46cTInugEb4MghhmT
 ONiNolXmSBCi_itN1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ydl9YBzN-83i8VN_elK8apWG72MZqHDPJtMHRwq12BaIieQH9dd6ow>
 <xmx:ydl9YJvXEJUsWcyixFPGbNJJsAWEpFt2ukk35sNALC13bnSxjiSZqg>
 <xmx:ydl9YLx-sqpAmzq6uDlGYN7FTCfrVo6-utO2eDwz5TNBd_oRz3dI9A>
 <xmx:ytl9YIYkJIE71JjnroC1Kdy6BAwWoAWPDaPjqfhFYxAzpBpDmPmCyw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id CD98E108006A;
 Mon, 19 Apr 2021 15:28:08 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/14] hw/block/nvme: consolidate header files
Date: Mon, 19 Apr 2021 21:27:51 +0200
Message-Id: <20210419192801.62255-5-its@irrelevant.dk>
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

In preparation for moving the nvme device into its own subtree, merge
the header files into one.

Also add missing copyright notice and add list of authors with
substantial contributions.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-dif.h    |  63 -------
 hw/block/nvme-ns.h     | 229 ------------------------
 hw/block/nvme-subsys.h |  59 -------
 hw/block/nvme.h        | 383 +++++++++++++++++++++++++++++++++++++----
 hw/block/nvme-dif.c    |   1 -
 hw/block/nvme-ns.c     |   1 -
 hw/block/nvme-subsys.c |   1 -
 hw/block/nvme.c        |   2 -
 8 files changed, 348 insertions(+), 391 deletions(-)
 delete mode 100644 hw/block/nvme-dif.h
 delete mode 100644 hw/block/nvme-ns.h
 delete mode 100644 hw/block/nvme-subsys.h

diff --git a/hw/block/nvme-dif.h b/hw/block/nvme-dif.h
deleted file mode 100644
index 524faffbd7a0..000000000000
--- a/hw/block/nvme-dif.h
+++ /dev/null
@@ -1,63 +0,0 @@
-/*
- * QEMU NVM Express End-to-End Data Protection support
- *
- * Copyright (c) 2021 Samsung Electronics Co., Ltd.
- *
- * Authors:
- *   Klaus Jensen           <k.jensen@samsung.com>
- *   Gollu Appalanaidu      <anaidu.gollu@samsung.com>
- */
-
-#ifndef HW_NVME_DIF_H
-#define HW_NVME_DIF_H
-
-/* from Linux kernel (crypto/crct10dif_common.c) */
-static const uint16_t t10_dif_crc_table[256] = {
-    0x0000, 0x8BB7, 0x9CD9, 0x176E, 0xB205, 0x39B2, 0x2EDC, 0xA56B,
-    0xEFBD, 0x640A, 0x7364, 0xF8D3, 0x5DB8, 0xD60F, 0xC161, 0x4AD6,
-    0x54CD, 0xDF7A, 0xC814, 0x43A3, 0xE6C8, 0x6D7F, 0x7A11, 0xF1A6,
-    0xBB70, 0x30C7, 0x27A9, 0xAC1E, 0x0975, 0x82C2, 0x95AC, 0x1E1B,
-    0xA99A, 0x222D, 0x3543, 0xBEF4, 0x1B9F, 0x9028, 0x8746, 0x0CF1,
-    0x4627, 0xCD90, 0xDAFE, 0x5149, 0xF422, 0x7F95, 0x68FB, 0xE34C,
-    0xFD57, 0x76E0, 0x618E, 0xEA39, 0x4F52, 0xC4E5, 0xD38B, 0x583C,
-    0x12EA, 0x995D, 0x8E33, 0x0584, 0xA0EF, 0x2B58, 0x3C36, 0xB781,
-    0xD883, 0x5334, 0x445A, 0xCFED, 0x6A86, 0xE131, 0xF65F, 0x7DE8,
-    0x373E, 0xBC89, 0xABE7, 0x2050, 0x853B, 0x0E8C, 0x19E2, 0x9255,
-    0x8C4E, 0x07F9, 0x1097, 0x9B20, 0x3E4B, 0xB5FC, 0xA292, 0x2925,
-    0x63F3, 0xE844, 0xFF2A, 0x749D, 0xD1F6, 0x5A41, 0x4D2F, 0xC698,
-    0x7119, 0xFAAE, 0xEDC0, 0x6677, 0xC31C, 0x48AB, 0x5FC5, 0xD472,
-    0x9EA4, 0x1513, 0x027D, 0x89CA, 0x2CA1, 0xA716, 0xB078, 0x3BCF,
-    0x25D4, 0xAE63, 0xB90D, 0x32BA, 0x97D1, 0x1C66, 0x0B08, 0x80BF,
-    0xCA69, 0x41DE, 0x56B0, 0xDD07, 0x786C, 0xF3DB, 0xE4B5, 0x6F02,
-    0x3AB1, 0xB106, 0xA668, 0x2DDF, 0x88B4, 0x0303, 0x146D, 0x9FDA,
-    0xD50C, 0x5EBB, 0x49D5, 0xC262, 0x6709, 0xECBE, 0xFBD0, 0x7067,
-    0x6E7C, 0xE5CB, 0xF2A5, 0x7912, 0xDC79, 0x57CE, 0x40A0, 0xCB17,
-    0x81C1, 0x0A76, 0x1D18, 0x96AF, 0x33C4, 0xB873, 0xAF1D, 0x24AA,
-    0x932B, 0x189C, 0x0FF2, 0x8445, 0x212E, 0xAA99, 0xBDF7, 0x3640,
-    0x7C96, 0xF721, 0xE04F, 0x6BF8, 0xCE93, 0x4524, 0x524A, 0xD9FD,
-    0xC7E6, 0x4C51, 0x5B3F, 0xD088, 0x75E3, 0xFE54, 0xE93A, 0x628D,
-    0x285B, 0xA3EC, 0xB482, 0x3F35, 0x9A5E, 0x11E9, 0x0687, 0x8D30,
-    0xE232, 0x6985, 0x7EEB, 0xF55C, 0x5037, 0xDB80, 0xCCEE, 0x4759,
-    0x0D8F, 0x8638, 0x9156, 0x1AE1, 0xBF8A, 0x343D, 0x2353, 0xA8E4,
-    0xB6FF, 0x3D48, 0x2A26, 0xA191, 0x04FA, 0x8F4D, 0x9823, 0x1394,
-    0x5942, 0xD2F5, 0xC59B, 0x4E2C, 0xEB47, 0x60F0, 0x779E, 0xFC29,
-    0x4BA8, 0xC01F, 0xD771, 0x5CC6, 0xF9AD, 0x721A, 0x6574, 0xEEC3,
-    0xA415, 0x2FA2, 0x38CC, 0xB37B, 0x1610, 0x9DA7, 0x8AC9, 0x017E,
-    0x1F65, 0x94D2, 0x83BC, 0x080B, 0xAD60, 0x26D7, 0x31B9, 0xBA0E,
-    0xF0D8, 0x7B6F, 0x6C01, 0xE7B6, 0x42DD, 0xC96A, 0xDE04, 0x55B3
-};
-
-uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint16_t ctrl, uint64_t slba,
-                           uint32_t reftag);
-uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
-                               uint64_t slba);
-void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
-                                 uint8_t *mbuf, size_t mlen, uint16_t apptag,
-                                 uint32_t reftag);
-uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
-                        uint8_t *mbuf, size_t mlen, uint16_t ctrl,
-                        uint64_t slba, uint16_t apptag,
-                        uint16_t appmask, uint32_t reftag);
-uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req);
-
-#endif /* HW_NVME_DIF_H */
diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
deleted file mode 100644
index fb0a41f912e7..000000000000
--- a/hw/block/nvme-ns.h
+++ /dev/null
@@ -1,229 +0,0 @@
-/*
- * QEMU NVM Express Virtual Namespace
- *
- * Copyright (c) 2019 CNEX Labs
- * Copyright (c) 2020 Samsung Electronics
- *
- * Authors:
- *  Klaus Jensen      <k.jensen@samsung.com>
- *
- * This work is licensed under the terms of the GNU GPL, version 2. See the
- * COPYING file in the top-level directory.
- *
- */
-
-#ifndef NVME_NS_H
-#define NVME_NS_H
-
-#include "qemu/uuid.h"
-
-#define TYPE_NVME_NS "nvme-ns"
-#define NVME_NS(obj) \
-    OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
-
-typedef struct NvmeZone {
-    NvmeZoneDescr   d;
-    uint64_t        w_ptr;
-    QTAILQ_ENTRY(NvmeZone) entry;
-} NvmeZone;
-
-typedef struct NvmeNamespaceParams {
-    bool     detached;
-    bool     shared;
-    uint32_t nsid;
-    QemuUUID uuid;
-
-    uint16_t ms;
-    uint8_t  mset;
-    uint8_t  pi;
-    uint8_t  pil;
-
-    uint16_t mssrl;
-    uint32_t mcl;
-    uint8_t  msrc;
-
-    bool     zoned;
-    bool     cross_zone_read;
-    uint64_t zone_size_bs;
-    uint64_t zone_cap_bs;
-    uint32_t max_active_zones;
-    uint32_t max_open_zones;
-    uint32_t zd_extension_size;
-} NvmeNamespaceParams;
-
-typedef struct NvmeNamespace {
-    DeviceState  parent_obj;
-    BlockConf    blkconf;
-    int32_t      bootindex;
-    int64_t      size;
-    int64_t      mdata_offset;
-    NvmeIdNs     id_ns;
-    const uint32_t *iocs;
-    uint8_t      csi;
-    uint16_t     status;
-    int          attached;
-
-    QTAILQ_ENTRY(NvmeNamespace) entry;
-
-    NvmeIdNsZoned   *id_ns_zoned;
-    NvmeZone        *zone_array;
-    QTAILQ_HEAD(, NvmeZone) exp_open_zones;
-    QTAILQ_HEAD(, NvmeZone) imp_open_zones;
-    QTAILQ_HEAD(, NvmeZone) closed_zones;
-    QTAILQ_HEAD(, NvmeZone) full_zones;
-    uint32_t        num_zones;
-    uint64_t        zone_size;
-    uint64_t        zone_capacity;
-    uint32_t        zone_size_log2;
-    uint8_t         *zd_extensions;
-    int32_t         nr_open_zones;
-    int32_t         nr_active_zones;
-
-    NvmeNamespaceParams params;
-
-    struct {
-        uint32_t err_rec;
-    } features;
-} NvmeNamespace;
-
-static inline uint16_t nvme_ns_status(NvmeNamespace *ns)
-{
-    return ns->status;
-}
-
-static inline uint32_t nvme_nsid(NvmeNamespace *ns)
-{
-    if (ns) {
-        return ns->params.nsid;
-    }
-
-    return 0;
-}
-
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
-static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
-{
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
-}
-
-static inline size_t nvme_m2b(NvmeNamespace *ns, uint64_t lba)
-{
-    return nvme_msize(ns) * lba;
-}
-
-static inline bool nvme_ns_ext(NvmeNamespace *ns)
-{
-    return !!NVME_ID_NS_FLBAS_EXTENDED(ns->id_ns.flbas);
-}
-
-/* calculate the number of LBAs that the namespace can accomodate */
-static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
-{
-    if (nvme_msize(ns)) {
-        return ns->size / (nvme_lsize(ns) + nvme_msize(ns));
-    }
-    return ns->size >> nvme_ns_lbads(ns);
-}
-
-typedef struct NvmeCtrl NvmeCtrl;
-
-static inline NvmeZoneState nvme_get_zone_state(NvmeZone *zone)
-{
-    return zone->d.zs >> 4;
-}
-
-static inline void nvme_set_zone_state(NvmeZone *zone, NvmeZoneState state)
-{
-    zone->d.zs = state << 4;
-}
-
-static inline uint64_t nvme_zone_rd_boundary(NvmeNamespace *ns, NvmeZone *zone)
-{
-    return zone->d.zslba + ns->zone_size;
-}
-
-static inline uint64_t nvme_zone_wr_boundary(NvmeZone *zone)
-{
-    return zone->d.zslba + zone->d.zcap;
-}
-
-static inline bool nvme_wp_is_valid(NvmeZone *zone)
-{
-    uint8_t st = nvme_get_zone_state(zone);
-
-    return st != NVME_ZONE_STATE_FULL &&
-           st != NVME_ZONE_STATE_READ_ONLY &&
-           st != NVME_ZONE_STATE_OFFLINE;
-}
-
-static inline uint8_t *nvme_get_zd_extension(NvmeNamespace *ns,
-                                             uint32_t zone_idx)
-{
-    return &ns->zd_extensions[zone_idx * ns->params.zd_extension_size];
-}
-
-static inline void nvme_aor_inc_open(NvmeNamespace *ns)
-{
-    assert(ns->nr_open_zones >= 0);
-    if (ns->params.max_open_zones) {
-        ns->nr_open_zones++;
-        assert(ns->nr_open_zones <= ns->params.max_open_zones);
-    }
-}
-
-static inline void nvme_aor_dec_open(NvmeNamespace *ns)
-{
-    if (ns->params.max_open_zones) {
-        assert(ns->nr_open_zones > 0);
-        ns->nr_open_zones--;
-    }
-    assert(ns->nr_open_zones >= 0);
-}
-
-static inline void nvme_aor_inc_active(NvmeNamespace *ns)
-{
-    assert(ns->nr_active_zones >= 0);
-    if (ns->params.max_active_zones) {
-        ns->nr_active_zones++;
-        assert(ns->nr_active_zones <= ns->params.max_active_zones);
-    }
-}
-
-static inline void nvme_aor_dec_active(NvmeNamespace *ns)
-{
-    if (ns->params.max_active_zones) {
-        assert(ns->nr_active_zones > 0);
-        ns->nr_active_zones--;
-        assert(ns->nr_active_zones >= ns->nr_open_zones);
-    }
-    assert(ns->nr_active_zones >= 0);
-}
-
-void nvme_ns_init_format(NvmeNamespace *ns);
-int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
-void nvme_ns_drain(NvmeNamespace *ns);
-void nvme_ns_shutdown(NvmeNamespace *ns);
-void nvme_ns_cleanup(NvmeNamespace *ns);
-
-#endif /* NVME_NS_H */
diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
deleted file mode 100644
index 7d7ef5f7f12b..000000000000
--- a/hw/block/nvme-subsys.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/*
- * QEMU NVM Express Subsystem: nvme-subsys
- *
- * Copyright (c) 2021 Minwoo Im <minwoo.im.dev@gmail.com>
- *
- * This code is licensed under the GNU GPL v2.  Refer COPYING.
- */
-
-#ifndef NVME_SUBSYS_H
-#define NVME_SUBSYS_H
-
-#define TYPE_NVME_SUBSYS "nvme-subsys"
-#define NVME_SUBSYS(obj) \
-    OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
-
-#define NVME_SUBSYS_MAX_CTRLS   32
-#define NVME_MAX_NAMESPACES     256
-
-typedef struct NvmeCtrl NvmeCtrl;
-typedef struct NvmeNamespace NvmeNamespace;
-typedef struct NvmeSubsystem {
-    DeviceState parent_obj;
-    uint8_t     subnqn[256];
-
-    NvmeCtrl    *ctrls[NVME_SUBSYS_MAX_CTRLS];
-    /* Allocated namespaces for this subsystem */
-    NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
-
-    struct {
-        char *nqn;
-    } params;
-} NvmeSubsystem;
-
-int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
-
-static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
-        uint32_t cntlid)
-{
-    if (!subsys || cntlid >= NVME_SUBSYS_MAX_CTRLS) {
-        return NULL;
-    }
-
-    return subsys->ctrls[cntlid];
-}
-
-/*
- * Return allocated namespace of the specified nsid in the subsystem.
- */
-static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
-        uint32_t nsid)
-{
-    if (!subsys || !nsid || nsid > NVME_MAX_NAMESPACES) {
-        return NULL;
-    }
-
-    return subsys->namespaces[nsid];
-}
-
-#endif /* NVME_SUBSYS_H */
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 5d05ec368f7a..d9374d3e33e0 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -1,28 +1,281 @@
+/*
+ * QEMU NVM Express
+ *
+ * Copyright (c) 2012 Intel Corporation
+ * Copyright (c) 2021 Minwoo Im
+ * Copyright (c) 2021 Samsung Electronics Co., Ltd.
+ *
+ * Authors:
+ *   Keith Busch            <kbusch@kernel.org>
+ *   Klaus Jensen           <k.jensen@samsung.com>
+ *   Gollu Appalanaidu      <anaidu.gollu@samsung.com>
+ *   Dmitry Fomichev        <dmitry.fomichev@wdc.com>
+ *   Minwoo Im              <minwoo.im.dev@gmail.com>
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ */
+
 #ifndef HW_NVME_H
 #define HW_NVME_H
 
-#include "block/nvme.h"
+#include "qemu/uuid.h"
 #include "hw/pci/pci.h"
-#include "nvme-subsys.h"
-#include "nvme-ns.h"
+#include "hw/block/block.h"
+
+#include "block/nvme.h"
 
 #define NVME_DEFAULT_ZONE_SIZE   (128 * MiB)
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
+#define NVME_MAX_CONTROLLERS 32
+#define NVME_MAX_NAMESPACES  256
 
-typedef struct NvmeParams {
-    char     *serial;
-    uint32_t num_queues; /* deprecated since 5.1 */
-    uint32_t max_ioqpairs;
-    uint16_t msix_qsize;
-    uint32_t cmb_size_mb;
-    uint8_t  aerl;
-    uint32_t aer_max_queued;
-    uint8_t  mdts;
-    uint8_t  vsl;
-    bool     use_intel_id;
-    uint8_t  zasl;
-    bool     legacy_cmb;
-} NvmeParams;
+typedef struct NvmeCtrl NvmeCtrl;
+typedef struct NvmeNamespace NvmeNamespace;
+
+#define TYPE_NVME_SUBSYS "nvme-subsys"
+#define NVME_SUBSYS(obj) \
+    OBJECT_CHECK(NvmeSubsystem, (obj), TYPE_NVME_SUBSYS)
+
+typedef struct NvmeSubsystem {
+    DeviceState parent_obj;
+    uint8_t     subnqn[256];
+
+    NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
+    NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
+
+    struct {
+        char *nqn;
+    } params;
+} NvmeSubsystem;
+
+int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
+
+static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
+                                         uint32_t cntlid)
+{
+    if (!subsys || cntlid >= NVME_MAX_CONTROLLERS) {
+        return NULL;
+    }
+
+    return subsys->ctrls[cntlid];
+}
+
+static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
+                                            uint32_t nsid)
+{
+    if (!subsys || !nsid || nsid > NVME_MAX_NAMESPACES) {
+        return NULL;
+    }
+
+    return subsys->namespaces[nsid];
+}
+
+#define TYPE_NVME_NS "nvme-ns"
+#define NVME_NS(obj) \
+    OBJECT_CHECK(NvmeNamespace, (obj), TYPE_NVME_NS)
+
+typedef struct NvmeZone {
+    NvmeZoneDescr   d;
+    uint64_t        w_ptr;
+    QTAILQ_ENTRY(NvmeZone) entry;
+} NvmeZone;
+
+typedef struct NvmeNamespaceParams {
+    bool     detached;
+    bool     shared;
+    uint32_t nsid;
+    QemuUUID uuid;
+
+    uint16_t ms;
+    uint8_t  mset;
+    uint8_t  pi;
+    uint8_t  pil;
+
+    uint16_t mssrl;
+    uint32_t mcl;
+    uint8_t  msrc;
+
+    bool     zoned;
+    bool     cross_zone_read;
+    uint64_t zone_size_bs;
+    uint64_t zone_cap_bs;
+    uint32_t max_active_zones;
+    uint32_t max_open_zones;
+    uint32_t zd_extension_size;
+} NvmeNamespaceParams;
+
+typedef struct NvmeNamespace {
+    DeviceState  parent_obj;
+    BlockConf    blkconf;
+    int32_t      bootindex;
+    int64_t      size;
+    int64_t      mdata_offset;
+    NvmeIdNs     id_ns;
+    const uint32_t *iocs;
+    uint8_t      csi;
+    uint16_t     status;
+    int          attached;
+
+    QTAILQ_ENTRY(NvmeNamespace) entry;
+
+    NvmeIdNsZoned   *id_ns_zoned;
+    NvmeZone        *zone_array;
+    QTAILQ_HEAD(, NvmeZone) exp_open_zones;
+    QTAILQ_HEAD(, NvmeZone) imp_open_zones;
+    QTAILQ_HEAD(, NvmeZone) closed_zones;
+    QTAILQ_HEAD(, NvmeZone) full_zones;
+    uint32_t        num_zones;
+    uint64_t        zone_size;
+    uint64_t        zone_capacity;
+    uint32_t        zone_size_log2;
+    uint8_t         *zd_extensions;
+    int32_t         nr_open_zones;
+    int32_t         nr_active_zones;
+
+    NvmeNamespaceParams params;
+
+    struct {
+        uint32_t err_rec;
+    } features;
+} NvmeNamespace;
+
+static inline uint16_t nvme_ns_status(NvmeNamespace *ns)
+{
+    return ns->status;
+}
+
+static inline uint32_t nvme_nsid(NvmeNamespace *ns)
+{
+    if (ns) {
+        return ns->params.nsid;
+    }
+
+    return 0;
+}
+
+static inline NvmeLBAF *nvme_ns_lbaf(NvmeNamespace *ns)
+{
+    NvmeIdNs *id_ns = &ns->id_ns;
+    return &id_ns->lbaf[NVME_ID_NS_FLBAS_INDEX(id_ns->flbas)];
+}
+
+static inline uint8_t nvme_ns_lbads(NvmeNamespace *ns)
+{
+    return nvme_ns_lbaf(ns)->ds;
+}
+
+/* convert an LBA to the equivalent in bytes */
+static inline size_t nvme_l2b(NvmeNamespace *ns, uint64_t lba)
+{
+    return lba << nvme_ns_lbads(ns);
+}
+
+static inline size_t nvme_lsize(NvmeNamespace *ns)
+{
+    return 1 << nvme_ns_lbads(ns);
+}
+
+static inline uint16_t nvme_msize(NvmeNamespace *ns)
+{
+    return nvme_ns_lbaf(ns)->ms;
+}
+
+static inline size_t nvme_m2b(NvmeNamespace *ns, uint64_t lba)
+{
+    return nvme_msize(ns) * lba;
+}
+
+static inline bool nvme_ns_ext(NvmeNamespace *ns)
+{
+    return !!NVME_ID_NS_FLBAS_EXTENDED(ns->id_ns.flbas);
+}
+
+/* calculate the number of LBAs that the namespace can accomodate */
+static inline uint64_t nvme_ns_nlbas(NvmeNamespace *ns)
+{
+    if (nvme_msize(ns)) {
+        return ns->size / (nvme_lsize(ns) + nvme_msize(ns));
+    }
+    return ns->size >> nvme_ns_lbads(ns);
+}
+
+static inline NvmeZoneState nvme_get_zone_state(NvmeZone *zone)
+{
+    return zone->d.zs >> 4;
+}
+
+static inline void nvme_set_zone_state(NvmeZone *zone, NvmeZoneState state)
+{
+    zone->d.zs = state << 4;
+}
+
+static inline uint64_t nvme_zone_rd_boundary(NvmeNamespace *ns, NvmeZone *zone)
+{
+    return zone->d.zslba + ns->zone_size;
+}
+
+static inline uint64_t nvme_zone_wr_boundary(NvmeZone *zone)
+{
+    return zone->d.zslba + zone->d.zcap;
+}
+
+static inline bool nvme_wp_is_valid(NvmeZone *zone)
+{
+    uint8_t st = nvme_get_zone_state(zone);
+
+    return st != NVME_ZONE_STATE_FULL &&
+           st != NVME_ZONE_STATE_READ_ONLY &&
+           st != NVME_ZONE_STATE_OFFLINE;
+}
+
+static inline uint8_t *nvme_get_zd_extension(NvmeNamespace *ns,
+                                             uint32_t zone_idx)
+{
+    return &ns->zd_extensions[zone_idx * ns->params.zd_extension_size];
+}
+
+static inline void nvme_aor_inc_open(NvmeNamespace *ns)
+{
+    assert(ns->nr_open_zones >= 0);
+    if (ns->params.max_open_zones) {
+        ns->nr_open_zones++;
+        assert(ns->nr_open_zones <= ns->params.max_open_zones);
+    }
+}
+
+static inline void nvme_aor_dec_open(NvmeNamespace *ns)
+{
+    if (ns->params.max_open_zones) {
+        assert(ns->nr_open_zones > 0);
+        ns->nr_open_zones--;
+    }
+    assert(ns->nr_open_zones >= 0);
+}
+
+static inline void nvme_aor_inc_active(NvmeNamespace *ns)
+{
+    assert(ns->nr_active_zones >= 0);
+    if (ns->params.max_active_zones) {
+        ns->nr_active_zones++;
+        assert(ns->nr_active_zones <= ns->params.max_active_zones);
+    }
+}
+
+static inline void nvme_aor_dec_active(NvmeNamespace *ns)
+{
+    if (ns->params.max_active_zones) {
+        assert(ns->nr_active_zones > 0);
+        ns->nr_active_zones--;
+        assert(ns->nr_active_zones >= ns->nr_open_zones);
+    }
+    assert(ns->nr_active_zones >= 0);
+}
+
+void nvme_ns_init_format(NvmeNamespace *ns);
+int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp);
+void nvme_ns_drain(NvmeNamespace *ns);
+void nvme_ns_shutdown(NvmeNamespace *ns);
+void nvme_ns_cleanup(NvmeNamespace *ns);
 
 typedef struct NvmeAsyncEvent {
     QTAILQ_ENTRY(NvmeAsyncEvent) entry;
@@ -43,6 +296,11 @@ typedef struct NvmeSg {
     };
 } NvmeSg;
 
+typedef enum NvmeTxDirection {
+    NVME_TX_DIRECTION_TO_DEVICE   = 0,
+    NVME_TX_DIRECTION_FROM_DEVICE = 1,
+} NvmeTxDirection;
+
 typedef struct NvmeRequest {
     struct NvmeSQueue       *sq;
     struct NvmeNamespace    *ns;
@@ -143,13 +401,20 @@ typedef struct NvmeBus {
 #define NVME(obj) \
         OBJECT_CHECK(NvmeCtrl, (obj), TYPE_NVME)
 
-typedef struct NvmeFeatureVal {
-    struct {
-        uint16_t temp_thresh_hi;
-        uint16_t temp_thresh_low;
-    };
-    uint32_t    async_config;
-} NvmeFeatureVal;
+typedef struct NvmeParams {
+    char     *serial;
+    uint32_t num_queues; /* deprecated since 5.1 */
+    uint32_t max_ioqpairs;
+    uint16_t msix_qsize;
+    uint32_t cmb_size_mb;
+    uint8_t  aerl;
+    uint32_t aer_max_queued;
+    uint8_t  mdts;
+    uint8_t  vsl;
+    bool     use_intel_id;
+    uint8_t  zasl;
+    bool     legacy_cmb;
+} NvmeParams;
 
 typedef struct NvmeCtrl {
     PCIDevice    parent_obj;
@@ -204,22 +469,25 @@ typedef struct NvmeCtrl {
     NvmeSubsystem   *subsys;
 
     NvmeNamespace   namespace;
-    /*
-     * Attached namespaces to this controller.  If subsys is not given, all
-     * namespaces in this list will always be attached.
-     */
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES];
     NvmeSQueue      **sq;
     NvmeCQueue      **cq;
     NvmeSQueue      admin_sq;
     NvmeCQueue      admin_cq;
     NvmeIdCtrl      id_ctrl;
-    NvmeFeatureVal  features;
+
+    struct {
+        struct {
+            uint16_t temp_thresh_hi;
+            uint16_t temp_thresh_low;
+        };
+        uint32_t    async_config;
+    } features;
 } NvmeCtrl;
 
 static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
 {
-    if (!nsid || nsid > n->num_namespaces) {
+    if (!nsid || nsid > NVME_MAX_NAMESPACES) {
         return NULL;
     }
 
@@ -249,11 +517,6 @@ static inline uint16_t nvme_cid(NvmeRequest *req)
     return le16_to_cpu(req->cqe.cid);
 }
 
-typedef enum NvmeTxDirection {
-    NVME_TX_DIRECTION_TO_DEVICE   = 0,
-    NVME_TX_DIRECTION_FROM_DEVICE = 1,
-} NvmeTxDirection;
-
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
 uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
@@ -263,4 +526,54 @@ void nvme_rw_complete_cb(void *opaque, int ret);
 uint16_t nvme_map_dptr(NvmeCtrl *n, NvmeSg *sg, size_t len,
                        NvmeCmd *cmd);
 
+/* from Linux kernel (crypto/crct10dif_common.c) */
+static const uint16_t t10_dif_crc_table[256] = {
+    0x0000, 0x8BB7, 0x9CD9, 0x176E, 0xB205, 0x39B2, 0x2EDC, 0xA56B,
+    0xEFBD, 0x640A, 0x7364, 0xF8D3, 0x5DB8, 0xD60F, 0xC161, 0x4AD6,
+    0x54CD, 0xDF7A, 0xC814, 0x43A3, 0xE6C8, 0x6D7F, 0x7A11, 0xF1A6,
+    0xBB70, 0x30C7, 0x27A9, 0xAC1E, 0x0975, 0x82C2, 0x95AC, 0x1E1B,
+    0xA99A, 0x222D, 0x3543, 0xBEF4, 0x1B9F, 0x9028, 0x8746, 0x0CF1,
+    0x4627, 0xCD90, 0xDAFE, 0x5149, 0xF422, 0x7F95, 0x68FB, 0xE34C,
+    0xFD57, 0x76E0, 0x618E, 0xEA39, 0x4F52, 0xC4E5, 0xD38B, 0x583C,
+    0x12EA, 0x995D, 0x8E33, 0x0584, 0xA0EF, 0x2B58, 0x3C36, 0xB781,
+    0xD883, 0x5334, 0x445A, 0xCFED, 0x6A86, 0xE131, 0xF65F, 0x7DE8,
+    0x373E, 0xBC89, 0xABE7, 0x2050, 0x853B, 0x0E8C, 0x19E2, 0x9255,
+    0x8C4E, 0x07F9, 0x1097, 0x9B20, 0x3E4B, 0xB5FC, 0xA292, 0x2925,
+    0x63F3, 0xE844, 0xFF2A, 0x749D, 0xD1F6, 0x5A41, 0x4D2F, 0xC698,
+    0x7119, 0xFAAE, 0xEDC0, 0x6677, 0xC31C, 0x48AB, 0x5FC5, 0xD472,
+    0x9EA4, 0x1513, 0x027D, 0x89CA, 0x2CA1, 0xA716, 0xB078, 0x3BCF,
+    0x25D4, 0xAE63, 0xB90D, 0x32BA, 0x97D1, 0x1C66, 0x0B08, 0x80BF,
+    0xCA69, 0x41DE, 0x56B0, 0xDD07, 0x786C, 0xF3DB, 0xE4B5, 0x6F02,
+    0x3AB1, 0xB106, 0xA668, 0x2DDF, 0x88B4, 0x0303, 0x146D, 0x9FDA,
+    0xD50C, 0x5EBB, 0x49D5, 0xC262, 0x6709, 0xECBE, 0xFBD0, 0x7067,
+    0x6E7C, 0xE5CB, 0xF2A5, 0x7912, 0xDC79, 0x57CE, 0x40A0, 0xCB17,
+    0x81C1, 0x0A76, 0x1D18, 0x96AF, 0x33C4, 0xB873, 0xAF1D, 0x24AA,
+    0x932B, 0x189C, 0x0FF2, 0x8445, 0x212E, 0xAA99, 0xBDF7, 0x3640,
+    0x7C96, 0xF721, 0xE04F, 0x6BF8, 0xCE93, 0x4524, 0x524A, 0xD9FD,
+    0xC7E6, 0x4C51, 0x5B3F, 0xD088, 0x75E3, 0xFE54, 0xE93A, 0x628D,
+    0x285B, 0xA3EC, 0xB482, 0x3F35, 0x9A5E, 0x11E9, 0x0687, 0x8D30,
+    0xE232, 0x6985, 0x7EEB, 0xF55C, 0x5037, 0xDB80, 0xCCEE, 0x4759,
+    0x0D8F, 0x8638, 0x9156, 0x1AE1, 0xBF8A, 0x343D, 0x2353, 0xA8E4,
+    0xB6FF, 0x3D48, 0x2A26, 0xA191, 0x04FA, 0x8F4D, 0x9823, 0x1394,
+    0x5942, 0xD2F5, 0xC59B, 0x4E2C, 0xEB47, 0x60F0, 0x779E, 0xFC29,
+    0x4BA8, 0xC01F, 0xD771, 0x5CC6, 0xF9AD, 0x721A, 0x6574, 0xEEC3,
+    0xA415, 0x2FA2, 0x38CC, 0xB37B, 0x1610, 0x9DA7, 0x8AC9, 0x017E,
+    0x1F65, 0x94D2, 0x83BC, 0x080B, 0xAD60, 0x26D7, 0x31B9, 0xBA0E,
+    0xF0D8, 0x7B6F, 0x6C01, 0xE7B6, 0x42DD, 0xC96A, 0xDE04, 0x55B3
+};
+
+uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint16_t ctrl, uint64_t slba,
+                           uint32_t reftag);
+uint16_t nvme_dif_mangle_mdata(NvmeNamespace *ns, uint8_t *mbuf, size_t mlen,
+                               uint64_t slba);
+void nvme_dif_pract_generate_dif(NvmeNamespace *ns, uint8_t *buf, size_t len,
+                                 uint8_t *mbuf, size_t mlen, uint16_t apptag,
+                                 uint32_t reftag);
+uint16_t nvme_dif_check(NvmeNamespace *ns, uint8_t *buf, size_t len,
+                        uint8_t *mbuf, size_t mlen, uint16_t ctrl,
+                        uint64_t slba, uint16_t apptag,
+                        uint16_t appmask, uint32_t reftag);
+uint16_t nvme_dif_rw(NvmeCtrl *n, NvmeRequest *req);
+
+
 #endif /* HW_NVME_H */
diff --git a/hw/block/nvme-dif.c b/hw/block/nvme-dif.c
index 81b0a4cb1382..25e5a90854fa 100644
--- a/hw/block/nvme-dif.c
+++ b/hw/block/nvme-dif.c
@@ -15,7 +15,6 @@
 #include "qapi/error.h"
 #include "trace.h"
 #include "nvme.h"
-#include "nvme-dif.h"
 
 uint16_t nvme_check_prinfo(NvmeNamespace *ns, uint16_t ctrl, uint64_t slba,
                            uint32_t reftag)
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7bb618f18209..b538c4c4a13c 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -28,7 +28,6 @@
 
 #include "trace.h"
 #include "nvme.h"
-#include "nvme-ns.h"
 
 #define MIN_DISCARD_GRANULARITY (4 * KiB)
 
diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
index 283a97b79d57..b81067f7b0d3 100644
--- a/hw/block/nvme-subsys.c
+++ b/hw/block/nvme-subsys.c
@@ -20,7 +20,6 @@
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
 #include "nvme.h"
-#include "nvme-subsys.h"
 
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp)
 {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f8209a92302b..c51de480d9fd 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -153,8 +153,6 @@
 #include "qemu/cutils.h"
 #include "trace.h"
 #include "nvme.h"
-#include "nvme-ns.h"
-#include "nvme-dif.h"
 
 #define NVME_MAX_IOQPAIRS 0xffff
 #define NVME_DB_SIZE  4
-- 
2.31.1


