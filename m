Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7A53C7E5C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 08:08:24 +0200 (CEST)
Received: from localhost ([::1]:43412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Y4F-00032I-QF
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 02:08:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3Xxj-0008L1-Dz; Wed, 14 Jul 2021 02:01:39 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:52609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3Xxh-0000dP-L5; Wed, 14 Jul 2021 02:01:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 878C32B0123C;
 Wed, 14 Jul 2021 02:01:34 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 14 Jul 2021 02:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=j/2kmdR7NtEfS
 Fyn3CnrhKEbyG00F/2ApTM4WM7M1Tk=; b=UsvOXM7EnjBc6zeO7QueB6mZx+WzT
 s/XW17T+Gcf7wAZOLjgi1G3h8+w5hsT3xm/r7I/8tqB2VpSz5rNVuzHj+jq6FdBA
 5NOKSAEWCxWHrSyAft5Fp1YLVF2WuM0PxLx/q+a5ANhFXVWxKeRiIbI7zvw2A1AJ
 e23rc75x2SrFdj6yI5+VLwGMj+fXSJnZ1mCs2ePkOpy3oOk2zm0Nkqf4sAr6T54j
 wc988KV/+GUWdbYGeOdDoN0M9W7zmgcap+uadwuBkVKMPohVYe0DF3/UcjP3TL/P
 3cbo47shj5hKdreHbX37nh+7/trvaBZp/DkphoRufoOmBMuU5UaFgxJ9Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=j/2kmdR7NtEfSFyn3CnrhKEbyG00F/2ApTM4WM7M1Tk=; b=Zi2ZiLmB
 nVc8emihKMTKM123LgurOHjZL9fTWk8EXKgBCuP/WvhJVprcxwFLL177FvDmHjNX
 C0faRbdGWidBkXXEx63QxUMe1PgrODGC67888BN5SGwqYiUUSgNi6aRa6HssB+yF
 JCbSG1p1fLHWrl2ednwCzA5uM+H54lt1F1PaDukB3npzWmCvm5ts5T4o9aYbw9Ke
 dnUA7bq1kP5xOb5llEmgLn1XUj4OFYuy3thmze9spuEY+Z9KgWWiaNzBsk82x18e
 0L2sGYYLoD8W1EmanXfgCX4U6XJ4O/shK33phRbdMZQaqNl+S4IfVrd+HFnAsBUj
 E03hEMX6KTjMDg==
X-ME-Sender: <xms:vn3uYCeoQRc6SnwB3xwhWLc1E-J4TXZvOFeWkkmesogZZm7QgV7WBQ>
 <xme:vn3uYMO-8QGelCHKCM1a1Y5fT6zjose5v1HxTTrzPV5JUGvO21I3g8cGnSSreIDec
 Vk_NmQlo3V6bddsDG8>
X-ME-Received: <xmr:vn3uYDjDdfKNZIj4_ydS717wClARPbcmclGzCS94ElCrFQ2oEuSjmowlpS_v_h53SyoNXtBI7ga7zXMwJ2X0Byb4VOvNkLOoPnT-O_wXiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:vn3uYP_aC9YRN3pHgwRnZqyOZxKjNDTZ_UDwWWbvAmZbYCE1JpmSXg>
 <xmx:vn3uYOscJQvP3ZtWlx2GKkin9E10X33Hcdtmg2_ggCR_mMcghfOuow>
 <xmx:vn3uYGEOUwrM_CqVtn7B72uiC4HqBbYXdtG7pzoSLow-uKemp2X0xA>
 <xmx:vn3uYDNF-nl9hJP0oRcAWRdpOFBAQzgOY9rLtsYbZ_4W77l_Tgy2sAPf7Ro>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Jul 2021 02:01:32 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] hw/nvme: split pmrmsc register into upper and lower
Date: Wed, 14 Jul 2021 08:01:21 +0200
Message-Id: <20210714060125.994882-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714060125.994882-1-its@irrelevant.dk>
References: <20210714060125.994882-1-its@irrelevant.dk>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>,
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
 hw/nvme/ctrl.c       |  9 +++++----
 2 files changed, 21 insertions(+), 19 deletions(-)

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
index 2f0524e12a36..28299c6f3764 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5916,11 +5916,12 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             return;
         }
 
-        n->bar.pmrmsc = (n->bar.pmrmsc & ~0xffffffff) | (data & 0xffffffff);
+        n->bar.pmrmscl = data & 0xffffffff;
         n->pmr.cmse = false;
 
-        if (NVME_PMRMSC_CMSE(n->bar.pmrmsc)) {
-            hwaddr cba = NVME_PMRMSC_CBA(n->bar.pmrmsc) << PMRMSC_CBA_SHIFT;
+        if (NVME_PMRMSCL_CMSE(n->bar.pmrmscl)) {
+            hwaddr cba = n->bar.pmrmscu |
+                (NVME_PMRMSCL_CBA(n->bar.pmrmscl) << PMRMSCL_CBA_SHIFT);
             if (cba + int128_get64(n->pmr.dev->mr.size) < cba) {
                 NVME_PMRSTS_SET_CBAI(n->bar.pmrsts, 1);
                 return;
@@ -5936,7 +5937,7 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
             return;
         }
 
-        n->bar.pmrmsc = (n->bar.pmrmsc & 0xffffffff) | (data << 32);
+        n->bar.pmrmscu = data & 0xffffffff;
         return;
     default:
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_invalid,
-- 
2.32.0


