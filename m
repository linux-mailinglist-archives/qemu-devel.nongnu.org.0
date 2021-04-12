Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A066D35BAB3
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 09:17:30 +0200 (CEST)
Received: from localhost ([::1]:33088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVqp7-00018b-JZ
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 03:17:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lVqa0-0001Iz-Df; Mon, 12 Apr 2021 03:01:52 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:47263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lVqZx-0000va-5p; Mon, 12 Apr 2021 03:01:52 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 358505C00B0;
 Mon, 12 Apr 2021 03:01:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 12 Apr 2021 03:01:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=/CEJA/YAR48FT
 9+ttjSyf+0MgTH7ZgkpEno9B+yacrc=; b=AsNDZatE9Us02xHMQpwHTGO4W6cDZ
 h1FUUHz8uoe1IPUEEN0tBrPAS/hFA/8HqvTBVPL+vuJoRV9OLLBlQV4Y6HT/zEG1
 XNsSPXTGZwsYWb2ot/E3aDmO4+lhsJM8ZEMtU3XL9DIjns1lBmbcFxzlD1qdwuhg
 ZrBPPnGi1SGRBcc7UDrMiXDirmFKvq1Iq+WyQca3rF19Djo66wh71SznXmjUOG4V
 LV500zziwguSkZx+SE7myYb+wRtwMIOTcnQa7DI0wuAk4hrqbSdprM8gUxynmtXg
 F+1MwMryT0ehCB/t12CascYr3J9zi9AD6fl9RMT4cJ+8Pga58aFfHlDmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=/CEJA/YAR48FT9+ttjSyf+0MgTH7ZgkpEno9B+yacrc=; b=omgurPdT
 rMB5OVKH8VgSlG7ZDxBtgascl1nbt95ryJBBvq+muc2qoBCpXWyN6A5g7zUJFW2d
 w+EqS/bGL44m+w6ULINosn0/LzoWYdInQNXXIHJWUoDjsrO8fERsee21EdG8RWMG
 qclwLq9mX9+zLngEdnDz8f2AXAq6x9NS++kdARtoMsw9Dy8uXXlOQn281Pf509vh
 rXsGEN5rMLaNIAie6wAIyERs/Aegb8pRLACk/dFHXve+MrzIRW9+aYZg8MXoNlLo
 myn9+k8iPPaGLYmA7u0cozIUDM02zgziTbJ0/2vgrZ8d+BUduUJ9EoZHX7tlXbv/
 EYhoEIc3+CcMJg==
X-ME-Sender: <xms:W_BzYMPZfa1gwwYv94MzGiEgIOxeYWO0ntJkc-r0zqD_MqogHZ2e2A>
 <xme:W_BzYC8G9RF8Bexnqm9QssAuUJVRa4013geYm8Nv7rYF5oPDOIXAn7gWzh7HOP5Ct
 N7RjyVnXajY_JqMZ10>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudekiedguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:W_BzYDQ0ljVO_GAEeu8ksG1zYtjprwWUG1rq0cMJyGJ6JLpatPlN6Q>
 <xmx:W_BzYEterkDjAsKXGl6G-L9qmXLNNjCh4BnZgDnMRxtaDq4X4kTyvA>
 <xmx:W_BzYEdMXWYohb_8EA23zcaX5cEUzQQZbMdrhRMYaencD0iSSHwp0g>
 <xmx:W_BzYMQ1cYDeAFzpIRsW0kyS2r8rUk2K9N2grxFDWkIsDluh6o_a8Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E153C240057;
 Mon, 12 Apr 2021 03:01:45 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL for-6.0 2/4] hw/block/nvme: map prp fix if prp2 contains
 non-zero offset
Date: Mon, 12 Apr 2021 09:01:39 +0200
Message-Id: <20210412070141.521593-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210412070141.521593-1-its@irrelevant.dk>
References: <20210412070141.521593-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>

nvme_map_prp needs to calculate the number of list entries based on the
offset value. For the subsequent PRP2 list, need to ensure the number of
entries is within the MAX number of PRP entries for a page.

Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 6b1f056a0ebc..86336152a378 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -655,7 +655,12 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
             uint32_t nents, prp_trans;
             int i = 0;
 
-            nents = (len + n->page_size - 1) >> n->page_bits;
+            /*
+             * The first PRP list entry, pointed to by PRP2 may contain offset.
+             * Hence, we need to calculate the number of entries in based on
+             * that offset.
+             */
+            nents = (n->page_size - (prp2 & (n->page_size - 1))) >> 3;
             prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
             ret = nvme_addr_read(n, prp2, (void *)prp_list, prp_trans);
             if (ret) {
@@ -666,7 +671,7 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
             while (len != 0) {
                 uint64_t prp_ent = le64_to_cpu(prp_list[i]);
 
-                if (i == n->max_prp_ents - 1 && len > n->page_size) {
+                if (i == nents - 1 && len > n->page_size) {
                     if (unlikely(prp_ent & (n->page_size - 1))) {
                         trace_pci_nvme_err_invalid_prplist_ent(prp_ent);
                         status = NVME_INVALID_PRP_OFFSET | NVME_DNR;
@@ -675,7 +680,8 @@ static uint16_t nvme_map_prp(NvmeCtrl *n, NvmeSg *sg, uint64_t prp1,
 
                     i = 0;
                     nents = (len + n->page_size - 1) >> n->page_bits;
-                    prp_trans = MIN(n->max_prp_ents, nents) * sizeof(uint64_t);
+                    nents = MIN(nents, n->max_prp_ents);
+                    prp_trans = nents * sizeof(uint64_t);
                     ret = nvme_addr_read(n, prp_ent, (void *)prp_list,
                                          prp_trans);
                     if (ret) {
-- 
2.31.1


