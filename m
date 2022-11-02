Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAD16169E0
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:59:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqH3l-0005u8-4G; Wed, 02 Nov 2022 12:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oqH3h-0005tH-HI
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:57:45 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1oqH3T-0001BD-9h
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:57:45 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C019C3200988;
 Wed,  2 Nov 2022 12:57:28 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 02 Nov 2022 12:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1667408248; x=1667494648; bh=4T
 V9nMwaXoflOXBxNVUiz+XysdCPoEiWWWBv9VRamHo=; b=otqDBQKe1b5EQ26qCK
 V/MlCmTb9mU4CynCWjK+CB3ig9ZeYZxndHfOa7PW/qI6WQg+GA+GsD2d3+SOlg/L
 2HHao80cctzdGccphSPAXGEJ8h9efdRDFnKDcuV+WcGzr2309EAgacJh8ImBAQL+
 Vhs94ZW+LkqAUmuhQWEgx7iScBgVejCH0BjJUTC3bPbMoA7AEAS8QqEOrWZf3YhM
 LY5mNxZo2dDxFN66v8smr1AqewtTzbhcs4YEzgOGdF2JBAf8csXfW33G4lDF8FL5
 bPX7NfrIb/WZbJFukPVihzESVwZNhklprEaw7dqRvX4S+669RlhYfzGSpit0ODwO
 34Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1667408248; x=1667494648; bh=4TV9nMwaXoflO
 XBxNVUiz+XysdCPoEiWWWBv9VRamHo=; b=h2cds6yNtCsWgGHZVoMhTNMOmwHQn
 6tXYIDM89VrHPrgaxKcNziHai69sgyZjNO8gLpaKJPYCFWx5RbWsJOTc1KhSYDga
 sE4yxBJj7t3fkXIWExsvLNYni7/n/PdcjoBEkEHWjBwGaEhCeNoVVWmLf12sqrXL
 VCiTqQ5fDZbDh53uU2LbjQAg5l9ku/lNbw9w4rv6edB+cULgrZrTz9BPwqqdA7ag
 aPyeGV9n/EO6mkoQ+ZleOYKpOg2l0QlkfooI9OhObuqueT22LVswIHQr2P58JgXc
 c3+GBNBECCxMK2UMJ0+N+MDav3k12uGOsqUJcqGXIu9jHike3UDdS0y0g==
X-ME-Sender: <xms:eKFiY3RTo-LH0ZNzO98yU_0SSQq2d2SCXULlKO2ugYeOM0D9LTfrWg>
 <xme:eKFiY4zcagv0oYg0rinPIZy5y4dAE60VhtX580ulSclltWpb_6WGIlOLWx4MLghh4
 cPPelBI4Iel0vTNvvc>
X-ME-Received: <xmr:eKFiY80HFo9XQRlzZUt_4oJNXOG3GLncJRfg9MJee2V_sWzHxluw63kB5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudejgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhg
 sehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvuedvvd
 egkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihgh
 horghtrdgtohhm
X-ME-Proxy: <xmx:eKFiY3DsQvOjuhKCWhaX54iKTdzDkw0NmS-f00bWmEvxCNZlRR40Bg>
 <xmx:eKFiYwgQbweGB88AuLTGrW2tTkGabUnRO5cjEuoeUlRxz9xCwBtu2w>
 <xmx:eKFiY7qf9yqCn0zEZbCkdqnfxFoN06Ez6-DpWlrBPu2wEvcMqPX6jQ>
 <xmx:eKFiY8YVAcSYVJrWe251rzUIf0B5QU3T-mQB7c9K74JulSlAH0A6Zg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Nov 2022 12:57:27 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] target/mips: Correct check for CABS instructions
Date: Wed,  2 Nov 2022 16:57:19 +0000
Message-Id: <20221102165719.190378-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221102165719.190378-1-jiaxun.yang@flygoat.com>
References: <20221102165719.190378-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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

Accroading to "MIPS Architecture for Programmers Volume IV-c:
The MIPS-3D Application-Specific Extension to the MIPS64 Architecture"
(MD00099). CABS.cond.fmt belongs to MIPS-3D ASE, and it has nothing to do
with COP1X opcode.

Remove all unnecessary COP1X checks and check for MIPS3D availability
in decoding code path.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/tcg/translate.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index e49d2a25a8..23e575ad95 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -1788,16 +1788,8 @@ static inline void gen_cmp ## type ## _ ## fmt(DisasContext *ctx, int n,      \
         check_ps(ctx);                                                        \
         break;                                                                \
     case FMT_D:                                                               \
-        if (abs) {                                                            \
-            check_cop1x(ctx);                                                 \
-        }                                                                     \
         check_cp1_registers(ctx, fs | ft);                                    \
         break;                                                                \
-    case FMT_S:                                                               \
-        if (abs) {                                                            \
-            check_cop1x(ctx);                                                 \
-        }                                                                     \
-        break;                                                                \
     }                                                                         \
     gen_ldcmp_fpr##bits(ctx, fp0, fs);                                        \
     gen_ldcmp_fpr##bits(ctx, fp1, ft);                                        \
@@ -10424,6 +10416,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
     case OPC_CMP_NGT_S:
         check_insn_opc_removed(ctx, ISA_MIPS_R6);
         if (ctx->opcode & (1 << 6)) {
+            check_insn(ctx, ASE_MIPS3D);
             gen_cmpabs_s(ctx, func - 48, ft, fs, cc);
         } else {
             gen_cmp_s(ctx, func - 48, ft, fs, cc);
-- 
2.34.1


