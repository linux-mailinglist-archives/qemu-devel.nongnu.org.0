Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9439F31498F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 08:37:27 +0100 (CET)
Received: from localhost ([::1]:56476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9NaQ-000798-1a
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 02:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUe-0004nf-Fu; Tue, 09 Feb 2021 02:31:28 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NUc-0005Qk-Rw; Tue, 09 Feb 2021 02:31:28 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BD9C9A57;
 Tue,  9 Feb 2021 02:31:22 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=g1xgO7k4JlGrN
 48UoQ8Tyy+14fMJ4luQHYuJPo3HohE=; b=LuRkFCnuQVP36N6COT4Yk7I9qfvvn
 cK/xfF31GePMMOpSmLZWMivOpwwU8dKDCGKSdtZ5M+Rxk4xwVMDqb09qtsZigRET
 o3MmrmJUBjWwCJ8WvTZTxhWYGyjE5VUs3R8nBohekC6heLThos5hhR6Kw4yf9viv
 wxV87dw1U7PwJQSb2BDAXDpBtN5ekKkwhsZf6erYFrUWbpJsTKW5sVMrw24q3UEb
 Eb14UZmguoNl+GLKJL32AMCn4iwPz2oprLs8RKTYcW9LaQ/uC0ZJ9Q1EbyRns0km
 9txWl1IHDCCsVa/ughMcUbK1Y75pm81JqEsFysfv02dtqd4jPCABiqwUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=g1xgO7k4JlGrN48UoQ8Tyy+14fMJ4luQHYuJPo3HohE=; b=JM3LSW3s
 WPfDFyhHkP05ptmhPx66pcIef00CI4brJ8Vx50+osjqIzZxABXMi1nanJswcodHn
 S9Ld6oY8wfuu7TRPVn5RIQHlCzXmATM89ZamAVcsIYEPzbRhesPxR3PWpiDO91qV
 ZyJp5r2qTnu7Qp4yozoZ6b4+qalmaOvc+chC39icchynwlfNeSnWjKBUYTt7r8dr
 e4Gpl1BmTwvdo7aVq4vQeZPoz0QbCg79ahM2/HYmsgu2URPWdgc4NrHsjen1Tm4b
 eYNQHLKaiBuHjYwucJWxiPK0ESVS8rNsdMV7FyGDJ91LshKmV6YcMwAd+b2aDaD+
 LkFAojpH4Psdcg==
X-ME-Sender: <xms:SjoiYPK1UH9CvxpEfAEOl5DjnONHTtppgiWyydL_GFlW4JeuAOrS_g>
 <xme:SjoiYDIA45eLH7aAqqjOJ18cgoL7STdeqXlI_GnwwFuYudHQ0CM6LIaSWp-IaXFDf
 md_D6Ob9NGZjo_OcGo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:SjoiYHtZTB_qRsJYAKsKVp61_CuCP1B4BcSYho8VXV8-FjVdYr4jcA>
 <xmx:SjoiYIYHLljf9oaX0v0Cishz7gy82WtqGC3eFirD0PMb93bjM_MmoA>
 <xmx:SjoiYGZcJ0afgbk_RJIkQzzTkpRzwNn0UaQjjGbXXSO8K2ySchgvig>
 <xmx:SjoiYMOWgG6fwlN4w6_SSUyD4lOAzDRAAd4Z-qEizZtgxPWLap1PxEgii74>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E6BD61080057;
 Tue,  9 Feb 2021 02:31:20 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/56] hw/block/nvme: remove superfluous NvmeCtrl parameter
Date: Tue,  9 Feb 2021 08:30:06 +0100
Message-Id: <20210209073101.548811-2-its@irrelevant.dk>
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

nvme_check_bounds has no use of the NvmeCtrl parameter; remove it.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 27d2c72716eb..b0816d19eff4 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -866,8 +866,8 @@ static inline uint16_t nvme_check_mdts(NvmeCtrl *n, size_t len)
     return NVME_SUCCESS;
 }
 
-static inline uint16_t nvme_check_bounds(NvmeCtrl *n, NvmeNamespace *ns,
-                                         uint64_t slba, uint32_t nlb)
+static inline uint16_t nvme_check_bounds(NvmeNamespace *ns, uint64_t slba,
+                                         uint32_t nlb)
 {
     uint64_t nsze = le64_to_cpu(ns->id_ns.nsze);
 
@@ -943,7 +943,7 @@ static uint16_t nvme_write_zeroes(NvmeCtrl *n, NvmeRequest *req)
 
     trace_pci_nvme_write_zeroes(nvme_cid(req), nvme_nsid(ns), slba, nlb);
 
-    status = nvme_check_bounds(n, ns, slba, nlb);
+    status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
         trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         return status;
@@ -979,7 +979,7 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
         goto invalid;
     }
 
-    status = nvme_check_bounds(n, ns, slba, nlb);
+    status = nvme_check_bounds(ns, slba, nlb);
     if (status) {
         trace_pci_nvme_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         goto invalid;
-- 
2.30.0


