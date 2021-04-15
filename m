Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8191E3609F6
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 15:05:23 +0200 (CEST)
Received: from localhost ([::1]:38264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1gQ-0007zf-J2
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 09:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lX1eH-0005fy-2G
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:03:10 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:31766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lX1eA-0000xY-Vv
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 09:03:08 -0400
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210415130246epoutp0426a4356b1430a5e248c7c1192572e8c6~2Ca_j8Wlh1496314963epoutp04P
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 13:02:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210415130246epoutp0426a4356b1430a5e248c7c1192572e8c6~2Ca_j8Wlh1496314963epoutp04P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618491766;
 bh=0N7bgzICT/STwYu24EbxURZbGBxYNEGCboHyWvMy7Do=;
 h=From:To:Cc:Subject:Date:References:From;
 b=u2W5FZhZhI8en5NyhZiQC4T0kJoMqvZWNVqiKJi4SHw5hJQGK/95TxKhUyzHrCk9M
 yiWowvP71vvv0nbpUb+c59IMRQEzFb5LGCb69q2nYRnllzgTdi5PFXMGhJY50hQbvY
 S3XpgCSXg83UFnT2fxznuNEIqieQHdojuylgUGD0=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210415130245epcas5p4e35b66935e566b922509125e9e304f49~2Ca_NWyHv1343313433epcas5p4-;
 Thu, 15 Apr 2021 13:02:45 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 0E.C7.41008.57938706; Thu, 15 Apr 2021 22:02:45 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210415120417epcas5p31ddb152cbe94fa5bebe386de5e33f69e~2Bn7aHVyw2590925909epcas5p3O;
 Thu, 15 Apr 2021 12:04:17 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210415120417epsmtrp281f46126381d25934844b2cc31490fef~2Bn7ZVVNb2050320503epsmtrp2X;
 Thu, 15 Apr 2021 12:04:17 +0000 (GMT)
X-AuditID: b6c32a4b-64bff7000001a030-7b-607839754ab5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 14.A7.08745.1CB28706; Thu, 15 Apr 2021 21:04:17 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.99.42.33]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210415120416epsmtip2a479cab8550f64efaf4ec178983b37ce~2Bn5_EYGP0214202142epsmtip2m;
 Thu, 15 Apr 2021 12:04:16 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] hw/block/nvme: align with existing style
Date: Thu, 15 Apr 2021 17:30:48 +0530
Message-Id: <20210415120048.5484-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7bCmpm6pZUWCwfTD8havdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8bS9l7Wgk8eFTNvX2ZpYDxr3MXIySEh
 YCJx4vRSti5GLg4hgd2MEg83LWCHcD4xShx4288I4XxmlNi15Q0LTMvx56uZIRK7GCWeL2mE
 amljktix/R5YFZuAkcTst28YQWwRAUmJ312nmUFsZpAl3+bqgNjCAjYSj499A6rh4GARUJW4
 uwsszAsUPrp2PSPEMnmJ1RsOMEPYh9gl/hwtAymXEHCR2LtTDyIsLPHq+BZ2CFtK4vO7vUDv
 sAPZ1RKHi0AOkxDoYJQ4dnkDG0SJvcS/Z9PAljILaEqs36UPEZaVmHpqHRPEjXwSvb+fMEHE
 eSV2zIOx1SQW3PoOtUlGYuaf26wQtodE88KpYAcLCcRKzFjRxjqBUXYWwoYFjIyrGCVTC4pz
 01OLTQuM81LL9YoTc4tL89L1kvNzNzGC04GW9w7GRw8+6B1iZOJgPMQowcGsJMLrNqUkQYg3
 JbGyKrUoP76oNCe1+BCjNAeLkjjvDoMH8UIC6YklqdmpqQWpRTBZJg5OqQamhZvubBQ39hMr
 rK8x35liUB8yeaujkJDBg209Apy7v+fcc1X41r3Kfda2DaLcLR9fHF6n8+lXDJ+2qaNnrV8n
 S5yf6L/NeptmbJ40JSsubE1t/o27qx+lFXI7ZOlOub0x/o2aLtOSf+1+h6ZPDeyWu66/4p7G
 k7kNK2sY30wyX5Eipt6rvJiLNe9zm3uyreG2xRfkzv6+dfCBnXB7lYTgk9x1Dl5x2e94i9de
 3+e89pzRC6lSh9uGEzKdsj7eXLyp6STz3k3yirlbPX359/2TZeb4u83aWSb65vKX3Wu9nvu9
 Fds7L/qGqN7CNxGu02SkCmODD/3qYBGaK3XDS3nLgp+nTxVfii5K6J315ruaEktxRqKhFnNR
 cSIAWO/0jHYDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJXvegdkWCwcJVhhavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8bS9l7Wgk8eFTNvX2ZpYDxr3MXIySEh
 YCJx/Plq5i5GLg4hgR2MEgt6/jBBJGQkfp2aygxhC0us/PecHaKohUli06EJYEVsAkYSs9++
 YQSxRQQkJX53nQabxCxwlFHicvtkFpCEsICNxONj34CKODhYBFQl7u7SAQnzAoWPrl3PCLFA
 XmL1hgPMExh5FjAyrGKUTC0ozk3PLTYsMMpLLdcrTswtLs1L10vOz93ECA4xLa0djHtWfdA7
 xMjEwXiIUYKDWUmE121KSYIQb0piZVVqUX58UWlOavEhRmkOFiVx3gtdJ+OFBNITS1KzU1ML
 UotgskwcnFINTOLiO3cs9vU8Xe3NO3VXv5qDSe+an3anX9Z0PWHYkqm0fp+6JufVSlfndSbb
 n86p27l/ik6lbrtE3YN5DROduO8u2yjFe3nK8Yuftusz3bvznuvDe26HJd4vFgnNFXX4FHqx
 PmWVRLaEuu6ct/vWuYnEvnd/HDvvsn4yQwJH94mwG9nvztpc/KAivmFKdsC2IPEHgqZ5MjZv
 ty+9Gr5APSds3hfRPrdT8gbPOM6wLPW8PMPpwbqNNUoW07vEHzHziWp9enXaQaJe7ESe8oGZ
 1tLbbi3dtbii8TDDZ1HW35z2tU5b456HZvJxzRWQqo08sSTy6VXLtRnMhsI7g2b+m5+oqWxd
 n905dXfRlzuv+JVYijMSDbWYi4oTASllWO+gAgAA
