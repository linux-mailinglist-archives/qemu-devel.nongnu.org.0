Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C72873DE58A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:39:28 +0200 (CEST)
Received: from localhost ([::1]:60530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAmD9-00033c-S0
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt4-0005Uz-UM
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:42 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:53125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlt2-0005Dw-Ll
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:18:42 -0400
Received: by mail-pj1-x1035.google.com with SMTP id nh14so16311964pjb.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=69LGSHrZA8s6OztFXTjeUBON6mz5Oha+x+e5NBengCE=;
 b=WZM9M3vBndwAKHHv5B/kTekJndVB3QF5KJvK/4D0RVBKuCtjEJMz26gEeO6TWfjNHf
 Ojs/prbe5g6R8UrGipjzmdCTJ4bHQQKEwAtuczL+5b9al90WLwaBk2Pww8OSIoDa5UVC
 HiSy2uZaqt4sQ8KKNbncYoOBaInnf8JuNPMOT1lMdlQ+Yw0ay8pN/JPHyiLIJenMkTPe
 lCEBl55ClqgrS2q0q8bLV5dL0c4WV4+R3YbzM3flWoLdd2CE8jk+y5CsQohc2J7h9+5H
 WWgn0iVQthmdC1ZPWyETZLjzK7oi5XsJXXHveigo9/CINa56h3rGG93rrS1+5aH5hWvA
 kfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=69LGSHrZA8s6OztFXTjeUBON6mz5Oha+x+e5NBengCE=;
 b=aB1P3Uz9/Prf3X02bXg+Mi/V4wMea17gphtAbv8tRIIui2G3SuVh1AFZYP/SWdV5Dw
 JLexbk+r5YUSlEX5fOQXiNPRsTMmAVP+m4U6OvcdBBEBPAiwIW5r4N09g0XkUgJ2Zb9H
 J2+/41t2ltoah5OQ8rg304TybOx+aZPTZuErghfjWTjHIr5oxSGrT2aa2r0VdLVjLNTg
 lGkVxfGjZ0i1dLyUZF3hhZekHVKUk1o8WN8dc3MmSlyP/pJI5tnMfEWSlrlZa/sbwoC+
 rLX42SViwi9M9inXIku6bufFUVgd+hlT80de4ijMlTBKGYVWSKm6ZKNBCGZM9lMh8MAt
 uLOg==
X-Gm-Message-State: AOAM531PNI4x2MFVffHYVXEJldWUvyVLva+Kwpt/NR7OdKpqvXQvlBW7
 /EmzyosESaVItFlmxytqUj4gmcZueJow3Q==
X-Google-Smtp-Source: ABdhPJyiFWurgJA2NW3XDl6H9gUbbwFe1vSIqQ/4uLB+DYSz2VRrM0bm/J7Yz2QJJ94dpsJXoNrFRg==
X-Received: by 2002:a05:6a00:10d0:b029:337:abdd:be39 with SMTP id
 d16-20020a056a0010d0b0290337abddbe39mr20173201pfu.65.1627964318309; 
 Mon, 02 Aug 2021 21:18:38 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id ns18sm12091020pjb.31.2021.08.02.21.18.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:18:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 43/55] tcg/i386: Support raising sigbus for user-only
Date: Mon,  2 Aug 2021 18:14:31 -1000
Message-Id: <20210803041443.55452-44-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.h     |   2 -
 tcg/i386/tcg-target.c.inc | 114 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 110 insertions(+), 6 deletions(-)

diff --git a/tcg/i386/tcg-target.h b/tcg/i386/tcg-target.h
index b00a6da293..3b2c9437a0 100644
--- a/tcg/i386/tcg-target.h
+++ b/tcg/i386/tcg-target.h
@@ -232,9 +232,7 @@ static inline void tb_target_set_jmp_target(uintptr_t tc_ptr, uintptr_t jmp_rx,
 
 #define TCG_TARGET_HAS_MEMORY_BSWAP  have_movbe
 
-#ifdef CONFIG_SOFTMMU
 #define TCG_TARGET_NEED_LDST_LABELS
-#endif
 #define TCG_TARGET_NEED_POOL_LABELS
 
 #endif
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 1e42a877fb..31dc3fafe9 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -420,8 +420,9 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_VZEROUPPER  (0x77 | P_EXT)
 #define OPC_XCHG_ax_r32	(0x90)
 
-#define OPC_GRP3_Ev	(0xf7)
-#define OPC_GRP5	(0xff)
+#define OPC_GRP3_Eb     (0xf6)
+#define OPC_GRP3_Ev     (0xf7)
+#define OPC_GRP5        (0xff)
 #define OPC_GRP14       (0x73 | P_EXT | P_DATA16)
 
 /* Group 1 opcode extensions for 0x80-0x83.
@@ -443,6 +444,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define SHIFT_SAR 7
 
 /* Group 3 opcode extensions for 0xf6, 0xf7.  To be used with OPC_GRP3.  */
+#define EXT3_TESTi 0
 #define EXT3_NOT   2
 #define EXT3_NEG   3
 #define EXT3_MUL   4
@@ -1604,9 +1606,9 @@ static void tcg_out_nopn(TCGContext *s, int n)
     tcg_out8(s, 0x90);
 }
 
-#if defined(CONFIG_SOFTMMU)
 #include "../tcg-ldst.c.inc"
 
+#if defined(CONFIG_SOFTMMU)
 /* helper signature: helper_ret_ld_mmu(CPUState *env, target_ulong addr,
  *                                     int mmu_idx, uintptr_t ra)
  */
@@ -1915,7 +1917,96 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
     tcg_out_jmp(s, qemu_st_helpers[opc & (MO_BSWAP | MO_SIZE)]);
     return true;
 }
