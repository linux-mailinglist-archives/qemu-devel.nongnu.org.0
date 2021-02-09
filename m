Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAEC314A88
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:43:54 +0100 (CET)
Received: from localhost ([::1]:36904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Ocj-0005kG-4D
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:43:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NW1-0005X8-9S; Tue, 09 Feb 2021 02:32:53 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:38273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVt-0005p6-QN; Tue, 09 Feb 2021 02:32:53 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 55E1BC62;
 Tue,  9 Feb 2021 02:32:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=9KE/Wpb56R9X5
 t9iNHb9mY2BXf26gErmPldIt+pUCOs=; b=qrmofQz4Dme+ryLg3Ac+Mxb7QpBrd
 oe+rCnap1w/rdjKbdphETmXWyVmun8RlV9yW7lm9y8YdaUbGJ4PvPLFI9zMvreqg
 D1pJwjbIKGwVOCKHx/iCn1pd3K82u/yfn54/6dWjFfHjPzmOyw4zk0XqFdf2RS85
 h5nmEmXTfYV2AU0j8cdK00c8Z5qHXQ0VPrW6TGVV1eurRQxTLj0m/wM+j9zlefvV
 7K5jxvOH8ywE/dVnFxN8y61lidKJZFUHPFTnm7qes9OyZUyeLOks2bcfvz7wpnl8
 aTLY5X/suOIaOZyreehxHqQIXFZHer/l6byqg1U1AxYZw41z3cbf1bPhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=9KE/Wpb56R9X5t9iNHb9mY2BXf26gErmPldIt+pUCOs=; b=ZHUvdWaJ
 lXja2ePiVEW4yIYXCBwl3dSlry2u9q1e6p1e2xoG9ioNqHhuz7+0D0yqVsNM35EP
 DhzbyGy6GeWibsAruHY9TOo56+sHl9Vfn4eJs91JPWc3Y8GbV2Rlwnb0Q9yAuKZV
 0VWlin715EWN4B3hBsoQOtaaYZ1hfwetW5FKFNYOSdkqg8OfgT/7sbqEuKSYfREq
 +GLci6VAPtHq0qowQGfuHQZ9Jt+h3sIjtK2qDbalB31F6JNIXVsrfvc1cHglRx/p
 eyjLajoK5DGYz1v99uNyva9JKPKMKiDaemGnHPS1wcVmcxjwYdBiHU9/dQaTe93o
 cuLLEW7izdPghw==
X-ME-Sender: <xms:ejoiYOEglptPxLC9xy_mRxFQ5OoCwas4o0vsmPvYT75IIwf84Gr1uA>
 <xme:ejoiYPVB2NWsg5ZlN3M8hVPm39-iYcNt2hLepEOYLT98t_B-WsjfbiPiknlI9tsVs
 lp3Ot6yuvBrQGNNaBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeeine
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:ejoiYIKLkpNYKrWSpK6YgNoFkejmMDr4XkVUOseEufBxcCKMsoDb7Q>
 <xmx:ejoiYIGedxsBhMIbdE0LPYRmGVJLWYYWcy-7zJZnSxUSOClQ4eWSwA>
 <xmx:ejoiYEUnhmNeu1SvmH0BXHW1aK1gi5GxPq4bz2lPEd6HLDxSZEoYVg>
 <xmx:ejoiYIpY48vQ6eNIv7pRLXl6khwD8OqVvTsj9Pg1-JVrqRy2njECMcx-Cj8>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7F1D81080057;
 Tue,  9 Feb 2021 02:32:09 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 31/56] hw/block/nvme: remove unused argument in nvme_ns_init_blk
Date: Tue,  9 Feb 2021 08:30:36 +0100
Message-Id: <20210209073101.548811-32-its@irrelevant.dk>
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

From: Minwoo Im <minwoo.im.dev@gmail.com>

Removed no longer used aregument NvmeCtrl object in nvme_ns_init_blk().

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-ns.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 7a5a77983798..17e876e6bc44 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -66,7 +66,7 @@ static int nvme_ns_init(NvmeNamespace *ns, Error **errp)
     return 0;
 }
 
-static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
+static int nvme_ns_init_blk(NvmeNamespace *ns, Error **errp)
 {
     bool read_only;
 
@@ -307,7 +307,7 @@ int nvme_ns_setup(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (nvme_ns_init_blk(n, ns, errp)) {
+    if (nvme_ns_init_blk(ns, errp)) {
         return -1;
     }
 
-- 
2.30.0


