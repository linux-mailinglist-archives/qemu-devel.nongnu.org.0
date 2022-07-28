Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947BC583AE9
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 11:03:59 +0200 (CEST)
Received: from localhost ([::1]:36488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGzQz-0000LO-TJ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 05:03:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oGypp-0006lx-LE; Thu, 28 Jul 2022 04:25:33 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:35405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oGypm-00056T-NC; Thu, 28 Jul 2022 04:25:32 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EF2225C0101;
 Thu, 28 Jul 2022 04:25:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 28 Jul 2022 04:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1658996729; x=
 1659083129; bh=KTzK8E5gzeTlKbKFz6fyG0Vav/HosNd9Ec7IsCZgxHw=; b=w
 pAJEa/1ercIEV2dfUqfkwEzX+aRskkwRyoFEUw+hisUAtWsl45jwvyjRGLtK0oOC
 JupB7Tj5XfWtnjc/C+2WE/k3TmULPSak16esjva2u7YmAzxf/M9G1w29EM1Aoue8
 sXFZZRwxefMB01vWB26SjDKOSKnmAlHaQc05mNvwWhw1hFG2Yql83NZEHaUgWvzI
 vPR8m0HfPWZ3LRU//2fLy7c90xf1pwy8Ti/lpB53buWkTKZMltrfETXzbDp8Oi0s
 lIAs1dLkDYjP8Bb7CUzFSN9R1J/0oB+NrpvtKEXLmAXsnN7YoZVcw3nKygNUO2fj
 5G7ps9peHtSwakFGgTgGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1658996729; x=1659083129; bh=KTzK8E5gzeTlK
 bKFz6fyG0Vav/HosNd9Ec7IsCZgxHw=; b=043tpLARxdTVBknr25lmuw4wNJ5LZ
 ANSGXqTWz9MlzkoDMoXIZD+hdJFYqTrCbIr9Xm86rbnkOUYqU0RIrbe5heJAY+uF
 6F+Sq9Me2We7i9ARccV4NPsDuAyAjGIwsydOM0cnOLeWtXgFglw31fJv81BgWGWe
 KuyS4bpJd2UNlnadh6jor/xvwC5qEG6VgQKuDxknrzcwlGCYHpTrV9G+ytjDOrrR
 5VuKMZH3Qep9+bOqCpFylh0mKUy5yQp29HEMNx9G7kLcQlcJNqdh91YRFz+h4Uvd
 KIqexVjeFYUNEubedD3ewLPWdQ8+OJDm1jPpofkAvC6rqN3SRwb9ND/YQ==
X-ME-Sender: <xms:-UfiYr4qSfXciBhw6-mjpfZxShltlh4Wcq2eWOfaFObfpRybhCxHtg>
 <xme:-UfiYg4DrJ-CPrJjwFG0_qHuQCreuK8ZP3MlfrcQbMOp-EC_nE_ZNmAS9446zwKyu
 6TIdlq1tFK7Zz5n1Y8>
X-ME-Received: <xmr:-UfiYic5RHN6F2UGhY8JmvrVMmjmGGYO67FH2DhvF2C096pfZ671EuPzIFfCfoXNLQTvz4nYPweTAw35MZN0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddufedgudeffecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeejgfeilefgieevheekueevheehkeefveegiefgheefgfejjeehffefgedu
 jedugeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:-UfiYsLLPCbcsdMCq-MGsqY8TVoVHmw2VtgQlJdvyPOn2gKNrarJXA>
 <xmx:-UfiYvLRDjaYdPOq1WfvOB5phbho5BoUgZXUVG93k0kljMpDn2K9HA>
 <xmx:-UfiYlxs7TyXtewfe0PRRlswRqVT7WIctVKzGoLfTx9q7kJmRwlJTA>
 <xmx:-UfiYsEPCV9-uObtIQvvhnSZpp-x8HdTc_DLQQcYZXpzNO1Bz4dOGw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Jul 2022 04:25:28 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Cc: Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>,
 qemu-block@nongnu.org, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PATCH for-7.1 3/3] hw/nvme: do not enable ioeventfd by default
Date: Thu, 28 Jul 2022 10:25:22 +0200
Message-Id: <20220728082522.3161739-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220728082522.3161739-1-its@irrelevant.dk>
References: <20220728082522.3161739-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=its@irrelevant.dk;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Do not enable ioeventfd by default. Let the feature mature a bit before
we consider enabling it by default.

Fixes: 2e53b0b45024 ("hw/nvme: Use ioeventfd to handle doorbell updates")
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/nvme/ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 70b454eedbd8..87aeba056499 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -7670,7 +7670,7 @@ static Property nvme_props[] = {
     DEFINE_PROP_UINT8("vsl", NvmeCtrl, params.vsl, 7),
     DEFINE_PROP_BOOL("use-intel-id", NvmeCtrl, params.use_intel_id, false),
     DEFINE_PROP_BOOL("legacy-cmb", NvmeCtrl, params.legacy_cmb, false),
-    DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, true),
+    DEFINE_PROP_BOOL("ioeventfd", NvmeCtrl, params.ioeventfd, false),
     DEFINE_PROP_UINT8("zoned.zasl", NvmeCtrl, params.zasl, 0),
     DEFINE_PROP_BOOL("zoned.auto_transition", NvmeCtrl,
                      params.auto_transition_zones, true),
-- 
2.36.1


