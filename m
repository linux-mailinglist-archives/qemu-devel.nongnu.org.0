Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 625123CEF63
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 00:52:45 +0200 (CEST)
Received: from localhost ([::1]:44560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5c7w-0004Ad-9q
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 18:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5c2N-0000Ix-Or; Mon, 19 Jul 2021 18:46:59 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:47703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1m5c2M-0005MF-81; Mon, 19 Jul 2021 18:46:59 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 88A9F580A37;
 Mon, 19 Jul 2021 18:46:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 19 Jul 2021 18:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=j/2kmdR7NtEfS
 Fyn3CnrhKEbyG00F/2ApTM4WM7M1Tk=; b=VffSi2AV4ukdGJBVVIo7GFqbRU1dK
 S1tthIYDYYPPW8LQqQe17rf1LTkzi/zwnHU5DIo3clWCZcWbdySulKwQ0kBkULDG
 t2o8VjPeGBIP9KIcNrSMxq1i/nQ3U4SXmiHPRlNwzE3bXVmTPM8gJpbBfn/SsjaH
 Yrncdn0Hxj0NmbtLooDIEMjvfRcZZ/N+tFpCPS0fL8A0R2W4ZBATOMyk3qX7fw8c
 B/KacV/27D4c6CZU68YaLJwtl5a07m2JoU6aT4fgrCdaBGCsju4IkGmbPRNeqeqg
 v/am3iScUDf3FV2agBhsJNUP49NS+qZDc1pBjoTi0pTRcY2nNzKgcoOuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=j/2kmdR7NtEfSFyn3CnrhKEbyG00F/2ApTM4WM7M1Tk=; b=BHvryHz+
 /qDWdLjeJAIp2EaMm9NFfoqOPUJXJPPak6XiNeKZ0oFeUfaSlG4bc2Tp03ygTWZH
 aHjEnJDz5BJofU/7U/iLCLiZYG4V2hbudVuPRRuVYVGWZpQHItVoHqZIdA8lfD3V
 g5s6aEGlFoBEUqmSTwENCHiitDfgLVtK3KlzO7lr9Ojw/duQw01y/bTb1/SlQcm+
 evPpZ7dqQ1Fzlob0LG+DrEOY+F0AxOFxDFdrDIjLAdrCRZgUHmRnCFPP2MnpyVrp
 mWESyAx+sb91fSoGobVidBY9eb1vFQr5IMA+rQi4dRKAVhtcIWX7qvM5Tu80We/A
 zMyypMYeHLhMGw==
X-ME-Sender: <xms:4AD2YPw-o9cJ39YfhCsaCwIemkI37dMCEUlianWr_AqkGPTM_Bfepg>
 <xme:4AD2YHRVXlvhnwTPpOXD_092G5mKw0AFT4H7BCa2IwtIwwgKN5pILL6G2NTpQSDed
 55OZrPA-DY8AcMrkqQ>
X-ME-Received: <xmr:4AD2YJXyQP4skNJlg-Pd8kHbHEP1K3EPFFotwOv9QGvsrWQMIGnL42E8aaQ-Jc_VqXzuzswUmb5yEGELnb_oqojys1witZGQrodXo-gciw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfedugddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:4AD2YJiT2LeBFNwebfqSWeu5nyRwsSQ-nSX_n_T-dMmu3R0G-wSLXg>
 <xmx:4AD2YBAsNfh0rmknW_HMY9q-CBNVCibP91Gc_2ezcExAzJHn90nqYA>
 <xmx:4AD2YCK_4HM3r0CCm4MYPvNuKzU1R4-ayBxAOqS0L89aqrbmqW03aQ>
 <xmx:4QD2YJzqR7RsljxTBEE0XaFrluNIeYaddZYnD8gjMV7EI_kMqhDa6A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jul 2021 18:46:54 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/5] hw/nvme: split pmrmsc register into upper and lower
Date: Tue, 20 Jul 2021 00:46:43 +0200
Message-Id: <20210719224647.68559-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210719224647.68559-1-its@irrelevant.dk>
References: <20210719224647.68559-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.221; envelope-from=its@irrelevant.dk;
 helo=new1-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
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


