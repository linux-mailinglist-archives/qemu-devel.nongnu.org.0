Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8473829BB
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 12:22:43 +0200 (CEST)
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liaOY-000750-4Y
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 06:22:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1liaM1-0004HD-94
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:20:05 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:58938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1liaLs-0001nb-Sg
 for qemu-devel@nongnu.org; Mon, 17 May 2021 06:20:05 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210517101947epoutp01ad3b7d953ac4a44893c8b65bf85f5bd6~-010pYEp23063030630epoutp01k
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 10:19:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210517101947epoutp01ad3b7d953ac4a44893c8b65bf85f5bd6~-010pYEp23063030630epoutp01k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621246787;
 bh=Kz2/BBJJuk5S5uXglEpkv/fM+mThj3YcA0u84ZbSUE0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DDBBV66RO3XfmIQoZ9aww2jfUyBdBp8du5e23DUR+3lCM/75pCqG+Y6XrW1xqVtn4
 jjr+MR7sbDqdUTXj3zyjafL2eZ8oHciloFpbBbCE9/Q7vMicNtKEzOsAGQ6c9ds9td
 U7oH0b4Xl6CLfCQhrXMKgjJIJYCTMS3YPnRXa0LQ=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTP id
 20210517101946epcas5p4253821fed88e96450fbc6fbee0c35871~-01zscz792731627316epcas5p4E;
 Mon, 17 May 2021 10:19:46 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 01.29.09697.24342A06; Mon, 17 May 2021 19:19:46 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210517101209epcas5p12d9c0d10a0f34a0f62aaf9ef388d51b8~-0vJmCdUP2842928429epcas5p1K;
 Mon, 17 May 2021 10:12:09 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210517101209epsmtrp2e4082cf70e11dfad86ef6e8a7ecd8741~-0vJlQuHS2103521035epsmtrp2Y;
 Mon, 17 May 2021 10:12:09 +0000 (GMT)
X-AuditID: b6c32a4a-639ff700000025e1-df-60a243429e89
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 DF.D5.08163.97142A06; Mon, 17 May 2021 19:12:09 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210517101207epsmtip1ce606f38bbdfb14482af547534108261~-0vIIGLix1221112211epsmtip1a;
 Mon, 17 May 2021 10:12:07 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] hw/nvme/ctrl: add controller list cns 0x13
Date: Mon, 17 May 2021 15:37:34 +0530
Message-Id: <20210517100736.17063-2-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517100736.17063-1-anaidu.gollu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRmVeSWpSXmKPExsWy7bCmhq6T86IEg3OPjCxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErozlO1awF3TKVxw6coq1gXGNRBcjJ4eE
 gInE3Y832LoYuTiEBHYzSkxv/c4K4XxilNj66RWU85lRonHBcla4lj+NLBCJXUCJX+uhnE4m
 iaMb7jKCVLEJGEnMfvsGzBYRkJT43XWaGcRmBlnyba4OiC0sYC/x+vtFsBoWAVWJnuZ3YDav
 gK3EnLf3mSC2yUus3nAArJdTwE5i0+qDUFfcY5c4sccEwnaRODHrGCOELSzx6vgWdghbSuLz
 u71Az7ED2dUSh4tAzpQQ6GCUOHZ5AxtEib3Ev2fTgFo5gE7TlFi/Sx8iLCsx9dQ6JoiL+SR6
 fz+BuoZXYsc8GFtNYsGt71CbZCRm/rkNdZmHxO//v5ggQTKRUeL0xRUsExjlZiGsWMDIuIpR
 MrWgODc9tdi0wCgvtVyvODG3uDQvXS85P3cTIzhZaHntYHz44IPeIUYmDsZDjBIczEoivJ/C
 5icI8aYkVlalFuXHF5XmpBYfYpTmYFES513xcHKCkEB6YklqdmpqQWoRTJaJg1OqgalPwZz1
 S4nl3/q1J/crP9lXIzpjXTjPKVuGBza/9vuULKhZzfzVV2pSd/399MSLy7/953w371KZ9JeZ
 GdePaP80ZZ/d3Z2jL3l9vQFDXvYbRnWDoDbnHzt+cF83rzyzuPl15ZaCC89ZvwR1m9ZctIiV
 +6ZRVHk08JIa23Fn/RTxN17F57VjpltPrlsy++rnGbvreRLql79mj5uwpjXCyPLqlVRHrwzz
 qxvnb642+BFb/ixfyejDg6P8Pn06uu0+zJpdMUmL5O494/q4VqmBibs4Ij5O2+HijsJZbzkP
 PS7O6ryzXFjkoIpLnrKA3Ld3n1fOn3TwYoVLa/1V+fPzwy7vmv16UaRKZ4fokZgZp5RYijMS
 DbWYi4oTAZXzh9iFAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGLMWRmVeSWpSXmKPExsWy7bCSnG6l46IEgw3PBC1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErozlO1awF3TKVxw6coq1gXGNRBcjJ4eE
 gInE3T+NLF2MXBxCAjsYJWa9/MsOkZCR+HVqKjOELSyx8t9zdoiidiaJFb87WEESbAJGErPf
 vmEEsUUEJCV+d51mBiliFjjKKHG5fTILSEJYwF7i9feLYEUsAqoSPc3vwGxeAVuJOW/vM0Fs
 kJdYveEA2DZOATuJTasPgi0QAqr537OffQIj3wJGhlWMkqkFxbnpucWGBUZ5qeV6xYm5xaV5
 6XrJ+bmbGMFBqaW1g3HPqg96hxiZOBgPMUpwMCuJ8H4Km58gxJuSWFmVWpQfX1Sak1p8iFGa
 g0VJnPdC18l4IYH0xJLU7NTUgtQimCwTB6dUA9Neh8YNS+SdFs6TndzR7lQdu+FpaZX3Va+n
 hVpVJ85+Tpi/znfjArZfUQ9Pcu/etLB2hntyaUWR3+FQ3kl6XUaJytdvX0289E39e/g7Mceu
 +fe8OC5KhYrNr3aY0pDz/eKX+SvT2qszuDW9i9gm1bbUbti08tQLnqhadQGutMcb9qp03NOr
 tvmtc3e1wQfefYeMM27eUqo81BLNcq6m8yVvlgur+6X2M+6/1/yqCzDsmrVt8udl7XM+Zdxb
 e0tjVdtx2V3MnIJiTJeK+VcX1UZzHtmotza8jr2UyUWG3/rN5K5Dr46/rc5QmJy+Z9X26Iur
 GJvqXwbcO9bEqVba9X7Blsgr28TMqh5MPt504IISS3FGoqEWc1FxIgCH4QcouQIAAA==
