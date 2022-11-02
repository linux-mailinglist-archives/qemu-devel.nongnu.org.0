Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4BB6169DF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:59:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqH3h-0005rV-9o; Wed, 02 Nov 2022 12:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oqH3d-0005pP-TW
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:57:41 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oqH3T-0001Ao-FW
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:57:41 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 0575A3200991;
 Wed,  2 Nov 2022 12:57:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 02 Nov 2022 12:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1667408246; x=1667494646; bh=2TFWLOI6i7agU1fdXiC24iUiZ
 oKJ0/+UvyNk8H7h+8w=; b=TgwQ0FeNvaaQJ6BoOmL76e9fzxfsC85SD1O87nruS
 GzUHO2C8UoA9j+/YnI7IOT2ViqJXyTWSCoANACcfXG5fkuaJdR8l1pfm0GKylR5b
 sqCoKMzjO9LIRTHfD4HXMMXSGRlAdloL9e48qRtw9rwLt7Rn5UXmEE+oE+CLgcT9
 awPGd6O8CrPB7tlM3gsClGNldKvWQXmWtsh2rdserUsJYQmOpswFFJ9h1v3GXn5E
 fIQVSbSxgR1pzc1p2VeIA2cy4aOV66KDeSSdDUfF6LX9WKw1oMRqyUomQMPT7iwM
 rQr1rhhj4UWj+CeAy6Qurm8nopR4MEqS9fzRqN1vo3IeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1667408246; x=1667494646; bh=2TFWLOI6i7agU1fdXiC24iUiZoKJ0/+UvyN
 k8H7h+8w=; b=LBqWN1xbMVW5yIwZSF0PMKXGbXy5bUVAGdsqg9EKyAiyspdiw/6
 aQeUIHIomh0G9rSURJ+LpXe2oqRbrqpXlAvxE27ZKoRnLDOayxCvA7rvPRyPWoYR
 M9O1sSsCOEXr5crQQrwL7QBdaSn8DWSAsf4IoIIkwVg4AVK8FpYK3ZoHD7Qx7jVi
 viBmLmVK0oSI0txRnUvoF7+zjAGM9GDcdpL0rmv3yi6O8rhx9Zlx42fhRCIvw8hx
 bJwAnh/cDk9rNjnVNLe9odriMSKdwS+/u6+5zBGKcPyocQcSXfcPaaTgsY80xsFM
 2KehkwxLWFwuz/30EV+Mqs00LaXDMt2zzdw==
X-ME-Sender: <xms:dqFiYyXdrruZkqQvBcc337wOBdSzE5dv9K812tx8E5gyBcH1NVjaZA>
 <xme:dqFiY-mCNUAJDt3JgNUbtOyfg87Om02ulShE2w1aLbw3U9PiCCfAsKbapltHJMQ0X
 AifFgji0AgT2dlk0ac>
X-ME-Received: <xmr:dqFiY2Zrkh7iZQ7__OIfOsBos06G0oNCRJYKJljRGuHDWjm4KJSfdCzmjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgggfestdekredtre
 dttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehf
 lhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpefhtedutdduveeileejjeetff
 ehueejudehgfffjeduhfeuleeludfffefgffevkeenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorg
 htrdgtohhm
X-ME-Proxy: <xmx:dqFiY5XKwEvibSEvgyQOEindIKboGA6Iky2nR-MqPdzCL68tgL0zrg>
 <xmx:dqFiY8njt6ofwFCc6GzOHORIyx2EMXodgjC9_gbRu6iDTGBEvB3fyQ>
 <xmx:dqFiY-cuJbP-L2b5qSWFAY_OPea3vsSffhHQms37thc9XPYHV9vS9w>
 <xmx:dqFiY4uzjG_1VsK1PYN6wKf9zBRIVYY2s0UmzFLtKAfxRRWZHUCM2g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Nov 2022 12:57:25 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/2] target/mips: Don't check COP1X for 64 bit FP mode
Date: Wed,  2 Nov 2022 16:57:18 +0000
Message-Id: <20221102165719.190378-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout1-smtp.messagingengine.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Some implementations (i.e. Loongson-2F) may decide to implement a 64 bit
FPU without implmenting COP1X instructions.

As the eligibility of 64 bit FP instructions is already determined by
CP0St_FR, there is no need to check for COP1X again.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 2f2d707a12..e49d2a25a8 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1545,7 +1545,7 @@ void check_cop1x(DisasContext *ctx)
  */
 void check_cp1_64bitmode(DisasContext *ctx)
 {
-    if (unlikely(~ctx->hflags & (MIPS_HFLAG_F64 | MIPS_HFLAG_COP1X))) {
+    if (unlikely(~ctx->hflags & MIPS_HFLAG_F64) {
         gen_reserved_instruction(ctx);
     }
 }
-- 
2.34.1


