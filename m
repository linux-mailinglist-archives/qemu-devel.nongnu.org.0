Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97AED3339C3
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 11:16:03 +0100 (CET)
Received: from localhost ([::1]:50408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJvso-0002Sp-I1
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 05:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXW-0007Z1-O1; Wed, 10 Mar 2021 04:54:02 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:43857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJvXT-00057F-2c; Wed, 10 Mar 2021 04:54:02 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4E5B65C00E1;
 Wed, 10 Mar 2021 04:53:58 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 10 Mar 2021 04:53:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=syfbKz9cAFbhT
 NQ47bfqxOFLD21vjTzsbUZ3ny2ztrE=; b=w5UuuQXxZj2POqgBeGuw44Hasqja/
 4IsdK4Iaqr5MsO9M9OXh8ViBV44bFEvKWvzndDa1ols9zFlD1AhAvRouHQMZwAqU
 zPlH+9u0jz4xb+ugHRtwTpBo32SfM6sZhx73SoOX1py3LP+HH+OSuldoSEs9MX0u
 ayNKslJ/Y/JWE18pcauLvryVTT1n4YmYRIkQhtrheXVkSiTqfa280gWwd1ZOhIJP
 H6wCUiQyWdwbTxiXriAWxPt63vgwRx2unQO89+f5wpsjJ+5di+1Jgv4p7Qk5F4Qy
 too4zZJCV5fsd5JHHEAVHb+dbgW5ZVFb3A9rOaWUv3l7QaJM116dE1MIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=syfbKz9cAFbhTNQ47bfqxOFLD21vjTzsbUZ3ny2ztrE=; b=by5aBQ2I
 O91xTsxD7DFnx+j3SOmsI4MvJNVf/YPVuJEySssOfARqlOoqgIOI/A8dOQbSOvrG
 37sQzcVPqB+xdH3JxD268jTLNMYyU6MuJkmZ54yeaOLY1dhn0DhBkGjQ544cndJP
 b+mhMtxZCKyEJqDBMosrLcqpwcYVVurANC+wFBCSnolANWZ6v2dokeMdMbx6cY6D
 3LYPIVB2kzu2RzO0HxNVKGPmSLLVe2tM33sOY3A464k5HQPNsE3+EM1gyTuKGb6B
 xl4AUnLpBCFg1soniex5apFUDZP4DXkpNxnvU+tutk6seXEPgUi4u0YXtfL7LjcI
 3uM05pGFriXDeg==
X-ME-Sender: <xms:NpdIYG2kgiNYRGwsAw2_YCZ79FaG_HRu_pr9ZSmtjT85EgQ18Yb8GA>
 <xme:NpdIYJEMzODsQPTDNVCjK7UEOz6DZd2F5N9HrrS8oXiDn8C91TAo6nY5ZkPfM69Qz
 R_fw97k4x8J6qWV2Kw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddukedgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeegne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:NpdIYO73N1UsqkJ7i9ixyhmffNqhsk0-tFZ63v3c4SV9pTpsyUxFTA>
 <xmx:NpdIYH3Q38mbUfVbQmZpxu4wPHooIDXseztnnJEz3HgeLwFYOWEc1A>
 <xmx:NpdIYJHXG9-Putq49-HHEyWZcuNg9AbMk6pBAshWP9arKPNXqfjoxg>
 <xmx:NpdIYA3dBbA0dAvqA9FMYvb5GBqlP2JxvQqs2OPEKS7f325zhuJqWQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E6D74240057;
 Wed, 10 Mar 2021 04:53:56 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 05/13] hw/block/nvme: add non-mdts command size limit for
 verify
Date: Wed, 10 Mar 2021 10:53:39 +0100
Message-Id: <20210310095347.682395-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310095347.682395-1-its@irrelevant.dk>
References: <20210310095347.682395-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
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
index e3af0428f802..a87621aa31e4 100644
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
index 43ef10921a94..70122a607169 100644
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
@@ -4108,12 +4127,14 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
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
@@ -5656,6 +5677,11 @@ static void nvme_check_constraints(NvmeCtrl *n, Error **errp)
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
@@ -5913,8 +5939,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->nn = cpu_to_le32(n->num_namespaces);
     id->oncs = cpu_to_le16(NVME_ONCS_WRITE_ZEROES | NVME_ONCS_TIMESTAMP |
                            NVME_ONCS_FEATURES | NVME_ONCS_DSM |
-                           NVME_ONCS_COMPARE | NVME_ONCS_COPY |
-                           NVME_ONCS_VERIFY);
+                           NVME_ONCS_COMPARE | NVME_ONCS_COPY);
 
     /*
      * NOTE: If this device ever supports a command set that does NOT use 0x0
@@ -6057,6 +6082,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT8("aerl", NvmeCtrl, params.aerl, 3),
     DEFINE_PROP_UINT32("aer_max_queued", NvmeCtrl, params.aer_max_queued, 64),
     DEFINE_PROP_UINT8("mdts", NvmeCtrl, params.mdts, 7),
+    DEFINE_PROP_UINT8("vsl", NvmeCtrl, params.vsl, 7),
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
-- 
2.30.1


