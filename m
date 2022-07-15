Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9313F575E26
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 11:02:48 +0200 (CEST)
Received: from localhost ([::1]:34252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCHDh-0000YC-3d
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 05:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvW-0000mz-Og; Fri, 15 Jul 2022 04:43:58 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:42349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oCGvU-0004Lz-0b; Fri, 15 Jul 2022 04:43:58 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 344C95C0219;
 Fri, 15 Jul 2022 04:43:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 15 Jul 2022 04:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1657874635; x=
 1657961035; bh=kqr9ToxfHHAqvwImNcPdZrpzEJdnEOW9xINMy2uph8c=; b=x
 bsDwUb6SJwmJzFTZy4ZbhL8ke2/YoMfcnjts//kUO7v1kbCpajRmNT/ZLbEntnvd
 4CcLkz8FknVKLppbljpHWLdMWXQGvJdiCJWdbmk/WPR70g2A3pRZuOmwrUGEMG3P
 aSb7Rapl+X9VZiRU3/VDYb/TOBllYYtGBPAu1HC9msB2stnwqUFF+LRIPDf31epB
 xCGYyA0B5ImvzAlPzbLHQPrnKD5AKJSNoHmsq8arBnm3JP6oMmupAmJ3RrSByHgN
 NM71CfZV29y84MclmBora/SDa7qD2lDFw5pzYMJoNbqkzHanki6LDvdSHuxRZJXa
 lp7jcw62Z6b8kMWR1884Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657874635; x=1657961035; bh=kqr9ToxfHHAqv
 wImNcPdZrpzEJdnEOW9xINMy2uph8c=; b=SMJzLiCb/mnmGfddbY/Tz9RBzQJv8
 QLLjOS5aufRilQ8Apbo/R2hk/jTjd1GyxchO/5nQ7G6WT7nGXIr9F9BdiAJ3Qb+X
 X+FFdBXbIwr1DqA07Oa15CRQNDk38lWgJ549tkOp1Z+09UZUlrhtymO6ES+PSA8Q
 FnmuHXffbSm/axy9j1v9mxvwSXfQKSeL6fXLxCtbb/odQqZJ12akvWPkLf3RjLO3
 wEf7hleL6oM0Rpo2pTC8Tt+P1hjacd6lbd1XffGDujZek3BJ43mM5euawn5MEQXJ
 anTQlYixKDIcCw8JUhqBWjFMVmbr2qPJT1lQDEdF4Ywq5SGWEAEy1nA8g==
X-ME-Sender: <xms:yijRYhrXDaPbmhab43OIsYELAxNPy1QTuS4mYLQMKCLLdeT-1gRwbg>
 <xme:yijRYjoOFPw57cOyZMKnl5zbgeDkIg6YLsAhXbjPkg0Qmt7L4YePg7HnuV_3khX0B
 A4in-vnPX34EN2Yb4U>
X-ME-Received: <xmr:yijRYuOCKrqX2Klw8NaxBdKs5jMhiYWVhUDZGXO3PVPf7neBDESSFnYqFIU4ys9FVXA__6ltb2k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:yijRYs4Y2T2iW5D_uUU_q3ebJtaObyOPymtJY9VK2nXylGTwYN0caw>
 <xmx:yijRYg5o5B9ZRNcMTLjrC56GMZbztFmfC7cvLkliGAvNhrcxJAuYiw>
 <xmx:yijRYkh-i1tAOMSvPoiB314K7NU7Bw8IcgbLCetc42Ywckm2q4ih4g>
 <xmx:yyjRYtwZjdigduXcIAmBrI1MzfmzYI06HKB7ccwUgzPHDi9aXlKobw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 04:43:53 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>, Fam Zheng <fam@euphon.net>,
 Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 5/6] nvme: Fix misleading macro when mixed with ternary operator
Date: Fri, 15 Jul 2022 10:43:39 +0200
Message-Id: <20220715084340.1128455-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715084340.1128455-1-its@irrelevant.dk>
References: <20220715084340.1128455-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Darren Kenny <darren.kenny@oracle.com>

Using the Parfait source code analyser and issue was found in
hw/nvme/ctrl.c where the macros NVME_CAP_SET_CMBS and NVME_CAP_SET_PMRS
are called with a ternary operatore in the second parameter, resulting
in a potentially unexpected expansion of the form:

  x ? a: b & FLAG_TEST

which will result in a different result to:

  (x ? a: b) & FLAG_TEST.

