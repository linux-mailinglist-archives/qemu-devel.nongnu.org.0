Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84BB33249D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:02:01 +0100 (CET)
Received: from localhost ([::1]:50034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJb3o-0001wI-HO
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJanq-0008CH-Q1; Tue, 09 Mar 2021 06:45:30 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:58169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJann-00008n-Tp; Tue, 09 Mar 2021 06:45:30 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 697E1261C;
 Tue,  9 Mar 2021 06:45:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ttCMfODAjtfaq
 TggQvOlkBJKw2ToMEl9DHUWKQ7EMUs=; b=0E35OnyY7ucLaId+m3kO8m9if1n9P
 Osv5+LpfAB+DaMxq8SgRy+Da/S9pFgFiscv7K0j/7BzCN0/zWuzjVHWwRO6KvLjb
 tV6vegfd6uEcekE61XGMcev+Sk6m7OgiX5jjf0s/fIlCzRSIAqt0BfWLNqSPh9Ab
 JbkrLfGcIvpTMcABMsDtfWX4YFTipdvEW/Ckh9WP9TZfvMJcqG2qS+aQUygWXzAK
 8YXo4d5ezK3oaX5+MqTgQIdKduLN2tUwmyGo8wemxHGI129JyHqiP5kbVvKtL5fV
 bBX280HerogjHkTcFl4aKbWG3Cvv+AIkjJsAMiruhKZV3gkT8Mvas8y2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ttCMfODAjtfaqTggQvOlkBJKw2ToMEl9DHUWKQ7EMUs=; b=WYkYAEkE
 ILJ511aR6YrU4TzJbcnAk+tlGSOQK+CVx0tMvzReeMNrfwtZ7JpwDqLsEJsUofLQ
 MyAZYUPZFusuehsARuB7NJz7vn5BmL6A/cqx2Xw3eRQgkcgd/YRK1476FQP4GNFh
 mHLEoyNLsi5YCk1E9eJKfa5ownocTtYsS8g++JIyw4sUqB5j50nVj5PpFXISSjRZ
 1b4bhYtH9zoUDkljzaO36VWIzXi+RhAAAq5M4++Ms7exH8PH1lb0IZYzQrmoh71H
 VD1r8ZStddmvFYVM4uXg0Cda09QtrYpVCaTMCeJuB5XR7waHoz6kTfGA6zg04hQO
 3sWWfCY+QrZo9A==
X-ME-Sender: <xms:019HYAqRiRHlZMgEcD7PKFRaH-HKhNtSz1LB-shwDO2oBVud9-wbLA>
 <xme:019HYGrZD7kUNOJ_rMG9VJ9VRmF9TnflmiFib3sjHGn4v4v6EGsZ0qh4s5WFEQOeJ
 ondWMWJSOADBH6l7nw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:019HYFMmLVq0WLASV_Niwv-_wcFbDGBjH1fEiwykl7u_lsNETAHyzA>
 <xmx:019HYH5PD4kPE4NqvsOAUf8Q8jxeBxCTaUoYk73WEfcq2I4UWTZY-w>
 <xmx:019HYP7QW-WMgX6KZ6VZ8EZGujQoM4M75DKIbiduuOZnp3SX3E1MWQ>
 <xmx:1F9HYJtJDvV5JHsfB-Flp3pFqydMZa9eKzDkBRLc4LIocjQtFLAA_007Tyg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 93973240057;
 Tue,  9 Mar 2021 06:45:22 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 05/38] hw/block/nvme: add NMIC enum value for Identify
 Namespace
Date: Tue,  9 Mar 2021 12:44:39 +0100
Message-Id: <20210309114512.536489-6-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309114512.536489-1-its@irrelevant.dk>
References: <20210309114512.536489-1-its@irrelevant.dk>
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
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Minwoo Im <minwoo.im.dev@gmail.com>

Added Namespace Multi-path I/O and Namespace Sharing Capabilities (NMIC)
field to support shared namespace from controller(s).

This field is in Identify Namespace data structure in [30].

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 include/block/nvme.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index f1d3a78658eb..3db2b9b4cba7 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -1203,6 +1203,10 @@ enum NvmeNsIdentifierType {
     NVME_NIDT_CSI               = 0x04,
 };
 
+enum NvmeIdNsNmic {
+    NVME_NMIC_NS_SHARED         = 1 << 0,
+};
+
 enum NvmeCsi {
     NVME_CSI_NVM                = 0x00,
     NVME_CSI_ZONED              = 0x02,
-- 
2.30.1


