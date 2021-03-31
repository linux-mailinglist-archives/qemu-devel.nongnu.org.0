Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E443234FCD1
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 11:29:45 +0200 (CEST)
Received: from localhost ([::1]:38264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRXAW-000130-Vh
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 05:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lRX98-0000c9-3n
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:28:18 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:39350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lRX94-0004D9-8X
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 05:28:17 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210331092805epoutp04ae1b5f6cb4435a65f51d1f9932f96d1c~xY0Q0inXF1960519605epoutp04h
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 09:28:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210331092805epoutp04ae1b5f6cb4435a65f51d1f9932f96d1c~xY0Q0inXF1960519605epoutp04h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617182885;
 bh=mklvv2mDIce01p/7DYzla7gtZvqW7T2bOU0JuBr9Thk=;
 h=From:To:Cc:Subject:Date:References:From;
 b=hcwR85i1+oHEjRQ8hE9ajmsmqW6m/y1AwZYNYjoGp5UBHgSWKvQ5178LbCyLNvSoX
 7yrD7nNSWLDdTGjG3UclpwfaidpsitM/RARbgp49IHwlKZTQ/cNxG/7jl6S+gDSzDO
 nWZGE+PPTbDb3t5dTalSRmJlPsZmSzfjfRlil2Mo=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210331092805epcas5p39147af5df12f0947cc36b8c2d53b8140~xY0QZrZf50948909489epcas5p3u;
 Wed, 31 Mar 2021 09:28:05 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4F.4F.41008.5A044606; Wed, 31 Mar 2021 18:28:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210331092753epcas5p33ef9360c0c8c6b6310108d2da9aa2687~xY0FDwktd0986409864epcas5p3M;
 Wed, 31 Mar 2021 09:27:53 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210331092753epsmtrp24e16de919100bcf73ba922edbd158fef~xY0FC9Hrl1078610786epsmtrp20;
 Wed, 31 Mar 2021 09:27:53 +0000 (GMT)
X-AuditID: b6c32a4b-64bff7000001a030-df-606440a5b260
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 59.0F.33967.89044606; Wed, 31 Mar 2021 18:27:52 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210331092751epsmtip29afa200fadd7e20fc88e2f148c10a9c4~xY0Dj4y8R0790207902epsmtip2a;
 Wed, 31 Mar 2021 09:27:51 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] hw/block/nvme: add device self test command support
