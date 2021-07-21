Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C2E3D0A17
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 09:55:48 +0200 (CEST)
Received: from localhost ([::1]:37570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6751-0001aI-Kd
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 03:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m66yK-0006ok-Gl; Wed, 21 Jul 2021 03:48:52 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:58809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m66yI-0002O0-Oj; Wed, 21 Jul 2021 03:48:52 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 14BBB5816EC;
 Wed, 21 Jul 2021 03:48:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 21 Jul 2021 03:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=G54sNIgnI7Z5d
 wJpYritT/x/ZGPie1yD2pSpGXBrxNU=; b=kHLUm4K8E1f95HjiAzijCuz6JqHfL
 sikw1LoCeXqqsbfCj/vQgmlkJD+arI3rM9qm16t2Muu9Q8ZX2g422R7hxcGH27GV
 ddqR9fjggLrQXO/GNU5fnwla2jAo+5/D9sG0SqmX55RJARzFFlyZ9jhtAGceTW6K
 AxXeEHohzp3XexBGUD2e7hD0aBQ+qm/v7HmIagOtGzB+Fef/ZrlVTlT+R+FSxs/Q
 7ERRDTYtQZs0H6ymVElHjjxXBmWOHHMBGOpqdYIym+NwkXSnOE3dSjpBhU2MPvHR
 j//vBn5ph9uyEBzkO59D04ziACkp4Oe+AEhgIHXjH3vozS3AS4fHmsfBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=G54sNIgnI7Z5dwJpYritT/x/ZGPie1yD2pSpGXBrxNU=; b=d5G3sQN7
 tdGQb0cwq2WiNLV2mAE+NqcYG6AuJiB4b67lSXS+eHQXCiW+c5e0o3RfOcgV0ItY
 jZm9HNwx0CMILrWS+O0nf0Kjy4t5mKpzeSPJoPaNZ8sfybE6LvBNA36NJoCoGCfb
 UNab0Ngfz64VRfsjM6iqES3areU4pzP4Bn+rN8ymXMEzjCACHd77rMdiIpwaJUvK
 cbgfmulkA9DJrwXNvU7r1PRbb/+vk8MhvVlkFc4Cd7sjanbRUKpYDuf8PB2faY7n
 KL+eSZIU0xyGjZJvd7uDDTfzHZeBNqFu5jthGfqwzfGDJfw2JPanPuA5dMD2kAze
 S9TkDYdMNnBnYg==
X-ME-Sender: <xms:YNH3YKOwc4pFGmD-TiD29IXbmpsGPSVS5WJ2b6tU5PoIxWWajtld-g>
 <xme:YNH3YI_DLlzNZD5itEoMgdp_LXDV_Kist1-XzC11e51-hKVvhInFKnWkPPa0MkS05
 pO-e40iselA-bvyd1U>
X-ME-Received: <xmr:YNH3YBQW0ISjo4BmFhDmcgSBXDPUsXXY2nUqZRRXxPfne5GOr0TGrWectXlvt3n_qYyny46sCOSh-aI8xs2rB_4HbWLLqqxSQNEtUhxCQA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeefgdduudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:YNH3YKvKwnfeD1e1Sr7XDPn3dosep95t38LOUdTWAjjoBjjhFkzWAg>
 <xmx:YNH3YCex7VuXaiLu85vxF7M3AUqBRNQv1aNblvVJ_8OPDXCUK9WKgg>
 <xmx:YNH3YO0TOFSWHl24yUbsQsOsa7zQbANZquRWnnPvlMyDiMyDxm735A>
 <xmx:YdH3YJ92vb8jcb_mZjeUy_-0RNQNjJOUHPpZwmjHogcHmvIo_EbAyA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 03:48:44 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/5] hw/nvme: split pmrmsc register into upper and lower
Date: Wed, 21 Jul 2021 09:48:32 +0200
Message-Id: <20210721074836.110232-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210721074836.110232-1-its@irrelevant.dk>
References: <20210721074836.110232-1-its@irrelevant.dk>
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The specification uses a set of 32 bit PMRMSCL and PMRMSCU registers to
make up the 64 bit logical PMRMSC register.

