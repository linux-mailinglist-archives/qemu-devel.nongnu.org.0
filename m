Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4461F60B2E7
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 18:53:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omzJE-0003iB-8X; Mon, 24 Oct 2022 11:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omzJC-0003hT-HL
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:24:10 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1omzJA-0008HS-Ph
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 11:24:10 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 63A8A320085B;
 Mon, 24 Oct 2022 11:24:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 24 Oct 2022 11:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1666625046; x=1666711446; bh=Ee
 NVEvuancGMM6mCbOQWAjOO2ICPI4+9myV2y4NytTw=; b=V2ySNA85GOFTlZQpOK
 C3h5eeK6CvMU5gIylSQZ/vosmGEAsioa4M0vHyFxEHf2CLnJ21xLQ8PTHMPBsLDc
 imoDWkrWQKWo3FF7zN97gQImi68IefugkKP6yC9Nn55olVyJcCdafIeCtki461ZF
 aRf4PG3RlWjy/r7QoglcMaJVVEU52BYsic03OdQJYTFEGGpxKanAVgCZ9Kp9LhFI
 1u8YZ9B6bw2yxFrHhWzVruZrDV6KLuuG86SnAMQUBflyhOhD5cvwB4i5Fx57kjlp
 v6jPgXl6Bd2gsSBuQXldiALlts6K86qL6X8meuwLZv+vY/d+Dd7U3LS5+FqX2rQt
 hPTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1666625046; x=1666711446; bh=EeNVEvuancGMM
 6mCbOQWAjOO2ICPI4+9myV2y4NytTw=; b=r+Etk+U/Wr3F8y+kmKsAMj4kDxE3V
 1ef6fdLyQYXiFbrZbQFARYHxWfZSRY6bozvNiTWZ5/lS8CfVZ/tOvT7WPw0xakcd
 CO9+vA0kDQAZkqyb9Sj44irYeKnnaYYyOTKE3QUHUUspKRKk0tp+36XiZUMmzK+/
 shaN5riVDP/YU5gLtr5YLQvFOcP8qft+WlDeVPLHmTQuxMJnImRMaTmbKnMKKem9
 gKA+PGpe1Q/Ooo8B4VX2uhjq99dbC37Ow/IKZRfJD1xOmEhQ3iLu9TbYcO2RqnGj
 whJEryOBMnqAGNxbbGiDNcijphGZTIC12OoNKYGTPuFzaX5nt1obMvGGQ==
X-ME-Sender: <xms:Fq5WY7G4M4Mvakcpm6pMCv-bs2q2RRfx3PlNiipQNrUYhete1HZ8Ug>
 <xme:Fq5WY4XFFl6s_Z_aTgR48JZ2FXGctu6eXqBnH__kiCxkVm_rOOX11MCZLL_fmV4BN
 kYKvozoI97XDFm7X-c>
X-ME-Received: <xmr:Fq5WY9LvI-mA33yVMBsG-nEik-MbpTuKRAu8XxLZY4AjmCMFmZzjnfBl7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
 ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
 dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
 vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomh
X-ME-Proxy: <xmx:Fq5WY5E0PwSc9JKSPkmoEfPHPG4chNyASG9ziXmZ8akCCtS9evjqtA>
 <xmx:Fq5WYxVsEwiRBLwBC73NpbBPH4McYgiRmG7ZMohBIdMxWAM6kAxxoA>
 <xmx:Fq5WY0N_oj0Q_Zp8P3zqCi9iWJTqJgxw_npQ-slRKxjt5rss6bJEXA>
 <xmx:Fq5WY-gGdoEbS2svKDZszj7fAaHJJpFVyuxZWAfs5ju6b66raXlGAQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Oct 2022 11:24:05 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: f4bug@amsat.org, richard.henderson@linaro.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 6/6] target/mips: Make MXU decoder standalone
Date: Mon, 24 Oct 2022 16:23:49 +0100
Message-Id: <20221024152349.215135-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024152349.215135-1-jiaxun.yang@flygoat.com>
References: <20221024152349.215135-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.19;
 envelope-from=jiaxun.yang@flygoat.com; helo=wout3-smtp.messagingengine.com
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

MXU is treated as an ISA extension for now.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 target/mips/tcg/mxu_translate.c | 98 ++++++++++++++++++---------------
 target/mips/tcg/translate.c     | 13 ++---
 2 files changed, 60 insertions(+), 51 deletions(-)

diff --git a/target/mips/tcg/mxu_translate.c b/target/mips/tcg/mxu_translate.c
index f52244e1b2..9be37da620 100644
--- a/target/mips/tcg/mxu_translate.c
+++ b/target/mips/tcg/mxu_translate.c
@@ -354,6 +354,8 @@
  *   Programming Manual", Ingenic Semiconductor Co, Ltd., revision June 2, 2017
  */
 