Date: Wed, 31 Mar 2021 14:54:27 +0530
Message-Id: <20210331092427.13545-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsWy7bCmlu5Sh5QEg1cT+Cxe7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsEroy/py+xFHyLqpixdDNrA+MC1y5GTg4J
 AROJNU0tjF2MXBxCArsZJW7+XcYC4XxilGjeM5kVwvnGKLHv8UdGmJaJD68wQyT2MkrcPn+A
 HcLpZJK41ryPCaSKTcBIYvbbN2AdIgKSEr+7TjOD2MwgS77N1QGxhQXcJXo/XwNawcHBIqAq
 sfSGCkiYV8BW4k7rHXaIZfISqzccAFsmIXCIXWLh/gNsIPUSAi4Sf77JQdQIS7w6vgWqXkri
 87u9QCXsQHa1xOEiiM4ORoljlzewQZTYS/x7No0RZAqzgKbE+l36EGFZiamn1jFBHMkn0fv7
 CRNEnFdixzwYW01iwa3vUJtkJGb+uc0KYXtIXF1+iRlkpJBArMTpKbwTGGVnISxYwMi4ilEy
 taA4Nz212LTAOC+1XK84Mbe4NC9dLzk/dxMjOB1oee9gfPTgg94hRiYOxkOMEhzMSiK8wgcS
 E4R4UxIrq1KL8uOLSnNSiw8xSnOwKInz7jB4EC8kkJ5YkpqdmlqQWgSTZeLglGpg8tDT6pz6
 dIKK2Xaf/ftW7v04bdIRZttH+86qvFE8l9PF8PRf4CXNptv31Jj/nCzibv2zmc++ITelZWH7
 39wZP6YtOq3Mt0fDVkV6843D9+3W/P3xIMCs75nYt4bQH1YnbxV/0g3QEZBVeqSm9G6N9m7J
 ncn+FpO3xHhnOi4VviDw9dt3mZ2tzZOPbHi46FmzvLmT5iVny03RNxee3GnLKmAonrQ0jF3n
 hlS84NlfxSsPd99Ze8wvUMeoUcbXy/SRh+m7BzsNVpZrXnowad3sHzeWVV74d9mFPaz8L8Ph
 ly/Wb5x7/uIh24vGOmr7GK/sndjFIGxucez34menf+3l+VQjPsN4082zMXV7PRau3dqpxFKc
 kWioxVxUnAgAjIarY3YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphluLIzCtJLcpLzFFi42LZdlhJXnemQ0qCwQ4Fi9c7jzNbXNl/ntFi
 /8FvrBaTDl1jtFhyMdVi3i1li1nv2tksjvfuYLF4Pek/qwOnx49z7Wwe53acZ/fYtKqTzePJ
 tc1MHu/3XWXz6NuyijGALYrLJiU1J7MstUjfLoEr4+/pSywF36IqZizdzNrAuMC1i5GTQ0LA
 RGLiwyvMXYxcHEICuxklli54wgKRkJH4dWoqM4QtLLHy33N2iKJ2JomXLduZQBJsAkYSs9++
 YQSxRQQkJX53nQabxCxwlFHicvtksEnCAu4SvZ+vsXYxcnCwCKhKLL2hAhLmFbCVuNN6hx1i
 gbzE6g0HmCcw8ixgZFjFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcYFqaOxi3r/qg
 d4iRiYPxEKMEB7OSCK/wgcQEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqem
 FqQWwWSZODilGpjmT2plOSKqpXFy1rsCN6Ur6kxHyqUztStm7JG6t5vn6a/gnZxfuLJiN8y+
 yaRydcGNPYo3nvL0l6UHHq6M2GSwTDU8zzKDpWXztyP57m+97rP6Tg2xvlG15f0O8+3fr9mv
 3OFRERVdudskJf5iS7Rgc6iOt8xiTRPlSc9nLmpTT/6w1U/ZgblKrrH/24/kxn/lR56ETV8+
 v0/laJpnRofEM4MVmspuSc8npKv75F9TO/F/veQ/3YBLc8Wqn4lqJAa/9rgUscI694I6cwuj
 vfiDmftzOT8Y90z6xXddJFGC//CNa+nfex4eK5UMc+D+sZZDxafsw3efPeb+pn7y/03rdC8c
 CDj7xfqhsOTWOUosxRmJhlrMRcWJAPcoOkCfAgAA
X-CMS-MailID: 20210331092753epcas5p33ef9360c0c8c6b6310108d2da9aa2687
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210331092753epcas5p33ef9360c0c8c6b6310108d2da9aa2687
References: <CGME20210331092753epcas5p33ef9360c0c8c6b6310108d2da9aa2687@epcas5p3.samsung.com>
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

This is to add support for Device Self Test Command (DST) and
DST Log Page. Refer NVM Express specification 1.4b section 5.8
("Device Self-test command")

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
changes:
 -v3: removed unwanted patch file added

 -v2: addressed style fixes in hw/block/nvme.h

 hw/block/nvme.c       | 118 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/nvme.h       |  13 +++++
 hw/block/trace-events |   1 +
 include/block/nvme.h  |  49 ++++++++++++++++++
 4 files changed, 180 insertions(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6842b01ab5..3c2186b170 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -214,6 +214,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
     [NVME_ADM_CMD_FORMAT_NVM]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_ADM_CMD_DST]              = NVME_CMD_EFF_CSUPP,
 };
 
 static const uint32_t nvme_cse_iocs_none[256];
@@ -3980,6 +3981,34 @@ static uint16_t nvme_cmd_effects(NvmeCtrl *n, uint8_t csi, uint32_t buf_len,
     return nvme_c2h(n, ((uint8_t *)&log) + off, trans_len, req);
 }
 
