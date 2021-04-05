Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD74D354673
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 20:01:08 +0200 (CEST)
Received: from localhost ([::1]:43386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTTX9-0003bZ-8e
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 14:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRK-00014P-T0; Mon, 05 Apr 2021 13:55:07 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:40245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lTTRJ-0000Jp-GC; Mon, 05 Apr 2021 13:55:06 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id B7F565C00C8;
 Mon,  5 Apr 2021 13:55:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 05 Apr 2021 13:55:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=X2nJtyHs3uF7J
 Gp1US5wprBitEbEUq28vmiGzv4z40k=; b=3a0YXjosKbXLZov4spAlvYWOxjnVc
 jI3fEiirz0WXDVjusBmnoMANN6q4v2TpA0WrhDqJuqMZJGA1CgXLmuxKjrFF2/TE
 WUGdYMzTVxGIAGIfrEsk0LyII2zoNoSs0XJDMT5ir6MhugJjQ0u5B4hv8QwtJg2I
 vJncPJFd/yOTGTSNeC7URtxQYvYyhtW4LoPtPywOLDXgAQJGg7HUZyjb18KEl1Og
 JRskxioTR/qxIsp58SCZKTs07KJn4rX1Z5Qzn/rvOUHQsYPrJFnuGv9cJRJyVmxF
 DjoB5yVSpDIhE7Ydr77hDD+yg9YaVJDZ+0t4b/66pEmb22StONFNpGgew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=X2nJtyHs3uF7JGp1US5wprBitEbEUq28vmiGzv4z40k=; b=ClvPdoJR
 7Azw6KS+DOLR6oKikgBcifprLJ81r54dXNyqmLU1MNtxiRz1tz6lIPhevIIw2Yyn
 OnQ8XjQdU1nHpsqCxdQMajLhATtcPMbBPVemCget0XJXt2Qlaz1xkDpYLKHN839g
 Nnoy/cYIYnQ8E95CPNzGqSnd0FgA7fYnHF+pBTs3ddI/1hJepoLrzKT6/MMs/a0+
 maRc4u8l3b6VhAPRegI0RO5fwVoIi9kg8Q4QzaeCnOUODqx6FP2lrx3nGzBCbtf+
 2y+IbN4R6HIP9eSKm4eFGzKL/2i8wN/84IVPrvptP+DpZf0/4rArGVWeSWBqb8Oj
 K9jqXpW6JVUlTA==
X-ME-Sender: <xms:-E5rYO0TPjwQ9qPJLchySSM0QI5GMy-WtU0CuDEBsXKi64OLmuWEnA>
 <xme:-E5rYBGGx5hNkBzJ3VfC0d1iN-BeDQVpvvALjAViaC1FlaCVHD_VqRRiZL56uDHrV
 _pns6cimYi69mVlNxM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejvddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepueelteegieeuhffgkeefgfevjeeigfetkeeitdfgtdeifefhtdfhfeeuffev
 gfeknecukfhppeektddrudeijedrleekrdduledtnecuvehluhhsthgvrhfuihiivgepud
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:-E5rYG6zc5z6YbaQZ3Da7h1I18o95eyelCk_Ss3d1fVtFWTXbBkiOg>
 <xmx:-E5rYP2lw6LXfNUz5CpBY3rSGssdks7Xth8Ps5r8_djrKLaWYx6-Yw>
 <xmx:-E5rYBG_7rviCO1VHnRXyBB59n8uDvXEQcBveE7HNm96anaCSUXS9Q>
 <xmx:-E5rYI220mtX6_3rmalMkKzL5t8AAum0Z5g4RrcfsqF5OTWsyQF_ig>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4190C240054;
 Mon,  5 Apr 2021 13:55:02 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 3/8] hw/block/nvme: fix the nsid 'invalid' value
Date: Mon,  5 Apr 2021 19:54:47 +0200
Message-Id: <20210405175452.37578-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210405175452.37578-1-its@irrelevant.dk>
References: <20210405175452.37578-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.28; envelope-from=its@irrelevant.dk;
 helo=out4-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

The `nvme_nsid()` function returns '-1' (FFFFFFFFh) when the given
namespace is NULL. Since FFFFFFFFh is actually a valid namespace
identifier (the "broadcast" value), change this to be '0' since that
actually *is* the invalid value.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
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
2.31.1


