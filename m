Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8E144C02B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 12:34:57 +0100 (CET)
Received: from localhost ([::1]:40392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mklsW-0006VZ-Q7
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 06:34:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <naveen.n1@samsung.com>)
 id 1mklr8-0005cy-FU
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:33:30 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:32185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <naveen.n1@samsung.com>)
 id 1mklr4-0007gN-CC
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 06:33:30 -0500
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20211110113316epoutp046ea7f3d5822647c70337a03f984f0ef5~2LBf3Tp3Z2643526435epoutp04f
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 11:33:16 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20211110113316epoutp046ea7f3d5822647c70337a03f984f0ef5~2LBf3Tp3Z2643526435epoutp04f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1636543996;
 bh=S7+o0L4hjY0QFB2F7IK6h4h+SyQDZ6txsgIL3WX4zrY=;
 h=From:To:Cc:Subject:Date:References:From;
 b=SNEjd35P0/xuD2qZb4Z8D5uIjKxi/P1gdArKJ7cRrfKD/FDiCzJ+LzygR5wc3BgVF
 NRxbHFEeYoCoEpyd04zyWOWnkC5Y32OpeZtqhJhz57ZY9kD+wkw0OM/RZKN0fAlRgs
 iBK5xLfd9bpcowm1JorgFLOa6AxbAJ5HvqFEQnf0=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20211110113315epcas5p3ee56d5904d81ec92f2a82c9c0da1e2d2~2LBfa6rsc2748827488epcas5p3G;
 Wed, 10 Nov 2021 11:33:15 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.174]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4Hq2ln4tQYz4x9Q6; Wed, 10 Nov
 2021 11:33:09 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 D9.A8.06423.4FDAB816; Wed, 10 Nov 2021 20:33:08 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20211110112647epcas5p1946f1543392f3b9563d6766fcda5c392~2K72NtqNS0183201832epcas5p1q;
 Wed, 10 Nov 2021 11:26:47 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20211110112647epsmtrp231ec644ac9adf71b253e447a634cac25~2K72M5r9I0100401004epsmtrp2t;
 Wed, 10 Nov 2021 11:26:47 +0000 (GMT)
X-AuditID: b6c32a49-b01ff70000001917-e7-618badf4f69e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 27.23.08738.77CAB816; Wed, 10 Nov 2021 20:26:47 +0900 (KST)
Received: from test.sa.corp.samsungelectronics.net (unknown [107.108.56.58])
 by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20211110112645epsmtip14b44dd636d54ffa52c92d21997e4d24b~2K7zw-8yC0225802258epsmtip1a;
 Wed, 10 Nov 2021 11:26:44 +0000 (GMT)
