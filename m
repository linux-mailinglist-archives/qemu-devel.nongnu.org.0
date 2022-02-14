Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6744B50E5
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 14:01:51 +0100 (CET)
Received: from localhost ([::1]:34328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJazF-0005LN-KE
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 08:01:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJaVd-000674-4H; Mon, 14 Feb 2022 07:31:15 -0500
Received: from wnew3-smtp.messagingengine.com ([64.147.123.17]:37711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nJaVL-0003b6-4R; Mon, 14 Feb 2022 07:31:12 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 976CA2B001EF;
 Mon, 14 Feb 2022 07:30:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 14 Feb 2022 07:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=c6rdmHN0NEAGD3
 zdhKdwEVcHjT559GhTdUF15i8kQyw=; b=qK0b4WhCAGODvfGV4miVOaTS0WBRxC
 vAVJnaaxzIZNgtsisEsfcoWTTlAtYvXvGDBEsFyotYLRAnWZUXRL95T7OB8i7C38
 hTyHDvqIBBfIIcTZ/eunj8/zSFiUBn3S+aYBDpYKKSCQmdwf3XR2BEhNI14ED3DI
 OsSbFzFbj1uhnlF9mkY+Pw61SLUotYAAfllgwHFHWrbCZpEyRRObkc5gEyNLF4KJ
 wwutHnOGOOUaE073mfA3GFaj5to38pRcP1GDluHHsicMSN0R+EoPmLfa9njgYBaP
 SaUD2J35I1pLv+KraYKwvTMxVsD+3fxlQSHnVq5rqEbpZxn0HocCRLDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=c6rdmH
 N0NEAGD3zdhKdwEVcHjT559GhTdUF15i8kQyw=; b=iTKr33tAWZHauF81QMcg68
 LpEajhGWSU5HaNlNdsowmVksnKR8a8fN835oXOvx6b5vaMahj3TDbgsGlXkTdl6c
 Qx4ViiTFhI3IkElNHM353+VD7vWjZXjetXe/Q2m7tGL+rlkhtPrFbBcgkXtPsqVi
 ZrJiorFWIUE+tqQIq9WJFxCN18NfH/krSMucq+KMqSR/DiYZpcwGbw8vmo5iTviX
 DWNUq5i8ZCUc1PHhne1ZANDCnRu0WdBQUk7xDSmxeUcbAZpDx4iIe0RAqKU29vma
 XWU16MolQ3LAEDUJ2O/doO5pRa57TMkYzd2ES/Am/fxfGgbgy20CHifqMSS7W3+Q
 ==
X-ME-Sender: <xms:cUsKYm7zM-UrCXAdU_OnL3gTfQMcl4EZPjDVKKUuMHoUkJHWDRbcxw>
 <xme:cUsKYv6VMVk8PzchxeE8VoNb-D1lOutsbFovEEqmE85gy_i25CbH6xq5d4VViCKnb
 yggH9eQIZabMqNbkgs>
X-ME-Received: <xmr:cUsKYldpZwiKn5HeOQ64Hq13ffWo4Wdzdv0ZH64yd8EL8aPxzgqefiVZx282Fl1Ny0nr1TLEh9vYqYv1TuP-lw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrjedvgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepihhtsh
 esihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:cUsKYjJww0-9qRmMWsNS63BuFOzAcwY3ZuDBYzwWPbcN_Jh8qtRlng>
 <xmx:cUsKYqJ1X5NLO8G2LfkR3k3Mv9ZJtkOGigVmcMOg9uVk4CiPUiBsLQ>
 <xmx:cUsKYkw-k_EiXMtrQ6QGIf2QDhat7H_wtQkfEZd8wukLgPiWzwUkXQ>
 <xmx:cUsKYnUBPXtgMSOjqJcOEqhd2-golKJuwmk63_5yPy66R-XwyLb7bLWvi4s>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Feb 2022 07:30:39 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 2/6] hw/nvme: add host behavior support feature
Date: Mon, 14 Feb 2022 13:30:25 +0100
Message-Id: <20220214123029.106404-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220214123029.106404-1-its@irrelevant.dk>
References: <20220214123029.106404-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.17; envelope-from=its@irrelevant.dk;
 helo=wnew3-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Naveen Nagar <naveen.n1@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Naveen Nagar <naveen.n1@samsung.com>

Add support for getting and setting the Host Behavior Support feature.

Signed-off-by: Naveen Nagar <naveen.n1@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c       | 8 ++++++++
 hw/nvme/nvme.h       | 4 +++-
 include/block/nvme.h | 9 +++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index d08af3bdc1a2..71c60482c75f 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -196,6 +196,7 @@ static const bool nvme_feature_support[NVME_FID_MAX] = {
     [NVME_WRITE_ATOMICITY]          = true,
     [NVME_ASYNCHRONOUS_EVENT_CONF]  = true,
     [NVME_TIMESTAMP]                = true,
+    [NVME_HOST_BEHAVIOR_SUPPORT]    = true,
     [NVME_COMMAND_SET_PROFILE]      = true,
 };
 
@@ -206,6 +207,7 @@ static const uint32_t nvme_feature_cap[NVME_FID_MAX] = {
     [NVME_NUMBER_OF_QUEUES]         = NVME_FEAT_CAP_CHANGE,
     [NVME_ASYNCHRONOUS_EVENT_CONF]  = NVME_FEAT_CAP_CHANGE,
     [NVME_TIMESTAMP]                = NVME_FEAT_CAP_CHANGE,
+    [NVME_HOST_BEHAVIOR_SUPPORT]    = NVME_FEAT_CAP_CHANGE,
     [NVME_COMMAND_SET_PROFILE]      = NVME_FEAT_CAP_CHANGE,
 };
 
@@ -5091,6 +5093,9 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         goto out;
     case NVME_TIMESTAMP:
         return nvme_get_feature_timestamp(n, req);
+    case NVME_HOST_BEHAVIOR_SUPPORT:
+        return nvme_c2h(n, (uint8_t *)&n->features.hbs,
+                        sizeof(n->features.hbs), req);
     default:
         break;
     }
