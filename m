Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2EF6DE477
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 21:06:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmJIc-0005Fz-8L; Tue, 11 Apr 2023 15:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmJIY-0005EC-VH; Tue, 11 Apr 2023 15:04:59 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmJIV-0006y1-QV; Tue, 11 Apr 2023 15:04:58 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C1BC5C0130;
 Tue, 11 Apr 2023 15:04:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 11 Apr 2023 15:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1681239893; x=
 1681326293; bh=SgOh6WcG6tCvJ6mzov0XlXx1lkiJr5cHhN9Douv0sxg=; b=d
 75Ar2f3Ff7mDn/zyVFJH12c4LaGLSfVf5xjy91tm2B5XZrXBf2DlvzjxoWD4cm48
 1lJJNjWAhZO36/cEsILkgSWl+CZlb7KNEvPncA8z4KNYbj/wC4TeyrNMEsh85kcR
 aWB2fiWTRVCUviczAleGZ62aebk7ls7VLLG7Bq+6KO/66DaHspe4BOwEApsNAA0U
 9IOhFBvrL+Dy6y0bWmQOGAteSPRbyRe52dxvXVnf1Zg79eXmOieUMvdOutbBP7xH
 H2NHlZ/HBKmZcICQRwA6vwVvOLdPX9wWP9jzz3xXar43d9ryTgq27/WbK0SbEepx
 r2Xf2GQLROJvQb6sXFCWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1681239893; x=
 1681326293; bh=SgOh6WcG6tCvJ6mzov0XlXx1lkiJr5cHhN9Douv0sxg=; b=K
 Nln+Y2Gg/R1iZveAM2+1q1CcegF9buGWWIp+THXLBjBekzKRFu1fdJEFSGbWDL/h
 LL4QQ4fR0EC0W5JhsCJHvqfCTdnJpJizkWeJkQmMuKgzqr7V3T7jsj5KWFiLNmzk
 7ZpP/FWdCJH4kxf9K5Ufi5t3yg+VuOAo2+C2uqDxf0dCe0g/yZ8dtjELdA8A1O8w
 oEfsPMcbKl+3ajh0LJrN9fe4rOjVz9vY6TQc0lrndFmiFYMffu19esK6AKSSCQiG
 XtmXJw35x0cJIwGd0vBUKtmBXBQxELGB84/nOfqC73NEt1apRM2v+JIEDb3bYtbR
 ktBpLmOK3B7CwQypr3AaQ==
X-ME-Sender: <xms:Va81ZOukPYraRpH4bOohqUYHpuEkNJ9MoZX2mquimyXy1j4oA-QeBQ>
 <xme:Va81ZDd2BFnDb76qPcbxMf59DeWksxGtfIkeSSYCdXDqjfSe2CHLveJiiy-GHuJJ0
 em0aDuwwic3SiHtSn8>
X-ME-Received: <xmr:Va81ZJwXMI0QICgJXkrAn1LQJwRHZA52_Yms-Uzs5cmVp91FOZH0r98hDt6gjxfARiUSkVl47zvGp5SryV4AnqqZIh_IK-FaTB0hVbw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekgedgudeffecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:Va81ZJOhY6PzT2CA3yT-19m_Ty4C53AxxEKQvMPlhtnlfBTZWpSS3A>
 <xmx:Va81ZO-hXb5qsFLBCDNDdHLytBhtBUkqM_ful-kTWWXaJ7FjOQiEuw>
 <xmx:Va81ZBVJlTgHru2JsKTCmZMSlUYDZZFIo78xXayEcDuKfwMg79gJgg>
 <xmx:Va81ZCa0hTsDaFgomPmd5-u-x-ytIdQT3iQtJWWNmJ1OjPRWYT_KVg>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Apr 2023 15:04:52 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH 1/2] hw/nvme: fix memory leak in fdp ruhid parsing
Date: Tue, 11 Apr 2023 21:04:47 +0200
Message-Id: <20230411190448.64863-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411190448.64863-1-its@irrelevant.dk>
References: <20230411190448.64863-1-its@irrelevant.dk>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=970; i=k.jensen@samsung.com;
 h=from:subject; bh=KRmGmCeNfTeZW4QUUG4mw1nOPd+snpnWmmLnLvvpklM=;
 b=owJ4nAFtAZL+kA0DAAoBTeGvMW1PDekByyZiAGQ1r09VMxT/a+z+oRPyhPRH4r2pOhdOjgFWG
 9iYsEvpXFgrb4kBMwQAAQoAHRYhBFIoM6p14tzmokdmwE3hrzFtTw3pBQJkNa9PAAoJEE3hrzFt
 Tw3pp2kH/RKJyBHwJOo065X6p6BdUd0nPbn+5Gh8AN1bmguncqZ2yAynoa0A1e/B4cX/faeSumW
 veV+7noPk8HLnbWMZqAq3ezAcH/gGHoRvyAHQ7AaMCD6iwxDYIgEIHdohcGD/q5+nBcY5xFkNwf
 s44R607Ybc2dFJP6KsNNhpdBhhyqLHj8YKUT10Cu/rxLAZ6tA2f+PUlUoHupfQGbGupflQOgQh2
 St06NZkeyPi6nILNQqGQBZ4U2Z7FiUSOq4gA61wC4/lir3eXA5S7D7FLI52Y0iido0W4SYaQ2Fv
 e2NidYhJw2D5AZkwrQDNDrAKns7s2rVZCZgNiVhmMj9kJJeB4NltIqbg
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Klaus Jensen <k.jensen@samsung.com>

Coverity reports a memory leak of memory when parsing ruhids at
namespace initialization. Since this is just working memory, not needed
beyond the scope of the functions, fix this by adding a g_autofree
annotation.

Reported-by: Coverity (CID 1507979)
Fixes: 73064edfb864 ("hw/nvme: flexible data placement emulation")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ns.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ns.c b/hw/nvme/ns.c
index cfac960dcf39..547c0b154312 100644
--- a/hw/nvme/ns.c
+++ b/hw/nvme/ns.c
@@ -399,7 +399,8 @@ static bool nvme_ns_init_fdp(NvmeNamespace *ns, Error **errp)
     NvmeEnduranceGroup *endgrp = ns->endgrp;
     NvmeRuHandle *ruh;
     uint8_t lbafi = NVME_ID_NS_FLBAS_INDEX(ns->id_ns.flbas);
-    unsigned int *ruhid, *ruhids;
+    g_autofree unsigned int *ruhids = NULL;
+    unsigned int *ruhid;
     char *r, *p, *token;
     uint16_t *ph;
 
-- 
2.39.2


