Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AAD561066
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 06:54:55 +0200 (CEST)
Received: from localhost ([::1]:39418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6mCb-0005u8-Nr
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 00:54:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9a-0002LA-Ga; Thu, 30 Jun 2022 00:51:46 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:47773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9V-0006uH-JC; Thu, 30 Jun 2022 00:51:46 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 0B5F62B058D5;
 Thu, 30 Jun 2022 00:51:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 30 Jun 2022 00:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656564698; x=1656568298; bh=Tz
 drkHjRQ8rWJQWIdjSiwTXhi7OvYfc3YUTxMfRrk6I=; b=UHXdtzEAuqcQ5cgAuY
 BLNSiJ+AmYZ63T2KJfEGBktMFcg9Rg6IRAHCOXiZxzgNqAEtVO90EkzldxBAvNcE
 B3vJLJKq1FAlHXqyCiPiWJRuP0988Z1hnQzWJ3InrvBSX8pCpQbdFo2HEtaZAQj1
 mOKcEo+nrhlOj15Q/G1+TO+ZOVPSdQczLq28wUTsVd8CFV6Fn1HABM5YHcebs1t/
 FggU5h+d5HgoyI/axkNUiKdNxPfGORs5bYm6u4oI45+CNHEEb4KE6TaVkRf4BpfO
 QhTDeRvHjMjn0pMn03Fww8ZjU9h22q2dkYOoKrGsFuhGilnqitC9zHfWxjDiTQeI
 S3xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564698; x=1656568298; bh=Tzd
 rkHjRQ8rWJQWIdjSiwTXhi7OvYfc3YUTxMfRrk6I=; b=lmtNxZK0m21xpCOOp24
 hkwhaL5P2uwsM2hDX/WSM0QhdTG7K3dpQbvV0dc6StWnEi2BQzqi8Mq9FhNSgUaL
 PzsQGR1/P76P29PuS5YGH+SltEBPyMYKCv39R9mu4sB6ijJf7lsTOEtxBgv1Kc+r
 DZwKfxS8nMAxYFJahaAIGXe8wsJzo55Kc5x6SfPJnWtnjzGfNDImROUKVsl0an2z
 7uayWWY9myF5BxwgMuWuJ5XY7VV1eRPdKT//KS32rmBf4gU61R5fSgirBwTCytJ3
 oblKFgnJqkxW3s74PDpd2edMOTTn5TNPOOtsxl9edEzBAUMcBov3OaQ3gdg5ujpl
 Jtw==
X-ME-Sender: <xms:2iu9YlcSkD_UlCyBFjT8nEvuw-cSX2LI7N0motRY_7bQplo05OazZA>
 <xme:2iu9YjMV_CLlBlh3k2LYxTr4_ZEGL3H3gIvcANcdRUTy0e_gGZU6M5BW3DaKhHXcA
 hB7h-eQ9hRBKU5GEso>
X-ME-Received: <xmr:2iu9YugwxRxdgwaua3qqjvUTTwwOOvinq50oVYeCsnpkJSqvywMm8xjayjng1U6g4__2QPs4YnsejUNtOKZeoW35wbUxcors>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeektefhieevgfduvdeiueetteegtdeuueevieelffevueevveehhedukeejtdek
 teenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmvg
 esphhjugdruggvvh
X-ME-Proxy: <xmx:2iu9Yu-uqfT_XrY2ZhMxtB0ad3BHbphPGP0GgYq3lvJbiz7Po9-otw>
 <xmx:2iu9Yhv6AWLTDrm-9HzP1eQJ4WvaBs828eS8rYoS69yYZXJQXcAJLQ>
 <xmx:2iu9YtFbVv0GU60vFmJ9eornlL7iu5tMYDwwt7sx4mrr2DviNXCizw>
 <xmx:2iu9YnAjQjnzsVpH0Pc0fkdZsxJX_A6Our6yGRhlCbc2FMXKdW7xn6KvIT8>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:51:37 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 01/14] hw/i2c/aspeed: Fix R_I2CD_FUN_CTRL reference
Date: Wed, 29 Jun 2022 21:51:20 -0700
Message-Id: <20220630045133.32251-2-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
References: <20220630045133.32251-1-me@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Peter Delevoryas <pdel@fb.com>

Very minor, doesn't effect functionality, but this is supposed to be
R_I2CC_FUN_CTRL (new-mode, not old-mode).

Fixes: ba2cccd64e9 ("aspeed: i2c: Add new mode support")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 37ae1f2e04..ff33571954 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -552,7 +552,7 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
                           __func__);
             break;
         }
-        bus->regs[R_I2CD_FUN_CTRL] = value & 0x007dc3ff;
+        bus->regs[R_I2CC_FUN_CTRL] = value & 0x007dc3ff;
         break;
     case A_I2CC_AC_TIMING:
         bus->regs[R_I2CC_AC_TIMING] = value & 0x1ffff0ff;
-- 
2.37.0


