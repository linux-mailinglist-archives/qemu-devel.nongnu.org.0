Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63371318E46
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:27:03 +0100 (CET)
Received: from localhost ([::1]:36514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lADrw-0005VS-3U
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lADmu-0003bR-0L; Thu, 11 Feb 2021 10:21:48 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:41331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lADms-0003jc-F6; Thu, 11 Feb 2021 10:21:47 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B13C75C00F5;
 Thu, 11 Feb 2021 10:21:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 11 Feb 2021 10:21:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm2; bh=
 BUB+PaVtIckRpPtKtaCZru27TXBaa+MPpa0dMGEOpKI=; b=shv9BHKVYrPZzgy5
 Dtn7PAiKOtrOEufdA7m96UP3Zov5RuiZbONiZ7dC+Ls/N5YqWCkkq5nwBNciHz4b
 Kcr+Gv6ILLsEfRykhfzYdj5Tdcdq7cYwiN0W+DMNE4oibze9uFOqHCrQNOHZdO4T
 Da8MqIEWSrJ1BcaX+m8wXB1UhGlCj4qPIBjqJApPvDDhoTCP2N/zfioIPkXe4m4H
 4GECOXTJAObCBaM4SLW3UkDvOiCIWJMU25JGLpMs9/PUb9BJhwgw5b3UK41+PMB3
 x15mA3bOYOXbD95Ln+094T9z7RtJ5lUiaHi4T/VtrreKqnWaWdZQLIO6JMqGYhHB
 65mHIQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=BUB+PaVtIckRpPtKtaCZru27TXBaa+MPpa0dMGEOp
 KI=; b=VsjGooICZdZRSRW2b3hjFsyhpxscBotRs0b4qbcGaofuF0FM+AKo/KHDx
 VcFUOBp0ghKr+unqJJXHcbEVifhzj35OcuUHT18ZXG33mhJWBSJ8p93TChAUQtEK
 eyPcAsH8gKJ9Z3MjIChZ5Y+rQlvR+11jmA7hb4OWWgyHQ86lEH1rAcpDApGbXm2d
 s3fcQ4hAG2bqn8rNLAJ9ITHAI+rtpH/5xe4edovLRcjiyOYgmL9EoIYGj0xOm2k/
 zBfn9UoWRLCe0XlTnuMwQ7aTEILhZKdD0SPDudMD7UZCfM/4tmolDkxiNyx2EJv9
 ehIeLvTlrPNw9fJyDB7QtXdbI4lyw==
X-ME-Sender: <xms:iUslYP9Dv1nkOVrtWFHDKTMH-ghIarbaTptlIp2_I-bRKs8LYi1BFg>
 <xme:iUslYJgbu7fjv-sEqPok72eNhB3MiJfAnbuBsAPmiw6f0NRjudHM9cQGIU2sEcHla
 Xw6oehew1RfhJF8ZLE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheelgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeetveeuudegveeiheegieelueeftedvtdekteefleegheduhfejueelvdfhffdt
 geenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:iUslYHeF1kL1rIN0g1bVe3emflu7lq9DgVOkihXl1Xq8AhESMFDwTA>
 <xmx:iUslYIoLirsRYJA7od25d2pjB0sg3zGKBFJzi2N-_F2NyjWIwgRjxg>
 <xmx:iUslYED5R7eSMv4yYGj0AQUjkI4TmTkDhqRYa14LW8eL3AcFg1eUSA>
 <xmx:iUslYB5-OnZ_w4V6oYUrWxHzsQrcpr4hN_ZeYVKpsMqonwQWlV-PYQ>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 18223240057;
 Thu, 11 Feb 2021 10:21:43 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL v2 2/3] hw/block/nvme: Fix a build error in nvme_get_feature()
Date: Thu, 11 Feb 2021 16:21:38 +0100
Message-Id: <20210211152139.1004257-3-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210211152139.1004257-1-its@irrelevant.dk>
References: <20210211152139.1004257-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Bin Meng <bin.meng@windriver.com>,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Current QEMU HEAD nvme.c does not compile with the default GCC 5.4
on a Ubuntu 16.04 host:

  hw/block/nvme.c:3242:9: error: ‘result’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
         trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
         ^
  hw/block/nvme.c:3150:14: note: ‘result’ was declared here
     uint32_t result;
              ^

Explicitly initialize the result to fix it.

Fixes: aa5e55e3b07e ("hw/block/nvme: open code for volatile write cache")
Fixes: Coverity CID 1446371
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 02390f1f5230..fb83636abdc1 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3228,6 +3228,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         result = ns->features.err_rec;
         goto out;
     case NVME_VOLATILE_WRITE_CACHE:
+        result = 0;
         for (i = 1; i <= n->num_namespaces; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
-- 
2.30.0


