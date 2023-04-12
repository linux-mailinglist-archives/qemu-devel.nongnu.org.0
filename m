Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748406DF18F
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 12:05:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmXLO-0004ZF-SB; Wed, 12 Apr 2023 06:04:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmXLL-0004YM-B9; Wed, 12 Apr 2023 06:04:48 -0400
Received: from wout5-smtp.messagingengine.com ([64.147.123.21])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1pmXLI-0005NL-TO; Wed, 12 Apr 2023 06:04:46 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8ADCF32009AC;
 Wed, 12 Apr 2023 06:04:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 12 Apr 2023 06:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to;
 s=fm2; t=1681293882; x=1681380282; bh=8Xs7tGZxZvvGjOXL4t2xmMTu6
 AtYhtCimAMX5scOnIY=; b=IHSJQJki+ImOsbMHl5AR24uGeQlbf+q9GLHUCp8dT
 Ug6n8+lSD4xPDkJq+dcqBUUgkJhr4anP9jm2C+5LjDQh5uY2PPFDgXFNnibJ/EN5
 A7b6G5LSe81tjkSx0Q2mBMPy+kzanqIj3PLavBKP+dNV/U/kJXKzx8EZkqqioG3c
 dgicy8JG9O2wxZoWpR1PPlvUdF4Bgdn/jbSFM10edd+RmhXA8h58cniASFlInACM
 SmVjhGQkmogolEGM9w4D/eIbpNrydFhCjrtUgPfFRAb2S2e+a5YpLp9wByTQhy5a
 IpHgiUSf8YjmAp9dTNFRFgypdO1KompdWQQBbp/fyLzVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1681293882; x=1681380282; bh=8Xs7tGZxZvvGjOXL4t2xmMTu6AtYhtCimAM
 X5scOnIY=; b=Er08nV03MfFeZzTUGq03iBCkr0rWdvEjhieWZIIY3Cg1nzZgPEn
 eCklmO7fuYW/N735AQCfjVD3i4znIvfI7w6mitaXJvVGGkh4X1HSQIeHiJ6lq4s9
 eQtqvZDJZgz593DBMpO72/XidJkY2iL5Gu8QhBLAI4nQrTP+FmVUhmltuH6CO7FF
 k5t3Tyn99jGyMrf9EKrVBMic9kr0sWgREtr9mQTSw0knl/aRMeGk3QBL95tI6alG
 LqEuyEkyBSNT02XTwJu0SJquYIQH0iKcEMT4wtVYLBC1ff+7X+wAyJY4EhJjnYtb
 hn1v6PyPDVUyvRBOxNEuWAYkwaSXvWFoIBg==
X-ME-Sender: <xms:OYI2ZO9rjhTzGoJF4fbg3PebItQJ2uxaHQnY4VQzVNyePJTzjq31Pg>
 <xme:OYI2ZOvK5r9Av3mjbbKQPquegbqMvv3cKq7UBis2dzP1XgE0LwCIyAM9NCEUrD1xH
 0OPsBAidFLBEwy4Y5I>
X-ME-Received: <xmr:OYI2ZEDgl-G8UFA5AGN2j3Go9kbKrU6e3OtDSf_y6E0SZLIpPZm8Shey8nOJ5i7tMqIVbZCGH24Jw3JBTg2xlejeFW1_j5YbMLpmzRs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekiedgvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeefvedtueetueduffevgffgtdeftdeuleffhfeigeffkeegfeejfeffteej
 iefhvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:OYI2ZGdnBwF_y8gWknXG91QAjqaumTtADir8_iTAEBUrvGh9YoQhRg>
 <xmx:OYI2ZDNVRfgfJ7ni_1EXWsj06W6bd-AfSy3hLuJNp26joAAhjzpSnw>
 <xmx:OYI2ZAm1-0W9TjNWaXS13Swqu-KrDmBokpTzTpJZRdweSh0PNBFTng>
 <xmx:OoI2ZO3rjVZNw6URjzlgKHhzXuC3kBkEDtevrxT5uesmimpTLmBviA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 12 Apr 2023 06:04:40 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL for-8.0 1/2] hw/nvme: fix memory leak in fdp ruhid parsing
Date: Wed, 12 Apr 2023 12:04:35 +0200
Message-Id: <20230412100436.94038-2-its@irrelevant.dk>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412100436.94038-1-its@irrelevant.dk>
References: <20230412100436.94038-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1028; i=k.jensen@samsung.com;
 h=from:subject; bh=ujQBMyZ2b2XAHG5JvO+/X6wlJts9d9Ei/9hgl1BWxLI=;
 b=owJ4nJvAy8zAxej7cL1hrj/vS8bTakkMKWZNJuyRy28Wv5mlnn+9VaXz6Ln5AedOZxwXVi+0v
 ureM3dWcW4nozELAyMXg6yYIkuQhvGq0kd3ni1yTzsAM4iVCWQKAxenAEzk038OhvYdOVO1qkO6
 3iVUlc5/1VqdWdnse9gm1+rO84/11yKKItsqzvxMzj/XwiNlXLzze0hP5PGWB0tqZPY5L/LT4uw
 rzrrh6nbdqS7nUtpyZbnb8d8nu3fyXXiRdsE34cLC65zK3vprNT+yHrlqo9GuyhDq3lz25wZfwg
 RNfea11jP6367V2ZIXtptvF9eqZU+jRQ8bmStFbf/9ucHvnsedb5YiIj/OcyssNzpR2v+x/5Kim
 1vSL6a7C5tfsF8s/6isIBNpdvC1yeXbRpe4VQ2Ufc69+hgXeM+QJfORwZGW+Z+e5gmx2hqtmMw1
 0dB0svIE3buPgjT3ZWzWyKtzdTouUBHwUmCii/8eNcaL5vEAOCCj7g==
X-Developer-Key: i=k.jensen@samsung.com; a=openpgp;
 fpr=DDCA4D9C9EF931CC3468427263D56FC5E55DA838
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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