From: Naveen <naveen.n1@samsung.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3] hw/nvme:Adding Support for namespace management
Date: Wed, 10 Nov 2021 16:56:29 +0530
Message-Id: <1636543589-32333-1-git-send-email-naveen.n1@samsung.com>
X-Mailer: git-send-email 1.8.3.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPKsWRmVeSWpSXmKPExsWy7bCmhu6Xtd2JBtdmW1j8nj6F1eLj37OM
 Fm+/PmCzuLL/PKPF/oPfWC2Wzte3mHToGqPFkoupFvNuKVs0PtnNbnH95yN2i1nv2tksjvfu
 YLHY82Ujq8XrSf9ZHfg9fpxrZ/M4t+M8u8emVZ1sHk+ubWbyeL/vKptH35ZVjAFsUdk2GamJ
 KalFCql5yfkpmXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUAXKymUJeaUAoUC
 EouLlfTtbIryS0tSFTLyi0tslVILUnIKTAr0ihNzi0vz0vXyUkusDA0MjEyBChOyM5a3X2cr
 mDOdsaJxyWymBsavOV2MnBwSAiYSN14+ZOpi5OIQEtjNKHFzcj8bhPOJUeLuznlQzmdGiUPX
 VrDCtOzpWsUMkdjFKPH95HVWCKeRSWLt9/WMIFVsAioS0/eeYAOxRQQkJX53nQbrYBY4wiQx
 b9FXsCJhAXeJD/ffgNksAqoSJ5Z8YQexeQVcJf48b2KCWKcgMeXhe2YI+y27xKOJLBC2i0Rb
 /zs2CFtY4tXxLewQtpTE53d7oeLFEhd6+1lAFksINDBKPPq2AarZXuLinr9ACziALtKUWL9L
 HyIsKzH11DqwvcwCfBK9v59A3cArsWPeE7ByCQFlifOruSFMSYlz05MhKjwkjr36CQ4gIYFY
 iWv9q5knMMrOQpi/gJFxFaNkakFxbnpqsWmBYV5qOTymkvNzNzGCU6KW5w7Guw8+6B1iZOJg
 PMQowcGsJMK7RL87UYg3JbGyKrUoP76oNCe1+BCjKTDEJjJLiSbnA5NyXkm8oYmlgYmZmZmJ
 pbGZoZI472nR7EQhgfTEktTs1NSC1CKYPiYOTqkGJonUqdt5Jr97s7y83G2OoHP60Q0LN589
 p3deUmDxRO7Hvz/2i1dU2VS/+O9zy/7WY9V/K4NPuVcECz9c3H388lXt+KQHc5T4XXmzihdP
 /a+VE+36PsLu3SMrqbx+tQ4DD7W5wVNap+3xvW8huH+/os+V+rhDG2Zt0jxx5c/0JwKCfJpL
 r7puy39v+k9r9pznyduP/v/g3MT06YralzNH8qw53JKvhW2/8mX1y7Vn/VuaZiqfLJlSa719
 6uWpvw3tPKeKuO6WTjl+Zq1FdVp4YWbChWulqVYHghctuSFbmSWWZeV5Tmvv2yOrnlQ2P11b
 ZPrkcHNsk/V9puDumLMNYR9STqVOOfHS+OQbswtLnnMqsRRnJBpqMRcVJwIAZra9VBIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDLMWRmVeSWpSXmKPExsWy7bCSnG75mu5Eg1ubZCx+T5/CavHx71lG
 i7dfH7BZXNl/ntFi/8FvrBZL5+tbTDp0jdFiycVUi3m3lC0an+xmt7j+8xG7xax37WwWx3t3
 sFjs+bKR1eL1pP+sDvweP861s3mc23Ge3WPTqk42jyfXNjN5vN93lc2jb8sqxgC2KC6blNSc
 zLLUIn27BK6M5e3X2QrmTGesaFwym6mB8WtOFyMnh4SAicSerlXMXYxcHEICOxglTm1+xw6R
 kJTY8HcrE4QtLLHy33N2iKL/jBJPNkwBK2ITUJGYvvcEG4gtAtTwu+s02CRmgWtMEpv2/WcB
 SQgLuEt8uP+GEcRmEVCVOLHkC1gzr4CrxJ/nTVAbFCSmPHzPPIGRZwEjwypGydSC4tz03GLD
 AqO81HK94sTc4tK8dL3k/NxNjOAA1dLawbhn1Qe9Q4xMHIyHGCU4mJVEeJfodycK8aYkVlal
 FuXHF5XmpBYfYpTmYFES573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwDS9ZBfXspa3ohZ885bL
 vPp7NKNwvvnkJ7vLRJkEKvoMEg21ZvcqKyR+ePD/QLxBjEL2Dq8dBo8aJxtY9GkITns7OfPu
 GdaVNUciNeWvWD232aXiWtTYtmwHw6HGQ9cXh/9b+H5m8ozzPJ/MmjsDXgfv2nDGusJS5eLh
 Xe8OpO5iCtlo0x2+LdN4+QntPXkGCozXs429BFbG//ySv3FNtf80hpXCDbqb1/75mHrEOO3f
 vuTJBQWssRNU9f+b50oyPrSd+f5tZ41Dzz+taQZanMfcZF+6HK/bmVdzV2KNkW70MUnXHZvO
 S+X4GZ5wuebuWT+x5TvLNZEP/ElLvn5VFOZYwmgoEez0qWP3sVN5GkosxRlAXzIXFScCAHSU
 jZO/AgAA
