Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796D333F23D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:06:53 +0100 (CET)
Received: from localhost ([::1]:58448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMWp2-00067Q-Ht
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:06:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lMSjh-0003jQ-2p
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:45:05 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:61401)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lMSjd-0002Wk-Lr
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 05:45:04 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210317094452epoutp03a8b543bf6c08d5824c5a2892eb71673c~tGA7Bys3c0323703237epoutp03g
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 09:44:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210317094452epoutp03a8b543bf6c08d5824c5a2892eb71673c~tGA7Bys3c0323703237epoutp03g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1615974292;
 bh=Lmb3zJ8JCcPzdFNnya4+g7qy8a3aUgbp00PMkYylYeA=;
 h=From:To:Cc:Subject:Date:References:From;
 b=BN3srR8pR82IWZIBOJEKfkHQre/BSOZ9dsNjmfI76ErMBfSWrtwbup3aqb7eag28a
 W4jm6IdaqN13nzSSdmtbpW3xoatjfQqF5YoULF1RCx8caIodohk6/zKyqd8Qw3JVLF
 IizjAvg4XRXSNxZ9SQGB5cCJ9zFZDicArrnBpvNg=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210317094452epcas5p31a4cbc67558e2449a58c0aa95e09396e~tGA6sWd3C2773627736epcas5p3p;
 Wed, 17 Mar 2021 09:44:52 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 9B.F9.15682.49FC1506; Wed, 17 Mar 2021 18:44:52 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210317093352epcas5p3193a70101b750934fabcb2540129e499~tF3UD8lWr0112201122epcas5p3s;
 Wed, 17 Mar 2021 09:33:52 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210317093352epsmtrp1980689f089d070e84a6b7e7cb8d7a5ca~tF3UB8v730877808778epsmtrp1z;
 Wed, 17 Mar 2021 09:33:52 +0000 (GMT)
X-AuditID: b6c32a49-8bfff70000013d42-05-6051cf94cfd7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 18.F2.08745.00DC1506; Wed, 17 Mar 2021 18:33:52 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210317093349epsmtip22ca547f9ce59a651a7dedf5bcdc8f121~tF3Q5vsCO3026030260epsmtip2u;
 Wed, 17 Mar 2021 09:33:48 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/block/nvme: align with existing style
Date: Wed, 17 Mar 2021 15:00:05 +0530
Message-Id: <20210317093006.31404-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsWy7bCmuu6U84EJBv8eSFu83nmc2eLK/vOM
 FvsPfmO1ONm4h9Vi0qFrjBZLLqZazLulbDHrXTubxfHeHSwWryf9Z3Xg8vhxrp3N49yO8+we
 m1Z1snk8ubaZyeP9vqtsHn1bVjEGsEVx2aSk5mSWpRbp2yVwZbSdXsNecNig4tzFc0wNjE8U
 uxg5OSQETCRWPn7F1MXIxSEksJtRovHLSyjnE6PEzj2bmSGcz4wSL/bfY4VpWX7tM1RiF6PE
 /IfroVo6mSSOdz5lA6liEzCSmP32DSOILSIgKfG76zRYB7PARUaJk8+WghUJC9hKvDx+hR3E
 ZhFQlVh/9jwTiM0LFP/ceJ0JYp28xOoNB8CaJQSOsUtcOXod6g4XiYPX7rBA2MISr45vYYew
 pSRe9rcB2exAdrXE4SKI1g5GiWOXN7BBlNhL/Hs2Deg4DqCDNCXW79KHCMtKTD21DmwtswCf
 RO/vJ1An8ErsmAdjq0ksuPUdapOMxMw/t1lBxkgIeEg8b/AGCQsJxErM/d7HMoFRdhbCggWM
 jKsYJVMLinPTU4tNCwzzUsv1ihNzi0vz0vWS83M3MYLTg5bnDsa7Dz7oHWJk4mA8xCjBwawk
 wmuaF5AgxJuSWFmVWpQfX1Sak1p8iFGag0VJnHeHwYN4IYH0xJLU7NTUgtQimCwTB6dUA5Pz
 ZIf4XZ3xz1/rS81N2F7Utkbo2Bm/FSnRXgVBb86cX1dzoHTm4tmHW/0+HpwSoKxvkbn0rUKr
 4KUf2bvY9xrxeO1napxjYXftoJg0x43HQpqHhZYx3/1U8PbDjHfrnzO2cPhsXfvblOHdSSvO
 G989k0u/1Z68YfkhK1Il9eX3dv4Dx172vnr2+ck2ITGz68dUw/cFrSw6PXPl6Q3r1CbqBd05
 nXrteLJrfPp9RsX5NYJ5nimGvdcmBl7QXzz3X0pb4IVfgjsNL+0Qv2DO69e8lVs7wn/Pg9AN
 38sPdItYcXwJvxufoCJeetUz4vvd7/2hn65ZGmT+/dj121/lmlmLp0/0mh/tTkvPTFzG8n2D
 EktxRqKhFnNRcSIAK+dC5n4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprELMWRmVeSWpSXmKPExsWy7bCSvC7D2cAEg+5LMhavdx5ntriy/zyj
 xf6D31gtTjbuYbWYdOgao8WSi6kW824pW8x6185mcbx3B4vF60n/WR24PH6ca2fzOLfjPLvH
 plWdbB5Prm1m8ni/7yqbR9+WVYwBbFFcNimpOZllqUX6dglcGW2n17AXHDaoOHfxHFMD4xPF
 LkZODgkBE4nl1z4zdzFycQgJ7GCUWDX1BhNEQkbi16mpzBC2sMTKf8/ZQWwhgXYmib2/5UFs
 NgEjidlv3zCC2CICkhK/u06DDWIWuAs0aM4+sGZhAVuJl8evgDWzCKhKrD97HmwBL1D8c+N1
 qGXyEqs3HGCewMizgJFhFaNkakFxbnpusWGBUV5quV5xYm5xaV66XnJ+7iZGcLBpae1g3LPq
 g94hRiYOxkOMEhzMSiK8pnkBCUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1O
 TS1ILYLJMnFwSjUwmQTse2H27Jfcc5/ZiaXLtymt84kPs1vfxMb40qFpQUDTB/29Vv26huet
 GxQOcd6yviTwY87aXbwufm3vSpV4ZvufNFW8HGp19kNE36tZT5le/Jksv8VTJ7c/pbK24OtN
 yXn70yxehz/hmckSrc/c7D97ulOqCFsq82G1eJFzS6OzatN4vI4KfnJTvCro/G7/+eSmS96y
 Wk808vYEvZx8/Lr+s0c/GG8uL/3rObVgcpjtyR0mn1kl/ziXJ+/2l3aYdfOG1/qvsdWnZ/JJ
 +9tzvI42083XltZddyh4WeA5uY29+rcSlx+W+u198IZDxSru3dUZl3SmM65Vb5us0MRQJuJp
 4/RI+JTCE7uFIXeUWIozEg21mIuKEwEZFPPupQIAAA==
