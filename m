Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA36770DC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 20:05:03 +0200 (CEST)
Received: from localhost ([::1]:42748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hr4aT-0007Fa-Qh
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 14:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59946)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr4O8-0008Do-5O
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 13:52:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr4Nu-0001Pj-88
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 13:52:13 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:39246)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr4Nu-00017Y-0H
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 13:52:02 -0400
Received: by mail-pf1-x441.google.com with SMTP id f17so20864591pfn.6
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 10:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p0rmZulySAyfFLpagWq7oUqjHQLoiP7mX2YCEOpaKkw=;
 b=cQRG/J8wdaeIQa1d78ZU1v82b4g3H1w2EnWaY/CpFqWTbdNYoY4OjkLDuT/d1JKiqD
 BZO1NxsAwKo7LmfcyZA6zG4QTX75+laq6A0w8/6Ofx1xKfE1HVqh0D6XIN59O7vfEitv
 8PUIe5fSiibdNIL4cHZfRJ8LqTCcjdGzi5EmOK+VtPe/1dHgh0Nias4XzXVJ5jOxFCMS
 TNyYOMuyseQuRppiv8JCvnmus0kwTGNV53LXWryDDtBkkseOtqN+aLskoVfKfenpedoJ
 hTtFjF4J+UYTQ0LNF834xnFsv+vRsyPzQFp1/D+GJj7WcosPr8cGgY1qAzBrQq/jvdw4
 gV/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p0rmZulySAyfFLpagWq7oUqjHQLoiP7mX2YCEOpaKkw=;
 b=jjTH76XLHs7aoteGwWJXbd8p8+lfqLQLFLHQcjek8awLSLdz1ELDbWq5vvelj6+DYc
 KWe00zTPbeKIK6/weIWV0VpkSVD44nxSrglQUIRIyGwLZH9AGMLHMYYTXvblRmAkcB9T
 ADekhEiWnI7RiIhkqE0t8OgwynIjLOF5m11gt+d//MVGE/+ItHUyEXwSgDZRdcbvg5AK
 sjBiLIFEngiR8oOlZNmSYQJSLFBuLjy7QfXxP3XhaUkWb3iCoAdhk7P+Kp8ZpqD9ePZc
 pd/UFUYwYyWDL8lS6bfSjDb7pzrdVDIwbems7sMfs6SoGU/YvL9CKXgMSo04FZvB48iz
 qjgQ==
X-Gm-Message-State: APjAAAWy2WO0tlf2OIVggzDIFTeTDICDPQYfyWYcINonP5gZ2nH1syNh
 MdfG4iizluMhxbP06iq3jV/TTLHbz6w=
X-Google-Smtp-Source: APXvYqwyV4ssXD5XBnpkN0d44Pjw31q0galkVm2aDIJ9LQqyOSSHCSbjMJJc+bxnzppbWU02Oi0Hfw==
X-Received: by 2002:a63:c442:: with SMTP id m2mr93954716pgg.286.1564163508292; 
 Fri, 26 Jul 2019 10:51:48 -0700 (PDT)
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net.
 [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.51.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 10:51:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 26 Jul 2019 10:50:27 -0700
Message-Id: <20190726175032.6769-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH 62/67] target/arm: Convert T16, load (literal)
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 42 ++----------------------------------------
 target/arm/t16.decode  |  4 ++++
 2 files changed, 6 insertions(+), 40 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index f9022fe65c..f1cab437e0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -1011,14 +1011,6 @@ static inline void gen_aa32_ld##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 a32, int index)            \
 {                                                                        \
     gen_aa32_ld_i32(s, val, a32, index, OPC | s->be_data);               \
-}                                                                        \
-static inline void gen_aa32_ld##SUFF##_iss(DisasContext *s,              \
-                                           TCGv_i32 val,                 \
-                                           TCGv_i32 a32, int index,      \
-                                           ISSInfo issinfo)              \
-{                                                                        \
-    gen_aa32_ld##SUFF(s, val, a32, index);                               \
-    disas_set_da_iss(s, OPC, issinfo);                                   \
 }
 
 #define DO_GEN_ST(SUFF, OPC)                                             \
