Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DECA92C5E5A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 00:56:05 +0100 (CET)
Received: from localhost ([::1]:58462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiR7M-0005C6-R0
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 18:56:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxu-0007Pj-7M; Thu, 26 Nov 2020 18:46:18 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:33473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kiQxo-0003tP-Ky; Thu, 26 Nov 2020 18:46:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 00F19581056;
 Thu, 26 Nov 2020 18:46:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Nov 2020 18:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=+lRBJL7LBAg5M
 4NcHDtnbUic7lHnkZSGRv4lKJaJfws=; b=0pNiH+sQIRhpqOQlUDWfzpwuHaJie
 hGIwieV/Qq/pA28CSgt+Gwyje6kScDKgVvoT91jr8To7MVl/rKl3/A48m/zCpItU
 jfsJu8oM21BrrhxKCVjeoUN37KCw1cDO8SKHWstYVm4b420Aq7tSlrfpXooe4SdQ
 5qADdKiX0+GH9DYrvRvyCtPx6VDNMOofz8k8TMETytF+DTEJW1zkv0Ak4yElFiZz
 jf187Gr3udEQZz92PXTQ3Q3Ru6foZpi1CcPZcMtsAEm8tNpyu11Ox/ll2sNqkGma
 pb/FHhEf+cI5JqrP44TQBF2qm0xNhYJCjUXNy7eQf7T1104lfyCbErAjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=+lRBJL7LBAg5M4NcHDtnbUic7lHnkZSGRv4lKJaJfws=; b=iDo6QNJJ
 /iwKtDxaMFNRZ7QfDW8YgfAZsqo9vIa1iaYvtNhYGWyXWCPfAiaTLVUYnFqroS11
 n2QqzRql95MZ/YWcwRlL3F4M/TB35fr80mZTiTDmx98rJEh93t1jTG1DUnSY3HwL
 sXnU2IJfSm91MC6CapitPlHX4ZgfnnSLuSpVK14CapUi+aPVCQgRvM4czwZnSHNQ
 /DfzzArMHN5LX0hWBARPDHt+WU3Xb7/L/rYx9pBAcAEvRo4w5ZAvmvbqevM8OfWq
 gyvHU5CUDNvZ1ywky2B9BGCUcCXPweVu62DrWBbuQCtfHeV5CWeNAJi17NarA4j4
 OM/u/QmF24+cqw==
X-ME-Sender: <xms:Qj7AX-OMWe4Ls2Be2ann-unCuY0H0CSQERUNJ4zWqSNivaDhIzYqng>
 <xme:Qj7AX88K7_OL08y0VP1GwjHNF6pxIho2yeiq8MFN3Ft1g20BsgvJvEHsGNzjgk3Co
 ZOkMQa5eIjEqu0CdJ0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudehfedguddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeiudehfeejteegueeffeekhfelgfekheetfffgteejgeekuefgtddujeeuudeg
 ieenucffohhmrghinhepuhhuihgurdgurghtrgenucfkphepkedtrdduieejrdelkedrud
 eltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehi
 thhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Qj7AX1TssRBOlzJ9VXH1EElBPicQMVM4vzjeU9uQOas1qWxv5RNS2w>
 <xmx:Qj7AX-uDaPCZHlxNWlx-LQ7SR2gR30dWKCaMO-JfVxRiyH8pvfyVeQ>
 <xmx:Qj7AX2cR7eWU2FnGWj0z3f5o1gk-c4QPyglpzJqw5ygaLZubMlAYyA>
 <xmx:Qj7AX9yRxG6wZ6_Qg7Fmn2DkE98iA1nfVQqKV4NQ0M2GCIwg2_QrjA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F4263064AAF;
 Thu, 26 Nov 2020 18:46:09 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/12] hw/block/nvme: Generate namespace UUIDs
Date: Fri, 27 Nov 2020 00:45:53 +0100
Message-Id: <20201126234601.689714-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126234601.689714-1-its@irrelevant.dk>
References: <20201126234601.689714-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Fomichev <dmitry.fomichev@wdc.com>

In NVMe 1.4, a namespace must report an ID descriptor of UUID type
if it doesn't support EUI64 or NGUID. Add a new namespace property,
"uuid", that provides the user the option to either specify the UUID
explicitly or have a UUID generated automatically every time a
namespace is initialized.

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
---
 hw/block/nvme-ns.h | 1 +
 hw/block/nvme-ns.c | 1 +
 hw/block/nvme.c    | 9 +++++----
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 745d288b09cf..1f8c9c0a92ad 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -21,6 +21,7 @@
 
 typedef struct NvmeNamespaceParams {
     uint32_t nsid;
+    QemuUUID uuid;
 
     uint16_t mssrl;
     uint32_t mcl;
diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index eb28757c2f17..505f6fb0a654 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -155,6 +155,7 @@ static void nvme_ns_realize(DeviceState *dev, Error **errp)
 static Property nvme_ns_props[] = {
     DEFINE_BLOCK_PROPERTIES(NvmeNamespace, blkconf),
     DEFINE_PROP_UINT32("nsid", NvmeNamespace, params.nsid, 0),
+    DEFINE_PROP_UUID("uuid", NvmeNamespace, params.uuid),
     DEFINE_PROP_UINT16("mssrl", NvmeNamespace, params.mssrl, 128),
     DEFINE_PROP_UINT32("mcl", NvmeNamespace, params.mcl, 128),
     DEFINE_PROP_UINT8("msrc", NvmeNamespace, params.msrc, 255),
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7a5ec843d567..4f732c13c7e9 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -2068,6 +2068,7 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
 
 static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
 {
+    NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
     uint32_t nsid = le32_to_cpu(c->nsid);
     uint8_t list[NVME_IDENTIFY_DATA_SIZE];
@@ -2087,7 +2088,8 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
         return NVME_INVALID_NSID | NVME_DNR;
     }
 
-    if (unlikely(!nvme_ns(n, nsid))) {
+    ns = nvme_ns(n, nsid);
+    if (unlikely(!ns)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
@@ -2096,12 +2098,11 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *req)
     /*
      * Because the NGUID and EUI64 fields are 0 in the Identify Namespace data
      * structure, a Namespace UUID (nidt = 0x3) must be reported in the
-     * Namespace Identification Descriptor. Add a very basic Namespace UUID
-     * here.
+     * Namespace Identification Descriptor. Add the namespace UUID here.
      */
     ns_descrs->uuid.hdr.nidt = NVME_NIDT_UUID;
     ns_descrs->uuid.hdr.nidl = NVME_NIDT_UUID_LEN;
-    stl_be_p(&ns_descrs->uuid.v, nsid);
+    memcpy(&ns_descrs->uuid.v, ns->params.uuid.data, NVME_NIDT_UUID_LEN);
 
     return nvme_dma(n, list, NVME_IDENTIFY_DATA_SIZE,
                     DMA_DIRECTION_FROM_DEVICE, req);
-- 
2.29.2


