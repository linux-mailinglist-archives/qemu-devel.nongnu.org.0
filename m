Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3EA43FAD0
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 12:34:13 +0200 (CEST)
Received: from localhost ([::1]:59992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgPDA-0008R1-PE
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 06:34:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNoN-0002N3-2K
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:04:31 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNoJ-0006pw-Vx
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:04:30 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so10111245pje.0
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rbt+tpMjnq4IOuZ+lSlbc+IgtGOMsUMuQxTyTcKKG7g=;
 b=bW2mqPjgb30AbZgcWRWlTz8McMoAbUb5tvNhvbfkkPBgUyDUtVnl+gRzlkDvN6vbqt
 fEsfl92JbSPqUIaDX+yAXPjfrVmIxZwGqcLyt8Fkl9Su6m7+67sQQx71LCd6P1d3R2Oq
 VfCPJ6YXe8A4kuWtL+y088Bf2l5kja3D51DZB6thrrh7sAqXMPePeTUyq4E3TcOVLJQw
 oiEX9yiaNxGSCmG8eRbXRS9k+ZRrw7CBGuuzD1UwlaCssjX+5HL1pe1MuxemTHpIWcHC
 zWcnVHHzdwlTxg984w6OWSaCIQk7Ym6q3DjC4cwpd83B6p9aN0AEEZ09CyAuObvfGXff
 NMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rbt+tpMjnq4IOuZ+lSlbc+IgtGOMsUMuQxTyTcKKG7g=;
 b=YV5/kvoAZMLOSHS/p8gmWuwWwUTpGV8pCcP8tRTzh5jQIZar/pm0hUcdGe0ajaz4V/
 8fGY/G+1k46wjxPd2YwDfRKmfBGYsmbzkep5EscC5IxM4Z+17raPpcsbZbJavp4E5Try
 uWYYZSejYsNjdP9tpxRp1l3ZfK8MfREIHolGiuE/3AsMeqfw2uI3dr9zUtXpe2DSj7eV
 mb3zyw6akw1q530Ej42J7hspQoYj6lIyHjhx1XbgAb+GumJlOTFBfQruHKX/Jo1uqhAs
 mUyZzyOY16m8vcuTCGooJu6ekjSBwfvRpUNY2B2XYumwZlOyoTkqlm+r1LLrGlAuQU8h
 X0iw==
X-Gm-Message-State: AOAM5330Wa4VBhxRoQVBI3VBnngNV4901pz2OKhUq4ObktWzor03DRUB
 n6ZoJ6fFGgDsTXqJFpZHv1Kh667njtK278WN
X-Google-Smtp-Source: ABdhPJyTq3h2eHnCIqSxcBR0KoiYZ6lO/nhnIQZ824elnBhlHYRj3Zt45oPVHhUTWj3PpwRs2WJ/8A==
X-Received: by 2002:a17:90b:92:: with SMTP id
 bb18mr376101pjb.133.1635498263303; 
 Fri, 29 Oct 2021 02:04:23 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:04:23 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 75/76] target/riscv: rvv-1.0: rename vmandnot.mm and
 vmornot.mm to vmandn.mm and vmorn.mm
Date: Fri, 29 Oct 2021 16:59:20 +0800
Message-Id: <20211029085922.255197-76-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   | 4 ++--
 target/riscv/insn32.decode              | 4 ++--
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 target/riscv/vector_helper.c            | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 6e58343af35..c15497e4a15 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1016,11 +1016,11 @@ DEF_HELPER_6(vfwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_6(vmand_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmnand_mm, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmandnot_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmandn_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
-DEF_HELPER_6(vmornot_mm, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vmorn_mm, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vmxnor_mm, void, ptr, ptr, ptr, ptr, env, i32)
 
 DEF_HELPER_4(vcpop_m, tl, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1a4a2871464..8617307b29a 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -635,11 +635,11 @@ vfredmax_vs     000111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwredsum_vs    1100-1 . ..... ..... 001 ..... 1010111 @r_vm
 vmand_mm        011001 - ..... ..... 010 ..... 1010111 @r
 vmnand_mm       011101 - ..... ..... 010 ..... 1010111 @r
-vmandnot_mm     011000 - ..... ..... 010 ..... 1010111 @r
+vmandn_mm       011000 - ..... ..... 010 ..... 1010111 @r
 vmxor_mm        011011 - ..... ..... 010 ..... 1010111 @r
 vmor_mm         011010 - ..... ..... 010 ..... 1010111 @r
 vmnor_mm        011110 - ..... ..... 010 ..... 1010111 @r
-vmornot_mm      011100 - ..... ..... 010 ..... 1010111 @r
+vmorn_mm        011100 - ..... ..... 010 ..... 1010111 @r
 vmxnor_mm       011111 - ..... ..... 010 ..... 1010111 @r
 vcpop_m         010000 . ..... 10000 010 ..... 1010111 @r2_vm
 vfirst_m        010000 . ..... 10001 010 ..... 1010111 @r2_vm
diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 97b1dc10265..33ef7926e64 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2862,11 +2862,11 @@ static bool trans_##NAME(DisasContext *s, arg_r *a)                \
 
 GEN_MM_TRANS(vmand_mm)
 GEN_MM_TRANS(vmnand_mm)
-GEN_MM_TRANS(vmandnot_mm)
+GEN_MM_TRANS(vmandn_mm)
 GEN_MM_TRANS(vmxor_mm)
 GEN_MM_TRANS(vmor_mm)
 GEN_MM_TRANS(vmnor_mm)
-GEN_MM_TRANS(vmornot_mm)
+GEN_MM_TRANS(vmorn_mm)
 GEN_MM_TRANS(vmxnor_mm)
 
 /* Vector count population in mask vcpop */
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 4c1a1310e63..ad505ec9b21 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4470,11 +4470,11 @@ void HELPER(NAME)(void *vd, void *v0, void *vs1,          \
 
 GEN_VEXT_MASK_VV(vmand_mm, DO_AND)
 GEN_VEXT_MASK_VV(vmnand_mm, DO_NAND)
-GEN_VEXT_MASK_VV(vmandnot_mm, DO_ANDNOT)
+GEN_VEXT_MASK_VV(vmandn_mm, DO_ANDNOT)
 GEN_VEXT_MASK_VV(vmxor_mm, DO_XOR)
 GEN_VEXT_MASK_VV(vmor_mm, DO_OR)
 GEN_VEXT_MASK_VV(vmnor_mm, DO_NOR)
-GEN_VEXT_MASK_VV(vmornot_mm, DO_ORNOT)
+GEN_VEXT_MASK_VV(vmorn_mm, DO_ORNOT)
 GEN_VEXT_MASK_VV(vmxnor_mm, DO_XNOR)
 
 /* Vector count population in mask vcpop */
-- 
2.25.1