X-CMS-MailID: 20210415120417epcas5p31ddb152cbe94fa5bebe386de5e33f69e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210415120417epcas5p31ddb152cbe94fa5bebe386de5e33f69e
References: <CGME20210415120417epcas5p31ddb152cbe94fa5bebe386de5e33f69e@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout4.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make uniform hexadecimal numbers format.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
-v2: Address review comments (Klaus)
use lower case hexa format for the code and in comments 
use the same format as used in Spec. ("FFFFFFFFh")
    

 hw/block/nvme-ns.c   |  2 +-
 hw/block/nvme.c      | 40 ++++++++++++++++++++--------------------
 include/block/nvme.h | 10 +++++-----
 3 files changed, 26 insertions(+), 26 deletions(-)

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
index 624a1431d0..f50e25c501 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3607,18 +3607,18 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 
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
@@ -3934,7 +3934,7 @@ static uint16_t nvme_changed_nslist(NvmeCtrl *n, uint8_t rae, uint32_t buf_len,
             NVME_CHANGED_NSID_SIZE) {
         /*
          * If more than 1024 namespaces, the first entry in the log page should
-         * be set to 0xffffffff and the others to 0 as spec.
+         * be set to FFFFFFFFh and the others to 0 as spec.
          */
         if (i == ARRAY_SIZE(nslist)) {
             memset(nslist, 0x0, sizeof(nslist));
@@ -4332,7 +4332,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
     trace_pci_nvme_identify_nslist(min_nsid);
 
     /*
-     * Both 0xffffffff (NVME_NSID_BROADCAST) and 0xfffffffe are invalid values
+     * Both FFFFFFFFh (NVME_NSID_BROADCAST) and FFFFFFFFEh are invalid values
      * since the Active Namespace ID List should return namespaces with ids
      * *higher* than the NSID specified in the command. This is also specified
      * in the spec (NVM Express v1.3d, Section 5.15.4).
@@ -4379,7 +4379,7 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
     trace_pci_nvme_identify_nslist_csi(min_nsid, c->csi);
 
     /*
-     * Same as in nvme_identify_nslist(), 0xffffffff/0xfffffffe are invalid.
+     * Same as in nvme_identify_nslist(), FFFFFFFFh/FFFFFFFFEh are invalid.
      */
     if (min_nsid >= NVME_NSID_BROADCAST - 1) {
         return NVME_INVALID_NSID | NVME_DNR;
@@ -4595,7 +4595,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
             /*
              * The Reservation Notification Mask and Reservation Persistence
              * features require a status code of Invalid Field in Command when
-             * NSID is 0xFFFFFFFF. Since the device does not support those
+             * NSID is FFFFFFFFh. Since the device does not support those
              * features we can always return Invalid Namespace or Format as we
              * should do for all other features.
              */
@@ -4854,8 +4854,8 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
             return NVME_INVALID_FIELD | NVME_DNR;
         }
 
-        trace_pci_nvme_setfeat_numq((dw11 & 0xFFFF) + 1,
-                                    ((dw11 >> 16) & 0xFFFF) + 1,
+        trace_pci_nvme_setfeat_numq((dw11 & 0xffff) + 1,
+                                    ((dw11 >> 16) & 0xffff) + 1,
                                     n->params.max_ioqpairs,
                                     n->params.max_ioqpairs);
         req->cqe.result = cpu_to_le32((n->params.max_ioqpairs - 1) |
@@ -5493,7 +5493,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             n->bar.cc = data;
         }
         break;
-    case 0x1C:  /* CSTS */
+    case 0x1c:  /* CSTS */
         if (data & (1 << 4)) {
             NVME_GUEST_ERR(pci_nvme_ub_mmiowr_ssreset_w1c_unsupported,
                            "attempted to W1C CSTS.NSSRO"
@@ -5505,7 +5505,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
         break;
     case 0x20:  /* NSSR */
-        if (data == 0x4E564D65) {
+        if (data == 0x4e564d65) {
             trace_pci_nvme_ub_mmiowr_ssreset_unsupported();
         } else {
             /* The spec says that writes of other values have no effect */
@@ -5575,11 +5575,11 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
@@ -5590,19 +5590,19 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
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
@@ -5622,7 +5622,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         }
 
         return;
-    case 0xE18: /* PMRMSCU */
+    case 0xe18: /* PMRMSCU */
         if (!NVME_CAP_PMRS(n->bar.cap)) {
             return;
         }
@@ -5664,7 +5664,7 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr addr, unsigned size)
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


