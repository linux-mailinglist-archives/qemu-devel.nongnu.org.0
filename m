Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF12DE36A
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 14:47:27 +0100 (CET)
Received: from localhost ([::1]:51818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqG6P-0003m7-VH
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 08:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFpD-0003gB-PI; Fri, 18 Dec 2020 08:29:39 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:60035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kqFot-0002wY-3p; Fri, 18 Dec 2020 08:29:39 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0F7BA8F2;
 Fri, 18 Dec 2020 08:29:16 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 18 Dec 2020 08:29:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=wWv2fNjokaT46
 09qW7onOktLNTiSjKrY8WjLJaLmM+M=; b=K3G+Uv22UjI7LrgR8mvE7ml3utlHj
 fkcrhyz1xoT6JSNwcooyVt+lF9xNb8vyQQ8QRuCkvN5N+w07Stykb8gGTbw1lrZ+
 gGEmg7ZOB8raibH8Q3lA2epvQ51wGBNpGHouMJOgkZJW1bDpj+Jwx424CciZmz+9
 5N8tVUIEuGqmukfGU69cGUAnSXLW/26f8hE5OG9Jsjn5E6NSWORcN7iP2Dcn78O0
 +8sWz/iZ1lixw7DcUGQTs3/oFIt4dpN3uZCIQIPKWfZbcp8utZRCVpcsNtmzppO0
 h5pjwG99VAL+w5FvSj02CAGNlaAHj/pDE6eREgf9oGcL5KQDAdRAnCBKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=wWv2fNjokaT4609qW7onOktLNTiSjKrY8WjLJaLmM+M=; b=HQOyHdwl
 FDzJTVTqQ53+LD59k2Zq7tGGCY/JsCnXNgTfm712n2rNWzRA2fpDeciuxbI11vS/
 loUsquUQpNmhNrYPIC7lil9hdEAacEd+Cp3Df1BNvfB5894GJH4AIEbc3uOzFulk
 Hbk+ic8/NXLGxJUC/wGmy2oPxG/8Yp+etMXNiqDuzQ2BRbSV/r3Q0PK5DyltzdME
 M6pNLCVIYSDhUo4blaLQJNRx+l5a4sRvjEiXzL/uLZlOe3jqSX2x2VM6Oc3D9kcm
 AhRvQ0zLJaRj6UWGC814SQj2u5nDAqomiKOV5lkh9GRUZTA0OXT/OkbpeoZwfXir
 80xp9boRCWB+7A==
X-ME-Sender: <xms:rK7cX-1SyjYemof8faEQSQIDHx7nmPHKD7HL6xMStW0Bx8I9BHsBng>
 <xme:rK7cX-oYZv44vcSEwdRpWRynAbLrSXYG3pzUjkIfLjiAfNS-_n_GsVxXvdWwbxuqf
 7VaEKu1ma0pQhaR8Io>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeliedghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:rK7cX9VFQn60ESyeWbXifsC9-RC3MxrButIEUtWy7fMYW7fcBZ3iug>
 <xmx:rK7cXxbuBatVlSnV65JBToHMcmeWmrxc2t5S4iMSbDslbzB9Qupv0w>
 <xmx:rK7cXyeDAwiVduRCkTVPz9Sp6wdFT13keZUq_HiXRNmzYdKB3x3ZIg>
 <xmx:rK7cX9RkGXZupBzwvwV5dgNJIJgZ69TOPPQpAAshiCUsmFgJ72Oo3g>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id B36F824005E;
 Fri, 18 Dec 2020 08:29:14 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] hw/block/nvme: rename CAP_PMR_{SHIFT,
 MASK} to CAP_PMRS_{SHIFT, MASK}
Date: Fri, 18 Dec 2020 14:29:02 +0100
Message-Id: <20201218132905.967326-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218132905.967326-1-its@irrelevant.dk>
References: <20201218132905.967326-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Andrzej Jakowski <andrzej.jakowski@linux.intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Use the correct field name.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 24f3c256a7f9..686e2541a587 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -35,7 +35,7 @@ enum NvmeCapShift {
     CAP_CSS_SHIFT      = 37,
     CAP_MPSMIN_SHIFT   = 48,
     CAP_MPSMAX_SHIFT   = 52,
-    CAP_PMR_SHIFT      = 56,
+    CAP_PMRS_SHIFT     = 56,
     CAP_CMB_SHIFT      = 57,
 };
 
@@ -49,7 +49,7 @@ enum NvmeCapMask {
     CAP_CSS_MASK       = 0xff,
     CAP_MPSMIN_MASK    = 0xf,
     CAP_MPSMAX_MASK    = 0xf,
-    CAP_PMR_MASK       = 0x1,
+    CAP_PMRS_MASK      = 0x1,
     CAP_CMB_MASK       = 0x1,
 };
 
@@ -81,8 +81,8 @@ enum NvmeCapMask {
                                                            << CAP_MPSMIN_SHIFT)
 #define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
                                                            << CAP_MPSMAX_SHIFT)
-#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMR_MASK)   \
-                                                           << CAP_PMR_SHIFT)
+#define NVME_CAP_SET_PMRS(cap, val)   (cap |= (uint64_t)(val & CAP_PMRS_MASK)  \
+                                                           << CAP_PMRS_SHIFT)
 #define NVME_CAP_SET_CMBS(cap, val)   (cap |= (uint64_t)(val & CAP_CMB_MASK)   \
                                                            << CAP_CMB_SHIFT)
 
-- 
2.29.2


