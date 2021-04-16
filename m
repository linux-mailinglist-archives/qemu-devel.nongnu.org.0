Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADD93618B0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 06:16:56 +0200 (CEST)
Received: from localhost ([::1]:47538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXFuY-00081D-Vo
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 00:16:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXFtC-0006tb-0I
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 00:15:30 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:45997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lXFt8-00058b-Fu
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 00:15:29 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210416041517epoutp0406b18212987d6fe823daf6e21241e7a1~2O3tgwiyZ0081200812epoutp04_
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 04:15:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210416041517epoutp0406b18212987d6fe823daf6e21241e7a1~2O3tgwiyZ0081200812epoutp04_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618546517;
 bh=D08uxTI0bbhnXvNZ7uVFW1AHrIR2RrAHS9XHCrrq5Eg=;
 h=From:To:Cc:Subject:Date:References:From;
 b=UGvS66pN8Ml8W2SBp9fL3I2OUB4m+G5+nisnXXManMkz/1J2HEfs+ZBOqNzTGMCU1
 7njzjDRtC8UHPJBe75+xi0P/wfS38jCNyR3D/sVYS3SAw0zj0MX0vGHPAz9hVvZGV9
 w4NY5bs7CkfSHJpdS/m1VKAS9T0LqTcevvphnx98=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20210416041516epcas5p11ab9ba8f322e381c0fc84a8f07c61633~2O3s9jQcc0432004320epcas5p1E;
 Fri, 16 Apr 2021 04:15:16 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5D.92.15682.45F09706; Fri, 16 Apr 2021 13:15:16 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210416035611epcas5p10b843f74cc93c015b5e74da149a8bd18~2OnCbGdAO3213032130epcas5p19;
 Fri, 16 Apr 2021 03:56:11 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210416035611epsmtrp2d50329039dfd428f4024a8ef07bd8c54~2OnCaSW6z0277102771epsmtrp2f;
 Fri, 16 Apr 2021 03:56:11 +0000 (GMT)
X-AuditID: b6c32a49-8d5ff70000013d42-85-60790f5443df
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 21.A7.33967.BDA09706; Fri, 16 Apr 2021 12:56:11 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210416035609epsmtip2c614afc31da0ee2420d6b6393adb2dba~2OnA8LEP72533325333epsmtip2g;
 Fri, 16 Apr 2021 03:56:09 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] hw/block/nvme: align with existing style