The macros should wrap each of the parameters in brackets to ensure the
correct result on expansion.

Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 351fd44ca8ca..8027b7126bda 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -98,28 +98,28 @@ enum NvmeCapMask {
 #define NVME_CAP_PMRS(cap)  (((cap) >> CAP_PMRS_SHIFT)   & CAP_PMRS_MASK)
 #define NVME_CAP_CMBS(cap)  (((cap) >> CAP_CMBS_SHIFT)   & CAP_CMBS_MASK)
 
-#define NVME_CAP_SET_MQES(cap, val)   (cap |= (uint64_t)(val & CAP_MQES_MASK)  \
-                                                           << CAP_MQES_SHIFT)
-#define NVME_CAP_SET_CQR(cap, val)    (cap |= (uint64_t)(val & CAP_CQR_MASK)   \
-                                                           << CAP_CQR_SHIFT)
-#define NVME_CAP_SET_AMS(cap, val)    (cap |= (uint64_t)(val & CAP_AMS_MASK)   \
-                                                           << CAP_AMS_SHIFT)
-#define NVME_CAP_SET_TO(cap, val)     (cap |= (uint64_t)(val & CAP_TO_MASK)    \
-                                                           << CAP_TO_SHIFT)
-#define NVME_CAP_SET_DSTRD(cap, val)  (cap |= (uint64_t)(val & CAP_DSTRD_MASK) \
-                                                           << CAP_DSTRD_SHIFT)
-#define NVME_CAP_SET_NSSRS(cap, val)  (cap |= (uint64_t)(val & CAP_NSSRS_MASK) \
-                                                           << CAP_NSSRS_SHIFT)
-#define NVME_CAP_SET_CSS(cap, val)    (cap |= (uint64_t)(val & CAP_CSS_MASK)   \
-                                                           << CAP_CSS_SHIFT)
-#define NVME_CAP_SET_MPSMIN(cap, val) (cap |= (uint64_t)(val & CAP_MPSMIN_MASK)\
-                                                           << CAP_MPSMIN_SHIFT)
-#define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
-                                                           << CAP_MPSMAX_SHIFT)
-#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMRS_MASK)  \
-                                                           << CAP_PMRS_SHIFT)
-#define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMBS_MASK)  \
-                                                           << CAP_CMBS_SHIFT)
+#define NVME_CAP_SET_MQES(cap, val)   \
+    ((cap) |= (uint64_t)((val) & CAP_MQES_MASK)   << CAP_MQES_SHIFT)
+#define NVME_CAP_SET_CQR(cap, val)    \
+    ((cap) |= (uint64_t)((val) & CAP_CQR_MASK)    << CAP_CQR_SHIFT)
+#define NVME_CAP_SET_AMS(cap, val)    \
+    ((cap) |= (uint64_t)((val) & CAP_AMS_MASK)    << CAP_AMS_SHIFT)
+#define NVME_CAP_SET_TO(cap, val)     \
+    ((cap) |= (uint64_t)((val) & CAP_TO_MASK)     << CAP_TO_SHIFT)
+#define NVME_CAP_SET_DSTRD(cap, val)  \
+    ((cap) |= (uint64_t)((val) & CAP_DSTRD_MASK)  << CAP_DSTRD_SHIFT)
+#define NVME_CAP_SET_NSSRS(cap, val)  \
+    ((cap) |= (uint64_t)((val) & CAP_NSSRS_MASK)  << CAP_NSSRS_SHIFT)
+#define NVME_CAP_SET_CSS(cap, val)    \
+    ((cap) |= (uint64_t)((val) & CAP_CSS_MASK)    << CAP_CSS_SHIFT)
+#define NVME_CAP_SET_MPSMIN(cap, val) \
+    ((cap) |= (uint64_t)((val) & CAP_MPSMIN_MASK) << CAP_MPSMIN_SHIFT)
+#define NVME_CAP_SET_MPSMAX(cap, val) \
+    ((cap) |= (uint64_t)((val) & CAP_MPSMAX_MASK) << CAP_MPSMAX_SHIFT)
+#define NVME_CAP_SET_PMRS(cap, val)   \
+    ((cap) |= (uint64_t)((val) & CAP_PMRS_MASK)   << CAP_PMRS_SHIFT)
+#define NVME_CAP_SET_CMBS(cap, val)   \
+    ((cap) |= (uint64_t)((val) & CAP_CMBS_MASK)   << CAP_CMBS_SHIFT)
 
 enum NvmeCapCss {
     NVME_CAP_CSS_NVM        = 1 << 0,
-- 
2.36.1


