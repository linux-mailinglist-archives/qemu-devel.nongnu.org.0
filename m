Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8545B4CCDF0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 07:41:06 +0100 (CET)
Received: from localhost ([::1]:46298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ1cf-0007un-DN
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 01:41:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nQ1N2-0005df-3A; Fri, 04 Mar 2022 01:24:56 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:50751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nQ1Mz-0002Pr-UH; Fri, 04 Mar 2022 01:24:55 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3492A580632;
 Fri,  4 Mar 2022 01:24:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 04 Mar 2022 01:24:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=6jQMn5vjkzbK22
 ZNGwwziED82xhmn61hEzAmt3+NbxI=; b=qyqcFsCVs9umQnvzDPuvN/cz9A2YBA
 FT+08UAa2EL0jxIp+oHFGawnzq1CkwFLaOY9NmfM3ghzIrwbuYDPjZhMo7Ai8bgc
 t+CZNl07oPFH0nyM19ymzcu59wIEG3i2QZo0gc5o4NEdiOZioulLTzzG5EW37xjX
 GL6uHLLwgodY/gCyMDGEGPOnpDjPNfrewjKRADbogZVccIdhlOO1FfsMN8fRQiKk
 K4qaozFYkutehbD57uza5GtnTDpqnTTGeTwiEwyrXWvpO3Sf+d4ea0+umDqEDbw3
 nIA0HbuoUqYUVe6UD7w9O/IJ9Bhq8CHNCgCy24CMPdQVC4zBAkuPxQXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=6jQMn5
 vjkzbK22ZNGwwziED82xhmn61hEzAmt3+NbxI=; b=bg9zXBMT/DCc6IPNHk9ql2
 1IXdHjqiSNWlqrO5BnJbhw6ZuYkFbJsLZ+5yfRAU7bxSFYNncHHM6bnbMU66ZCfO
 mppVyzYvTKVM7pJGQhXnZ/XlYT9AdadH+dLtnFaLKJlz5AEjtfV7E3dshOnb36hM
 yglxPmffGMWHiZXqf5W7j+TL8oJU2nF80W96veCZbFsH1UzRWs2Fq4RDcT03U3nL
 u6fCRZjVNxRkExylG7zrMxRQwIZKwjUZgyz+VBe0uorUdkbP1Fx4uMjpluTsP5HT
 E8vM0tn9YSIti2MKGQuvhDGPiuagKzGp6jk9lowfKdlbu6CkDNEXFttxEkcHVFGQ
 ==
X-ME-Sender: <xms:s7AhYneoKkJ-cIv0eexPv26xWCb0JDi7kcor4MVDIuW7EprcT03oJw>
 <xme:s7AhYtPALkcZSnmxcvDWNkRvmXSaB8a51x0MzfiG1T9FIDJApXf_p2pIoggGTBEIE
 KdXXFdr9LCvoD3-qUQ>
X-ME-Received: <xmr:s7AhYggECgQGj03xCFmktyrXErDQWO2Xf3jMjqWiWJ-cVx55bb_nVuRk7c9UM0o4BLXNSnBGvqSRqSBZDlnG5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtjedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:s7AhYo9TJqTqWOWIwPjqd9kpCISjMrMI3B2H7WWBDEwXY-_0hq-JOA>
 <xmx:s7AhYjvSe5mesPd0bGZvfcGMzjDk52-8FIndF0LAVus1oTLkx4aFYg>
 <xmx:s7AhYnEh5BHLZ9BZlLbvY6ymhbGlbZG1XIqp1Ruf6qcWmhbF3LGvgw>
 <xmx:tLAhYklpN-Ns0FJMkS6iyz4w73YDj0jGyCvcgIsUyLAopH6fYG8EFQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Mar 2022 01:24:49 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/6] hw/nvme: add host behavior support feature
Date: Fri,  4 Mar 2022 07:24:39 +0100
Message-Id: <20220304062443.352515-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304062443.352515-1-its@irrelevant.dk>
References: <20220304062443.352515-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230; envelope-from=its@irrelevant.dk;
 helo=new4-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Klaus Jensen <its@irrelevant.dk>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
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


