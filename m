Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B805B518B
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 00:29:01 +0200 (CEST)
Received: from localhost ([::1]:36978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXVRk-0000k7-Gj
	for lists+qemu-devel@lfdr.de; Sun, 11 Sep 2022 18:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVPY-0005sZ-IY
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 18:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oXVPW-00027b-U0
 for qemu-devel@nongnu.org; Sun, 11 Sep 2022 18:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662935202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y71Jb9qkkoQ9TDS2b/TKh10oAYuaouXMle09gl2ybQ4=;
 b=ZHIMADuSiIV0qq/kChmkJjDJJQHmUzJ+OF5kl21FhtpYeGiJ349ee9jkpRlKHWvJvPlf8p
 7UwayYxIjxwjfdvS7zVWryR8f4mWHqooP4N3AWCmAQqIdxmMqok6aEzssjeq4xLVc1IzH0
 tBSAwbtW1mCsNqwvwwiHq0UWeeRQs9E=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-iFtp7fpSNCeogWVfsDeCZA-1; Sun, 11 Sep 2022 18:26:40 -0400
X-MC-Unique: iFtp7fpSNCeogWVfsDeCZA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y9-20020a056402270900b00451dfbbc9b2so420785edd.12
 for <qemu-devel@nongnu.org>; Sun, 11 Sep 2022 15:26:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Y71Jb9qkkoQ9TDS2b/TKh10oAYuaouXMle09gl2ybQ4=;
 b=ZQC/IQAv73+0wOKbCox6zLCF4TETGFMY8dnMX5XXFaL8eUAXm4hiPqmrVwA2ANreYv
 iMojbgexKeoImvd7/KnyayYuN+aGcbX/MvCM3XogMPwyz1oaHGJF6EXh/OZMNBZxm5AY
 Ij3FFtJSDjWnib8Y5IjQmHineo4WOR+24i2tSkBh+t34gQnenzA0ekth8gmlVg1xHZow
 iADChdVUjxTOMJNGiaskzazpd7zhvU+PU/agcba763luJJkLSnlYjI+S9SUlkZf9Oc64
 /GANWufXsh96HphrlvIvQ/0oyo4iYjzHOltVn2l+aWN9NQfYpyTKNNA7ABcJKx/bqXHm
 xqZQ==
X-Gm-Message-State: ACgBeo2n+bPSg4zXw7+vKWP3l/eVr0cX4VZlLQKim8CqoSfkul07ES2w
 Zp+GSxa/mJiLVvmOgkjynJ2wFwcNG9/bY59Lqie4G+uHBP3kBfMC2MbAsDW/HKWXbwFzu4MrJY1
 M7xCdfWIf5NXcRHcRLE/d61TcujIxI1JKGwFpZLnOC0zY31Zt0wEAJ0e9e800fxVYo2U=
X-Received: by 2002:a17:906:cc56:b0:779:ed37:b59e with SMTP id
 mm22-20020a170906cc5600b00779ed37b59emr8706852ejb.536.1662935198895; 
 Sun, 11 Sep 2022 15:26:38 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4VUDc2xEl+t4eI3OH0YVJ31LbjDR6q6RQtLGJl4zUbuvR9CrnWZ4OQMkduW8iRcLneeSNUAA==
X-Received: by 2002:a17:906:cc56:b0:779:ed37:b59e with SMTP id
 mm22-20020a170906cc5600b00779ed37b59emr8706848ejb.536.1662935198537; 
 Sun, 11 Sep 2022 15:26:38 -0700 (PDT)
Received: from goa-sendmail (93-44-39-154.ip95.fastwebnet.it. [93.44.39.154])
 by smtp.gmail.com with ESMTPSA id
 o13-20020a170906768d00b00773c60c2129sm3493306ejm.141.2022.09.11.15.26.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Sep 2022 15:26:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] target/i386: fix cmpxchg with 32-bit register destination
Date: Mon, 12 Sep 2022 00:26:29 +0200
Message-Id: <20220911222630.338330-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220911222630.338330-1-pbonzini@redhat.com>
References: <20220911222630.338330-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Unlike the memory case, where "the destination operand receives a write
cycle without regard to the result of the comparison", rm must not be
touched altogether if the write fails, including not zero-extending
it on 64-bit processors.  This is not how the movcond currently works,
because it is always followed by a gen_op_mov_reg_v to rm.

To fix it, introduce a new function that is similar to gen_op_mov_reg_v
but writes to a TCG temporary.

Considering that gen_extu(ot, oldv) is not needed in the memory case
either, the two cases for register and memory destinations are different
enough that one might as well fuse the two "if (mod == 3)" into one.
So do that too.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/translate.c | 73 ++++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 22 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index d6420df31d..0e9237d627 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -429,32 +429,51 @@ static inline MemOp mo_b_d32(int b, MemOp ot)
     return b & 1 ? (ot == MO_16 ? MO_16 : MO_32) : MO_8;
 }
 
