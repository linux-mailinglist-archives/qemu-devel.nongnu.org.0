Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1114314A4B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:31:49 +0100 (CET)
Received: from localhost ([::1]:37878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OR1-0002ew-4O
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVy-0005SS-3w; Tue, 09 Feb 2021 02:32:50 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:40365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVn-0005nu-6v; Tue, 09 Feb 2021 02:32:49 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 27F10B1E;
 Tue,  9 Feb 2021 02:32:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:32:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=RFEec4Wljni8p
 G2EOZAGtoFYeS9ZZ/53q25lmNyipYQ=; b=rG51/4YujYYP/e8WkFIjrZUirY7Nr
 HVIFuo8o5kY2rL5WrAeaz2HJPFIcD8pO527o8HjQrJ1LRvCM9/S1nNXY+vSkdbLz
 TZIn6BNXp3ZCCMaM4xV8AZgb1KG8NLMYmMbpnL9XX5FDJEBp0AiP2wfsVunL414q
 iKvlr6zpa4QpDQTpfuA+mUKpIHhZgj+WeJ9Z3+RyBEfZsRX+GLDAL1N3TtCZHkLu
 a1zAo+FMEm69Iz19HJv+O7t2m6uxrpEFAm3ZTOT8s+VFu2QmucIjT5UeO/a9wVf9
 D+CITqSX4xQ1MQv8ZbNhPut/G6jmRM4MGbUv1d05FKW1beZgn3HGHTphA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=RFEec4Wljni8pG2EOZAGtoFYeS9ZZ/53q25lmNyipYQ=; b=mkxInHr7
 1tvRdArqgyAnQLJSkSc8ctFVL0oRxnpcway49xmgdny51749U9MnD88qvrhrujnx
 HoGTpyBWDdvOGGAJYh6hq9xE+rLHKk5OE8yCnL9sU0TaptgAwbFJLjV6Zf/8H1jL
 R7HR38cND7m/4j9DdO4lmWnKESKS+/DYJd22IHl8ZL/yV02xYdZ/fptho9qAT2gH
 AtAoSdLFJc1iId6ckSkWsgndPHJlFmlT9U2wNBLT8zmjE4eGvWdxcRek/W47Uf4d
 1pMJBinXUR522FdcOYaBfJQmf/qf4WrHsvk3+WKkzAzZsS+HehBR3+vIF8URmHI4
 3a9BzlCUejNv7g==
X-ME-Sender: <xms:dDoiYL4GyEtdqJ039_uXPXzqlPg7kF1jcMVLPFdec-PI_RXep0f3TQ>
 <xme:dDoiYA6vVz0moWRAC7cA3PsAhHlzO5P5sDS3R7tgL7cXBNnAagKTA4hSRhBgfBadW
 4WDpiVXWpsPu5fmkww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedvne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:dDoiYCd15GGlr_L50jV8UoqrRdm4h9NX-r2KZGevos73jx6nQmOygA>
 <xmx:dDoiYMJXXgasZzR21QQckQ3aoZVgTjXqp473Z4MvYf8NZN6zIusLdQ>
 <xmx:dDoiYPJtH9jvE2IbXiJDACradwb5dQsM59kUQlgyls0SPH2qV3OvIQ>
 <xmx:dDoiYG_1RpF2vIHwcca_4Y9WBnwoBxy8bvZKjfD0RLQj0cA3D20ZapBsIVY>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A7EA1080057;
 Tue,  9 Feb 2021 02:32:03 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 27/56] hw/block/nvme: remove unnecessary check for append
Date: Tue,  9 Feb 2021 08:30:32 +0100
Message-Id: <20210209073101.548811-28-its@irrelevant.dk>
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
 qemu-block@nongnu.org, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

nvme_io_cmd already checks if the namespace supports the Zone Append
command, so the removed check is dead code.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Tested-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 hw/block/nvme.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7222eff755ee..c73afdf8054f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1707,10 +1707,6 @@ static uint16_t nvme_do_write(NvmeCtrl *n, NvmeRequest *req, bool append,
         }
 
         res->slba = nvme_advance_zone_wp(ns, zone, nlb);
-    } else if (append) {
-        trace_pci_nvme_err_invalid_opc(rw->opcode);
-        status = NVME_INVALID_OPCODE;
-        goto invalid;
     }
 
     data_offset = nvme_l2b(ns, slba);
-- 
2.30.0


