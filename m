Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881493B7845
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 21:10:08 +0200 (CEST)
Received: from localhost ([::1]:43702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyJ7X-0008OI-H4
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 15:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImY-0001Pd-JI; Tue, 29 Jun 2021 14:48:26 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:47807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImL-0005N6-5v; Tue, 29 Jun 2021 14:48:26 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id A2E4A2B00A96;
 Tue, 29 Jun 2021 14:48:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 29 Jun 2021 14:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=PNXaIrjVKNBCa
 b62YttBX4D71RRbyEBtO42tW0rbjcw=; b=DuUbOGGk5XMLhB0109V/cxTOSENW8
 XTZPIu+ty8I1H0s44uW07ZTCYrtim2MGmRc8u9KKK9XhbfhTH2vq9+KW9uPPbLfa
 zJUa3u1mDRludXPCFloQVFRryJIObgvc/Bfekx3mvRiGpSIOcyxzAYUNAUzYo0Vb
 1mnd/+q0TADBnNywWL84lvul6DAYy9DD/BkC/6KggHGLDdqPi8WJQ+a2XD3bVvq3
 skbW2tPtnsK3jTkmf92XsDtGJbvvtgJ+8/iN9TyXCc+hTLHcZkTYgQHePQfMGyae
 CMxP6CUKnrCwMIB+y/4xnKqWzHtrq7cCIkZGgeyyFsMczLYAjHUce9Cww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=PNXaIrjVKNBCab62YttBX4D71RRbyEBtO42tW0rbjcw=; b=bd8bbCYa
 qzMPL6+ZSQKBwGyoC/gQOE5saG4fy3XKnwQx2n5F/xt8cu3NNOfJuohniElIysRM
 g6BPvFR7EBH7QIwGz2Hn4SUfcgHDbnfijAEJV/vhG17d//Br9Isv2Tr2dB7ZVJX+
 fw3Fsrk5wqFuR9bynowVzM9nwjSS0Y8Y6X/gfpXO6d3Lmdsjd8CFmfQQAjYEnEp3
 9bdDztNzoPyrE/b7TNsN1lWex6NUbDENE25RRlCal6A0Tn0GOtQJN4ZmVDQHpGJP
 gNM/tsNM6LZO5yzeor2Hrj5r7IMMjit9EbFJ4JQ0X7W3QMN2hSlNf52ezU43kzf0
 518OlplfhMLoNg==
X-ME-Sender: <xms:6WrbYG3D_X-7g1NCozJulNrMR6HWsMkr7Hdu7u9vBK0OteykLvBuUw>
 <xme:6WrbYJE_EnN_kK4sh_GaLvtjh9a5Bm9U2llk7VaAEw5XzWv9UlKdwHclWL_QqFEzK
 aRiKNxnqU2mt9LxFdg>
X-ME-Received: <xmr:6WrbYO6u7bKQMhf69jBEXasiABjohfz4A8Ui83Wa-3Y03PBXBaEGiF66WYHtqeUEhh7-K9zSDNwEHs8tNf1fECdQAYO2O2BMT590bwZQBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeiudehfeejteegueeffeekhfelgfekheetfffgteejgeekuefgtddujeeuudeg
 ieenucffohhmrghinhepuhhuihgurdgurghtrgenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:6WrbYH27qKZoXLFGgvI599TXA_jxtS67eBbpCSqVIZrc9x7pojoN0w>
 <xmx:6WrbYJHmyQdwDq8kUglPvoLhzIKHnCnJ0LCeFCOmBZkmcOeK_ffBxw>
 <xmx:6WrbYA8OsIKgUrh1qbJPcd_WjHyrwo8iJckFIAmsr1SMPA3ai77eHQ>
 <xmx:6mrbYI_CMcwZM5pfREpQ9CKDU4zBP3ztr32r3IBbA0mYE51MATjo5rAERmQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:07 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 06/23] hw/nvme: namespace parameter for EUI-64
Date: Tue, 29 Jun 2021 20:47:26 +0200
Message-Id: <20210629184743.230173-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210629184743.230173-1-its@irrelevant.dk>
References: <20210629184743.230173-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Heinrich Schuchardt <xypron.glpk@gmx.de>

The EUI-64 field is the only identifier for NVMe namespaces in UEFI device
paths. Add a new namespace property "eui64", that provides the user the
option to specify the EUI-64.

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
Acked-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/system/nvme.rst |  4 ++++
 hw/nvme/nvme.h       |  1 +
 hw/nvme/ctrl.c       | 56 +++++++++++++++++++++++++++-----------------
 hw/nvme/ns.c         |  2 ++
 4 files changed, 41 insertions(+), 22 deletions(-)

diff --git a/docs/system/nvme.rst b/docs/system/nvme.rst
index f7f63d6bf615..b5f8288d7c85 100644
--- a/docs/system/nvme.rst
+++ b/docs/system/nvme.rst
@@ -81,6 +81,10 @@ There are a number of parameters available:
   Set the UUID of the namespace. This will be reported as a "Namespace UUID"
   descriptor in the Namespace Identification Descriptor List.
 
