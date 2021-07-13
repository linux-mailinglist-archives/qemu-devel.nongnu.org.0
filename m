Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB3D3C775F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 21:38:12 +0200 (CEST)
Received: from localhost ([::1]:42352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3OEM-0006UB-WF
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 15:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3O1I-0007OA-4F; Tue, 13 Jul 2021 15:24:40 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:55507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m3O1G-0003OZ-DO; Tue, 13 Jul 2021 15:24:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 93B21580ABA;
 Tue, 13 Jul 2021 15:24:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 13 Jul 2021 15:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=j/2kmdR7NtEfS
 Fyn3CnrhKEbyG00F/2ApTM4WM7M1Tk=; b=iyGw0epOf6Ug3CCnaBBmyNTlLONBt
 YD66tg1QoURD7YJlevvzlF/M0JjVuIELT5no3/DASkn+PlIszxIMtks4GxDRMYfZ
 cEkyrBGsjZVMXijyXGrdKBmeWlW1JmLkkJpHXhjZPNRTsVDK6rCi0Ze+cWsI6g0h
 h5eNIfi0YVtyRNOg6iC0jBlGfXEe/AzaOWSPABCNLC0zL1GRcCaJXTIBrpBa0ket
 RTQAcrZX01Lm0+wGmYa6O4J7Ty74/UbH9Rh2qTVaZQD0yQoAfE8q1XH3HRB45jM1
 fY9h8TaWmosnXxxxL3n/P/WPQv5uP8EFOVJjc7RKwJm1CT+Ga75nf9F2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=j/2kmdR7NtEfSFyn3CnrhKEbyG00F/2ApTM4WM7M1Tk=; b=SehST0Qx
 dgfXOwahxwRwaDyn9W6kz7wHKPKpl3CW2ryFNq5WEYW6MV6XjGUSYqJLoAhQ2ARA
 qksBXXqqK+/e4orMoNX1eHkS6xdEh8dSt+RXNtW8JqI7AJI4lA8JJG8e4PVDKC7K
 hpSgnrOFCtB4igDWQZF5reUp9ONdgSjceP8RZ1LRSPE1T8wCZQfQqvcs6Ykq3aHy
 ZsV+wMqHT1j7jQnWHiJrxmPoquJX2D7GdhLsoKK2am/GZLeMOBeU7yqqaeAbJL5F
 UYjCza4egMxe/4+px10q5HxoNFmiPBsKJnn/dE4paExzubxAIhEW6M3yg3jV7EQj
 ZvNpdcLQTxEeJg==
X-ME-Sender: <xms:dOjtYPoGjGj-IJG3Pzs7IDfAOuZEtNYUhiRd9oLm2dUST8gutSpbNw>
 <xme:dOjtYJqwUdQDQ1B2cBk0RQnm1C3woJEKeQDczurS3OFq3e4VetLBqm494ozcu2yxj
 VwV3M1ZOvz_vQtGWSE>
X-ME-Received: <xmr:dOjtYMPlyhxl8o7pR0B7s4AwVexmwaoEnzJ6r4kTnAPDOwDhabpYsz81BM2bBjUaHZTunAo-wevdaAGPUBXdEEV3FmPo734QTLbUF7285Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudehgdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:dOjtYC5yeLuZX4i-FvepnXoEpjITjdDOZSX1TVWdDsFtqfZbVH9dxA>
 <xmx:dOjtYO61iWslFyjMitj8X2JjCbKyN-A-8_jtadC1g9M_P2FUCvZmdA>
 <xmx:dOjtYKjmZB-HrPull7oq3Hk7mLlGuVhIGBcZOL0Pcfx9HO48y8B-8A>
 <xmx:dOjtYOyWzqxO0IkfqOFIrCfuvejmzbXQ-yEfBbsK8eR7MolRjq8-3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jul 2021 15:24:34 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] hw/nvme: split pmrmsc register into upper and lower
Date: Tue, 13 Jul 2021 21:24:24 +0200
Message-Id: <20210713192428.950160-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210713192428.950160-1-its@irrelevant.dk>
References: <20210713192428.950160-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
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
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Paolo Bonzini <pbonzini@redhat.com>
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


