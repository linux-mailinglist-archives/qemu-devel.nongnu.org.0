Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA275586740
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 12:14:39 +0200 (CEST)
Received: from localhost ([::1]:43702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oISRb-00008v-18
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 06:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oISJR-0001GK-9t; Mon, 01 Aug 2022 06:06:13 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:56693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1oISJP-0000XT-MY; Mon, 01 Aug 2022 06:06:12 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 8FD31320094F;
 Mon,  1 Aug 2022 06:06:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 01 Aug 2022 06:06:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1659348369; x=
 1659434769; bh=gDF/qKIKZPKhM3ujgAUdpGUVAx+pT7cb6Y+fUGAVVBg=; b=S
 1RYhkI2CUdj4F6KbroJRbqnfEUyahWIsT2oUIYloTAXO1SFUIsGyqR7XGbQSQWxV
 Kp3yhZ09rxtlhv2l2qBvM9rThdW7/5TJ8cUdoLD6Snsv6IaB/e3v0oMM65qJELEJ
 +Q30tMI/r4mvw0Wf35+rJpcaIUVjDp38AILRWt1LDpX0Kfe9cwg4uQQ7Tmsgp+Z1
 iMC1cjsj97qrKeNKVYdUPwd5sifuBUrnHcxyYR02sMAW/+aF7oqf06QWssxEAQq/
 ZvQV96wKzkZ5kZcZXcD2VuHxCTvUAJvx9SxfPI25A08KAkL3qG1e7Afr8WgIFhzD
 f22rnfuv8z0nC+UG7+8HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1659348369; x=1659434769; bh=gDF/qKIKZPKhM
 3ujgAUdpGUVAx+pT7cb6Y+fUGAVVBg=; b=QfuH30ek+nKo+bILIpwIhEG614EJO
 9xJCzyW2oL7ymdb/CcX1KX0dlOV8wmi+puaI2pwsfnXRvXr/h6veg5yq9qOT2Utn
 fnM8KchlyVebZVdpLW2WYoNh648OfItECr42kJjBRlw8kB/+rFEuOQgbpQvvBP6T
 cOaBgd2CxFk0wf8nF5UoQWGPRWXQ9EwR3dYiBJrg1mkU508ITyTL3Iaz1T0TLiki
 XhAmeOipwX2MTU2+yLe5dauh5DRAoy36vuzyi/JSp0Us0NMHWfUukyylKGoFvd52
 4onHcrxjE391CixPnfs1SHLXY6VhtZJ2cXo9d/lm3xsaLH2nyLzuV7H5w==
X-ME-Sender: <xms:kKXnYivIShbMa1LMCsCDBi4otOS_e8f3e_8bcP7PIY49gFo6l9eXRw>
 <xme:kKXnYnf4R8fqRo2YC8-4hfpeeFyoZRQfKP7ez9-OLgeZQ3cdnf9ort5RquZXhINtz
 piuad7CRlWC4FChraY>
X-ME-Received: <xmr:kKXnYtwM9Lm8IbOpKbQ-3AwKov6J9HMKmrAid8LKXmF8JtK7P2TX7z5x-K-XnATp8dF3vViTsc5mpCXPt6kn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvfedgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgieelgfeiveehkeeuveehheekfeevgeeigfehfefgjeejhefffeegudej
 udegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:kKXnYtONKlh9H9uN3Sll55vRdORdzjOiSDTAi2srXlfLVyT9TC6U8Q>
 <xmx:kKXnYi-5Ubo0XA5WcFh1yPLWSL-MGwLvvJ2DKuWC1vJwJqbIHEQyGA>
 <xmx:kKXnYlWvZrvGbsy9nFXXe4mh1tyCViyGO6xM8eHUf5F9MsUafqUdWA>
 <xmx:kaXnYpkGIJvnBGglLEYyHeo0QNGQp7O6eRUYtrjndf827_8Au52PAA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Aug 2022 06:06:07 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Klaus Jensen <k.jensen@samsung.com>,
 Jinhao Fan <fanjinhao21s@ict.ac.cn>
Subject: [PULL for-7.1 3/3] hw/nvme: do not enable ioeventfd by default
Date: Mon,  1 Aug 2022 12:05:56 +0200
Message-Id: <20220801100556.2217492-4-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220801100556.2217492-1-its@irrelevant.dk>
References: <20220801100556.2217492-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
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


