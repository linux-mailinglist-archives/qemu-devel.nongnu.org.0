Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A2D31B348
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 00:23:43 +0100 (CET)
Received: from localhost ([::1]:55070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBQju-00087o-CM
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 18:23:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQQ4-0004R6-BN; Sun, 14 Feb 2021 18:03:13 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:47307)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lBQPw-0001qH-OQ; Sun, 14 Feb 2021 18:03:12 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B7D725C0083;
 Sun, 14 Feb 2021 18:02:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 14 Feb 2021 18:02:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=mgiIQL+45rpWB
 hWBCWU6B6bQA6oPi+g+ctu4wJJLMiM=; b=SVx17E6vXEKch5wiP9YJTHNSy+DH/
 mBVJAJBh8bus98/Q3Wl2uceWZrnqd9mjTbQGiJ+SbLWGbvb+UGB5nfFDiDeXoJtH
 OEa88gPqkBIL3SH/P4z2WQW+VurZcIgB+g94vBANs0oMKCOmgPyvvYC5oK6OGQF8
 5ju9Pi/wDtlfO6W2/QlJJGuvtYeNbWnh3hwFuJJbRL0P1hYaYgaZ/3MrbGFIHj0P
 GPAzgMfQrzVn2E0ysur+fon7A/PrgLo+2CV5xCe3ksKL3N1C48ugtYw1uIQ2XIdj
 OK/k/DWwyEFeVJLDXDqKUR8hgys7aQbav1mey/Z/qmE9ruAAcTeovAWqw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=mgiIQL+45rpWBhWBCWU6B6bQA6oPi+g+ctu4wJJLMiM=; b=M76rioEF
 NcXLcWsJH5ZN7lQ8NLvv30rUhBNQvrZfNCcZWPK8rc89MYw4/PBA3nsrqiLCKKgm
 3eABHzbBeOvBPUpOOZTfz1IlO4+PNE6LLCwveMDnebpxZng7jptsWto5h3tJEYrk
 Xf9lYuOTFHMBT0jgtwH9dI18kuxQ2i6cBwOKTqe+jLhLB7rboMO3A6kQgOg6fuVO
 /DSvxvQLipTXlwQkRa0HZieKdvhCnL59VlLQR4ldBikNJ7bxzVWwNL0/cVRdX7Jd
 Z/L2fCDdtJV+NXkRnJ8wSVwU/8WE27ZgX/Q/MqKFdu6e7g9D+fpIFY/C94Vk0aKU
 lpA+wfEq32h57g==
X-ME-Sender: <xms:I6wpYGOeJ0Mg2MWPge6bQ9FSeITue9Zgg3Z4x91J7DZ0qiBSuC_wOw>
 <xme:I6wpYE9-ZVXKfArmqmRTQP9RR9Gy0eq4YmFlzCKB0h2fhl-E5WIbkofOTarpAJ9Jv
 mENRXCogxm0oEYRXQ4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrieeigddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepkeenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:I6wpYNQZ5nU9AXc31aMVelreivu2U-TKLq80QO6d_doi3wSzQ9EhLA>
 <xmx:I6wpYGvjgNqlenSDxyefzOtlZEdJZmDCTPoM9eh9TpPb-OXh9Ng4tA>
 <xmx:I6wpYOe6GoJwIFfU2SdkSoRwWcYdKMY9txhlzuiDADqAjURIWODQMQ>
 <xmx:I6wpYEs690eP73yncq3JL1pobrpX1BLIodjcom2h1rKtjPgOkTsuNA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 56E37240057;
 Sun, 14 Feb 2021 18:02:58 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC v3 10/12] hw/block/nvme: add non-mdts command size limit
 for verify
