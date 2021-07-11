Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 006403C3F3D
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:40:26 +0200 (CEST)
Received: from localhost ([::1]:44190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gFV-0006Oe-SH
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3S-0004DS-Oy; Sun, 11 Jul 2021 16:27:58 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:58899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m2g3R-0002zB-94; Sun, 11 Jul 2021 16:27:58 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 260B83200909;
 Sun, 11 Jul 2021 16:27:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 11 Jul 2021 16:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=kUje2Vxop9TRc
 4Lak53EzA8xgsjr/JN1irVkKwHRT88=; b=VwmfjXm95R7sV8HRJ29obqPEg0jB4
 /B+sYkVxm6egh38uqEnCsTpt2H9NaldTQ7qrjRBj8fBeT+iQdEeKxrr/KUnaMIr8
 3lvY4WBUMcs/XC1F66jCXPWxwoHLbEM03K1o64CdhzHOtxjOWt3il7eSQO+Aom+6
 Gjsx06PqdD6T4Wjl38hM18bvVkX9wWtkPOERW/25SahDcWROVxdjQ6BauxKdTAcd
 pwBt2ECkRLeVxCAzSeZFcIdVVLiKoTMAb9rwpMCa9EfMngsosKEVdqjtCDTBv78C
 OAUa2fY6tq7qi4ow2klT6315FPKjWkpDrE5g8M5M/nVfMAf/tbRkMJycQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=kUje2Vxop9TRc4Lak53EzA8xgsjr/JN1irVkKwHRT88=; b=bGKgcavb
 em/OhUoRAdmaa2Dzt1x4nui90UmQsUmbLinpeG84tuSDPtE9r2BNxZenLZvj7jVu
 rJqU2Y+9tPL7Pe4/OifbkXWmHFYN56ILJcQfvqNDS4TcY48LH/Iv7V5tx0UX5D92
 oCEBrhxIEwdCl+XGAOQcFu0aJyR5uDnPhUOsCzdTosF0M/qkbYs5F1ZY/6nF1VYK
 klGoUU5ZIIPd8x1ld2OtFx7sNW2EW4lTocm1/PzX4OR4aMsUzK9n2DnQqvvUfY9e
 FbbLUXziGL4N554N26KzGyVP2CrS57yNq8v2HWkIEkIgMFngvqDEYqLgu0sV21PK
 wfdPGGVYVk6xvQ==
X-ME-Sender: <xms:SlTrYArNA3Q3C0UEM29ftV6sn0nQw5ekRnleZVV6f4vqP6RdZDUGrw>
 <xme:SlTrYGplA8lfSjckF6PhI8KDZwXX2XMuluA6ryP1XGn7VBYMnnoICcB51wbbYz2-l
 8d_yGFfmZeWDV87ohY>
X-ME-Received: <xmr:SlTrYFPCpwRQgkbEJGyxTtCOsL7kzMKsY-MEzzClhLFXM894L3ttVma_lLMihCw4AP9WlcEwhc1mkqqFgXGgcTj4NCYxqDM8EaPGnSVS_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddtgddugeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SlTrYH67axcBAAYFHbcv3ZmieXNh_C5VGHsa9uuuzwudyWmjg95VjA>
 <xmx:SlTrYP7MvRu-hSOBiBHTsAHxnq0cNrcfF2WwkUiUlTLRfPbgZWLAyw>
 <xmx:SlTrYHgYCxULpZeFLgo-J7QBzhVY4cCxmElqoCqDWTgjx_5_1xwWUw>
 <xmx:SlTrYFS0HJF5Rw66L6oTfxpQqBVrtpzAYgQrDz-rnXyeMBQnPsJlsw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 11 Jul 2021 16:27:52 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/6] hw/nvme: error handling for too many mappings
Date: Sun, 11 Jul 2021 22:27:34 +0200
Message-Id: <20210711202736.591334-5-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711202736.591334-1-its@irrelevant.dk>
References: <20210711202736.591334-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Padmakar Kalghatgi <p.kalghatgi@samsung.com>

If the number of PRP/SGL mappings exceed 1024, reads and writes will
fail because of an internal QEMU limitation of max 1024 vectors.

Signed-off-by: Padmakar Kalghatgi <p.kalghatgi@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
[k.jensen: changed the error message to be more generic]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 13 +++++++++++++
 hw/nvme/trace-events |  1 +
 2 files changed, 14 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 90e3ee2b70ee..ead7531bde5e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -623,6 +623,10 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg, hwaddr addr, size_t len)
             return NVME_INVALID_USE_OF_CMB | NVME_DNR;
         }
 
+        if (sg->iov.niov + 1 > IOV_MAX) {
+            goto max_mappings_exceeded;
+        }
+
         if (cmb) {
             return nvme_map_addr_cmb(n, &sg->iov, addr, len);
         } else {
@@ -634,9 +638,18 @@ static uint16_t nvme_map_addr(NvmeCtrl *n, NvmeSg *sg, hwaddr addr, size_t len)
         return NVME_INVALID_USE_OF_CMB | NVME_DNR;
     }
 
+    if (sg->qsg.nsg + 1 > IOV_MAX) {
+        goto max_mappings_exceeded;
+    }
+
     qemu_sglist_add(&sg->qsg, addr, len);
 
     return NVME_SUCCESS;
+
+max_mappings_exceeded:
+    NVME_GUEST_ERR(pci_nvme_ub_too_many_mappings,
+                   "number of mappings exceed 1024");
+    return NVME_INTERNAL_DEV_ERROR | NVME_DNR;
 }
 
 static inline bool nvme_addr_is_dma(NvmeCtrl *n, hwaddr addr)
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index f9a1f14e2638..430eeb395b24 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -199,3 +199,4 @@ pci_nvme_ub_db_wr_invalid_cqhead(uint32_t qid, uint16_t new_head) "completion qu
 pci_nvme_ub_db_wr_invalid_sq(uint32_t qid) "submission queue doorbell write for nonexistent queue, sqid=%"PRIu32", ignoring"
 pci_nvme_ub_db_wr_invalid_sqtail(uint32_t qid, uint16_t new_tail) "submission queue doorbell write value beyond queue size, sqid=%"PRIu32", new_head=%"PRIu16", ignoring"
 pci_nvme_ub_unknown_css_value(void) "unknown value in cc.css field"
+pci_nvme_ub_too_many_mappings(void) "too many prp/sgl mappings"
-- 
2.32.0