@@ -5281,6 +5286,9 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         break;
     case NVME_TIMESTAMP:
         return nvme_set_feature_timestamp(n, req);
+    case NVME_HOST_BEHAVIOR_SUPPORT:
+        return nvme_h2c(n, (uint8_t *)&n->features.hbs,
+                        sizeof(n->features.hbs), req);
     case NVME_COMMAND_SET_PROFILE:
         if (dw11 & 0x1ff) {
             trace_pci_nvme_err_invalid_iocsci(dw11 & 0x1ff);
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index 801176a2bd5e..103407038e74 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -468,7 +468,9 @@ typedef struct NvmeCtrl {
             uint16_t temp_thresh_hi;
             uint16_t temp_thresh_low;
         };
-        uint32_t    async_config;
+
+        uint32_t                async_config;
+        NvmeHostBehaviorSupport hbs;
     } features;
 } NvmeCtrl;
 
diff --git a/include/block/nvme.h b/include/block/nvme.h
index cd068ac89142..e527c728f975 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1216,6 +1216,7 @@ enum NvmeFeatureIds {
     NVME_WRITE_ATOMICITY            = 0xa,
     NVME_ASYNCHRONOUS_EVENT_CONF    = 0xb,
     NVME_TIMESTAMP                  = 0xe,
+    NVME_HOST_BEHAVIOR_SUPPORT      = 0x16,
     NVME_COMMAND_SET_PROFILE        = 0x19,
     NVME_SOFTWARE_PROGRESS_MARKER   = 0x80,
     NVME_FID_MAX                    = 0x100,
@@ -1257,6 +1258,13 @@ typedef struct QEMU_PACKED NvmeRangeType {
     uint8_t     rsvd48[16];
 } NvmeRangeType;
 
+typedef struct NvmeHostBehaviorSupport {
+    uint8_t     acre;
+    uint8_t     etdas;
+    uint8_t     lbafee;
+    uint8_t     rsvd3[509];
+} NvmeHostBehaviorSupport;
+
 typedef struct QEMU_PACKED NvmeLBAF {
     uint16_t    ms;
     uint8_t     ds;
@@ -1520,6 +1528,7 @@ static inline void _nvme_check_size(void)
     QEMU_BUILD_BUG_ON(sizeof(NvmeDsmCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeCopyCmd) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeRangeType) != 64);
+    QEMU_BUILD_BUG_ON(sizeof(NvmeHostBehaviorSupport) != 512);
     QEMU_BUILD_BUG_ON(sizeof(NvmeErrorLog) != 64);
     QEMU_BUILD_BUG_ON(sizeof(NvmeFwSlotInfoLog) != 512);
     QEMU_BUILD_BUG_ON(sizeof(NvmeSmartLog) != 512);
-- 
2.35.1


