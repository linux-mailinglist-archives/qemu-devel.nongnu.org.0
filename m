Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC2934FAAC
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 09:45:49 +0200 (CEST)
Received: from localhost ([::1]:40668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRVXw-0007aj-8n
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 03:45:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lRVWn-0006wK-OJ
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 03:44:38 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:60153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lRVWc-00071w-Cx
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 03:44:37 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210331074417epoutp03b679b903a6801f79f93145e9b53ac899~xXZn_skwF2536025360epoutp03N
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 07:44:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210331074417epoutp03b679b903a6801f79f93145e9b53ac899~xXZn_skwF2536025360epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1617176657;
 bh=yVsHCVsKLhnnZ8ib3gwK1N526Ie37+5vf6eJmoDxLp0=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Zq1eA2jBEnF3v4y7SyW4KXirYAQz+F6kpTwAvm9vOYapjQMNp2v1Cy/tjmLbnzekm
 Tn2ewpPxS5iRwHGmLKGPB7qr9jF2uUHaciA7cMK0yUe9SXvBxnPk4MSQ5JzT/8UW5Y
 DMYVEm7PIJuvishEYZp2vB+kHYqf9y2udYJCnyf8=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTP id
 20210331074416epcas5p1450a29d9ec9d1c6f91e30578cf76d6e4~xXZnqRYMB1999719997epcas5p1T;
 Wed, 31 Mar 2021 07:44:16 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 A8.46.15682.05824606; Wed, 31 Mar 2021 16:44:16 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20210331073605epcas5p349854b0cd620475674895fa40417ffeb~xXSeYEMZs1945919459epcas5p3N;
 Wed, 31 Mar 2021 07:36:05 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210331073605epsmtrp1461ba354b5853d0457246205154505f5~xXSeXRsrI1418114181epsmtrp1x;
 Wed, 31 Mar 2021 07:36:05 +0000 (GMT)
X-AuditID: b6c32a49-8bfff70000013d42-18-606428506140
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 AF.C1.08745.56624606; Wed, 31 Mar 2021 16:36:05 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210331073604epsmtip19c6329496ca3a38221ba2f13dc94c2f8~xXSdCZTGL1721517215epsmtip1_;
 Wed, 31 Mar 2021 07:36:04 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/block/nvme: add device self test command support
Date: Wed, 31 Mar 2021 13:02:33 +0530
Message-Id: <20210331073233.11198-1-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7bCmpm6ARkqCQfNHHYvXO48zW1zZf57R
 Yv/Bb6wWkw5dY7RYcjHVYt4tZYtZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK+PJv3XMBdOjKl4vb2BpYLzu0sXIySEh
 YCJxY/5H9i5GLg4hgd2MEhsbNzFBOJ8YJSZ+W8wI4XwGyvxdyA7Tcqb5K1TVLkaJh8t3QfV3
 Mkn8XD+bDaSKTcBIYvbbN4wgtoiApMTvrtPMIDYzyJJvc3VAbGEBF4mnM06zgNgsAqoSu+fd
 A9vAK2ArcadpAhPENnmJ1RsOMIMskBA4xi6x++Y2oKEcQI6LxMR2qCeEJV4d3wJ1nZTEy/42
 IJsdyK6WOFwE0dnBKHHs8gY2iBJ7iX/PpoFNYRbQlFi/Sx8iLCsx9dQ6Jogr+SR6fz+BuoBX
 Ysc8GFtNYsGt71CbZCRm/rnNCmF7SFy9dwrsQyGBWIm7vU+YJjDKzkLYsICRcRWjZGpBcW56
 arFpgWFearlecWJucWleul5yfu4mRnBK0PLcwXj3wQe9Q4xMHIyHGCU4mJVEeIUPJCYI8aYk
 VlalFuXHF5XmpBYfYpTmYFES591h8CBeSCA9sSQ1OzW1ILUIJsvEwSnVwJQTY9V40e3Jvzks
 ZwSvutwJkPq695W954tvWiK+L55wBLFpm7yMEqys3bBs2rGgwkjhJql6ts+iCYzbxeRUDfPi
 LpydEjTr377b7jUSsgGTNv33lL9Rn/LsaLVpwNRvuZpXWQ7tvj6Zc4XjueA38tcMDbilPmpH
 hXRGRWiIlifvkcybv4eVc+7+y4vXT5L7oFGy/879LPbSw6cUuPV2/wreMEXbqP0Wp+eUa53B
 2ovvhVn/T1eTT+SMPdCVsrin92Jlhdg09uuGu288unfq8PXlE6UXe//9msr94/Jd8UULlW1e
 nWx4caObY8ulJ62XxC1WcX7VXn/+SY/YlQvFbRembtjkHdaXf+SVybSZ4teUWIozEg21mIuK
 EwGofZy5eAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplluLIzCtJLcpLzFFi42LZdlhJTjdVLSXBYM9sHYvXO48zW1zZf57R
 Yv/Bb6wWkw5dY7RYcjHVYt4tZYtZ79rZLI737mCxeD3pP6sDp8ePc+1sHud2nGf32LSqk83j
 ybXNTB7v911l8+jbsooxgC2KyyYlNSezLLVI3y6BK+PJv3XMBdOjKl4vb2BpYLzu0sXIySEh
 YCJxpvkrUxcjF4eQwA5GiZ/7uhkhEjISv05NZYawhSVW/nvODmILCbQzSRx/bABiswkYScx+
 +wasXkRAUuJ312lmkEHMAkcZJS63T2YBSQgLuEg8nXEazGYRUJXYPe8e2CBeAVuJO00TmCAW
 yEus3nCAeQIjzwJGhlWMkqkFxbnpucWGBUZ5qeV6xYm5xaV56XrJ+bmbGMEhpqW1g3HPqg96
 hxiZOBgPMUpwMCuJ8AofSEwQ4k1JrKxKLcqPLyrNSS0+xCjNwaIkznuh62S8kEB6Yklqdmpq
 QWoRTJaJg1OqgYntn+uiqc0n4iM3SXdY31HYc8q9+9k2s/On7ctuNTHX20u3GnCULl3olJjx
 r7Z3b4Dx3Njb6xZM2rBlbVXEOwNfLu/HsrdvzlgXnN25a38ej061stHm9fq1q0UDVv+Y0NTX
 MPVe1qkpb2vNr9/6cXftvJnvC9c+mDbLhDnLVZ+zYBdXBvdSt0VTd7TxqGisbrUXn23eIKn7
 N9NA+Bbr7MtdC60ZrWJabWe+yD6+bPnXV4kXLhkkmvHNUaydNv/TQs/pl+O964457V/a9TB+
 e1ex/pJn0za77Yt/ZjpdWGVJl1CH+T77ThuBdk4Dzyl/Lu0omiIwq6Bx1drj02Zt2ug5b01A
 mNo2/zkmfaYbNOSUWIozEg21mIuKEwHRGXexoAIAAA==
X-CMS-MailID: 20210331073605epcas5p349854b0cd620475674895fa40417ffeb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210331073605epcas5p349854b0cd620475674895fa40417ffeb
References: <CGME20210331073605epcas5p349854b0cd620475674895fa40417ffeb@epcas5p3.samsung.com>
Received-SPF: pass client-ip=203.254.224.33;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout3.samsung.com
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
index 5b0031b11d..20e020d467 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -158,6 +158,18 @@ typedef struct NvmeFeatureVal {
     uint32_t    async_config;
 } NvmeFeatureVal;
 
+typedef struct NvmeDst {
+    uint8_t      current_dsto;
+    uint8_t      current_dstc;
+    uint8_t      num_entries;
+    QTAILQ_HEAD(dst_list, NvmeDstEntry)  dst_list;
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