X-CMS-MailID: 20210517101209epcas5p12d9c0d10a0f34a0f62aaf9ef388d51b8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210517101209epcas5p12d9c0d10a0f34a0f62aaf9ef388d51b8
References: <20210517100736.17063-1-anaidu.gollu@samsung.com>
 <CGME20210517101209epcas5p12d9c0d10a0f34a0f62aaf9ef388d51b8@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -73
X-Spam_score: -7.4
X-Spam_bar: -------
X-Spam_report: (-7.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.296,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the controller identifiers list available in NVM Subsystem
that may or may not be attached to namespaces.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/nvme/ctrl.c       | 25 +++++++++++++++----------
 hw/nvme/trace-events |  2 +-
 include/block/nvme.h |  1 +
 3 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 2e7498a73e..d08a3350e2 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4251,7 +4251,8 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
     return NVME_INVALID_CMD_SET | NVME_DNR;
 }
 
-static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ctrl_list(NvmeCtrl *n, NvmeRequest *req,
+                                        bool attached)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
     uint16_t min_id = le16_to_cpu(c->ctrlid);
@@ -4261,15 +4262,17 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
     NvmeCtrl *ctrl;
     int cntlid, nr_ids = 0;
 
-    trace_pci_nvme_identify_ns_attached_list(min_id);
+    trace_pci_nvme_identify_ctrl_list(c->cns, min_id);
 
-    if (c->nsid == NVME_NSID_BROADCAST) {
-        return NVME_INVALID_FIELD | NVME_DNR;
-    }
+    if (attached) {
+        if (c->nsid == NVME_NSID_BROADCAST) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
 
-    ns = nvme_subsys_ns(n->subsys, c->nsid);
-    if (!ns) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+        ns = nvme_subsys_ns(n->subsys, c->nsid);
+        if (!ns) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
     }
 
     for (cntlid = min_id; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
@@ -4278,7 +4281,7 @@ static uint16_t nvme_identify_ns_attached_list(NvmeCtrl *n, NvmeRequest *req)
             continue;
         }
 
-        if (!nvme_ns(ctrl, c->nsid)) {
+        if (attached && !nvme_ns(ctrl, c->nsid)) {
             continue;
         }
 
@@ -4493,7 +4496,9 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
     case NVME_ID_CNS_NS_PRESENT:
         return nvme_identify_ns(n, req, false);
     case NVME_ID_CNS_NS_ATTACHED_CTRL_LIST:
-        return nvme_identify_ns_attached_list(n, req);
+        return nvme_identify_ctrl_list(n, req, true);
+    case NVME_ID_CNS_CTRL_LIST:
+        return nvme_identify_ctrl_list(n, req, false);
     case NVME_ID_CNS_CS_NS:
         return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ea33d0ccc3..7ba3714671 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -55,7 +55,7 @@ pci_nvme_identify(uint16_t cid, uint8_t cns, uint16_t ctrlid, uint8_t csi) "cid
 pci_nvme_identify_ctrl(void) "identify controller"
 pci_nvme_identify_ctrl_csi(uint8_t csi) "identify controller, csi=0x%"PRIx8""
 pci_nvme_identify_ns(uint32_t ns) "nsid %"PRIu32""
-pci_nvme_identify_ns_attached_list(uint16_t cntid) "cntid=%"PRIu16""
+pci_nvme_identify_ctrl_list(uint8_t cns, uint16_t cntid) "cns 0x%"PRIx8" cntid=%"PRIu16""
 pci_nvme_identify_ns_csi(uint32_t ns, uint8_t csi) "nsid=%"PRIu32", csi=0x%"PRIx8""
 pci_nvme_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 pci_nvme_identify_nslist_csi(uint16_t ns, uint8_t csi) "nsid=%"PRIu16", csi=0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 0ff9ce17a9..188ab460df 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -980,6 +980,7 @@ enum NvmeIdCns {
     NVME_ID_CNS_NS_PRESENT_LIST       = 0x10,
     NVME_ID_CNS_NS_PRESENT            = 0x11,
     NVME_ID_CNS_NS_ATTACHED_CTRL_LIST = 0x12,
+    NVME_ID_CNS_CTRL_LIST             = 0x13,
     NVME_ID_CNS_CS_NS_PRESENT_LIST    = 0x1a,
     NVME_ID_CNS_CS_NS_PRESENT         = 0x1b,
     NVME_ID_CNS_IO_COMMAND_SET        = 0x1c,
-- 
2.17.1


