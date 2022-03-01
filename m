Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6424C8A2C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:59:16 +0100 (CET)
Received: from localhost ([::1]:47180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP0Dq-00079B-2O
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:59:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nOzzk-0006JL-RM; Tue, 01 Mar 2022 05:44:41 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:55973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nOzzi-0005hO-2O; Tue, 01 Mar 2022 05:44:40 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 502025802FE;
 Tue,  1 Mar 2022 05:44:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 01 Mar 2022 05:44:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=6jQMn5vjkzbK22
 ZNGwwziED82xhmn61hEzAmt3+NbxI=; b=Mr7qVRQM0toeGFT7Ocmu5rEnrq+hd3
 KlOVxkLzUST8d6VJRfBAmSMRodhxjmosjtkm+vNHZJBlM9R4IO1OEvF3F/9J+21Q
 8XcWA3oxFiKxnUDBwO9Q0oWLo+Mjrj0PLdcccOyM5BDR2bGZUxTvVKsyW2DGuoAO
 E5IEhGnUgJI0xCPxFO77pvJBrjdHhTlGWnTNRAjMwQ5xQTdVwSrEdhiHJVyDMDob
 DWHk/fJjkbZ85RnPfRoXciuOsXdeb2vJbwy+1SPVOXczySM3279gcExRhR2Jgjt+
 /yAbzKH15+gBlI7v6R55Lq78aaqhFQl9/Gmmmr2frpAtaBd5/ZtHyxCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6jQMn5
 vjkzbK22ZNGwwziED82xhmn61hEzAmt3+NbxI=; b=KNj0Fm/NaT4pXFb/LZ1QqW
 vaTpX6MzOrKLrYkY22pr+Fs4caET8fWbGDt/CK+OARLAAg1kpWiUX+0Ny84WQqzL
 57FDnL4APU03aQxvsSkQNYRUUJcEwW7lMiTkEekHVBKqXDbcPcrvlSQQWWihrDXO
 JenvVBxb1SOBuLRbfr9vpZsGx9H7jBB+Yk/Q5/nEdRVUbArRIe4LH8ErFls+kT6q
 w2cM0/3LwrDBqnOxPsjHj+V3qauIEC6u+VKyXJ4VlAPR9EVx4xTbJxhgwbX7xNfE
 J3SHE9EGEA6GHZ6dmFYsI7J505DTuEMpLQNWRseajprcls4fvSQlKkhJDJ1J/LjQ
 ==
X-ME-Sender: <xms:FfkdYjOTWU-IRz9KtbchIXZawjQmxiDWI2K2vqcvlmSGms7nLsnGPg>
 <xme:FfkdYt-aXXiWatutxIrV-aNy1NAr08cN58GDDALzLpL3tQqiVNNcaGuFhHKFQuomw
 HlmxIP2m9wump68EIw>
X-ME-Received: <xmr:FfkdYiSj83cWxShV7mdk3qfbSRqiUvX_zUzawDwRrUFYcjZlrGtwW9DE-QN2y6724qbxRx432A5pVHumTM6qWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtvddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:FfkdYns6YtnvSYJRI90mJUkYwTPg5lAcd7ymZPO_7n5WnSkfDiwZ0w>
 <xmx:FfkdYrcsBZ_0f0xwJs2GbcAq6R7PoQ__zjREuzOy7__cXWGpj_SmlA>
 <xmx:FfkdYj0Q-8ZHCCXbUXCqmjLHwZbsvdWyouoK1VX-AEU-1rtCRIxxng>
 <xmx:FfkdYv7vNrM14fgld9BtyVPZeH97glVuc0Ze3AgXbZEvBH4AGqHRYA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Mar 2022 05:44:35 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Keith Busch <kbusch@kernel.org>
Subject: [PATCH v2 2/6] hw/nvme: add host behavior support feature
Date: Tue,  1 Mar 2022 11:44:24 +0100
Message-Id: <20220301104428.160017-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220301104428.160017-1-its@irrelevant.dk>
References: <20220301104428.160017-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.224; envelope-from=its@irrelevant.dk;
 helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Naveen Nagar <naveen.n1@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Naveen Nagar <naveen.n1@samsung.com>

Add support for getting and setting the Host Behavior Support feature.

Reviewed-by: Keith Busch <kbusch@kernel.org>
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