Date: Fri, 16 Apr 2021 09:22:28 +0530
Message-Id: <20210416035228.16339-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFIsWRmVeSWpSXmKPExsWy7bCmum4If2WCwbW5chavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyha9y36zW8x6185mcbx3B4vF60n/WR24PH6ca2fzOLfjPLvH
 plWdbB5Prm1m8ni/7yqbR9+WVYwBbFFcNimpOZllqUX6dglcGbcu/WMuOOBbcbHlGWsD4xLz
 LkYODgkBE4k7h1K6GLk4hAR2M0q0XbnBBuF8YpS4PGsCC4TzjVFiS8dP1i5GTrCOs407wGwh
 gb2MEit/hEAUtTFJHHvQxwySYBMwkpj99g0jiC0iICnxu+s0M0gRs8A5Ron2Vy/ZQBLCAjYS
 d38+BCtiEVCV2LLqKdhUXgFbicWfrzJBbJOXWL3hAFizhMA5dok1058wQyRcJP7fPcAOYQtL
 vDq+BcqWkvj8bi/QAnYgu1ricBFEawejxLHLG9ggSuwl/j2bxgjyP7OApsT6XfoQYVmJqafW
 ga1lFuCT6P39BOoEXokd82BsNYkFt75DbZKRmPnnNjRQPCT6Z9xlggRKrMSELyfZJjDKzkLY
 sICRcRWjZGpBcW56arFpgWFearlecWJucWleul5yfu4mRnBy0PLcwXj3wQe9Q4xMHIyHGCU4
 mJVEeI07KxKEeFMSK6tSi/Lji0pzUosPMUpzsCiJ8+4weBAvJJCeWJKanZpakFoEk2Xi4JRq
 YJK7/vnzk5dbAtoWsEy4kqSm6cvSb9ob9YJHu+OUj2/znkavF07B70JFW+US594rSz4h/tDn
 5pnzKQF9ey9Y7ypZsbFsM79HzsqjDkGfl09p1/MM39q5y+vNTWuFdh0B+2oeswCTgEO/Vrlr
 hTGzzHv7RMPSoL+lJvco75andkePb2p7L3R4hqzdQ8kzx8/fjNgtl2cjFut98bpnU7vJl/Bq
 gZ7HuSs4ZtYq+mv8vPq0ZuLdq/tfLz15Iv6R6JxD12+Y3v8TNI9J53Nd864fJ5gX7/r+pUsj
 3VHbdYNPXFbvrTMbStvure56Hs9e5bqx71by6wsrlnTLcSeuUfi8d+/Oe6bvLBoS3rSW7rnv
 e0iJpTgj0VCLuag4EQC4dLLPfQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMLMWRmVeSWpSXmKPExsWy7bCSvO5trsoEg6YbQhavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyha9y36zW8x6185mcbx3B4vF60n/WR24PH6ca2fzOLfjPLvH
 plWdbB5Prm1m8ni/7yqbR9+WVYwBbFFcNimpOZllqUX6dglcGbcu/WMuOOBbcbHlGWsD4xLz
 LkZODgkBE4mzjTtYuxi5OIQEdjNK/GtfwgaRkJH4dWoqM4QtLLHy33N2iKIWJomlvR1gCTYB
 I4nZb98wgtgiApISv7tOM4MUMQvcYpTY9fUSE0hCWMBG4u7Ph2BFLAKqEltWPWUFsXkFbCUW
 f77KBLFBXmL1hgPMExh5FjAyrGKUTC0ozk3PLTYsMMxLLdcrTswtLs1L10vOz93ECA43Lc0d
 jNtXfdA7xMjEwXiIUYKDWUmE17izIkGINyWxsiq1KD++qDQntfgQozQHi5I474Wuk/FCAumJ
 JanZqakFqUUwWSYOTqkGpnnn1LUn+RzLaxNS3Xem9ve6d/ukylkOVLJYs0xd13KnROXFm9Md
 TgdjA63O5xWsusvlFnnn/YPtN3bkSL1j9jS/ZyO3TXLCzfcn/0oqx3Q+trlr4fTd+eaVprmy
 G6WYWSeoOb6QkNlpFqmwSWF9jk/M5ibPDVsVVp1ru1DacP1yrl7qUhbduNOJ5T0/UpcZn7JV
 XKGy+6hZTyW73bW5h0TWt//nN3FaYSQTuTr4YtqVF/fOcd+cu9R055yNH95pJ+98PKPTu9Vl
 +g8+4+rnD+W3vukvijv93/Hgodnn1BbF/yj9v5u3dPaDaqe+aR0BvWd0TJ6//vzGKWjH9VOi
 O/UrtxrMNvYVDvTpcuM+J63EUpyRaKjFXFScCADVMErppgIAAA==
X-CMS-MailID: 20210416035611epcas5p10b843f74cc93c015b5e74da149a8bd18
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210416035611epcas5p10b843f74cc93c015b5e74da149a8bd18
References: <CGME20210416035611epcas5p10b843f74cc93c015b5e74da149a8bd18@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout4.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use lower case hexadecimal format for the constants and in
comments use the same format as used in Spec. ("FFFFFFFFh")

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
-v3: Add Suggestions (Philippe)
 Describe the NVMe subsystem style in nvme.c header

-v2: Address review comments (Klaus)
 use lower case hexa format for the code and in comments
 use the same format as used in Spec. ("FFFFFFFFh")

 hw/block/nvme-ns.c   |  2 +-
 hw/block/nvme.c      | 46 +++++++++++++++++++++++++-------------------
 include/block/nvme.h | 10 +++++-----
 3 files changed, 32 insertions(+), 26 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7bb618f182..a0895614d9 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -303,7 +303,7 @@ static void nvme_ns_init_zoned(NvmeNamespace *ns)
 
     id_ns_z = g_malloc0(sizeof(NvmeIdNsZoned));
 