X-CMS-MailID: 20211110112647epcas5p1946f1543392f3b9563d6766fcda5c392
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20211110112647epcas5p1946f1543392f3b9563d6766fcda5c392
References: <CGME20211110112647epcas5p1946f1543392f3b9563d6766fcda5c392@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.34;
 envelope-from=naveen.n1@samsung.com; helo=mailout4.samsung.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, anuj.singh@samsung.com,
 jg123.choi@samsung.com, qemu-block@nongnu.org,
 Naveen Nagar <naveen.n1@samsung.com>, d.palani@samsung.com, mreitz@redhat.com,
 its@irrelevant.dk, anshul@samsung.com, stefanha@redhat.com,
 p.kalghatgi@samsung.com, kbusch@kernel.org, raphel.david@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Naveen Nagar <naveen.n1@samsung.com>

This patch supports namespace management : create and delete operations
This patch has been tested with the following command and size of image
file for unallocated namespaces is taken as 0GB. ns_create will look into
the list of unallocated namespaces and it will initialize the same and 
return the nsid of the same. A new mandatory field has been added called
tnvmcap and we have ensured that the total capacity of namespace created
does not exceed tnvmcap

-device nvme-subsys,id=subsys0,tnvmcap=8
-device nvme,serial=foo,id=nvme0,subsys=subsys0
-device nvme,serial=bar,id=nvme1,subsys=subsys0

-drive id=ns1,file=ns1.img,if=none
-device nvme-ns,drive=ns1,bus=nvme0,nsid=1,zoned=false,shared=true
-drive id=ns2,file=ns2.img,if=none
-device nvme-ns,drive=ns2,bus=nvme0,nsid=2,zoned=false,shared=true
-drive id=ns3,file=ns3.img,if=none
-device nvme-ns,drive=ns3,bus=nvme0,nsid=3,zoned=false,shared=true
-drive id=ns4,file=ns4.img,if=none
-device nvme-ns,drive=ns4,bus=nvme0,nsid=4,zoned=false,shared=true

Please review and suggest if any changes are required.

Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>

Since v2:
-Lukasz Maniak found a bug in namespace attachment and proposed 
 solution is added

---
 hw/nvme/ctrl.c       | 241 ++++++++++++++++++++++++++++++++++++++++---
 hw/nvme/ns.c         |  61 ++++++-----
 hw/nvme/nvme.h       |   7 +-
 hw/nvme/subsys.c     |   3 +
 include/block/nvme.h |  18 +++-
 5 files changed, 288 insertions(+), 42 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 6baf9e0420..63ea2fcb14 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -219,6 +219,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_NS_MANAGEMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
     [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
     [NVME_ADM_CMD_FORMAT_NVM]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
 };
@@ -4450,11 +4451,19 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
     uint32_t nsid = le32_to_cpu(c->nsid);
+    NvmeIdNs *id_ns = NULL;
+    uint16_t ret;
 
     trace_pci_nvme_identify_ns(nsid);
 
-    if (!nvme_nsid_valid(n, nsid) || nsid == NVME_NSID_BROADCAST) {
+    if (!nvme_nsid_valid(n, nsid)) {
         return NVME_INVALID_NSID | NVME_DNR;
+    } else if (nsid == NVME_NSID_BROADCAST) {
+        id_ns = g_new0(NvmeIdNs, 1);
+        nvme_ns_identify_common(id_ns);
+        ret = nvme_c2h(n, (uint8_t *)id_ns, sizeof(NvmeIdNs), req);
+        g_free(id_ns);
+        return ret;
     }
 
     ns = nvme_ns(n, nsid);
@@ -5184,9 +5193,204 @@ static void nvme_select_iocs_ns(NvmeCtrl *n, NvmeNamespace *ns)
     }
 }
 
