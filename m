Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A8133E116
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:05:07 +0100 (CET)
Received: from localhost ([::1]:32772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMHoI-0002Nq-JK
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXv-00070k-7k; Tue, 16 Mar 2021 17:48:11 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:53399)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lMHXt-0000yj-7K; Tue, 16 Mar 2021 17:48:11 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 486015C00DC;
 Tue, 16 Mar 2021 17:48:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 16 Mar 2021 17:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=v7R6ji4hmzhu3
 WPoc4UYASaZHazKMQsmhFwtwuXaMHI=; b=GDjBkgqlRcrERQDIwXgWX0KlcPvN8
 4wGA+BRgwrAtfGeFLKA/P1y/8KQZoCqyIsppgQDVyfj6t2fqchMoOUEBZSVzZ4b3
 QmHJPZwsBE93sQfDTJZgUwZ5BmBF5zMWASaZZ+wrgwMIRnA6NyyQmL9fXF0jvY6e
 J7AZI9+oyiI3XXB5dcpbegc3rowcHqHo4ea7YhG9FbnC8spM1Q3x1DrIZrlal7ui
 xbywOXrG7NWxO61WvM2JQ6wEoCKT/K0Ip9qAd6VYngb10E6jKhU4Tm1qhMpHSvF+
 HmqUiUbKs9Yip8dSO5N2hUvSF+pHr+VRlvliOiaFcgjlWDYrFNQfsIy6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=v7R6ji4hmzhu3WPoc4UYASaZHazKMQsmhFwtwuXaMHI=; b=eltFXmg2
 Ydgm6GyfMgHutfBKgIzadCs4kBY4CjUlq3MoHLK2Bdljipm7k3f/e3x5T9n3ACT2
 ZBHEtf6HnKmZj7MIFN6xGYVJeaIidKmJQBfrHNa+D911fs01xIRbuDWYzUED8IZq
 jNe6pn+s2WK57W81VWLP6gWUh6pEdsBlvywVvTl5KSJaIeu7RBj076bqNAJWEc5x
 btq1bnnRG7zfRa0am00hPX/rwHtCgvhbcsMcg3nne5eyD+yoOxiwojBMFP9d79vh
 FrBecZmzQZIuY/frq7but68hQvslRjgYwtyevxDh0BamMg+Mr3CpylrUXrzRNHio
 dHpNCG6bXK7EUg==
X-ME-Sender: <xms:mCdRYNb9HAwwYV2MIKMf3k2fQykxGyAlvrv_XeQbIFddmXzkUQKxTw>
 <xme:mCdRYJQvgEajvY9nAj9yv-kW7hCjzJzaEuTAMTs-vIAWdHIbydnAshT7HBaKEQOf7
 02yPShJFPWbnQp5Uf4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefvddgudehhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:mCdRYIiCD5cj2rB9e61Pju_1-QdA6Ibmm4822fncinNd64KrxRzvpA>
 <xmx:mCdRYM4SRGL01-WJFqhJ7wLIKb3mshpa7alVhblPi--RGa2fmF8ixA>
 <xmx:mCdRYLn83AJfFxxk93jssKETTjNEld5mcVpog4ut0OCepa_HkN3oSg>
 <xmx:mCdRYCcML29HLKcpttk7TaV_-4MTBgpFsN_22K8RWYMxQ9SfvvlpXw>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E8396108005C;
 Tue, 16 Mar 2021 17:48:06 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 07/11] hw/block/nvme: add non-mdts command size limit for verify
Date: Tue, 16 Mar 2021 22:47:49 +0100
Message-Id: <20210316214753.399389-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210316214753.399389-1-its@irrelevant.dk>
References: <20210316214753.399389-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=its@irrelevant.dk;
 helo=out5-smtp.messagingengine.com
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Verify is not subject to MDTS, so a single Verify command may result in
excessive amounts of allocated memory. Impose a limit on the data size
by adding support for TP 4040 ("Non-MDTS Command Size Limits").

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.h |  1 +
 hw/block/nvme.c | 34 ++++++++++++++++++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 11c7fcc317da..7b082212db04 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -26,6 +26,7 @@ typedef struct NvmeParams {
     uint8_t  aerl;
     uint32_t aer_max_queued;
     uint8_t  mdts;
+    uint8_t  vsl;
     bool     use_intel_id;
     uint8_t  zasl;
     bool     legacy_cmb;
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index d754bd8e0440..64cb966ab695 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -23,7 +23,8 @@
  *              [pmrdev=<mem_backend_file_id>,] \
  *              max_ioqpairs=<N[optional]>, \
  *              aerl=<N[optional]>,aer_max_queued=<N[optional]>, \
- *              mdts=<N[optional]>,zoned.zasl=<N[optional]>, \
+ *              mdts=<N[optional]>,vsl=<N[optional]>, \
+ *              zoned.zasl=<N[optional]>, \
  *              subsys=<subsys_id>
  *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
  *              zoned=<true|false[optional]>, \
@@ -78,12 +79,26 @@
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
@@ -2544,6 +2559,10 @@ static uint16_t nvme_verify(NvmeCtrl *n, NvmeRequest *req)
         }
     }
 
+    if (len > n->page_size << n->params.vsl) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
     status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
         trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
@@ -4109,12 +4128,14 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
     uint8_t id[NVME_IDENTIFY_DATA_SIZE] = {};
+    NvmeIdCtrlNvm *id_nvm = (NvmeIdCtrlNvm *)&id;
 
     trace_pci_nvme_identify_ctrl_csi(c->csi);
 
     switch (c->csi) {
     case NVME_CSI_NVM:
-        ((NvmeIdCtrlNvm *)&id)->dmrsl = cpu_to_le32(n->dmrsl);
+        id_nvm->vsl = n->params.vsl;
+        id_nvm->dmrsl = cpu_to_le32(n->dmrsl);
         break;
 
     case NVME_CSI_ZONED:
@@ -5657,6 +5678,11 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
@@ -5914,8 +5940,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->nn = cpu_to_le32(n->num_namespaces);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
-                           NVME_ONCS_COMPARE | NVME_ONCS_COPY |
-                           NVME_ONCS_VERIFY);
+                           NVME_ONCS_COMPARE | NVME_ONCS_COPY);
 
     /*
      * NOTE: If this device ever supports a command set that does NOT use 0x0
@@ -6058,6 +6083,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT8("aerl", NvmeCtrl, params.aerl, 3),
     DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
     DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
+    DEFINE_PROP_UINT8("vsl", NvmeCtrl, params.vsl, 7),
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
-- 
2.30.1