-    /* MAR/MOR are zeroes-based, 0xffffffff means no limit */
+    /* MAR/MOR are zeroes-based, FFFFFFFFFh means no limit */
     id_ns_z->mar = cpu_to_le32(ns->params.max_active_zones - 1);
     id_ns_z->mor = cpu_to_le32(ns->params.max_open_zones - 1);
     id_ns_z->zoc = 0;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 624a1431d0..cbe7f33daa 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -134,6 +134,12 @@
  *         Setting this property to true enables Read Across Zone Boundaries.
  */
 
+/**
+ * While QEMU coding style prefers lowercase hexadecimal in constants,
+ * the NVMe subsystem use the format from the NVMe specifications in
+ * the comments: no '0x' prefix, uppercase, 'h' hexadecimal suffix
+ */
+
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "qemu/error-report.h"
@@ -3607,18 +3613,18 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 
     /*
      * In the base NVM command set, Flush may apply to all namespaces
-     * (indicated by NSID being set to 0xFFFFFFFF). But if that feature is used
+     * (indicated by NSID being set to FFFFFFFFh). But if that feature is used
      * along with TP 4056 (Namespace Types), it may be pretty screwed up.
      *
-     * If NSID is indeed set to 0xFFFFFFFF, we simply cannot associate the
+     * If NSID is indeed set to FFFFFFFFh, we simply cannot associate the
      * opcode with a specific command since we cannot determine a unique I/O
      * command set. Opcode 0x0 could have any other meaning than something
      * equivalent to flushing and say it DOES have completely different
-     * semantics in some other command set - does an NSID of 0xFFFFFFFF then
+     * semantics in some other command set - does an NSID of FFFFFFFFh then
      * mean "for all namespaces, apply whatever command set specific command
      * that uses the 0x0 opcode?" Or does it mean "for all namespaces, apply
      * whatever command that uses the 0x0 opcode if, and only if, it allows
-     * NSID to be 0xFFFFFFFF"?
+     * NSID to be FFFFFFFFh"?
      *
      * Anyway (and luckily), for now, we do not care about this since the
      * device only supports namespace types that includes the NVM Flush command
@@ -3934,7 +3940,7 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
             NVME_CHANGED_NSID_SIZE) {
         /*
          * If more than 1024 namespaces, the first entry in the log page should
-         * be set to 0xffffffff and the others to 0 as spec.
+         * be set to FFFFFFFFh and the others to 0 as spec.
          */
         if (i == ARRAY_SIZE(nslist)) {
             memset(nslist, 0x0, sizeof(nslist));
@@ -4332,7 +4338,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
     trace_pci_nvme_identify_nslist(min_nsid);
 
     /*
-     * Both 0xffffffff (NVME_NSID_BROADCAST) and 0xfffffffe are invalid values
+     * Both FFFFFFFFh (NVME_NSID_BROADCAST) and FFFFFFFFEh are invalid values
      * since the Active Namespace ID List should return namespaces with ids
      * *higher* than the NSID specified in the command. This is also specified
      * in the spec (NVM Express v1.3d, Section 5.15.4).
@@ -4379,7 +4385,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
     trace_pci_nvme_identify_nslist_csi(min_nsid, c->csi);
 
     /*
-     * Same as in nvme_identify_nslist(), 0xffffffff/0xfffffffe are invalid.
+     * Same as in nvme_identify_nslist(), FFFFFFFFh/FFFFFFFFEh are invalid.
      */
     if (min_nsid >= NVME_NSID_BROADCAST - 1) {
         return NVME_INVALID_NSID | NVME_DNR;
@@ -4595,7 +4601,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
             /*
              * The Reservation Notification Mask and Reservation Persistence
              * features require a status code of Invalid Field in Command when
-             * NSID is 0xFFFFFFFF. Since the device does not support those
+             * NSID is FFFFFFFFh. Since the device does not support those
              * features we can always return Invalid Namespace or Format as we
              * should do for all other features.
              */
@@ -4854,8 +4860,8 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        trace_pci_nvme_setfeat_numq((dw11 & 0xFFFF) + 1,
-                                    ((dw11 >> 16) & 0xFFFF) + 1,
+        trace_pci_nvme_setfeat_numq((dw11 & 0xffff) + 1,
+                                    ((dw11 >> 16) & 0xffff) + 1,
                                     n->params.max_ioqpairs,
                                     n->params.max_ioqpairs);
         req->cqe.result = cpu_to_le32((n->params.max_ioqpairs - 1) |
@@ -5493,7 +5499,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             n->bar.cc = data;
         }
         break;
-    case 0x1C:  /* CSTS */
+    case 0x1c:  /* CSTS */
         if (data & (1 << 4)) {
             NVME_GUEST_ERR(pci_nvme_ub_mmiowr_ssreset_w1c_unsupported,
                            "attempted to W1C CSTS.NSSRO"
@@ -5505,7 +5511,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
         break;
     case 0x20:  /* NSSR */
-        if (data == 0x4E564D65) {
+        if (data == 0x4e564d65) {
             trace_pci_nvme_ub_mmiowr_ssreset_unsupported();
         } else {
             /* The spec says that writes of other values have no effect */
@@ -5575,11 +5581,11 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         n->bar.cmbmsc = (n->bar.cmbmsc & 0xffffffff) | (data << 32);
         return;
 
-    case 0xE00: /* PMRCAP */
+    case 0xe00: /* PMRCAP */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrcap_readonly,
                        "invalid write to PMRCAP register, ignored");
         return;
-    case 0xE04: /* PMRCTL */
+    case 0xe04: /* PMRCTL */
         n->bar.pmrctl = data;
         if (NVME_PMRCTL_EN(data)) {
             memory_region_set_enabled(&n->pmr.dev->mr, true);
@@ -5590,19 +5596,19 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             n->pmr.cmse = false;
         }
         return;
-    case 0xE08: /* PMRSTS */
+    case 0xe08: /* PMRSTS */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrsts_readonly,
                        "invalid write to PMRSTS register, ignored");
         return;
-    case 0xE0C: /* PMREBS */
+    case 0xe0C: /* PMREBS */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrebs_readonly,
                        "invalid write to PMREBS register, ignored");
         return;
-    case 0xE10: /* PMRSWTP */
+    case 0xe10: /* PMRSWTP */
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_pmrswtp_readonly,
                        "invalid write to PMRSWTP register, ignored");
         return;
-    case 0xE14: /* PMRMSCL */
+    case 0xe14: /* PMRMSCL */
         if (!NVME_CAP_PMRS(n->bar.cap)) {
             return;
         }
@@ -5622,7 +5628,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
 
         return;
-    case 0xE18: /* PMRMSCU */
+    case 0xe18: /* PMRMSCU */
         if (!NVME_CAP_PMRS(n->bar.cap)) {
             return;
         }
@@ -5664,7 +5670,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
          * from PMRSTS should ensure prior writes
          * made it to persistent media
          */
-        if (addr == 0xE08 &&
+        if (addr == 0xe08 &&
             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
             memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
         }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 4ac926fbc6..0739e0d665 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -848,8 +848,8 @@ enum NvmeStatusCodes {
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
     NVME_NS_ALREADY_ATTACHED    = 0x0118,
     NVME_NS_PRIVATE             = 0x0119,
-    NVME_NS_NOT_ATTACHED        = 0x011A,
-    NVME_NS_CTRL_LIST_INVALID   = 0x011C,
+    NVME_NS_NOT_ATTACHED        = 0x011a,
+    NVME_NS_CTRL_LIST_INVALID   = 0x011c,
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
@@ -1409,9 +1409,9 @@ typedef enum NvmeZoneState {
     NVME_ZONE_STATE_IMPLICITLY_OPEN  = 0x02,
     NVME_ZONE_STATE_EXPLICITLY_OPEN  = 0x03,
     NVME_ZONE_STATE_CLOSED           = 0x04,
-    NVME_ZONE_STATE_READ_ONLY        = 0x0D,
-    NVME_ZONE_STATE_FULL             = 0x0E,
-    NVME_ZONE_STATE_OFFLINE          = 0x0F,
+    NVME_ZONE_STATE_READ_ONLY        = 0x0d,
+    NVME_ZONE_STATE_FULL             = 0x0e,
+    NVME_ZONE_STATE_OFFLINE          = 0x0f,
 } NvmeZoneState;
 
 static inline void _nvme_check_size(void)
-- 
2.17.1