+static int nvme_blk_truncate(BlockBackend *blk, size_t len, Error **errp)
+{
+    int ret;
+    uint64_t perm, shared_perm;
+
+    blk_get_perm(blk, &perm, &shared_perm);
+
+    ret = blk_set_perm(blk, perm | BLK_PERM_RESIZE, shared_perm, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = blk_truncate(blk, len, false, PREALLOC_MODE_OFF, 0, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = blk_set_perm(blk, perm, shared_perm, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return 0;
+}
+
+static uint32_t nvme_allocate_nsid(NvmeCtrl *n)
+{
+    uint32_t nsid = 0;
+    for (int i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+        if (nvme_ns(n, i) || nvme_subsys_ns(n->subsys, i)) {
+            continue;
+        }
+
+        nsid = i;
+        return nsid;
+    }
+    return nsid;
+}
+
+static uint16_t nvme_namespace_create(NvmeCtrl *n, NvmeRequest *req)
+{
+    uint32_t ret;
+    NvmeIdNs id_ns_host;
+    NvmeSubsystem *subsys = n->subsys;
+    Error *err = NULL;
+    uint8_t flbas_host;
+    uint64_t ns_size;
+    int lba_index;
+    NvmeNamespace *ns;
+    NvmeCtrl *ctrl;
+    NvmeIdNs *id_ns;
+
+    ret = nvme_h2c(n, (uint8_t *)&id_ns_host, sizeof(id_ns_host), req);
+    if (ret) {
+        return ret;
+    }
+
+    if (id_ns_host.ncap < id_ns_host.nsze) {
+        return NVME_THIN_PROVISION_NO_SUPP | NVME_DNR;
+    } else if (id_ns_host.ncap > id_ns_host.nsze) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (!id_ns_host.nsze) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    if (QSLIST_EMPTY(&subsys->unallocated_namespaces)) {
+        return NVME_NS_ID_UNAVAILABLE;
+    }
+
+    ns = QSLIST_FIRST(&subsys->unallocated_namespaces);
+    id_ns = &ns->id_ns;
+    flbas_host = (id_ns_host.flbas) & (0xF);
+
+    if (flbas_host > id_ns->nlbaf) {
+        return NVME_INVALID_FORMAT | NVME_DNR;
+    }
+
+    ret = nvme_ns_setup(ns, &err);
+    if (ret) {
+        return ret;
+    }
+
+    id_ns->flbas = id_ns_host.flbas;
+    id_ns->dps = id_ns_host.dps;
+    id_ns->nmic = id_ns_host.nmic;
+
+    lba_index = NVME_ID_NS_FLBAS_INDEX(id_ns->flbas);
+    ns_size = id_ns_host.nsze * ((1 << id_ns->lbaf[lba_index].ds) +
+                (id_ns->lbaf[lba_index].ms));
+    id_ns->nvmcap = ns_size;
+
+    if (ns_size > n->id_ctrl.unvmcap) {
+        return NVME_NS_INSUFF_CAP;
+    }
+
+    ret = nvme_blk_truncate(ns->blkconf.blk, id_ns->nvmcap, &err);
+    if (ret) {
+        return ret;
+    }
+
+    ns->size = blk_getlength(ns->blkconf.blk);
+    nvme_ns_init_format(ns);
+
+    ns->params.nsid = nvme_allocate_nsid(n);
+    if (!ns->params.nsid) {
+        return NVME_NS_ID_UNAVAILABLE;
+    }
+    subsys->namespaces[ns->params.nsid] = ns;
+
+    for (int cntlid = 0; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
+        ctrl = nvme_subsys_ctrl(n->subsys, cntlid);
+        if (ctrl) {
+            ctrl->id_ctrl.unvmcap -= le64_to_cpu(ns->size);
+        }
+    }
+
+    stl_le_p(&req->cqe.result, ns->params.nsid);
+    QSLIST_REMOVE_HEAD(&subsys->unallocated_namespaces, entry);
+    return NVME_SUCCESS;
+}
+
+static void nvme_namespace_delete(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid)
+{
+    NvmeCtrl *ctrl;
+    NvmeSubsystem *subsys = n->subsys;
+
+    subsys->namespaces[nsid] = NULL;
+    QSLIST_INSERT_HEAD(&subsys->unallocated_namespaces, ns, entry);
+
+    for (int cntlid = 0; cntlid < ARRAY_SIZE(n->subsys->ctrls); cntlid++) {
+        ctrl = nvme_subsys_ctrl(n->subsys, cntlid);
+        if (ctrl) {
+            ctrl->id_ctrl.unvmcap += le64_to_cpu(ns->size);
+            if (nvme_ns(ctrl, nsid)) {
+                nvme_detach_ns(ctrl, ns, nsid);
+            }
+            nvme_ns_attr_changed_aer(ctrl, nsid);
+        }
+    }
+}
+
+static uint16_t nvme_ns_management(NvmeCtrl *n, NvmeRequest *req)
+{
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    uint8_t sel = dw10 & 0x7;
+    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint8_t  csi = le32_to_cpu(req->cmd.cdw11) >> 24;
+    NvmeNamespace *ns;
+
+    if (!n->subsys) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    switch (sel) {
+    case NVME_NS_MANAGEMENT_CREATE:
+        if (nsid) {
+            return NVME_INVALID_FIELD | NVME_DNR;
+        }
+        if (csi == NVME_CSI_NVM) {
+            return nvme_namespace_create(n, req);
+        }
+        break;
+    case NVME_NS_MANAGEMENT_DELETE:
+        if (nsid != NVME_NSID_BROADCAST && !nvme_nsid_valid(n, nsid)) {
+            return NVME_INVALID_NSID | NVME_DNR;
+        }
+        if (nsid == NVME_NSID_BROADCAST) {
+            uint32_t i;
+
+            for (i = 1; i <= NVME_MAX_NAMESPACES; i++) {
+                ns = nvme_subsys_ns(n->subsys, i);
+                if (!ns) {
+                    continue;
+                }
+                nvme_namespace_delete(n, ns, i);
+            }
+            return NVME_SUCCESS;
+        } else {
+            ns = nvme_subsys_ns(n->subsys, nsid);
+            if (!ns) {
+                return NVME_INVALID_FIELD | NVME_DNR;
+            }
+            nvme_namespace_delete(n, ns, nsid);
+            return NVME_SUCCESS;
+        }
+
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+    return NVME_INVALID_FIELD | NVME_DNR;
+}
+
 static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
+    NvmeIdNs *id_ns;
     NvmeCtrl *ctrl;
     uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
@@ -5217,6 +5421,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
         return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
     }
 
+    id_ns = &ns->id_ns;
     *nr_ids = MIN(*nr_ids, NVME_CONTROLLER_LIST_SIZE - 1);
     for (i = 0; i < *nr_ids; i++) {
         ctrl = nvme_subsys_ctrl(n->subsys, ids[i]);
@@ -5229,7 +5434,7 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
                 return NVME_NS_ALREADY_ATTACHED | NVME_DNR;
             }
 
-            if (ns->attached && !ns->params.shared) {
+            if (ns->attached && !(id_ns->nmic & NVME_NMIC_NS_SHARED)) {
                 return NVME_NS_PRIVATE | NVME_DNR;
             }
 
@@ -5239,22 +5444,14 @@ static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
             if (!nvme_ns(ctrl, nsid)) {
                 return NVME_NS_NOT_ATTACHED | NVME_DNR;
             }
-
-            ctrl->namespaces[nsid] = NULL;
-            ns->attached--;
-
-            nvme_update_dmrsl(ctrl);
+            nvme_detach_ns(ctrl, ns, nsid);
         }
 
         /*
          * Add namespace id to the changed namespace id list for event clearing
          * via Get Log Page command.
          */
-        if (!test_and_set_bit(nsid, ctrl->changed_nsids)) {
-            nvme_enqueue_event(ctrl, NVME_AER_TYPE_NOTICE,
-                               NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
-                               NVME_LOG_CHANGED_NSLIST);
-        }
+        nvme_ns_attr_changed_aer(ctrl, nsid);
     }
 
     return NVME_SUCCESS;
@@ -5487,6 +5684,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_get_feature(n, req);
     case NVME_ADM_CMD_ASYNC_EV_REQ:
         return nvme_aer(n, req);
+    case NVME_ADM_CMD_NS_MANAGEMENT:
+        return nvme_ns_management(n, req);
     case NVME_ADM_CMD_NS_ATTACHMENT:
         return nvme_ns_attachment(n, req);
     case NVME_ADM_CMD_FORMAT_NVM:
@@ -6471,6 +6670,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     if (n->subsys) {
         id->cmic |= NVME_CMIC_MULTI_CTRL;
+        id->tnvmcap = n->subsys->params.tnvmcap * GiB;
+        id->unvmcap = n->subsys->params.tnvmcap * GiB;
     }
 
     NVME_CAP_SET_MQES(cap, 0x7ff);
@@ -6518,6 +6719,22 @@ void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns)
                             BDRV_REQUEST_MAX_BYTES / nvme_l2b(ns, 1));
 }
 
