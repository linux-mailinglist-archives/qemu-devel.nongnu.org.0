Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2506B3B780D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:54:18 +0200 (CEST)
Received: from localhost ([::1]:43120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyIsD-0004uA-3l
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:54:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImM-0001GG-SS; Tue, 29 Jun 2021 14:48:15 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:35311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lyImG-0005LB-T1; Tue, 29 Jun 2021 14:48:12 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id B86D92B00A94;
 Tue, 29 Jun 2021 14:48:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 29 Jun 2021 14:48:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=MoK9Hb6n9zcE5
 maGlnidS6flQTsjp6N6t7vv7geQmes=; b=jAX2/UKAwch4U9B8RtN6a3q0stXDA
 3of44BiZfoU+nqGZDgZnZZySbZ+sBbDs34tzdqsqxReIJpZZgH/5g5xW8JpLIaGD
 9SlQwbzp5PqN9cFsjZLSrOCOE/mHJjkWbEdaYDQyVjuG6tqpm4z4E8IFNlMgkhLA
 lO24vKCewoiCtkyXTmgaGD8fK4pAhA9Br48P1sJfUJQ3iq9WLCrGvgCXei4p9t74
 e90vtM8XlTrYoh8/mfV8L4RVmiEkxyHfPkFbPf1GtCMIJLVTV8/q8tU2IzSCGumL
 pxz3VRg7EK8mUh2lE2Ifamdr9UwEhtVq22SBjzaU5eVS6mY0SzCuQz5CA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=MoK9Hb6n9zcE5maGlnidS6flQTsjp6N6t7vv7geQmes=; b=wOHCkDRk
 8HmQ1b+WBW9/3ULKz7oNnQT75wKLJdbBHMInw2e9OhDavhZxhUMUHJcGFyif18uO
 gXmAkHjktdnFmbU1nraZrSrqpw55Anu6kRUutvLNUkPJtkL33teCJUtQuUkHjW7n
 mqSXWDS7qWLwLRxUZGQleUAi3D5zaYJj3DMrlgqdS/DnxB01891al4yld8jNiTKa
 1weGCuMwv+O4FLCx/IUyyycuPtOshEuFqJjiTsbg6NfLxONA7ohxokVoP4l5q07Q
 c3vorUaEEHeq1xEHZ2LoYIGqOeDx8WvJcz6VLmFxpXm44ztKQycV0Nhh1Ux6ix3S
 1XdaR24WdrH9TQ==
X-ME-Sender: <xms:5WrbYJmXpPJsbOF3KJfJUi4irSeKyGjwntvFBqD4DK1y2Exx5fyg_A>
 <xme:5WrbYE0eSudN_-alMDTv4hMc1fpjavnniwY4YMAGGpsYZKwGB0qSDzhgzr6shEvD6
 igRTY8c5IoNpnmfWhA>
X-ME-Received: <xmr:5WrbYPpsJL695Q5MabbeVfNOjxKgRCf-B33AatcADIi7PEj4lIFkFH6ftBU81B8l4tBU-Ju8WJc3SKEgVHdQoS20TNTrZnnb3x58tWRF_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgleegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:5WrbYJluxjZMGnSuEH9KClf08R_VPlEgOc_njmjYCHM_BhzuChLAxQ>
 <xmx:5WrbYH1RKnkL0x8XsYhBZzFj4XlvtY1gAUTiwjxN1K4fJiAW9b1piw>
 <xmx:5WrbYIucXaIKj4qIN9HhqFM-pKZ3cxSWnxzKs1Mu_hXuZV86rXYGpQ>
 <xmx:5mrbYAvoj0JKpc-nT3aJ7QUBBC_WaHO4zQP2Yn6bZcZWNbFIhK0zwQIDucs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 14:48:03 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 05/23] hw/nvme: fix csi field for cns 0x00 and 0x11
Date: Tue, 29 Jun 2021 20:47:25 +0200
Message-Id: <20210629184743.230173-6-its@irrelevant.dk>
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
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

As per the TP 4056d Namespace types CNS 0x00 and CNS 0x11
CSI field shouldn't use but it is being used for these two
Identify command CNS values, fix that.

Remove 'nvme_csi_has_nvm_support()' helper as suggested by
Klaus we can safely assume NVM command set support for all
namespaces.

Suggested-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 8dd9cb2ccbf3..7dea64b72e6a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -4188,16 +4188,6 @@ static uint16_t nvme_rpt_empty_id_struct(NvmeCtrl *n, NvmeRequest *req)
     return nvme_c2h(n, id, sizeof(id), req);
 }
 
-static inline bool nvme_csi_has_nvm_support(NvmeNamespace *ns)
-{
-    switch (ns->csi) {
-    case NVME_CSI_NVM:
-    case NVME_CSI_ZONED:
-        return true;
-    }
-    return false;
-}
-
 static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_identify_ctrl();
@@ -4254,7 +4244,7 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
         }
     }
 
-    if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
+    if (active || ns->csi == NVME_CSI_NVM) {
         return nvme_c2h(n, (uint8_t *)&ns->id_ns, sizeof(NvmeIdNs), req);
     }
 
@@ -4325,7 +4315,7 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
         }
     }
 
-    if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
+    if (c->csi == NVME_CSI_NVM) {
         return nvme_rpt_empty_id_struct(n, req);
     } else if (c->csi == NVME_CSI_ZONED && ns->csi == NVME_CSI_ZONED) {
         return nvme_c2h(n, (uint8_t *)ns->id_ns_zoned, sizeof(NvmeIdNsZoned),
-- 
2.32.0


