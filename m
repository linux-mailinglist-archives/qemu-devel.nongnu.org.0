Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE195355DB
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 23:54:12 +0200 (CEST)
Received: from localhost ([::1]:40504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLQp-00072i-Qt
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 17:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCT-0001w7-T4; Thu, 26 May 2022 17:39:22 -0400
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34]:35623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCS-0008Aw-7d; Thu, 26 May 2022 17:39:21 -0400
Received: by mail-oo1-xc34.google.com with SMTP id
 a16-20020a4ad1d0000000b0040edb942aa2so124292oos.2; 
 Thu, 26 May 2022 14:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZPMxauLQzqGZMA2XAOP14VZN+YIw1f6RR3xyPK7LGo=;
 b=Wx5mgqwwJ/RyT8icdNpQkwyKjDlXiWMwRvZjB6H4Wex531omto/6OuBqn4eDxNr6iW
 zX8tXh89y2L4+wEmuXriJRkwAG/UZ4zX2j2t9hvdMPm2Td2F/eqzZv+x9ze/soyzoVKA
 KRJ2AY8VLRE+bpcG1IF83T0FWgJQm5kE5SvB3JnigwAUI3hKdTm12E3CVXiY+OWOJKk7
 /i7n/68o03PQS+N3ACVIrw2u1Z1/rg+ZjI+LuCQOfMrgX6251DMCgiBu48LqNABctu5O
 xrSpyGSjrBn5L9jRSzQs0ztCTuwo1OmGJN2qvNNHhCkHJaLi0WGgHaVIHxo7gztTRmwN
 KIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ZPMxauLQzqGZMA2XAOP14VZN+YIw1f6RR3xyPK7LGo=;
 b=Hb3b2S1uP9ribNP40LDbqh9AluWN0Mm/Pcd51WTu6f6g6a0r6h/tbGmccwCtePcYAN
 NGwOgtRgen4xYpQ+mdUW3eWdkfwOlzDKhu85au8KbAU2ZFVeGsCYGSFBf6o30nKEGOzZ
 ivCVA5kTanxeWoYfCWC9AMxadWbEW+EHO+XrDysCmvbxc4UwyMzrqtIwzx5jCWvaxrEv
 jnBJRTgtX1sgJ6mWmsXiA4J/umH5soSua9JmZWA4CLpOp+Tr3/lsqtO9Y9cvn/Juqf8C
 xpOwabmWDZ/GKF0ebkpnjaDKarpAFd86yjiSxXPWhQR91ln/vHX1XT/GOtvHuh7ev/HM
 WE6w==
X-Gm-Message-State: AOAM533cBn0P4JgpFE+r+fr2CCYejNkA0mIiSZ6YC2WSp5ZY7b+RYFlU
 AemFZ51tnsFBtw+F2BzX1lwFfdbsdek=
X-Google-Smtp-Source: ABdhPJwWRBV8IarwLAe5C7hxFn9Hrajp9rpC5u/t0lFpSGRN/GFYu0mk8pEs475Te17txPaWSbQevA==
X-Received: by 2002:a4a:2819:0:b0:40e:6f37:1ae8 with SMTP id
 h25-20020a4a2819000000b0040e6f371ae8mr11695621ooa.44.1653601158792; 
 Thu, 26 May 2022 14:39:18 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 16/34] target/ppc: declare xscvspdpn helper with call flags
Date: Thu, 26 May 2022 18:37:57 -0300
Message-Id: <20220526213815.92701-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c34;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Move xscvspdpn to decodetree, declare helper_xscvspdpn with
TCG_CALL_NO_RWG_SE and drop the unused env argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517123929.284511-7-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c             |  2 +-
 target/ppc/helper.h                 |  2 +-
 target/ppc/insn32.decode            |  1 +
 target/ppc/translate/vsx-impl.c.inc | 22 +++++++++++++++++++++-
 target/ppc/translate/vsx-ops.c.inc  |  1 -
 5 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 588448702f..55ef4b5d48 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2878,7 +2878,7 @@ uint64_t helper_xscvdpspn(CPUPPCState *env, uint64_t xb)
     return (result << 32) | result;
 }
 
