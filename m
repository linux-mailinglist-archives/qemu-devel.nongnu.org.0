Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF9A33258F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:37:44 +0100 (CET)
Received: from localhost ([::1]:42440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbcN-0006P4-2U
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoi-0000Xr-2X; Tue, 09 Mar 2021 06:46:24 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:38865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaoZ-0000aU-Uo; Tue, 09 Mar 2021 06:46:23 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 8FA3D2792;
 Tue,  9 Mar 2021 06:45:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 09 Mar 2021 06:45:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ikZI4SqCFrlxb
 8pxm76EXX8zt/XdX1KHkArjxS2L0tg=; b=j1wtB7jDtqK/R3DumTC00iOuBVRAm
 a5Uta4+afKZcH0XYjzec6E/1vV6TJiF+wdQU9XQAkeJlrLapYky9qRBzvlr0oid0
 42swjhr6c+XHQG74nZovFCBSy0S99ylsUGeMQQw/XenuD1vy0OdW7Pd//m3QptUd
 ftGpK5Vjpzpt/74RQGcGhmcJqm1YYD4tq/pDkhEIPYEoQEGwLUBinRT610l8OM5g
 YQWgfWrJEqqg5YutZg7xGj0qB1PdIn1YD1fCB5GCAaPPxoLrxcWyrDlnPc5Y+9ta
 AywM3Iu3t55Zy+FZp7J5AT6pr57PuEw47jkwWIxq/wCqFTCPF7U1ITOmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ikZI4SqCFrlxb8pxm76EXX8zt/XdX1KHkArjxS2L0tg=; b=t1ra6wHP
 CloDR6xMoSWlCu6CXRDJguhVl37CcpiOutWy1nydsV5QAo+W+pSEi0qKJwR2RtiM
 9RYNkDgAM3jbt+LxHzKPl1aV+mSMuU5/6n5CO5dulY2Osov7Z9BVoWJlNmSw8mWG
 Vc5+mfomCGoy7/xwHdGe6ZOsWIUZhWShD/yEOCEYjefBv4+90LglmoFv9Sddw/75
 j29BL9/VeeVeErBcEnMwKUK5wqBm/h12gGGMfbUJcSQXshlNCK0nIjhgJKKJMbr7
 GG7T4KZDITxj09Fq9iqQ2TToNEMQrsllf/pKLz8rn27uIhQEUU+enXoV+ojG5Ez/
 dXZJQQp2pg4pug==
X-ME-Sender: <xms:8F9HYMUg-r2zO_DseQ7tVvOQ8nFQHOnjm1MI5zI-U7ED4NHhLLSz_A>
 <xme:8F9HYHVCUCvcFKrAWs6WnMCCjZFWyFVfzZ1dWoyAD7m-scCvbUmQv-RCBcUO9fBdj
 XqxZ4rKohlTnQYoeTY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:8F9HYCJKcXnrFhw_9V7qqR1gQ7qWU2UtsLyyNRtr275BS2u9eLzivg>
 <xmx:8F9HYHDxTNiyE8-iCh8yIHzrrOUkRk9hJtEvkN69K15p5ZkCDMqgBg>
 <xmx:8F9HYCcievo0UT8WpLWOSL7_Nae7TxSaAOXgDPI4OWcSbMZmur3SUw>
 <xmx:8F9HYCDhBrYp2tx68wzYp7B14i8eWR1SVpdDI3hAYa-5bUwMLsx6XPrdYEE>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id A13E8240054;
 Tue,  9 Mar 2021 06:45:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 23/38] hw/block/nvme: add trace event for zone read check
Date: Tue,  9 Mar 2021 12:44:57 +0100
Message-Id: <20210309114512.536489-24-its@irrelevant.dk>
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
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Gollu Appalanaidu <anaidu.gollu@samsung.com>

Add a trace event for the offline zone condition when checking zone
read.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
[k.jensen: split commit]
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index de3d0ca51bb4..b81c4c3705f1 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1255,6 +1255,7 @@ static uint16_t nvme_check_zone_state_for_read(NvmeZone *zone)
     case NVME_ZONE_STATE_READ_ONLY:
         return NVME_SUCCESS;
     case NVME_ZONE_STATE_OFFLINE:
+        trace_pci_nvme_err_zone_is_offline(zone->d.zslba);
         return NVME_ZONE_OFFLINE;
     default:
         assert(false);
-- 
2.30.1