@@ -1026,14 +1018,6 @@ static inline void gen_aa32_st##SUFF(DisasContext *s, TCGv_i32 val,      \
                                      TCGv_i32 a32, int index)            \
 {                                                                        \
     gen_aa32_st_i32(s, val, a32, index, OPC | s->be_data);               \
-}                                                                        \
-static inline void gen_aa32_st##SUFF##_iss(DisasContext *s,              \
-                                           TCGv_i32 val,                 \
-                                           TCGv_i32 a32, int index,      \
-                                           ISSInfo issinfo)              \
-{                                                                        \
-    gen_aa32_st##SUFF(s, val, a32, index);                               \
-    disas_set_da_iss(s, OPC, issinfo | ISSIsWrite);                      \
 }
 
 static inline void gen_aa32_frob64(DisasContext *s, TCGv_i64 val)
@@ -1082,9 +1066,7 @@ static inline void gen_aa32_st64(DisasContext *s, TCGv_i64 val,
     gen_aa32_st_i64(s, val, a32, index, MO_Q | s->be_data);
 }
 
-DO_GEN_LD(8s, MO_SB)
 DO_GEN_LD(8u, MO_UB)
-DO_GEN_LD(16s, MO_SW)
 DO_GEN_LD(16u, MO_UW)
 DO_GEN_LD(32u, MO_UL)
 DO_GEN_ST(8, MO_UB)
@@ -10657,11 +10639,10 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
 
 static void disas_thumb_insn(DisasContext *s, uint32_t insn)
 {
-    uint32_t val, rd;
+    uint32_t val;
     int32_t offset;
     TCGv_i32 tmp;
     TCGv_i32 tmp2;
-    TCGv_i32 addr;
 
     if (disas_t16(s, insn)) {
         return;
@@ -10671,26 +10652,7 @@ static void disas_thumb_insn(DisasContext *s, uint32_t insn)
     switch (insn >> 12) {
     case 0: case 1: /* add/sub (3reg, 2reg imm), shift imm; in decodetree */
     case 2: case 3: /* add, sub, cmp, mov (reg, imm), in decodetree */
-        goto illegal_op;
-    case 4:
-        if (insn & (1 << 11)) {
-            rd = (insn >> 8) & 7;
-            /* load pc-relative.  Bit 1 of PC is ignored.  */
-            addr = add_reg_for_lit(s, 15, (insn & 0xff) * 4);
-            tmp = tcg_temp_new_i32();
-            gen_aa32_ld32u_iss(s, tmp, addr, get_mem_index(s),
-                               rd | ISSIs16Bit);
-            tcg_temp_free_i32(addr);
-            store_reg(s, rd, tmp);
-            break;
-        }
-
-        /*
-         * - Data-processing (two low registers), in decodetree
-         * - data processing extended, branch and exchange, in decodetree
-         */
-        goto illegal_op;
-
+    case 4: /* ldr lit, data proc (2reg), data proc ext, bx; in decodetree */
     case 5: /* load/store register offset, in decodetree */
     case 6: /* load/store word immediate offset, in decodetree */
     case 7: /* load/store byte immediate offset, in decodetree */
diff --git a/target/arm/t16.decode b/target/arm/t16.decode
index ddffd073a2..c18d146a84 100644
--- a/target/arm/t16.decode
+++ b/target/arm/t16.decode
@@ -113,6 +113,10 @@ LDRH_ri         10001 ..... ... ...             @ldst_ri_2
 STR_ri          10010 ... ........              @ldst_spec_i rn=13
 LDR_ri          10011 ... ........              @ldst_spec_i rn=13
 
+# Load (PC-relative)
+
+LDR_ri          01001 ... ........              @ldst_spec_i rn=15
+
 # Add PC/SP (immediate)
 
 ADR             10100 rd:3 ........             imm=%imm8_0x4
-- 
2.17.1


