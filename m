Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A401639D921
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 11:55:03 +0200 (CEST)
Received: from localhost ([::1]:44312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqByH-0007cD-Su
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 05:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lqBrf-0006HW-AW; Mon, 07 Jun 2021 05:48:11 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:37121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lqBrc-0006mJ-7t; Mon, 07 Jun 2021 05:48:11 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 8DBF21871;
 Mon,  7 Jun 2021 05:48:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 07 Jun 2021 05:48:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=wVsbsiCnyGrAVUo2+ULTy1z644
 kgj43z2iD6dpbvPwc=; b=Ifp9xIvH73sIUCtzG+T6/b1bOYcBNjaD+1DcIs74tb
 SAz+y7CiuDiC5qHMvRxQAJlHYeOmLX7vSsVmY+I6jDC13JCed6Glnk2UdmXJxUyR
 rSb8VSYGGGIG4JuhnO51OB6wX7Sl783R8KpkrbpLLk2CFvZp+adGqhL0tMwhwEs3
 9sp86NIQQOKYug3y/J0jUAIULStnTra97UW77HSUjppayadlkrN6FI39zt1anVPU
 g/PICEMpCd8dtc5iqG92UMXi/JeEXpDsyKi1R08h+SnfF6/DuXZ+tH9Xm3/aJy5U
 z55mFTeBMYdRR3Dg+psnPGW2vCU4J3fzW7HKpKoqBDpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=wVsbsiCnyGrAVUo2+
 ULTy1z644kgj43z2iD6dpbvPwc=; b=nh4/i97nM0toQSF51RjTPlDXPyy2BZl4X
 p0+7frzR51XNkJsdmrolkZgvsIczPJHWINMinfRmtfeiGMujrHggKmBoYaoGOshG
 oFCcZ0VBYrHaYhLLhmO5bK6QAqdmuCP+vSPaIi6DF4oUSOLb8JsYHxGs0PndXjB3
 LvD7DmdPTihRRXFlMZIkcm46S6tQmN8ldp5WEGXgFmeHdjo5AS+NF7q0UXFBGz/0
 H8UsPvNKVv11+3nKxSOwkjluRXJrHzcwR4ZYhAfY5fDXfu1GDr/d6Pa3dOfvsCpE
 FqSFy1fuaSWHxczASJOGedePNjcAFBxCQcQQohFR3SI+MN4XLE7pA==
X-ME-Sender: <xms:UOu9YIQmYbfsCI_wfihWvoxS_Cm5QcHKWUhx7bMYkD-heWZz_vkJww>
 <xme:UOu9YFwanp6fTeHBmJjZffOyU2CnB8hn2z83WS_oQqKZeNZhkrFmYmRs5gx_Ybfur
 ilszWlPPBoQKxKCWUQ>
X-ME-Received: <xmr:UOu9YF05MKHyNTC51Lk6ErJVAdvP5-M99cB-2cShUoO9O9WCRIOcB25bkMwp2VC5HbjbzqAfzNsPXb8zCV0XZiENDGqYyL754Q8b7KixFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtjedgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpeeuueejhedtheehhfegtdehgeelteefteegffevleefffdvhfeiudffudelkeeikeen
 ucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:UOu9YMBmscGr7JjZ4gy5CIr4xpktjHNatTPCy958o2QTlql1zQnlwA>
 <xmx:UOu9YBgEHVCYiekC8VDynB_h-T-280u2p75X3qAOgR-dmwI6wrZIIA>
 <xmx:UOu9YIrqDkWJJyfsHWBDkeKORAeD7xiGp2kRCEHFAmelsr48O1E1UA>
 <xmx:Ueu9YBf6MMU9lMDZsXU6Azv0lo1T0gHnPnbM2h-2VSKnGnwXBn1fqw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jun 2021 05:47:59 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/nvme: fix missing check for PMR capability
Date: Mon,  7 Jun 2021 11:47:57 +0200
Message-Id: <20210607094757.29661-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-stable@nongnu.org, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Qiang Liu reported that an access on an unknown address is triggered in
memory_region_set_enabled because a check on CAP.PMRS is missing for the
PMRCTL register write when no PMR is configured.

Cc: qemu-stable@nongnu.org
Fixes: 75c3c9de961d ("hw/block/nvme: disable PMR at boot up")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/362
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 0bcaf7192f99..463772602c4e 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -5583,6 +5583,10 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
                        "invalid write to PMRCAP register, ignored");
         return;
     case 0xe04: /* PMRCTL */
+        if (!NVME_CAP_PMRS(n->bar.cap)) {
+            return;
+        }
+
         n->bar.pmrctl = data;
         if (NVME_PMRCTL_EN(data)) {
             memory_region_set_enabled(&n->pmr.dev->mr, true);
-- 
2.31.1