X-CMS-MailID: 20210317093352epcas5p3193a70101b750934fabcb2540129e499
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210317093352epcas5p3193a70101b750934fabcb2540129e499
References: <CGME20210317093352epcas5p3193a70101b750934fabcb2540129e499@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
X-Spam_score_int: -72
X-Spam_score: -7.3
X-Spam_bar: -------
X-Spam_report: (-7.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 17 Mar 2021 10:04:51 -0400
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
 k.jensen@samsung.com, Gollu Appalanaidu <anaidu.gollu@samsung.com>,
 mreitz@redhat.com, its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make uniform hexadecimal numbers format.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/block/nvme.c      | 30 +++++++++++++++---------------
 include/block/nvme.h | 10 +++++-----
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d439e44db8..21e85374bf 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2728,18 +2728,18 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 
     /*
      * In the base NVM command set, Flush may apply to all namespaces
-     * (indicated by NSID being set to 0xFFFFFFFF). But if that feature is used
+     * (indicated by NSID being set to 0xffffffff). But if that feature is used
      * along with TP 4056 (Namespace Types), it may be pretty screwed up.
      *
-     * If NSID is indeed set to 0xFFFFFFFF, we simply cannot associate the
+     * If NSID is indeed set to 0xffffffff, we simply cannot associate the
      * opcode with a specific command since we cannot determine a unique I/O
      * command set. Opcode 0x0 could have any other meaning than something
      * equivalent to flushing and say it DOES have completely different
-     * semantics in some other command set - does an NSID of 0xFFFFFFFF then
+     * semantics in some other command set - does an NSID of 0xffffffff then
      * mean "for all namespaces, apply whatever command set specific command
      * that uses the 0x0 opcode?" Or does it mean "for all namespaces, apply
      * whatever command that uses the 0x0 opcode if, and only if, it allows
-     * NSID to be 0xFFFFFFFF"?
+     * NSID to be 0xffffffff"?
      *
      * Anyway (and luckily), for now, we do not care about this since the
      * device only supports namespace types that includes the NVM Flush command
@@ -3948,8 +3948,8 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        trace_pci_nvme_setfeat_numq((dw11 & 0xFFFF) + 1,
-                                    ((dw11 >> 16) & 0xFFFF) + 1,
+        trace_pci_nvme_setfeat_numq((dw11 & 0xffff) + 1,
+                                    ((dw11 >> 16) & 0xffff) + 1,
                                     n->params.max_ioqpairs,
                                     n->params.max_ioqpairs);
         req->cqe.result = cpu_to_le32((n->params.max_ioqpairs - 1) |
@@ -4436,7 +4436,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
         break;
     case 0x20:  /* NSSR */
-        if (data == 0x4E564D65) {
+        if (data == 0x4e564d65) {
             trace_pci_nvme_ub_mmiowr_ssreset_unsupported();
         } else {
             /* The spec says that writes of other values have no effect */
@@ -4506,11 +4506,11 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
@@ -4521,19 +4521,19 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
@@ -4553,7 +4553,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
 
         return;
-    case 0xE18: /* PMRMSCU */
+    case 0xe18: /* PMRMSCU */
         if (!NVME_CAP_PMRS(n->bar.cap)) {
             return;
         }
@@ -4595,7 +4595,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
          * from PMRSTS should ensure prior writes
          * made it to persistent media
          */
-        if (addr == 0xE08 &&
+        if (addr == 0xe08 &&
             (NVME_PMRCAP_PMRWBM(n->bar.pmrcap) & 0x02)) {
             memory_region_msync(&n->pmr.dev->mr, 0, n->pmr.dev->size);
         }
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 372d0f2799..fc65cfcb01 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -840,8 +840,8 @@ enum NvmeStatusCodes {
     NVME_FEAT_NOT_NS_SPEC       = 0x010f,
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
     NVME_NS_ALREADY_ATTACHED    = 0x0118,
-    NVME_NS_NOT_ATTACHED        = 0x011A,
-    NVME_NS_CTRL_LIST_INVALID   = 0x011C,
+    NVME_NS_NOT_ATTACHED        = 0x011a,
+    NVME_NS_CTRL_LIST_INVALID   = 0x011c,
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
@@ -1392,9 +1392,9 @@ typedef enum NvmeZoneState {
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