Make it so.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 31 ++++++++++++++++---------------
 hw/nvme/ctrl.c       | 10 ++++++----
 2 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 527105fafc0b..84053b68b987 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -26,7 +26,8 @@ typedef struct QEMU_PACKED NvmeBar {
     uint32_t    pmrsts;
     uint32_t    pmrebs;
     uint32_t    pmrswtp;
-    uint64_t    pmrmsc;
+    uint32_t    pmrmscl;
+    uint32_t    pmrmscu;
     uint8_t     css[484];
 } NvmeBar;
 
@@ -475,25 +476,25 @@ enum NvmePmrswtpMask {
 #define NVME_PMRSWTP_SET_PMRSWTV(pmrswtp, val)   \
     (pmrswtp |= (uint64_t)(val & PMRSWTP_PMRSWTV_MASK) << PMRSWTP_PMRSWTV_SHIFT)
 
-enum NvmePmrmscShift {
-    PMRMSC_CMSE_SHIFT   = 1,
-    PMRMSC_CBA_SHIFT    = 12,
+enum NvmePmrmsclShift {
+    PMRMSCL_CMSE_SHIFT   = 1,
+    PMRMSCL_CBA_SHIFT    = 12,
 };
 
-enum NvmePmrmscMask {
-    PMRMSC_CMSE_MASK   = 0x1,
-    PMRMSC_CBA_MASK    = 0xfffffffffffff,
+enum NvmePmrmsclMask {
+    PMRMSCL_CMSE_MASK   = 0x1,
+    PMRMSCL_CBA_MASK    = 0xfffff,
 };
 
-#define NVME_PMRMSC_CMSE(pmrmsc)    \
-    ((pmrmsc >> PMRMSC_CMSE_SHIFT)   & PMRMSC_CMSE_MASK)
-#define NVME_PMRMSC_CBA(pmrmsc)     \
-    ((pmrmsc >> PMRMSC_CBA_SHIFT)   & PMRMSC_CBA_MASK)
+#define NVME_PMRMSCL_CMSE(pmrmscl)    \
+    ((pmrmscl >> PMRMSCL_CMSE_SHIFT)   & PMRMSCL_CMSE_MASK)
+#define NVME_PMRMSCL_CBA(pmrmscl)     \
+    ((pmrmscl >> PMRMSCL_CBA_SHIFT)   & PMRMSCL_CBA_MASK)
 
-#define NVME_PMRMSC_SET_CMSE(pmrmsc, val)   \
-    (pmrmsc |= (uint64_t)(val & PMRMSC_CMSE_MASK) << PMRMSC_CMSE_SHIFT)
-#define NVME_PMRMSC_SET_CBA(pmrmsc, val)   \
-    (pmrmsc |= (uint64_t)(val & PMRMSC_CBA_MASK) << PMRMSC_CBA_SHIFT)
+#define NVME_PMRMSCL_SET_CMSE(pmrmscl, val)   \
+    (pmrmscl |= (uint32_t)(val & PMRMSCL_CMSE_MASK) << PMRMSCL_CMSE_SHIFT)
+#define NVME_PMRMSCL_SET_CBA(pmrmscl, val)   \
+    (pmrmscl |= (uint32_t)(val & PMRMSCL_CBA_MASK) << PMRMSCL_CBA_SHIFT)
 
 enum NvmeSglDescriptorType {
     NVME_SGL_DESCR_TYPE_DATA_BLOCK          = 0x0,
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 2f0524e12a36..070d9f6a962d 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5916,11 +5916,13 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             return;
         }
 
-        n->bar.pmrmsc = (n->bar.pmrmsc & ~0xffffffff) | (data & 0xffffffff);
+        n->bar.pmrmscl = data;
         n->pmr.cmse = false;
 
-        if (NVME_PMRMSC_CMSE(n->bar.pmrmsc)) {
-            hwaddr cba = NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_SHIFT;
+        if (NVME_PMRMSCL_CMSE(n->bar.pmrmscl)) {
+            uint64_t pmrmscu = n->bar.pmrmscu;
+            hwaddr cba = (pmrmscu << 32) |
+                (NVME_PMRMSCL_CBA(n->bar.pmrmscl) << PMRMSCL_CBA_SHIFT);
             if (cba + int128_get64(n->pmr.dev->mr.size) < cba) {
                 NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
                 return;
@@ -5936,7 +5938,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             return;
         }
 
-        n->bar.pmrmsc = (n->bar.pmrmsc & 0xffffffff) | (data << 32);
+        n->bar.pmrmscu = data;
         return;
     default:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_invalid,
-- 
2.32.0