+``eui64``
+  Set the EUI-64 of the namespace. This will be reported as a "IEEE Extended
+  Unique Identifier" descriptor in the Namespace Identification Descriptor List.
+
 ``bus``
   If there are more ``nvme`` devices defined, this parameter may be used to
   attach the namespace to a specific ``nvme`` device (identified by an ``id``
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 93a7e0e5380e..ac90e13d7b3f 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -83,6 +83,7 @@ typedef struct NvmeNamespaceParams {
     bool     shared;
     uint32_t nsid;
     QemuUUID uuid;
+    uint64_t eui64;
 
     uint16_t ms;
     uint8_t  mset;
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 7dea64b72e6a..762bb82e3cac 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4426,19 +4426,19 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
     uint32_t nsid = le32_to_cpu(c->nsid);
     uint8_t list[NVME_IDENTIFY_DATA_SIZE] = {};
-
-    struct data {
-        struct {
-            NvmeIdNsDescr hdr;
-            uint8_t v[NVME_NIDL_UUID];
-        } uuid;
-        struct {
-            NvmeIdNsDescr hdr;
-            uint8_t v;
-        } csi;
-    };
-
-    struct data *ns_descrs = (struct data *)list;
+    uint8_t *pos = list;
+    struct {
+        NvmeIdNsDescr hdr;
+        uint8_t v[NVME_NIDL_UUID];
+    } QEMU_PACKED uuid;
+    struct {
+        NvmeIdNsDescr hdr;
+        uint64_t v;
+    } QEMU_PACKED eui64;
+    struct {
+        NvmeIdNsDescr hdr;
+        uint8_t v;
+    } QEMU_PACKED csi;
 
     trace_pci_nvme_identify_ns_descr_list(nsid);
 
@@ -4452,17 +4452,29 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     }
 
     /*
-     * Because the NGUID and EUI64 fields are 0 in the Identify Namespace data
-     * structure, a Namespace UUID (nidt = 3h) must be reported in the
-     * Namespace Identification Descriptor. Add the namespace UUID here.
+     * If the EUI-64 field is 0 and the NGUID field is 0, the namespace must
+     * provide a valid Namespace UUID in the Namespace Identification Descriptor
+     * data structure. QEMU does not yet support setting NGUID.
      */
-    ns_descrs->uuid.hdr.nidt = NVME_NIDT_UUID;
-    ns_descrs->uuid.hdr.nidl = NVME_NIDL_UUID;
-    memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
+    uuid.hdr.nidt = NVME_NIDT_UUID;
+    uuid.hdr.nidl = NVME_NIDL_UUID;
+    memcpy(uuid.v, ns->params.uuid.data, NVME_NIDL_UUID);
+    memcpy(pos, &uuid, sizeof(uuid));
+    pos += sizeof(uuid);
 
-    ns_descrs->csi.hdr.nidt = NVME_NIDT_CSI;
-    ns_descrs->csi.hdr.nidl = NVME_NIDL_CSI;
-    ns_descrs->csi.v = ns->csi;
+    if (ns->params.eui64) {
+        eui64.hdr.nidt = NVME_NIDT_EUI64;
+        eui64.hdr.nidl = NVME_NIDL_EUI64;
+        eui64.v = cpu_to_be64(ns->params.eui64);
+        memcpy(pos, &eui64, sizeof(eui64));
+        pos += sizeof(eui64);
+    }
+
+    csi.hdr.nidt = NVME_NIDT_CSI;
+    csi.hdr.nidl = NVME_NIDL_CSI;
+    csi.v = ns->csi;
+    memcpy(pos, &csi, sizeof(csi));
+    pos += sizeof(csi);
 
     return nvme_c2h(n, list, sizeof(list), req);
 }
diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index 3fec9c627321..45e457de6ae1 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -77,6 +77,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     id_ns->mssrl = cpu_to_le16(ns->params.mssrl);
     id_ns->mcl = cpu_to_le32(ns->params.mcl);
     id_ns->msrc = ns->params.msrc;
+    id_ns->eui64 = cpu_to_be64(ns->params.eui64);
 
     ds = 31 - clz32(ns->blkconf.logical_block_size);
     ms = ns->params.ms;
@@ -511,6 +512,7 @@ static Property nvme_ns_props[] = {
     DEFINE_PROP_BOOL("shared", NvmeNamespace, params.shared, false),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
     DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
+    DEFINE_PROP_UINT64("eui64", NvmeNamespace, params.eui64, 0),
     DEFINE_PROP_UINT16("ms", NvmeNamespace, params.ms, 0),
     DEFINE_PROP_UINT8("mset", NvmeNamespace, params.mset, 0),
     DEFINE_PROP_UINT8("pi", NvmeNamespace, params.pi, 0),
-- 
2.32.0


