Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B4F314A82
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:42:09 +0100 (CET)
Received: from localhost ([::1]:59826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ob2-0003ZA-Aj
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:42:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NW8-0005Zo-4a; Tue, 09 Feb 2021 02:33:00 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:58273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NW2-0005uE-0Q; Tue, 09 Feb 2021 02:32:59 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 83E60B84;
 Tue,  9 Feb 2021 02:32:30 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=k4v6XaoQU5nSO
 +ofxC5Ny8BL2vGSKPGVQHN2ksOGwqQ=; b=Qzn9pjapvB0Dccg8gr4w7PnLaVdzI
 V5lK14K5ImS1pdo+C9K/qS0X+7ZPddQupuq8JGcJcx+VB1cpXFciveWVtZV5C/Hf
 +VbCktCQjjFjSNXc2WpQdWXRloQ2cVPPH0GU7DlSsn6ukHZSXp0zOis8pFnMXLEu
 /9lJeaOQAwzpY5aUYVmjVpvIVzPQGls69Sr/Lr2AeZKPw0r4O8x1DM97Cch1kmpC
 KpHClOupuaFQMbfQ5xfuMV5PzYGAxb9RTz/b+gqEuhYkD48yl2n9Qpb7UIuHYuR1
 ifWaJwzxXmvZrJklAV281N0U4R1Res9GUEpW367bjGQvRJpgR0J1T1jJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=k4v6XaoQU5nSO+ofxC5Ny8BL2vGSKPGVQHN2ksOGwqQ=; b=LYo/+Wax
 v8srRhk8tm+WGBWw7IfVsI3JYk3RyO8KtgrPA0kiF4J1/lyCwNrwssw+qs+Go42c
 oAjkUHtLzfvSr/+uOjLcw//wpz/PJu4Tm8SCw6m8L6b3H4oM/k0p34b/QHO1IDFn
 yXGf9BuPwO2d2skKKnVDzTLsaC168g1zTtKuh4UNenShc8MYFrXDzICnbk0RqzvS
 c0ajUNyfXmR4cB3YKAtDaFfW2Gy/ktz1kdNMKc742ps2cJpqirxqMo85H6abIml/
 qbgP8j8yxe79sqTi3xuZQkeurDNyrD7KWjV7D9XMCxqfmAQc0INIzlrcC5uhqvQQ
 LN6Zvk448jwBSg==
X-ME-Sender: <xms:jjoiYGpQbjkSzAI3OCwQ6mjcvGKZ1y4o4oQnQ_h1XKdcQO_95xT5Xg>
 <xme:jjoiYEqV5eUTelu28d-QXXwguXUm0FwEOR0bZRIVInZSgdfnFQPMhoIpXC8rGthyW
 s5B3BFuomeqFy7J0mI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduhe
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:jjoiYLNkeerbV9CNGPxrehD-Y9uWD-H2GwIl1C3XShfusengQK45qQ>
 <xmx:jjoiYF4eEDoiHVa5O2gkhXpk-CADc4aJ1RXAM5Ca1BegT6B122snIg>
 <xmx:jjoiYF4mEfMEBstQ4gik1TpPSC37KUbcJgh4iJZ09K6UuGQt8QJ7lA>
 <xmx:jjoiYPvfZnTnSTdhjGbPQMOtWgAzsYFZrwwgPK0sqWXk_QI-4fAqVbWnKOc>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id ADC141080057;
 Tue,  9 Feb 2021 02:32:28 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 43/56] hw/block/nvme: rename PMR/CMB shift/mask fields
Date: Tue,  9 Feb 2021 08:30:48 +0100
Message-Id: <20210209073101.548811-44-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Use the correct field names.

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 18 +++++++++---------
 hw/block/nvme.c      |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 151921da21f9..008108bd1af8 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -35,8 +35,8 @@ enum NvmeCapShift {
     CAP_CSS_SHIFT      = 37,
     CAP_MPSMIN_SHIFT   = 48,
     CAP_MPSMAX_SHIFT   = 52,
-    CAP_PMR_SHIFT      = 56,
-    CAP_CMB_SHIFT      = 57,
+    CAP_PMRS_SHIFT     = 56,
+    CAP_CMBS_SHIFT     = 57,
 };
 
 enum NvmeCapMask {
@@ -49,8 +49,8 @@ enum NvmeCapMask {
     CAP_CSS_MASK       = 0xff,
     CAP_MPSMIN_MASK    = 0xf,
     CAP_MPSMAX_MASK    = 0xf,
-    CAP_PMR_MASK       = 0x1,
-    CAP_CMB_MASK       = 0x1,
+    CAP_PMRS_MASK      = 0x1,
+    CAP_CMBS_MASK      = 0x1,
 };
 
 #define NVME_CAP_MQES(cap)  (((cap) >> CAP_MQES_SHIFT)   & CAP_MQES_MASK)
@@ -62,7 +62,7 @@ enum NvmeCapMask {
 #define NVME_CAP_CSS(cap)   (((cap) >> CAP_CSS_SHIFT)    & CAP_CSS_MASK)
 #define NVME_CAP_MPSMIN(cap)(((cap) >> CAP_MPSMIN_SHIFT) & CAP_MPSMIN_MASK)
 #define NVME_CAP_MPSMAX(cap)(((cap) >> CAP_MPSMAX_SHIFT) & CAP_MPSMAX_MASK)
-#define NVME_CAP_PMR(cap)   (((cap) >> CAP_PMR_SHIFT)    & CAP_PMR_MASK)
+#define NVME_CAP_PMRS(cap)  (((cap) >> CAP_PMRS_SHIFT)   & CAP_PMRS_MASK)
 
 #define NVME_CAP_SET_MQES(cap, val)   (cap |= (uint64_t)(val & CAP_MQES_MASK)  \
                                                            << CAP_MQES_SHIFT)
@@ -82,10 +82,10 @@ enum NvmeCapMask {
                                                            << CAP_MPSMIN_SHIFT)
 #define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
                                                            << CAP_MPSMAX_SHIFT)
-#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMR_MASK)   \
-                                                           << CAP_PMR_SHIFT)
-#define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMB_MASK)   \
-                                                           << CAP_CMB_SHIFT)
+#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMRS_MASK)  \
+                                                           << CAP_PMRS_SHIFT)
+#define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMBS_MASK)  \
+                                                           << CAP_CMBS_SHIFT)
 
 enum NvmeCapCss {
     NVME_CAP_CSS_NVM        = 1 << 0,
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 4ce75642f1a4..0057a02402b7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -4501,7 +4501,7 @@ static void nvme_set_smart_warning(Object *obj, Visitor *v, const char *name,
 
     cap = NVME_SMART_SPARE | NVME_SMART_TEMPERATURE | NVME_SMART_RELIABILITY
           | NVME_SMART_MEDIA_READ_ONLY | NVME_SMART_FAILED_VOLATILE_MEDIA;
-    if (NVME_CAP_PMR(n->bar.cap)) {
+    if (NVME_CAP_PMRS(n->bar.cap)) {
         cap |= NVME_SMART_PMR_UNRELIABLE;
     }
 
-- 
2.30.0


