Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B735E364AFA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:09:20 +0200 (CEST)
Received: from localhost ([::1]:51196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYaCt-00030P-OK
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:09:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZJ-0000Nq-IG; Mon, 19 Apr 2021 15:28:26 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:33683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lYZZ9-0005Hx-Mh; Mon, 19 Apr 2021 15:28:25 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id AB05D21AF;
 Mon, 19 Apr 2021 15:28:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 19 Apr 2021 15:28:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=mQUzxU09IK2GZ
 gLwUOxQk/wN52a3m7yRAaxFNmLeGog=; b=yvzB6XMk6dWRn0dFqlSDGT5RxZ5SR
 A421YGGW5w5CYfExpv2OAK5n91UR4Cm4Ry4VCgqN06gtXTcm72d2x01xxIUV9+Ly
 Fgf09FRU6vxHAwuA8qugScZw7ildi3jyLTOAkCz8wHimI/c7i0DPruW8qQJDUfq8
 bqr/gXcL2+XYrhQ2/Qi6o6+wKAlTblYSAGQxVv3Wruec/5cDtiXs281dp32LRWAU
 eD16/6dUVDTXce3x0dd6ngsymQ31esOLtxpxJNy79zLxQEWHIU+mtlN+JDbb08/j
 oiAIcTghbUdbOk29uEEY7L9hsP6wciDYcg/ABZuM0sNFcehxO69Q1nuyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=mQUzxU09IK2GZgLwUOxQk/wN52a3m7yRAaxFNmLeGog=; b=PsXFkuLt
 aI6kNuoo9YjXx2ueCFOz/w9l+M++IseZ1RdU1ShRaQo1Zenugg9d+uFsB0z6aJRE
 Eba9fbt6NiTjizer/wglld/g/IWDz3Ph8FyUZqjlhiTUJKD9LgqQXiRq/aySoENQ
 e5wzMsf+reMtousTA6RnztIApBWomV5kuKTdrP0E5P/3Bs7WqJDZGggcZzWnRx67
 tL4fBJKelgs+m3ZIM+UkP3rORiQngh95VSGr4OxoRCwx/fzi9T95wM1KM1Qa13YK
 r1+DsgD5idHuzQmvOJ5MeTa3KRW8EVYrhbFjxRU+9aMZxCPkCi4u/H7NePIJTUnG
 Xo3v5vtv9PHl0g==
X-ME-Sender: <xms:zdl9YLp4eyI6WSeMKDjQ_CNfH1wQWJWhOf7VAwdL34HSY-ZK5BnWtQ>
 <xme:zdl9YHPAL2e_mLHZ759ZKQEHgUDgO817B6LGMY9WcvLWEeO1Rs-aKLRbU5wPxiN_L
 TZIFrACfteL1DsFf1U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddtgedgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:zdl9YHfZykB0MlgCF5cINUf3cXIVZar6i3t6AZSSBGV0f09qQznNQQ>
 <xmx:zdl9YFVTcqxa_mQBghkYHm3n1n76Wv-rfu0wjeIXNdKyBLak7t3BnA>
 <xmx:zdl9YADngHUFGDOabcM6VLcdOvcPpR5lhXy7Iga2IL_rKPWmsdoO8w>
 <xmx:zdl9YD_3qTXCReTD8-S84uk44RyPoPBAndeRjvhqhaM1hovFiUm4rQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5DAB31080064;
 Mon, 19 Apr 2021 15:28:12 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/14] hw/block/nvme: replace nvme_ns_status
Date: Mon, 19 Apr 2021 21:27:54 +0200
Message-Id: <20210419192801.62255-8-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419192801.62255-1-its@irrelevant.dk>
References: <20210419192801.62255-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The inline nvme_ns_status() helper only has a single call site. Remove
it from the header file and inline it for real.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.h |  5 -----
 hw/block/nvme.c | 15 ++++++++-------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 2c4e7b90fa54..d9bee7e5a05c 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -137,11 +137,6 @@ typedef struct NvmeNamespace {
     } features;
 } NvmeNamespace;
 
-static inline uint16_t nvme_ns_status(NvmeNamespace *ns)
-{
-    return ns->status;
-}
-
 static inline uint32_t nvme_nsid(NvmeNamespace *ns)
 {
     if (ns) {
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 2c0af579e7a8..bcef6038ae09 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3594,8 +3594,8 @@ static uint16_t nvme_zone_mgmt_recv(NvmeCtrl *n, NvmeRequest *req)
 
 static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
+    NvmeNamespace *ns;
     uint32_t nsid = le32_to_cpu(req->cmd.nsid);
-    uint16_t status;
 
     trace_pci_nvme_io_cmd(nvme_cid(req), nsid, nvme_sqid(req),
                           req->cmd.opcode, nvme_io_opc_str(req->cmd.opcode));
@@ -3627,21 +3627,22 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_flush(n, req);
     }
 
-    req->ns = nvme_ns(n, nsid);
-    if (unlikely(!req->ns)) {
+    ns = nvme_ns(n, nsid);
+    if (unlikely(!ns)) {
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 
-    if (!(req->ns->iocs[req->cmd.opcode] & NVME_CMD_EFF_CSUPP)) {
+    if (!(ns->iocs[req->cmd.opcode] & NVME_CMD_EFF_CSUPP)) {
         trace_pci_nvme_err_invalid_opc(req->cmd.opcode);
         return NVME_INVALID_OPCODE | NVME_DNR;
     }
 
-    status = nvme_ns_status(req->ns);
-    if (unlikely(status)) {
-        return status;
+    if (ns->status) {
+        return ns->status;
     }
 
+    req->ns = ns;
+
     switch (req->cmd.opcode) {
     case NVME_CMD_WRITE_ZEROES:
         return nvme_write_zeroes(n, req);
-- 
2.31.1


