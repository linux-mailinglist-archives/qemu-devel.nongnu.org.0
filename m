Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E08F82B0EC1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 21:05:20 +0100 (CET)
Received: from localhost ([::1]:55218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdIqN-0004fA-Dl
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 15:05:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIl7-0003Dx-TA; Thu, 12 Nov 2020 14:59:53 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:45809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kdIl4-00078B-IM; Thu, 12 Nov 2020 14:59:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 156CB5C01BA;
 Thu, 12 Nov 2020 14:59:49 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 12 Nov 2020 14:59:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=JCrkjzOVvDiT4
 zbPMcXqF89wc8X7KHjhjFWUPWs9bBQ=; b=lsC01mLeOo0BJnl8PYTIR8z3X4Yys
 8sz5iJkk6c9sr+631kwAvFC0S4Y1fL382uiubwEIti2K5q+1sbtUwpyr6I1nzJa1
 PHdd63x+g4ZYeHNZMK6Sn+7SqhyFbtqgQ2TyrpQAEchjk/O7qwY9fOmAa/vERAtM
 G/vpxhwDeoL6iPC0ECZnuaedRx+LLQeb2eUAsOdkah8wfshx8VnI2aquG4R8uRzt
 F3QRYdpUJsJXcmKQyyS5MlFd2xYqcvhUxy/z4BUnCcv4lQPRQhMHVH3cRxN7uh20
 gQZukAAhV8Q8MdkMgvX1ruDsyrCZettTxctobsfKOxUy34QGvRMFTUcBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=JCrkjzOVvDiT4zbPMcXqF89wc8X7KHjhjFWUPWs9bBQ=; b=CKFStMm6
 63mTQxHTB51C9bsiwQtFuLDkxAbkMdKxFVhHsnNKLTQ/1QkgxeTqgtyNmKonJCxy
 19Fy8mymOvYGYZkeHxDo2zjMo5v3Gna15ol35MGllAoQ6q1yCqcBdQzWzXWJJ6T6
 uQWTJl+AQown50rUWTXUDZh9LEoUq3N21dnH6xZMMObhMVRIKhcOPvGMWMLVS33x
 m8vULnr2YmXywXuaZbMsyUoCLidoAmvRvVi3/Qxxqrv0gYF0rrpODmmIALSXqgu0
 B2dSdsECPbZK3SImF4KuoTsKpWINAj5e5oQLcSUytvTnr+wwZFpylfZ7m7HOmG2j
 lpy1p042jlC+Bw==
X-ME-Sender: <xms:NJStX6liURLJFDuH8j2_Fg6ZhiXpztLjS9lOc3VZKHqFe5uxuzSn2A>
 <xme:NJStXx30DLV6Rw_E5BZbGP9xxXcmxi_v6FhUxxa6vVgv0f2eauq95f-XFtgQSHnex
 0PTjf7O7M9FTDccfZs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvfedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:NJStX4pW8uEOL9NAW4q4UXMzUsbcpjaKBTuej-s-EmolxyoRi31QEg>
 <xmx:NJStX-lACqb7UWqzybZjcXYiLCEhMEW5WdDqXc95XZdmIk3z7deHGw>
 <xmx:NJStX429vgmcMGRXGsfC52s9cbicx8ahe6gyaZ4AOZqbBqzOygR04A>
 <xmx:NZStX88tQ0GF3eGLYmfp_-daDnZdSxtbXv4TNcDhcbLqY5Uo-ZHCDA>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 89ACD30689DB;
 Thu, 12 Nov 2020 14:59:47 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 1/5] hw/block/nvme: remove superfluous NvmeCtrl parameter
Date: Thu, 12 Nov 2020 20:59:41 +0100
Message-Id: <20201112195945.819915-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201112195945.819915-1-its@irrelevant.dk>
References: <20201112195945.819915-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 14:59:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

nvme_check_bounds has no use of the NvmeCtrl parameter; remove it.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 01b657b1c5e2..51f35e8cf18b 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -866,8 +866,8 @@ static inline uint16_t nvme_check_mdts(NvmeCtrl *n, size_t len)
     return NVME_SUCCESS;
 }
 
-static inline uint16_t nvme_check_bounds(NvmeCtrl *n, NvmeNamespace *ns,
-                                         uint64_t slba, uint32_t nlb)
+static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
+                                         uint32_t nlb)
 {
     uint64_t nsze = le64_to_cpu(ns->id_ns.nsze);
 
@@ -943,7 +943,7 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
 
     trace_pci_nvme_write_zeroes(nvme_cid(req), nvme_nsid(ns), slba, nlb);
 
-    status = nvme_check_bounds(n, ns, slba, nlb);
+    status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
         trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         return status;
@@ -979,7 +979,7 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    status = nvme_check_bounds(n, ns, slba, nlb);
+    status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
         trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         goto invalid;
-- 
2.29.2