-#elif TCG_TARGET_REG_BITS == 32
+#else
+
+static void tcg_out_test_alignment(TCGContext *s, bool is_ld, TCGReg addrlo,
+                                   TCGReg addrhi, unsigned a_bits)
+{
+    unsigned a_mask = (1 << a_bits) - 1;
+    TCGLabelQemuLdst *label;
+
+    /*
+     * We are expecting a_bits to max out at 7, so we can usually use testb.
+     * For i686, we have to use testl for %esi/%edi.
+     */
+    if (a_mask <= 0xff && (TCG_TARGET_REG_BITS == 64 || addrlo < 4)) {
+        tcg_out_modrm(s, OPC_GRP3_Eb | P_REXB_RM, EXT3_TESTi, addrlo);
+        tcg_out8(s, a_mask);
+    } else {
+        tcg_out_modrm(s, OPC_GRP3_Ev, EXT3_TESTi, addrlo);
+        tcg_out32(s, a_mask);
+    }
+
+    /* jne slow_path */
+    tcg_out_opc(s, OPC_JCC_long + JCC_JNE, 0, 0, 0);
+
+    label = new_ldst_label(s);
+    label->is_ld = is_ld;
+    label->addrlo_reg = addrlo;
+    label->addrhi_reg = addrhi;
+    label->raddr = tcg_splitwx_to_rx(s->code_ptr + 4);
+    label->label_ptr[0] = s->code_ptr;
+
+    s->code_ptr += 4;
+}
+
+static bool tcg_out_fail_alignment(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    MMUAccessType type = l->is_ld ? MMU_DATA_LOAD : MMU_DATA_STORE;
+    TCGReg retaddr;
+
+    /* resolve label address */
+    tcg_patch32(l->label_ptr[0], s->code_ptr - l->label_ptr[0] - 4);
+
+    if (TCG_TARGET_REG_BITS == 32) {
+        int ofs = 0;
+
+        tcg_out_st(s, TCG_TYPE_PTR, TCG_AREG0, TCG_REG_ESP, ofs);
+        ofs += 4;
+
+        tcg_out_st(s, TCG_TYPE_I32, l->addrlo_reg, TCG_REG_ESP, ofs);
+        ofs += 4;
+        if (TARGET_LONG_BITS == 64) {
+            tcg_out_st(s, TCG_TYPE_I32, l->addrhi_reg, TCG_REG_ESP, ofs);
+            ofs += 4;
+        }
+
+        tcg_out_sti(s, TCG_TYPE_I32, type, TCG_REG_ESP, ofs);
+
+        retaddr = TCG_REG_EAX;
+        tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
+        tcg_out_st(s, TCG_TYPE_PTR, retaddr, TCG_REG_ESP, ofs);
+    } else {
+        tcg_out_mov(s, TCG_TYPE_TL, tcg_target_call_iarg_regs[1],
+                    l->addrlo_reg);
+        tcg_out_mov(s, TCG_TYPE_PTR, tcg_target_call_iarg_regs[0], TCG_AREG0);
+        tcg_out_movi(s, TCG_TYPE_I32, tcg_target_call_iarg_regs[2], type);
+
+        retaddr = tcg_target_call_iarg_regs[3];
+        tcg_out_movi(s, TCG_TYPE_PTR, retaddr, (uintptr_t)l->raddr);
+    }
+
+    /*
+     * "Tail call" to the helper, with the return address back inline,
+     * just for the clarity of the debugging traceback -- the helper
+     * cannot return.
+     */
+    tcg_out_push(s, retaddr);
+    tcg_out_jmp(s, (const void *)helper_unaligned_mmu);
+    return true;
+}
+
+static bool tcg_out_qemu_ld_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
+static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
+{
+    return tcg_out_fail_alignment(s, l);
+}
+
+#if TCG_TARGET_REG_BITS == 32
 # define x86_guest_base_seg     0
 # define x86_guest_base_index   -1
 # define x86_guest_base_offset  guest_base
@@ -1949,6 +2040,7 @@ static inline int setup_guest_base_seg(void)
     return 0;
 }
 # endif
+#endif
 #endif /* SOFTMMU */
 
 static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
@@ -2058,6 +2150,8 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
 #if defined(CONFIG_SOFTMMU)
     int mem_index;
     tcg_insn_unit *label_ptr[2];
+#else
+    unsigned a_bits;
 #endif
 
     datalo = *args++;
@@ -2080,6 +2174,11 @@ static void tcg_out_qemu_ld(TCGContext *s, const TCGArg *args, bool is64)
     add_qemu_ldst_label(s, true, is64, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, true, addrlo, addrhi, a_bits);
+    }
+
     tcg_out_qemu_ld_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg,
                            is64, opc);
@@ -2147,6 +2246,8 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
 #if defined(CONFIG_SOFTMMU)
     int mem_index;
     tcg_insn_unit *label_ptr[2];
+#else
+    unsigned a_bits;
 #endif
 
     datalo = *args++;
@@ -2169,6 +2270,11 @@ static void tcg_out_qemu_st(TCGContext *s, const TCGArg *args, bool is64)
     add_qemu_ldst_label(s, false, is64, oi, datalo, datahi, addrlo, addrhi,
                         s->code_ptr, label_ptr);
 #else
+    a_bits = get_alignment_bits(opc);
+    if (a_bits) {
+        tcg_out_test_alignment(s, false, addrlo, addrhi, a_bits);
+    }
+
     tcg_out_qemu_st_direct(s, datalo, datahi, addrlo, x86_guest_base_index,
                            x86_guest_base_offset, x86_guest_base_seg, opc);
 #endif
-- 
2.25.1