Date: Mon, 15 Feb 2021 00:02:38 +0100
Message-Id: <20210214230240.301275-11-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210214230240.301275-1-its@irrelevant.dk>
References: <20210214230240.301275-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Verify is not subject to MDTS, so a single Verify command may result in
excessive amounts of allocated memory. Impose a limit on the data size
by adding support for TP 4040 ("Non-MDTS Command Size Limits").

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h      |  1 +
 include/block/nvme.h |  5 +++++
 hw/block/nvme.c      | 50 +++++++++++++++++++++++++++++++++-----------
 3 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 3b8ed73d2a04..d1b09ece1985 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -19,6 +19,7 @@ typedef struct NvmeParams {
     uint8_t  aerl;
     uint32_t aer_max_queued;
     uint8_t  mdts;
+    uint8_t  vsl;
     bool     use_intel_id;
     uint32_t zasl_bs;
     bool     legacy_cmb;
diff --git a/include/block/nvme.h b/include/block/nvme.h
index c2fd7e817e5d..ec5262d17e12 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1042,6 +1042,11 @@ typedef struct QEMU_PACKED NvmeIdCtrl {
     uint8_t     vs[1024];
 } NvmeIdCtrl;
 
+typedef struct NvmeIdCtrlNvm {
+    uint8_t     vsl;
+    uint8_t     rsvd1[4095];
+} NvmeIdCtrlNvm;
+
 typedef struct NvmeIdCtrlZoned {
     uint8_t     zasl;
     uint8_t     rsvd1[4095];
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7b366f979a1c..e5832ce2a69e 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -22,7 +22,8 @@
  *              [pmrdev=<mem_backend_file_id>,] \
  *              max_ioqpairs=<N[optional]>, \
  *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
- *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]>, \
+ *              mdts=<N[optional]>,vsl=<N[optional]>, \
+ *              zoned.append_size_limit=<N[optional]>, \
  *              subsys=<subsys_id> \
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
@@ -63,6 +64,18 @@
  *   completion when there are no outstanding AERs. When the maximum number of
  *   enqueued events are reached, subsequent events will be dropped.
  *
+ * - `mdts`
+ *   Indicates the maximum data transfer size for a command that transfers data
+ *   between host-accessible memory and the controller. The value is specified
+ *   as a power of two (2^n) and is in units of the minimum memory page size
+ *   (CAP.MPSMIN). The default value is 7 (i.e. 512 KiB).
+ *
+ * - `vsl`
+ *   Indicates the maximum data size limit for the Verify command. Like `mdts`,
+ *   this value is specified as a power of two (2^n) and is in units of the
+ *   minimum memory page size (CAP.MPSMIN). The default value is 7 (i.e. 512
+ *   KiB).
+ *
  * - `zoned.append_size_limit`
  *   The maximum I/O size in bytes that is allowed in Zone Append command.
  *   The default is 128KiB. Since internally this this value is maintained as
@@ -2866,6 +2879,10 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
+    if (len > n->page_size << n->params.vsl) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
         trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
@@ -4551,20 +4568,24 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
-    NvmeIdCtrlZoned id = {};
+    uint8_t id[NVME_IDENTIFY_DATA_SIZE] = {};
 
     trace_pci_nvme_identify_ctrl_csi(c->csi);
 
-    if (c->csi == NVME_CSI_NVM) {
-        return nvme_rpt_empty_id_struct(n, req);
-    } else if (c->csi == NVME_CSI_ZONED) {
-        if (n->params.zasl_bs) {
-            id.zasl = n->zasl;
-        }
-        return nvme_c2h(n, (uint8_t *)&id, sizeof(id), req);
+    switch (c->csi) {
+    case NVME_CSI_NVM:
+        ((NvmeIdCtrlNvm *)&id)->vsl = n->params.vsl;
+        break;
+
+    case NVME_CSI_ZONED:
+        ((NvmeIdCtrlZoned *)&id)->zasl = n->zasl;
+        break;
+
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    return NVME_INVALID_FIELD | NVME_DNR;
+    return nvme_c2h(n, id, sizeof(id), req);
 }
 
 static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
@@ -5968,6 +5989,11 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
             return;
         }
     }
+
+    if (!n->params.vsl) {
+        error_setg(errp, "vsl must be non-zero");
+        return;
+    }
 }
 
 static void nvme_init_state(NvmeCtrl *n)
@@ -6190,8 +6216,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->nn = cpu_to_le32(n->num_namespaces);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
-                           NVME_ONCS_COMPARE | NVME_ONCS_COPY |
-                           NVME_ONCS_VERIFY);
+                           NVME_ONCS_COMPARE | NVME_ONCS_COPY);
 
     /*
      * NOTE: If this device ever supports a command set that does NOT use 0x0
@@ -6334,6 +6359,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT8("aerl", NvmeCtrl, params.aerl, 3),
     DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
     DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
+    DEFINE_PROP_UINT8("vsl", NvmeCtrl, params.vsl, 7),
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_SIZE32("zoned.append_size_limit", NvmeCtrl, params.zasl_bs,
-- 
2.30.0