-uint64_t helper_xscvspdpn(CPUPPCState *env, uint64_t xb)
+uint64_t helper_XSCVSPDPN(uint64_t xb)
 {
     return helper_todouble(xb >> 32);
 }
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ddfa0308bc..9be69fa91e 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -395,7 +395,7 @@ DEF_HELPER_3(XSCVSQQP, void, env, vsr, vsr)
 DEF_HELPER_3(xscvhpdp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvsdqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvspdp, void, env, vsr, vsr)
-DEF_HELPER_2(xscvspdpn, i64, env, i64)
+DEF_HELPER_FLAGS_1(XSCVSPDPN, TCG_CALL_NO_RWG_SE, i64, i64)
 DEF_HELPER_3(xscvdpsxds, void, env, vsr, vsr)
 DEF_HELPER_3(xscvdpsxws, void, env, vsr, vsr)
 DEF_HELPER_3(xscvdpuxds, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 1d0b55bde3..d4c2615b1a 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -708,6 +708,7 @@ XSCVUQQP        111111 ..... 00011 ..... 1101000100 -   @X_tb
 XSCVSQQP        111111 ..... 01011 ..... 1101000100 -   @X_tb
 XVCVBF16SPN     111100 ..... 10000 ..... 111011011 ..   @XX2
 XVCVSPBF16      111100 ..... 10001 ..... 111011011 ..   @XX2
+XSCVSPDPN       111100 ..... ----- ..... 101001011 ..   @XX2
 
 ## VSX Vector Test Least-Significant Bit by Byte Instruction
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 3692740736..9b4f309d9d 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1045,7 +1045,27 @@ GEN_VSX_HELPER_R2(xscvqpuwz, 0x04, 0x1A, 0x01, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvhpdp, 0x16, 0x15, 0x10, PPC2_ISA300)
 GEN_VSX_HELPER_R2(xscvsdqp, 0x04, 0x1A, 0x0A, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvspdp, 0x12, 0x14, 0, PPC2_VSX)
-GEN_VSX_HELPER_XT_XB_ENV(xscvspdpn, 0x16, 0x14, 0, PPC2_VSX207)
+
+bool trans_XSCVSPDPN(DisasContext *ctx, arg_XX2 *a)
+{
+    TCGv_i64 tmp;
+
+    REQUIRE_INSNS_FLAGS2(ctx, VSX207);
+    REQUIRE_VSX(ctx);
+
+    tmp = tcg_temp_new_i64();
+    get_cpu_vsr(tmp, a->xb, true);
+
+    gen_helper_XSCVSPDPN(tmp, tmp);
+
+    set_cpu_vsr(a->xt, tmp, true);
+    set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
+
+    tcg_temp_free_i64(tmp);
+
+    return true;
+}
+
 GEN_VSX_HELPER_X2(xscvdpsxds, 0x10, 0x15, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2(xscvdpsxws, 0x10, 0x05, 0, PPC2_VSX)
 GEN_VSX_HELPER_X2(xscvdpuxds, 0x10, 0x14, 0, PPC2_VSX)
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index b8fd116728..52d7ab30cd 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -200,7 +200,6 @@ GEN_XX2FORM(xscvdpspn, 0x16, 0x10, PPC2_VSX207),
 GEN_XX2FORM_EO(xscvhpdp, 0x16, 0x15, 0x10, PPC2_ISA300),
 GEN_VSX_XFORM_300_EO(xscvsdqp, 0x04, 0x1A, 0x0A, 0x00000001),
 GEN_XX2FORM(xscvspdp, 0x12, 0x14, PPC2_VSX),
-GEN_XX2FORM(xscvspdpn, 0x16, 0x14, PPC2_VSX207),
 GEN_XX2FORM(xscvdpsxds, 0x10, 0x15, PPC2_VSX),
 GEN_XX2FORM(xscvdpsxws, 0x10, 0x05, PPC2_VSX),
 GEN_XX2FORM(xscvdpuxds, 0x10, 0x14, PPC2_VSX),
-- 
2.36.1