+void nvme_detach_ns(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid)
+{
+    n->namespaces[nsid] = NULL;
+    ns->attached--;
+    nvme_update_dmrsl(n);
+}
+
+void nvme_ns_attr_changed_aer(NvmeCtrl *n, uint32_t nsid)
+{
+    if (!test_and_set_bit(nsid, n->changed_nsids)) {
+        nvme_enqueue_event(n, NVME_AER_TYPE_NOTICE,
+                           NVME_AER_INFO_NOTICE_NS_ATTR_CHANGED,
+                           NVME_LOG_CHANGED_NSLIST);
+    }
+}
+
 static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 {
     NvmeCtrl *n = NVME(pci_dev);
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index b7cf1494e7..f62a695132 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -54,6 +54,30 @@ void nvme_ns_init_format(NvmeNamespace *ns)
     id_ns->npda = id_ns->npdg = npdg - 1;
 }
 
+void nvme_ns_identify_common(NvmeIdNs *id_ns)
+{
+    id_ns->dlfeat = 0x1;
+
+    /* support DULBE and I/O optimization fields */
+    id_ns->nsfeat |= (0x4 | 0x10);
+    id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
+    id_ns->dpc = 0x1f;
+
+    static const NvmeLBAF lbaf[16] = {
+        [0] = { .ds =  9           },
+        [1] = { .ds =  9, .ms =  8 },
+        [2] = { .ds =  9, .ms = 16 },
+        [3] = { .ds =  9, .ms = 64 },
+        [4] = { .ds = 12           },
+        [5] = { .ds = 12, .ms =  8 },
+        [6] = { .ds = 12, .ms = 16 },
+        [7] = { .ds = 12, .ms = 64 },
+    };
+
+    memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
+    id_ns->nlbaf = 7;
+}
+
 static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
 {
     static uint64_t ns_count;
@@ -65,11 +89,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     ns->csi = NVME_CSI_NVM;
     ns->status = 0x0;
 
-    ns->id_ns.dlfeat = 0x1;
-
-    /* support DULBE and I/O optimization fields */
-    id_ns->nsfeat |= (0x4 | 0x10);
-
+    nvme_ns_identify_common(id_ns);
     if (ns->params.shared) {
         id_ns->nmic |= NVME_NMIC_NS_SHARED;
     }
@@ -89,32 +109,15 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     ds = 31 - clz32(ns->blkconf.logical_block_size);
     ms = ns->params.ms;
 
-    id_ns->mc = NVME_ID_NS_MC_EXTENDED | NVME_ID_NS_MC_SEPARATE;
-
     if (ms && ns->params.mset) {
         id_ns->flbas |= NVME_ID_NS_FLBAS_EXTENDED;
     }
 
-    id_ns->dpc = 0x1f;
     id_ns->dps = ns->params.pi;
     if (ns->params.pi && ns->params.pil) {
         id_ns->dps |= NVME_ID_NS_DPS_FIRST_EIGHT;
     }
 
-    static const NvmeLBAF lbaf[16] = {
-        [0] = { .ds =  9           },
-        [1] = { .ds =  9, .ms =  8 },
-        [2] = { .ds =  9, .ms = 16 },
-        [3] = { .ds =  9, .ms = 64 },
-        [4] = { .ds = 12           },
-        [5] = { .ds = 12, .ms =  8 },
-        [6] = { .ds = 12, .ms = 16 },
-        [7] = { .ds = 12, .ms = 64 },
-    };
-
-    memcpy(&id_ns->lbaf, &lbaf, sizeof(lbaf));
-    id_ns->nlbaf = 7;
-
     for (i = 0; i <= id_ns->nlbaf; i++) {
         NvmeLBAF *lbaf = &id_ns->lbaf[i];
         if (lbaf->ds == ds) {
@@ -402,10 +405,6 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (nvme_ns_init_blk(ns, errp)) {
-        return -1;
-    }
-
     if (nvme_ns_init(ns, errp)) {
         return -1;
     }
@@ -481,6 +480,15 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
         }
     }
 
+    if (nvme_ns_init_blk(ns, errp)) {
+        return;
+    }
+
+    if (!ns->size) {
+        QSLIST_INSERT_HEAD(&subsys->unallocated_namespaces, ns, entry);
+        return;
+    }
+
     if (nvme_ns_setup(ns, errp)) {
         return;
     }
@@ -519,6 +527,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
 
                 if (ctrl) {
                     nvme_attach_ns(ctrl, ns);
+                    ctrl->id_ctrl.unvmcap -= le64_to_cpu(ns->size);
                 }
             }
 
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 83ffabade4..142268f4e0 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -51,9 +51,11 @@ typedef struct NvmeSubsystem {
 
     NvmeCtrl      *ctrls[NVME_MAX_CONTROLLERS];
     NvmeNamespace *namespaces[NVME_MAX_NAMESPACES + 1];
+    QSLIST_HEAD(, NvmeNamespace) unallocated_namespaces;
 
     struct {
         char *nqn;
+        uint64_t tnvmcap;
     } params;
 } NvmeSubsystem;
 
