Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7C12FB54A
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 11:22:34 +0100 (CET)
Received: from localhost ([::1]:42354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1o9h-0004Jv-Av
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 05:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2i-00025Q-LP; Tue, 19 Jan 2021 05:15:20 -0500
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:39143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l1o2g-0004Hz-UM; Tue, 19 Jan 2021 05:15:20 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id D66AAF5B;
 Tue, 19 Jan 2021 05:15:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 19 Jan 2021 05:15:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=mJVLB/WGdVWqN
 aTjqp4aIkVY7ievaaG46upf1c0VMZQ=; b=CdyI9wzRuSd9kMIQFfiW5N83BUq6m
 MrVbtscrAyNtP3bz5p43rbbAxgI+vm4yz0tUUxmfOwqNGnHxp+ah9p0IFu/BLYZZ
 +kBwYjAC7IwTAuji1wQvMLcEkXiSRoxKAIpbjAn5ZqhJRSALDnqQqetC6Fu50STS
 mXH5LGoDN5cxRWkhQhsIJaRYHQAts+7DNNUKg9M/ECWN9rKfhgvn0BVamPIF2HGS
 tBNzAKZaHVVUJ+87k7n7pouFocTCzMvsMbc1DVygQgcHYbxrA2R/6K7t4YXfIDmT
 NnQuWsfNZXJ/yVFQhbXmW4uV5498v5peGPj/5NUQybMnJzXzrthnhc8vg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=mJVLB/WGdVWqNaTjqp4aIkVY7ievaaG46upf1c0VMZQ=; b=IOTaXkUU
 9nuzgW84fDkL3ku7bcLxQflaX9UssFQXZ/NeJZyWlVgWs12STXjnfvcX265yh7a4
 4TlvajoelXLJzAQ3OUOrQoHpzgDBzT3Q0GOfUWfCc1mDphsJFGTDbfbsIhl2PYEz
 sGMecbg2nujG6/Wns2gi2QjfBrZibEGFXmxRhFejhrRtWU/XqPcDbJQk9fO+8v3V
 yFYNiiGBrJyblcvoMeRYUDJRurzf4YjMCjrr1K3MFXce9irU6V96hODMdT8EWrBy
 xMr07OyQQ6ZkCoTuSLs2Xb8llYUf64rh07jL14A+Sb78WupHxKAmrzVfE4Crr5VJ
 3KvKuL620X8ZBg==
X-ME-Sender: <xms:NLEGYBazOC7xCeElCw0AKl0XNV-i_ecD7KFJaRClklKkxBEuYmSXdg>
 <xme:NLEGYIYgSBMc59nure4UcrTTJ7emmKlQttraduZ5QeXGUlCNFQvYjg56nP7oJevkP
 pcjmXOBdsO326yeEnY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddtgdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghushcu
 lfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvg
 hrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffevgfek
 necukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:NLEGYD-V1ilfyWoX0HpzejytEaGlIoydVlR5FT8GTY9I_phwSG7UGw>
 <xmx:NLEGYPqRaxflDtkDB9eZFrAL1PhL4156hSplIoSQKRF_N0CsH5KdmQ>
 <xmx:NLEGYMqHrziNlohBcvAcC7QUpGgl2u8loBUqEhgUespq3lNv9_FhnQ>
 <xmx:NLEGYELYsmQ81QmOzVJtqlkgavHY3L_EAVGoE3-OuQl4gw7TS_ZK2Q>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 17CD724005A;
 Tue, 19 Jan 2021 05:15:14 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/12] hw/block/nvme: rename PMR/CMB shift/mask fields
Date: Tue, 19 Jan 2021 11:14:58 +0100
Message-Id: <20210119101504.231259-7-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210119101504.231259-1-its@irrelevant.dk>
References: <20210119101504.231259-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Use the correct field names.

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 86d7fc2f905c..f3cbe17d0971 100644
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
@@ -81,10 +81,10 @@ enum NvmeCapMask {
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
-- 
2.30.0


