Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BFA3482BB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 21:17:57 +0100 (CET)
Received: from localhost ([::1]:54528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP9wy-0002p0-BN
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 16:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9oh-0007rQ-F7; Wed, 24 Mar 2021 16:09:23 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:46961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lP9oc-0008MX-ID; Wed, 24 Mar 2021 16:09:23 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2C2C91398;
 Wed, 24 Mar 2021 16:09:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 24 Mar 2021 16:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ik2e+oQ15mYXV
 HqR8ae39WxygT92dBiTwi8TuB+ZLHw=; b=HDz1jxG1+D2So2UfWZMpSjoNwXNzh
 qo1xGpNtC8r4kCeJvMvySvgpdi2VPNkEA5Cyt4hutWi/mITNTuYDp01PPNy3sOuO
 63AUQUjmvsCaKUTqlS22FK7DrvJwYglPizdSGWxk3UysVsPh9xd9AbLZeuoRgnt6
 yVwCDtqNO/xBkxLOxVzX2QAqsMFhVRFyLHuryt1LGCs/0QmMrGwwJ4nk7Vhbma4T
 qYgVRNpNEzS20/pDurx4GmlVktNRVsaaKpGV2giB9Jq3Phlk8pMSVnWU3gS9qMDf
 QFSMKuqBf96Act6JFbjuoS+VkrU9sw0MDEdp5N8fwRWPAdcWst5GMzW5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ik2e+oQ15mYXVHqR8ae39WxygT92dBiTwi8TuB+ZLHw=; b=D03mldJE
 T0OhxEAfVpf0ypmjImVE6Yuh3laA1DtCGbhPmttEUj31ibX27HwnhXMy03CDMa2w
 /x1ugILX1daKVmFvJnvzIYuOg6ARvgHWp72SIlGLBZASzK2AtNY4dQID7GSrUsXO
 xn05ZZEHiPR2vMllVEdHkD5Cxy/uQLydFesi0zGWhi1ftHoA0pIROAKVwEVaVhLp
 6PClCJTDIkXQ3Gn3Lf24zMpzvc2VbUFsSgajvo53nWRAhua4L2nC0pofnHpLF4/O
 ajY+9TpuTRf+JNmz1DuGL9FmUd38AFaYJNyXm3Xrs1LdTlx3QvvIB0TP6NSvwUnZ
 l6Z1hnllhFEVRw==
X-ME-Sender: <xms:a5xbYFKmfeYkSHiyT7GlPsVkP-gna_y6x6jOT7knPFQrX-QwNQatgg>
 <xme:a5xbYBKZe75fvuZqr9XVQMaOQrVpUFHLLf7BhyHZrXhSfc_h5yC3qzlfQju0YLHhs
 ggOGht28m72pEgxFRQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:a5xbYNuwHtboKHEj-YHaSYxnYVir70KaevjkmcAIRMAidJXrHRVkZw>
 <xmx:a5xbYGZ7vfZl_MCITCU61DAY-2vQPnudGGmjyAEIsMaKaEAbXofpcw>
 <xmx:a5xbYMby1r3DWmNUJZpY8_xCrVhp20B4apx7UgD8tEI8NbR9_b0CwA>
 <xmx:a5xbYBNEyUmutyuM3mhIL4KHv77UiuS43uzdE1wg8ParNRB5x1UThg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 794B51080057;
 Wed, 24 Mar 2021 16:09:14 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 3/7] hw/block/nvme: fix the nsid 'invalid' value
Date: Wed, 24 Mar 2021 21:09:03 +0100
Message-Id: <20210324200907.408996-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210324200907.408996-1-its@irrelevant.dk>
References: <20210324200907.408996-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The `nvme_nsid()` function returns '-1' (FFFFFFFFh) when the given
namespace is NULL. Since FFFFFFFFh is actually a valid namespace
identifier (the "broadcast" value), change this to be '0' since that
actually *is* the invalid value.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme-ns.h b/hw/block/nvme-ns.h
index 9ab7894fc83e..82340c4b2574 100644
--- a/hw/block/nvme-ns.h
+++ b/hw/block/nvme-ns.h
@@ -96,7 +96,7 @@ static inline uint32_t nvme_nsid(NvmeNamespace *ns)
         return ns->params.nsid;
     }
 
-    return -1;
+    return 0;
 }
 
 static inline bool nvme_ns_shared(NvmeNamespace *ns)
-- 
2.31.0