-static void gen_op_mov_reg_v(DisasContext *s, MemOp ot, int reg, TCGv t0)
+/* Compute the result of writing t0 to the OT-sized register REG.
+ *
+ * If DEST is NULL, store the result into the register and return the
+ * register's TCGv.
+ *
+ * If DEST is not NULL, store the result into DEST and return the
+ * register's TCGv.
+ */
+static TCGv gen_op_deposit_reg_v(DisasContext *s, MemOp ot, int reg, TCGv dest, TCGv t0)
 {
     switch(ot) {
     case MO_8:
-        if (!byte_reg_is_xH(s, reg)) {
-            tcg_gen_deposit_tl(cpu_regs[reg], cpu_regs[reg], t0, 0, 8);
-        } else {
-            tcg_gen_deposit_tl(cpu_regs[reg - 4], cpu_regs[reg - 4], t0, 8, 8);
+        if (byte_reg_is_xH(s, reg)) {
+            dest = dest ? dest : cpu_regs[reg - 4];
+            tcg_gen_deposit_tl(dest, cpu_regs[reg - 4], t0, 8, 8);
+            return cpu_regs[reg - 4];
         }
+        dest = dest ? dest : cpu_regs[reg];
+        tcg_gen_deposit_tl(dest, cpu_regs[reg], t0, 0, 8);
         break;
     case MO_16:
-        tcg_gen_deposit_tl(cpu_regs[reg], cpu_regs[reg], t0, 0, 16);
+        dest = dest ? dest : cpu_regs[reg];
+        tcg_gen_deposit_tl(dest, cpu_regs[reg], t0, 0, 16);
         break;
     case MO_32:
         /* For x86_64, this sets the higher half of register to zero.
            For i386, this is equivalent to a mov. */
-        tcg_gen_ext32u_tl(cpu_regs[reg], t0);
+        dest = dest ? dest : cpu_regs[reg];
+        tcg_gen_ext32u_tl(dest, t0);
         break;
 #ifdef TARGET_X86_64
     case MO_64:
-        tcg_gen_mov_tl(cpu_regs[reg], t0);
+        dest = dest ? dest : cpu_regs[reg];
+        tcg_gen_mov_tl(dest, t0);
         break;
 #endif
     default:
         tcg_abort();
     }
+    return cpu_regs[reg];
+}
+
+static void gen_op_mov_reg_v(DisasContext *s, MemOp ot, int reg, TCGv t0)
+{
+    gen_op_deposit_reg_v(s, ot, reg, NULL, t0);
 }
 
 static inline
@@ -5495,26 +5514,36 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                                           s->mem_index, ot | MO_LE);
                 gen_op_mov_reg_v(s, ot, R_EAX, oldv);
             } else {
+                gen_extu(ot, cmpv);
                 if (mod == 3) {
+                    TCGv dest;
                     rm = (modrm & 7) | REX_B(s);
                     gen_op_mov_v_reg(s, ot, oldv, rm);
+                    gen_extu(ot, oldv);
+
+                    /*
+                     * Unlike the memory case, where "the destination operand receives
+                     * a write cycle without regard to the result of the comparison",
+                     * rm must not be touched altogether if the write fails, including
+                     * not zero-extending it on 64-bit processors.  So, precompute
+                     * the result of a successful writeback and perform the movcond
+                     * directly on cpu_regs.  Also need to write accumulator first, in
+                     * case rm is part of RAX too.
+                     */
+                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
+                    dest = gen_op_deposit_reg_v(s, ot, rm, newv, newv);
+                    tcg_gen_movcond_tl(TCG_COND_EQ, dest, oldv, cmpv, newv, dest);
                 } else {
                     gen_lea_modrm(env, s, modrm);
                     gen_op_ld_v(s, ot, oldv, s->A0);
-                    rm = 0; /* avoid warning */
-                }
-                gen_extu(ot, oldv);
-                gen_extu(ot, cmpv);
-                /* store value = (old == cmp ? new : old);  */
-                tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
-                if (mod == 3) {
-                    gen_op_mov_reg_v(s, ot, R_EAX, oldv);
-                    gen_op_mov_reg_v(s, ot, rm, newv);
-                } else {
-                    /* Perform an unconditional store cycle like physical cpu;
-                       must be before changing accumulator to ensure
-                       idempotency if the store faults and the instruction
-                       is restarted */
+
+                    /*
+                     * Perform an unconditional store cycle like physical cpu;
+                     * must be before changing accumulator to ensure
+                     * idempotency if the store faults and the instruction
+                     * is restarted
+                     */
+                    tcg_gen_movcond_tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
                     gen_op_st_v(s, ot, newv, s->A0);
                     gen_op_mov_reg_v(s, ot, R_EAX, oldv);
                 }
-- 
2.37.2