@@ -130,7 +132,7 @@ typedef struct NvmeNamespace {
     uint16_t     status;
     int          attached;
 
-    QTAILQ_ENTRY(NvmeNamespace) entry;
+    QSLIST_ENTRY(NvmeNamespace) entry;
 
     NvmeIdNsZoned   *id_ns_zoned;
     NvmeZone        *zone_array;
@@ -259,6 +261,7 @@ int nvme_ns_setup(NvmeNamespace *ns, Error **errp);
 void nvme_ns_drain(NvmeNamespace *ns);
 void nvme_ns_shutdown(NvmeNamespace *ns);
 void nvme_ns_cleanup(NvmeNamespace *ns);
+void nvme_ns_identify_common(NvmeIdNs *id_ns);
 
 typedef struct NvmeAsyncEvent {
     QTAILQ_ENTRY(NvmeAsyncEvent) entry;
@@ -495,6 +498,8 @@ static inline uint16_t nvme_cid(NvmeRequest *req)
 }
 
 void nvme_attach_ns(NvmeCtrl *n, NvmeNamespace *ns);
+void nvme_detach_ns(NvmeCtrl *n, NvmeNamespace *ns, uint32_t nsid);
+void nvme_ns_attr_changed_aer(NvmeCtrl *n, uint32_t nsid);
 uint16_t nvme_bounce_data(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
                           NvmeTxDirection dir, NvmeRequest *req);
 uint16_t nvme_bounce_mdata(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
diff --git a/hw/nvme/subsys.c b/hw/nvme/subsys.c
index 93c35950d6..e30bfbca81 100644
--- a/hw/nvme/subsys.c
+++ b/hw/nvme/subsys.c
@@ -53,11 +53,14 @@ static void nvme_subsys_realize(DeviceState *dev, Error **errp)
     qbus_create_inplace(&subsys->bus, sizeof(NvmeBus), TYPE_NVME_BUS, dev,
                         dev->id);
 
+    QSLIST_INIT(&subsys->unallocated_namespaces);
+
     nvme_subsys_setup(subsys);
 }
 
 static Property nvme_subsystem_props[] = {
     DEFINE_PROP_STRING("nqn", NvmeSubsystem, params.nqn),
+    DEFINE_PROP_SIZE("tnvmcap", NvmeSubsystem, params.tnvmcap, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 77aae01174..8a8ca6753b 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -592,6 +592,7 @@ enum NvmeAdminCommands {
     NVME_ADM_CMD_SET_FEATURES   = 0x09,
     NVME_ADM_CMD_GET_FEATURES   = 0x0a,
     NVME_ADM_CMD_ASYNC_EV_REQ   = 0x0c,
+    NVME_ADM_CMD_NS_MANAGEMENT  = 0x0d,
     NVME_ADM_CMD_ACTIVATE_FW    = 0x10,
     NVME_ADM_CMD_DOWNLOAD_FW    = 0x11,
     NVME_ADM_CMD_NS_ATTACHMENT  = 0x15,
@@ -882,6 +883,9 @@ enum NvmeStatusCodes {
     NVME_FEAT_NOT_CHANGEABLE    = 0x010e,
     NVME_FEAT_NOT_NS_SPEC       = 0x010f,
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
+    NVME_NS_INSUFF_CAP          = 0x0115,
+    NVME_THIN_PROVISION_NO_SUPP = 0x011b,
+    NVME_NS_ID_UNAVAILABLE      = 0x0116,
     NVME_NS_ALREADY_ATTACHED    = 0x0118,
     NVME_NS_PRIVATE             = 0x0119,
     NVME_NS_NOT_ATTACHED        = 0x011a,
@@ -1056,8 +1060,10 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint16_t    mtfa;
     uint32_t    hmpre;
     uint32_t    hmmin;
-    uint8_t     tnvmcap[16];
-    uint8_t     unvmcap[16];
+    uint64_t    tnvmcap;
+    uint64_t    tnvmcap_u;
+    uint64_t    unvmcap;
+    uint64_t    unvmcap_u;
     uint32_t    rpmbs;
     uint16_t    edstt;
     uint8_t     dsto;
@@ -1154,6 +1160,11 @@ enum NvmeIdCtrlCmic {
     NVME_CMIC_MULTI_CTRL    = 1 << 1,
 };
 
+enum NvmeNsManagementOperation {
+    NVME_NS_MANAGEMENT_CREATE = 0x0,
+    NVME_NS_MANAGEMENT_DELETE = 0x1,
+};
+
 #define NVME_CTRL_SQES_MIN(sqes) ((sqes) & 0xf)
 #define NVME_CTRL_SQES_MAX(sqes) (((sqes) >> 4) & 0xf)
 #define NVME_CTRL_CQES_MIN(cqes) ((cqes) & 0xf)
@@ -1285,7 +1296,8 @@ typedef struct QEMU_PACKED NvmeIdNs {
     uint16_t    nabo;
     uint16_t    nabspf;
     uint16_t    noiob;
-    uint8_t     nvmcap[16];
+    uint64_t    nvmcap;
+    uint64_t    nvmcap_u;
     uint16_t    npwg;
     uint16_t    npwa;
     uint16_t    npdg;
-- 
2.17.1


