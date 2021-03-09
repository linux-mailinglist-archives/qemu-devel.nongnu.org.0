Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E0332563
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 13:23:08 +0100 (CET)
Received: from localhost ([::1]:51402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJbOF-0006Tk-9V
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 07:23:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJap3-0000gV-TT; Tue, 09 Mar 2021 06:46:45 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:33725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lJaow-0000nD-B7; Tue, 09 Mar 2021 06:46:42 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 2407B271E;
 Tue,  9 Mar 2021 06:45:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 09 Mar 2021 06:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=tC9OnheygbOgy
 2iheSiwJY9pgiRiMV7Ov0a4W6vz4HY=; b=H33iRg14Ws13sjriVrftYncKnLfkN
 UOCP4iXXAINlJo/UpFg7Qgcvpv1OHnqC9pK9bAIqg8xCLK/EKQyKZ3YavjRKCy7X
 beE9v2e2kkFpPfVd3Eyu1XfOLcxaD0yFQEcB5owLkKVPaES2RbWCzQUOSLNzrWfQ
 eMjGR7cld8EUx1albZejai1rkFlcaCPypEWHJQi5YFZZ11410wi6XzC93bpNEGtP
 Yk5mcImWPIi6Vw4Q9XG0IVAPrB31jgsePt2BzNpa4b5BGZBLrNSwHD+I2LBZB4uI
 RiJkYMKh1MZgeNEDCsqxiV8S216XZBUFZ65mZFlk7P405vObXPQblGRYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=tC9OnheygbOgy2iheSiwJY9pgiRiMV7Ov0a4W6vz4HY=; b=lzSA68Lb
 IxFqkin8xEYL6WRjVTuCGWHBqmNhLxWeW9jLxFnzbt8/yImFAXrxX+KJqJ+A76pe
 E6b5cqZgspqlmYxjHsHnMYcFSlEmdvGdEIRDIGbBR7+l87rXG88WkzRThEXZfcbA
 l4UvaeN2nnEq7v8bvG+YZtq7upo4GR47iR+Zq99KxVOOeLM8ZxaVTHtaO6xS4Ul+
 yrTTujJfnb/EidmL/pCCgmnSu42FWPFbRpBulYoyWSqWmhSkIfP8JD6M8RuWSJ+P
 9E6B8IRdSplcbP0mHSOoTpkH4zLSOh/eMzq0Y80HXWXvzY2AQkUsFQeyyrV6G97j
 A8ALJxat2pb7sw==
X-ME-Sender: <xms:9l9HYM3TRlIrfKwbImAdr5qdV9OZN_SvZF2iNJ3gx0hivj4lMp8KJg>
 <xme:9l9HYHF4ZPlffV2ITRgEfEwAWnOjuMLMZke1JYcr4gqYiBALi1-JDbCBAxc3NOYuJ
 dPkKg5kQRhSpEYFyvs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudduiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeuleetgeeiuefhgfekfefgveejiefgteekiedtgfdtieefhfdthfefueffvefg
 keenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpeduke
 enucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:9l9HYE4miXGtvzHZ7YewNBD3LBv98npjC3QIXBPPkPWu84rksT88hw>
 <xmx:9l9HYF3PmsgBrgnqcZ7e2VmusTzno-tAhgCAlJiwO8HKOFDmlCqKRg>
 <xmx:9l9HYPGcN4y09XWuI5yRaI6pES95xASFscCPW1zZ_7j4BPPu3_LvSA>
 <xmx:9l9HYFY-JrnkXeF6_Ddun7EuRUgDhSWFAoSbpt5pmZdBLhr1BwSunadaM8I>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id E3F2C24005E;
 Tue,  9 Mar 2021 06:45:56 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 27/38] hw/block/nvme: fix strerror printing
Date: Tue,  9 Mar 2021 12:45:01 +0100
Message-Id: <20210309114512.536489-28-its@irrelevant.dk>
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

From: Klaus Jensen <k.jensen@samsung.com>

Fix missing sign inversion.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 88e800898526..8f27fa745074 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -1164,7 +1164,7 @@ static void nvme_aio_err(NvmeRequest *req, int ret)
         break;
     }
 
-    trace_pci_nvme_err_aio(nvme_cid(req), strerror(ret), status);
+    trace_pci_nvme_err_aio(nvme_cid(req), strerror(-ret), status);
 
     error_setg_errno(&local_err, -ret, "aio failed");
     error_report_err(local_err);
-- 
2.30.1