+#define OPC_SPECIAL2 (0x1C << 26)
+
 enum {
     OPC_MXU__POOL00  = 0x03,
     OPC_MXU_D16MUL   = 0x08,
@@ -1552,54 +1554,64 @@ bool decode_ase_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
-    if (opcode == OPC_MXU_S32M2I) {
-        gen_mxu_s32m2i(ctx);
-        return true;
+    if (MASK_OP_MAJOR(insn) != OPC_SPECIAL2) {
+        return false;
     }
 
-    if (opcode == OPC_MXU_S32I2M) {
+    switch (opcode) {
+    case OPC_MXU_S32M2I:
+        gen_mxu_s32m2i(ctx);
+        return true;
+    case OPC_MXU_S32I2M:
         gen_mxu_s32i2m(ctx);
         return true;
-    }
-
-    {
-        TCGv t_mxu_cr = tcg_temp_new();
-        TCGLabel *l_exit = gen_new_label();
-
-        gen_load_mxu_cr(t_mxu_cr);
-        tcg_gen_andi_tl(t_mxu_cr, t_mxu_cr, MXU_CR_MXU_EN);
-        tcg_gen_brcondi_tl(TCG_COND_NE, t_mxu_cr, MXU_CR_MXU_EN, l_exit);
+    case OPC_MXU__POOL00:
+    case OPC_MXU_D16MUL:
+    case OPC_MXU_D16MAC:
+    case OPC_MXU__POOL04:
+    case OPC_MXU_S8LDD:
+    case OPC_MXU__POOL16:
+    case OPC_MXU__POOL19:
+        {
+            TCGv t_mxu_cr = tcg_temp_new();
+            TCGLabel *l_exit = gen_new_label();
+
+            gen_load_mxu_cr(t_mxu_cr);
+            tcg_gen_andi_tl(t_mxu_cr, t_mxu_cr, MXU_CR_MXU_EN);
+            tcg_gen_brcondi_tl(TCG_COND_NE, t_mxu_cr, MXU_CR_MXU_EN, l_exit);
+
+            switch (opcode) {
+            case OPC_MXU__POOL00:
+                decode_opc_mxu__pool00(ctx);
+                break;
+            case OPC_MXU_D16MUL:
+                gen_mxu_d16mul(ctx);
+                break;
+            case OPC_MXU_D16MAC:
+                gen_mxu_d16mac(ctx);
+                break;
+            case OPC_MXU__POOL04:
+                decode_opc_mxu__pool04(ctx);
+                break;
+            case OPC_MXU_S8LDD:
+                gen_mxu_s8ldd(ctx);
+                break;
+            case OPC_MXU__POOL16:
+                decode_opc_mxu__pool16(ctx);
+                break;
+            case OPC_MXU__POOL19:
+                decode_opc_mxu__pool19(ctx);
+                break;
+            default:
+                MIPS_INVAL("decode_opc_mxu");
+                gen_reserved_instruction(ctx);
+            }
 
-        switch (opcode) {
-        case OPC_MXU__POOL00:
-            decode_opc_mxu__pool00(ctx);
-            break;
-        case OPC_MXU_D16MUL:
-            gen_mxu_d16mul(ctx);
-            break;
-        case OPC_MXU_D16MAC:
-            gen_mxu_d16mac(ctx);
-            break;
-        case OPC_MXU__POOL04:
-            decode_opc_mxu__pool04(ctx);
-            break;
-        case OPC_MXU_S8LDD:
-            gen_mxu_s8ldd(ctx);
-            break;
-        case OPC_MXU__POOL16:
-            decode_opc_mxu__pool16(ctx);
-            break;
-        case OPC_MXU__POOL19:
-            decode_opc_mxu__pool19(ctx);
-            break;
-        default:
-            MIPS_INVAL("decode_opc_mxu");
-            gen_reserved_instruction(ctx);
+            gen_set_label(l_exit);
+            tcg_temp_free(t_mxu_cr);
         }
-
-        gen_set_label(l_exit);
-        tcg_temp_free(t_mxu_cr);
+        return true;
+    default:
+        return false;
     }
-
-    return true;
 }
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index c8a3f63203..a5e89c528d 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -13766,14 +13766,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         decode_opc_special(env, ctx);
         break;
     case OPC_SPECIAL2:
-        if (TARGET_LONG_BITS == 32 && (ctx->insn_flags & ASE_MXU)) {
-            if (MASK_SPECIAL2(ctx->opcode) == OPC_MUL) {
-                gen_arith(ctx, OPC_MUL, rd, rs, rt);
-            } else {
-                decode_ase_mxu(ctx, ctx->opcode);
-            }
-            break;
-        }
         decode_opc_special2_legacy(env, ctx);
         break;
     case OPC_SPECIAL3:
@@ -14484,6 +14476,11 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     if (cpu_supports_isa(env, ASE_LMMI) && decode_ase_lmmi(ctx, ctx->opcode)) {
         return;
     }
+    if (TARGET_LONG_BITS == 32) {
+        if (cpu_supports_isa(env, ASE_MXU) && decode_ase_mxu(ctx, ctx->opcode)) {
+            return;
+        }
+    }
     if (ase_msa_available(env) && decode_ase_msa(ctx, ctx->opcode)) {
         return;
     }
-- 
2.34.1


