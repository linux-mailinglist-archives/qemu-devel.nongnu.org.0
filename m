Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D334056106C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 06:58:37 +0200 (CEST)
Received: from localhost ([::1]:47966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6mGC-0003Ve-R2
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 00:58:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9e-0002T7-Tw; Thu, 30 Jun 2022 00:51:50 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:53073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9Y-0006vw-NV; Thu, 30 Jun 2022 00:51:50 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 5F64E2B058D6;
 Thu, 30 Jun 2022 00:51:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 30 Jun 2022 00:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656564701; x=1656568301; bh=Lw
 +1g+XzIO5FqGC0pP7rAAEex6IHNU163XV6+BxRlio=; b=kbKYQka7lt8EbPtcsU
 R+mffm23RExXJpaKuxeunlwo9zMVcHcCIORaxLhEAli6+92OHIO5uM97Dv5Q1JQj
 Q+Wbff59ZLmIyEPy5CcgYSU7pJAeFnnqjienjq/KoAGqoYxJrfEaQ8cD9Dg6Z5/j
 aKO7Vv6gsLCzgye+QiK7ImpbWWr5TRc3/Nro3norY1aQyZ06J4mAZIcJj82e3gMi
 CK+g2GTBFgbtWrEOOzfVNUbVJQAwipx79ioArde/xw5IZ67IoGmde1doCUqqdAHG
 G6FdiYNJIrsqgLuZmFu4HTkAsBx8C/AVvFmH0brN3v9A34k4c6ACWVk2qqZkpJl2
 8abQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564701; x=1656568301; bh=Lw+
 1g+XzIO5FqGC0pP7rAAEex6IHNU163XV6+BxRlio=; b=XTEoiOv1M+qtXJqFK/L
 zlb75zaPmuAsOH8Dt+TO9YvHfIyaqQs4uZgRbWTxn0d79s/kJwRyhaD8GuaTtBVw
 I7BWKDJ8820c83RiY6DA+fh7IKtlDLh1Wz0uCfI2vHkD8ujKimjgtbqMO9sx4CfI
 KLfuM7B4b300zS98jDoAbULDNduRyPktZ53LO9VYyg63+2kKAklfM7Z/7JK4B3bv
 BOfBrL2cI/bFH+n8hnUclUCD+0wk/U/U4nxRNkqjVwuSxzWYmrJWTF4wr4noW2QZ
 AIUV/+siyta8eqggHkOtnWoqOVGeLi3Pva7hk2mZUYaV4kipLUjbKLx/7Y72ETIm
 1Mg==
X-ME-Sender: <xms:3Su9Yvp0iL1xiupbHky8vQ2-QviXNpco4n6_gipKQMEhzxSlf2OT2g>
 <xme:3Su9YpqGoDatSEB-EaLKAhaLzeoIc2if6CPsdZbumw_8tcW7j2BHQnzwQjX45wqC7
 mTbFS-V2nPR3EXLMj8>
X-ME-Received: <xmr:3Su9YsMDoBS7eninwz8EoOzXX34Bjr3dsUkjtWJMIzmDdw_yqiYf4pyzNvYB3CYyUmgIeOmKmZO91hxdyYbs-Mp5BHXOjOOJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeetleevtefgleevleelteekffffvdekheekkeejveegheelveehgeeufffgtdei
 leenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgvsehpjhgurdguvghv
X-ME-Proxy: <xmx:3Su9Yi44KmL7W0iGvJSnTQoKQUE59ZKKSANI3_sLq2PgBdyw0tPw-g>
 <xmx:3Su9Yu4DH6VchiBXMYRCVbmr_kzNvnD1J99ASjyh1SaPM2hLuTkGsQ>
 <xmx:3Su9YqgcC7CKiL3s8pFf2EaHGqMhI2IgX543bkEXHu75ORSuEpDHDA>
 <xmx:3Su9Ygtjs4j-ExWdPw1w4IjrEEcySVbRt9deien5WlluRT_8G-VbqPbmtuo>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:51:41 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 02/14] hw/i2c/aspeed: Fix DMA len write-enable bit handling
Date: Wed, 29 Jun 2022 21:51:21 -0700
Message-Id: <20220630045133.32251-3-me@pjd.dev>
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

I noticed i2c rx transfers were getting shortened to "1" on Zephyr. It
seems to be because the Zephyr i2c driver sets the RX DMA len with the
RX field write-enable bit set (bit 31) to avoid a read-modify-write. [1]

/* 0x1C : I2CM Master DMA Transfer Length Register   */

I think we should be checking the write-enable bits on the incoming
value, not checking the register array. I'm not sure we're even writing
the write-enable bits to the register array, actually.

[1] https://github.com/AspeedTech-BMC/zephyr/blob/db3dbcc9c52e67a47180890ac938ed380b33f91c/drivers/i2c/i2c_aspeed.c#L145-L148

Fixes: ba2cccd64e90f34 ("aspeed: i2c: Add new mode support")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index ff33571954..cbaa7c96fc 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -644,18 +644,18 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
                                                      RX_BUF_LEN) + 1;
         break;
     case A_I2CM_DMA_LEN:
-        w1t = ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
-                   ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
+        w1t = FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
+              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
         /* If none of the w1t bits are set, just write to the reg as normal. */
         if (!w1t) {
             bus->regs[R_I2CM_DMA_LEN] = value;
             break;
         }
-        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
+        if (FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
             ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN,
                              FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN));
         }
-        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
+        if (FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
             ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN,
                              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN));
         }
-- 
2.37.0