+static uint16_t nvme_dst_info(NvmeCtrl *n,  uint32_t buf_len, uint64_t off,
+                              NvmeRequest *req)
+{
+    NvmeDstLogPage dst_log = {};
+    NvmeDst *dst;
+    NvmeDstEntry *traverser;
+    uint32_t trans_len;
+    uint8_t entry_index = 0;
+    dst = &n->dst;
+
+    if (off >= sizeof(dst_log)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    dst_log.current_dsto = dst->current_dsto;
+    dst_log.current_dstc = dst->current_dstc;
+
+    QTAILQ_FOREACH(traverser, &dst->dst_list, entry) {
+        memcpy(&dst_log.dst_result[entry_index],
+            &traverser->dst_entry, sizeof(NvmeSelfTestResult));
+        entry_index++;
+    }
+
+    trans_len = MIN(sizeof(dst_log) - off, buf_len);
+
+    return nvme_c2h(n, ((uint8_t *)&dst_log) + off, trans_len, req);
+}
+
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCmd *cmd = &req->cmd;
@@ -4027,6 +4056,8 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
         return nvme_changed_nslist(n, rae, len, off, req);
     case NVME_LOG_CMD_EFFECTS:
         return nvme_cmd_effects(n, csi, len, off, req);
+    case NVME_LOG_DEV_SELF_TEST:
+        return nvme_dst_info(n, len, off, req);
     default:
         trace_pci_nvme_err_invalid_log_page(nvme_cid(req), lid);
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -5069,6 +5100,73 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     return req->status;
 }
 
+static void nvme_dst_create_entry(NvmeCtrl *n, uint32_t nsid,
+                                uint8_t stc)
+{
+    NvmeDstEntry *cur_entry;
+    time_t current_ms;
+
+    cur_entry = QTAILQ_LAST(&n->dst.dst_list);
+    QTAILQ_REMOVE(&n->dst.dst_list, cur_entry, entry);
+    memset(cur_entry, 0x0, sizeof(NvmeDstEntry));
+
+    cur_entry->dst_entry.dst_status = stc << 4;
+
+    if ((n->temperature >= n->features.temp_thresh_hi) ||
+        (n->temperature <= n->features.temp_thresh_low)) {
+        cur_entry->dst_entry.dst_status |= NVME_DST_WITH_FAILED_SEG;
+        cur_entry->dst_entry.segment_number = NVME_SMART_CHECK;
+    }
+
+    current_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
+    cur_entry->dst_entry.poh = cpu_to_le64((((current_ms -
+        n->starttime_ms) / 1000) / 60) / 60);
+    cur_entry->dst_entry.nsid = nsid;
+
+    QTAILQ_INSERT_HEAD(&n->dst.dst_list, cur_entry, entry);
+}
+
+static uint16_t nvme_dst_processing(NvmeCtrl *n, uint32_t nsid,
+                                    uint8_t stc)
+{
+    /*
+     * n->dst.current_dsto will be always 0x0 or NO DST OPERATION,
+     * since no background device self test operation takes place.
+     */
+    assert(n->dst.current_dsto == NVME_DST_NO_OPERATION);
+
+    if (stc == NVME_ABORT_DSTO) {
+        goto out;
+    }
+    if (stc == NVME_SHORT_DSTO || stc == NVME_EXTENDED_DSTO) {
+        nvme_dst_create_entry(n, nsid, stc);
+    }
+
+out:
+    n->dst.current_dstc = NVME_DST_OPERATION_COMPLETED;
+    return NVME_SUCCESS;
+}
+
+static uint16_t nvme_dst(NvmeCtrl *n, NvmeRequest *req)
+{
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint8_t stc = dw10 & 0xf;
+
+    trace_pci_nvme_dst(nvme_cid(req), nsid, stc);
+
+    if (!nvme_nsid_valid(n, nsid) && nsid != 0) {
+        return NVME_INVALID_NSID | NVME_DNR;
+    }
+
+    if (nsid != NVME_NSID_BROADCAST && nsid != 0 &&
+        !nvme_ns(n, nsid)) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    return nvme_dst_processing(n, nsid, stc);
+}
+
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
@@ -5109,6 +5207,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_ns_attachment(n, req);
     case NVME_ADM_CMD_FORMAT_NVM:
         return nvme_format(n, req);
