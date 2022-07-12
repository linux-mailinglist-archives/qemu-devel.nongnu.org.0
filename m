Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1B7571066
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 04:40:23 +0200 (CEST)
Received: from localhost ([::1]:54936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB5p0-0007ZB-Fo
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 22:40:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oB5hM-0007kW-W7; Mon, 11 Jul 2022 22:32:29 -0400
Received: from new3-smtp.messagingengine.com ([66.111.4.229]:59781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1oB5hL-0006XO-0d; Mon, 11 Jul 2022 22:32:28 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id F1A31580A06;
 Mon, 11 Jul 2022 22:32:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 11 Jul 2022 22:32:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1657593144; x=1657596744; bh=dC94u0acFC77t7Vh4yTVAzl3K
 W+gG7tWXOK31wAM6yo=; b=HXf6+SlH5+eYm8lznjNYl5H+gWVB2UNvuQnZ+X8oC
 5drOOxlydVG5twFEYnbShudl+AQVVDQHx4zUalkwOM2sLY9gD1MK/x1V9WnoV60E
 MnWLdhm4mDGNWkNZicMNU4EwljZVmgQIJcYsULDEpjHHgMy/TWILc8WvCnx3ht4e
 7+kCGk9G5426Le+55KkjOoUPJTNPTMtH8qMAyv9kXYYG6rwesSMK4/T5EqgKAPJO
 8hBGe1G8MZNccc0Ml225XaTXNFzaPBnzHyl3uXIENyQhJIPR4ZPefOwvRX9L8ATB
 hN6fcGPo2KI3btUJWs6SC8c8FJrH/Z5OLUV7fgsYjfFQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1657593144; x=1657596744; bh=dC94u0acFC77t7Vh4yTVAzl3KW+gG7tWXOK
 31wAM6yo=; b=UCYakeLKYupgxahHLdTJCbQAdN9dn8q6VEBzb+P+GALENXCbBj+
 2gb2+9cDng+UHzgOeiiZ08+SpgK38D32jUYhPcoG7Ee2mEHIttUplrUObs287Kb5
 z6+dbIlCX2+MnZfTKpIdi6NRMSnsV/+JEkKWsqniKHvKDeXEs3VIBsT9i2sKCgA8
 R0AfaymlcbmLJRsvZON/NyhC3VONQwZL07x2gYFuKSOMnOhsIDtjX4tzAwk5zrfS
 9xi3GkXpsxU0UpLfgERV3ddb+9Xe5gzr0mKAqLZFaWYv1215LhB9fcn+vrKBLY5X
 7n8pqRgzH3rTpB47PKfalOmmik/RkNGIsEA==
X-ME-Sender: <xms:ON3MYkc6eIiE8qo4b1OrLhvi16rTJHjH9SgkxYBCLzfglpqwXPlE7g>
 <xme:ON3MYmO29rJ_-AV0yJsIde2dSPcP8eAtll1dt45sHU6tUtL8QqMYQQc2z-0Yp29Na
 lwYaEebTceTFVmlVfE>
X-ME-Received: <xmr:ON3MYljyjM-pxMatecqDgz_YRQFKSskojzeQCPu2ta7Q4WGXMrKNEoKa7WBySA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgedgiedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgggfestdekredt
 redttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesph
 hjugdruggvvheqnecuggftrfgrthhtvghrnhepvdejgefhkeejjeeitddutddvueegheeh
 feelteffueegjedutdetgfdvgeevieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:ON3MYp-rwf7kzJCthxW_420QgniSq6sBAXtaDV_X1tQ4NltN8ohzbA>
 <xmx:ON3MYguxfs2V34TQqLrfhY8-GGCeBZWC0__pgTj6jgDKKhhaGFV5-Q>
 <xmx:ON3MYgHgC5NnOd1U3DC8diLPMo8yCoGXU-YY8T2yrC1IXM1yGucrzg>
 <xmx:ON3MYuAgPdR161wBoPwY0JMNrBX3fNopgJEzdkwvaZh0oQ-2DgqFAQ>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 22:32:24 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] hw/gpio/aspeed: Don't let guests modify input pins
Date: Mon, 11 Jul 2022 19:32:16 -0700
Message-Id: <20220712023219.41065-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.229; envelope-from=peter@pjd.dev;
 helo=new3-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM14=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

v3:
- Replaced fix in v2 with change suggested by arj
- Removed all changes to the body of the aspeed_gpio_update loop
- Removed guest error messages from v2

Peter Delevoryas (3):
  qtest/aspeed_gpio: Add input pin modification test
  hw/gpio/aspeed: Don't let guests modify input pins
  aspeed: Add fby35-bmc slot GPIO's

 hw/arm/aspeed.c                | 14 +++++++++++++-
 hw/gpio/aspeed_gpio.c          | 15 ++++++++-------
 tests/qtest/aspeed_gpio-test.c | 27 +++++++++++++++++++++++++++
 3 files changed, 48 insertions(+), 8 deletions(-)

-- 
2.37.0


