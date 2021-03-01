Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B61432810C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 15:36:47 +0100 (CET)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGjfB-0003SM-WF
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 09:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGj6n-0002P8-52; Mon, 01 Mar 2021 09:01:13 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:58851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lGj6g-000435-Kn; Mon, 01 Mar 2021 09:01:12 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CE71F5C003B;
 Mon,  1 Mar 2021 09:01:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 01 Mar 2021 09:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=sPlkfIUNxTNFI
 ysNxqG7K4k8v4d9WmPkKNlfwvFufi0=; b=bQ189fRic0AM28oVq8SF7tx8IHpC7
 KyS+9uaCVPy26MWIzxKfYedIVzXnEFyJL6N3zVf5a6d63mZmNvHgT8QHzjjbYXaL
 MtmouxOCza8cuCoLJfubGGBxB3/ZQ4Gonja+MnFeojwNho1o5I7iNoEnorloGGpZ
 F81R3GhsrH0EAAMATA4RCAXncG0u8WIJn+2m6xxhuyLv3p8Q+fVmxZXgb5WGQau8
 +l9h17WE/akwEuEOCIAGww0hQatb9Xhq+AhHUQVHnWCQupi1Hbj4WUGpFEjbCZS0
 1GkxY+AMUOd5h+9PoaPfqM0HlfYE9jTjCz5J40XUgAcmT2zUo7tAGtqRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=sPlkfIUNxTNFIysNxqG7K4k8v4d9WmPkKNlfwvFufi0=; b=OeUOimTG
 pTDsELfGQykE3ECvZCLJFYbmnncnU0s4dcL8qzkhr0tflavdF98QfqNQqnno+3YW
 PjnOsimN36hcgQ8cLzoWaU4c2bk4/q7LmtT13FXnckzI6MlTF1lui/qWNYfPLkQ4
 37pAXCJotjYsK9jDKtKQZrmnDt2bKb6YXn/4Kh3TLG4V3i00giqSk+upul6IZuex
 m5BgmvihBjfMePP2SmK1ibqEW8DaEW3gKv2rojS2yfRyVThkx8L+urVVZ04H6PIq
 DVRCWWCkAbukt3rKZol8gSpAOspmeHvg/xco5OepyaF0fMqdQrf3Cj+Pq8+ZouYj
 uOlOEdXKbkjd8A==
X-ME-Sender: <xms:ofM8YPDyYbudwh_5nFyD2JdZxuaLv5XaM1Et09xUaRwAvpQxTad1AQ>
 <xme:ofM8YFgsLiazop-2MLcGnwVNjtZ2A56qEMnadprOeJW4OUK4sfCrfrkYPrXn323to
 KJBVvCgvYT7Ch2dxpE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrleekgdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepheenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ofM8YKlJAObmcfZZBFFCqUhFwbSgRHSb5oYIToYWqZKu7RBRcAFSpQ>
 <xmx:ofM8YByf_OqU0VBCFHEtxwVMG8wpn_-uJgvYB84gGsC0mhzYtzdUXg>
 <xmx:ofM8YESrljbySB7trRgMHrPOcedB59hdO0hNt6CisptHdFP2ideTow>
 <xmx:ofM8YJR8WxiA7757O_v3Dn0NMXjDYCvYc_rWbXSoAJPQ77rbPyojaQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 658981080067;
 Mon,  1 Mar 2021 09:01:04 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/12] hw/block/nvme: add non-mdts command size limit for
 verify
Date: Mon,  1 Mar 2021 15:00:45 +0100
Message-Id: <20210301140047.106261-11-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210301140047.106261-1-its@irrelevant.dk>
References: <20210301140047.106261-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
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
 hw/block/nvme.c      | 49 +++++++++++++++++++++++++++++++++++---------
 3 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 2afbece68b87..5154196ad5a3 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -20,6 +20,7 @@ typedef struct NvmeParams {
     uint8_t  aerl;
     uint32_t aer_max_queued;
     uint8_t  mdts;
+    uint8_t  vsl;
     bool     use_intel_id;
     uint8_t  zasl;
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
index 0bf667f824ce..beaf7f850bd3 100644
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
@@ -69,12 +70,26 @@
  *   as a power of two (2^n) and is in units of the minimum memory page size
  *   (CAP.MPSMIN). The default value is 7 (i.e. 512 KiB).
  *
+ * - `vsl`
+ *   Indicates the maximum data size limit for the Verify command. Like `mdts`,
+ *   this value is specified as a power of two (2^n) and is in units of the
+ *   minimum memory page size (CAP.MPSMIN). The default value is 7 (i.e. 512
+ *   KiB).
+ *
  * - `zoned.zasl`
  *   Indicates the maximum data transfer size for the Zone Append command. Like
  *   `mdts`, the value is specified as a power of two (2^n) and is in units of
  *   the minimum memory page size (CAP.MPSMIN). The default value is 0 (i.e.
  *   defaulting to the value of `mdts`).
  *
+ * - `zoned.append_size_limit`
+ *   The maximum I/O size in bytes that is allowed in Zone Append command.
+ *   The default is 128KiB. Since internally this this value is maintained as
+ *   ZASL = log2(<maximum append size> / <page size>), some values assigned
+ *   to this property may be rounded down and result in a lower maximum ZA
+ *   data size being in effect. By setting this property to 0, users can make
+ *   ZASL to be equal to MDTS. This property only affects zoned namespaces.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `subsys`
@@ -2505,6 +2520,10 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
+    if (len > n->page_size << n->params.vsl) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
         trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
@@ -4022,19 +4041,24 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
 static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
-    NvmeIdCtrlZoned id = {};
+    uint8_t id[NVME_IDENTIFY_DATA_SIZE] = {};
 
     trace_pci_nvme_identify_ctrl_csi(c->csi);
 
-    if (c->csi == NVME_CSI_NVM) {
-        return nvme_rpt_empty_id_struct(n, req);
-    } else if (c->csi == NVME_CSI_ZONED) {
-        id.zasl = n->params.zasl;
+    switch (c->csi) {
+    case NVME_CSI_NVM:
+        ((NvmeIdCtrlNvm *)&id)->vsl = n->params.vsl;
+        break;
 
-        return nvme_c2h(n, (uint8_t *)&id, sizeof(id), req);
+    case NVME_CSI_ZONED:
+        ((NvmeIdCtrlZoned *)&id)->zasl = n->params.zasl;
+        break;
+
+    default:
+        return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    return NVME_INVALID_FIELD | NVME_DNR;
+    return nvme_c2h(n, id, sizeof(id), req);
 }
 
 static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
@@ -5418,6 +5442,11 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
                    "than or equal to mdts (Maximum Data Transfer Size)");
         return;
     }
+
+    if (!n->params.vsl) {
+        error_setg(errp, "vsl must be non-zero");
+        return;
+    }
 }
 
 static void nvme_init_state(NvmeCtrl *n)
@@ -5640,8 +5669,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->nn = cpu_to_le32(n->num_namespaces);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
-                           NVME_ONCS_COMPARE | NVME_ONCS_COPY |
-                           NVME_ONCS_VERIFY);
+                           NVME_ONCS_COMPARE | NVME_ONCS_COPY);
 
     /*
      * NOTE: If this device ever supports a command set that does NOT use 0x0
@@ -5784,6 +5812,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT8("aerl", NvmeCtrl, params.aerl, 3),
     DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
     DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
+    DEFINE_PROP_UINT8("vsl", NvmeCtrl, params.vsl, 7),
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
-- 
2.30.1