+    case NVME_ADM_CMD_DST:
+        return nvme_dst(n, req);
     default:
         assert(false);
     }
@@ -5870,6 +5970,15 @@ static void nvme_init_state(NvmeCtrl *n)
     n->features.temp_thresh_hi = NVME_TEMPERATURE_WARNING;
     n->starttime_ms = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
     n->aer_reqs = g_new0(NvmeRequest *, n->params.aerl + 1);
+
+    QTAILQ_INIT(&n->dst.dst_list);
+
+    while (n->dst.num_entries < NVME_DST_MAX_ENTRIES) {
+        NvmeDstEntry *next_entry = g_malloc0(sizeof(NvmeDstEntry));
+        next_entry->dst_entry.dst_status = NVME_DST_ENTRY_NOT_USED;
+        QTAILQ_INSERT_HEAD(&n->dst.dst_list, next_entry, entry);
+        n->dst.num_entries++;
+    }
 }
 
 static int nvme_attach_namespace(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
@@ -6085,7 +6194,8 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
-    id->oacs = cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT);
+    id->oacs = cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT |
+        NVME_OACS_DST);
     id->cntrltype = 0x1;
 
     /*
@@ -6240,6 +6350,12 @@ static void nvme_exit(PCIDevice *pci_dev)
         host_memory_backend_set_mapped(n->pmr.dev, false);
     }
     msix_uninit_exclusive_bar(pci_dev);
+
+    while (!QTAILQ_EMPTY(&n->dst.dst_list)) {
+        NvmeDstEntry *entry = QTAILQ_FIRST(&n->dst.dst_list);
+        QTAILQ_REMOVE(&n->dst.dst_list, entry, entry);
+        g_free(entry);
+    }
 }
 
 static Property nvme_props[] = {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 5b0031b11d..5abd2fa7ed 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -158,6 +158,18 @@ typedef struct NvmeFeatureVal {
     uint32_t    async_config;
 } NvmeFeatureVal;
 
+typedef struct NvmeDst {
+    uint8_t      current_dsto;
+    uint8_t      current_dstc;
+    uint8_t      num_entries;
+    QTAILQ_HEAD(, NvmeDstEntry)  dst_list;
+} NvmeDst;
+
+typedef struct NvmeDstEntry {
+    NvmeSelfTestResult           dst_entry;
+    QTAILQ_ENTRY(NvmeDstEntry)   entry;
+} NvmeDstEntry;
+
 typedef struct NvmeCtrl {
     PCIDevice    parent_obj;
     MemoryRegion bar0;
@@ -223,6 +235,7 @@ typedef struct NvmeCtrl {
     NvmeCQueue      admin_cq;
     NvmeIdCtrl      id_ctrl;
     NvmeFeatureVal  features;
+    NvmeDst         dst;
 } NvmeCtrl;
 
 static inline NvmeNamespace *nvme_ns(NvmeCtrl *n, uint32_t nsid)
diff --git a/hw/block/trace-events b/hw/block/trace-events
index 22da06986d..f9a596e3a5 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -133,6 +133,7 @@ pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PR
 pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
 pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
+pci_nvme_dst(uint16_t cid, uint32_t nsid, uint8_t stc) "cid %"PRIu16" nsid 0x%"PRIx32" fid 0x%"PRIx8""
 pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" status 0x%"PRIx16""
 pci_nvme_mmio_read(uint64_t addr, unsigned size) "addr 0x%"PRIx64" size %d"
 pci_nvme_mmio_write(uint64_t addr, uint64_t data, unsigned size) "addr 0x%"PRIx64" data 0x%"PRIx64" size %d"
diff --git a/include/block/nvme.h b/include/block/nvme.h
index b0a4e42916..f835b62577 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -567,6 +567,7 @@ enum NvmeAdminCommands {
     NVME_ADM_CMD_ACTIVATE_FW    = 0x10,
     NVME_ADM_CMD_DOWNLOAD_FW    = 0x11,
     NVME_ADM_CMD_NS_ATTACHMENT  = 0x15,
+    NVME_ADM_CMD_DST            = 0x14,
     NVME_ADM_CMD_FORMAT_NVM     = 0x80,
     NVME_ADM_CMD_SECURITY_SEND  = 0x81,
     NVME_ADM_CMD_SECURITY_RECV  = 0x82,
@@ -849,6 +850,7 @@ enum NvmeStatusCodes {
     NVME_NS_ALREADY_ATTACHED    = 0x0118,
     NVME_NS_NOT_ATTACHED        = 0x011A,
     NVME_NS_CTRL_LIST_INVALID   = 0x011C,
+    NVME_DST_IN_PROGRESS        = 0x011D,
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
@@ -920,6 +922,50 @@ typedef struct QEMU_PACKED NvmeSmartLog {
 } NvmeSmartLog;
 
 #define NVME_SMART_WARN_MAX     6
+
+enum NvmeDstOpStatus {
+    NVME_DST_NO_OPERATION           = 0,
+    NVME_DST_OPERATION_COMPLETED    = 100,
+    NVME_DST_MAX_ENTRIES            = 20,
+};
+
+typedef struct QEMU_PACKED NvmeSelfTestResult {
+    uint8_t     dst_status;
+    uint8_t     segment_number;
+    uint8_t     valid_dinfo;
+    uint8_t     rsvd;
+    uint64_t    poh;
+    uint32_t    nsid;
+    uint64_t    flba;
+    uint8_t     sct;
+    uint8_t     sc;
+    uint8_t     vs[2];
+} NvmeSelfTestResult;
+
+typedef struct QEMU_PACKED NvmeDstLogPage {
+    uint8_t             current_dsto;
+    uint8_t             current_dstc;
+    uint8_t             rsvd[2];
+    NvmeSelfTestResult  dst_result[NVME_DST_MAX_ENTRIES];
+} NvmeDstLogPage;
+
+enum NvmeDstStc {
+    NVME_SHORT_DSTO     = 0x01,
+    NVME_EXTENDED_DSTO  = 0x02,
+    NVME_ABORT_DSTO     = 0x0f,
+};
+
+enum NvmeDstStatusResult {
+    NVME_DST_WITHOUT_ERROR      = 0x0,
+    NVME_DST_ABORTED_BY_DST_CMD = 0x1,
+    NVME_DST_WITH_FAILED_SEG    = 0x7,
+    NVME_DST_ENTRY_NOT_USED     = 0xf,
+};
+
+enum NvmeDstSegmentNumber {
+    NVME_SMART_CHECK    = 0x2,
+};
+
 enum NvmeSmartWarn {
     NVME_SMART_SPARE                  = 1 << 0,
     NVME_SMART_TEMPERATURE            = 1 << 1,
@@ -951,6 +997,7 @@ enum NvmeLogIdentifier {
     NVME_LOG_FW_SLOT_INFO   = 0x03,
     NVME_LOG_CHANGED_NSLIST = 0x04,
     NVME_LOG_CMD_EFFECTS    = 0x05,
+    NVME_LOG_DEV_SELF_TEST  = 0x06,
 };
 
 typedef struct QEMU_PACKED NvmePSD {
@@ -1076,6 +1123,7 @@ enum NvmeIdCtrlOacs {
     NVME_OACS_FORMAT    = 1 << 1,
     NVME_OACS_FW        = 1 << 2,
     NVME_OACS_NS_MGMT   = 1 << 3,
+    NVME_OACS_DST       = 1 << 4,
 };
 
 enum NvmeIdCtrlOncs {
@@ -1445,5 +1493,6 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeIdNsDescr) != 4);
     QEMU_BUILD_BUG_ON(sizeof(NvmeZoneDescr) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeDifTuple) != 8);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeDstLogPage) != 564);
 }
 #endif
-- 
2.17.1


