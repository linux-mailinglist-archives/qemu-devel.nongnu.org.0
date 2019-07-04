Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6EBA5FBA9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jul 2019 18:21:46 +0200 (CEST)
Received: from localhost ([::1]:47520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hj4UU-0003bE-2b
	for lists+qemu-devel@lfdr.de; Thu, 04 Jul 2019 12:21:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44173)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hj4HU-000800-93
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 12:08:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hj4HS-0002Ah-Be
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 12:08:20 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:45491)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hj4HQ-00028x-Dp
 for qemu-devel@nongnu.org; Thu, 04 Jul 2019 12:08:16 -0400
Received: by mail-wr1-x443.google.com with SMTP id f9so7149309wre.12
 for <qemu-devel@nongnu.org>; Thu, 04 Jul 2019 09:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JEKrypWivlM4LroK8QYHrkEvHc8PX/KQovIQmzmw7AE=;
 b=T232z+HhaMbCzO+VCVswfH74Spkj4eUkZvD9NYpMj7oZy0awDOjwROJyamA5k/Q0gG
 cEN4GCWyomZW9JFOCYseP7D49g3nDSQO/HWX3Mxcl7iOxFz8kFIJ4oGP+2IYie3nFclb
 fpTFgtDu6fF7G2bHp5QQYEZ6Id4/Gg230b2AEkoO91QC45q9HoHlVRtI7FRLEqPBbuTA
 hoFRr01UEYIfR4roEQByQfalQBU7MkEVnuMY4HWmhs4M58h1B1JNhjcdXB+CIRNPBRhC
 ZuGoQwBLKpqmGUOFK2SE34kOyhmkyBIj2qcujKckxQs9CX+a5sDfbhUmALllK/0J3OnU
 rISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JEKrypWivlM4LroK8QYHrkEvHc8PX/KQovIQmzmw7AE=;
 b=OsOnz43ZF+PIMwuZg62uIrbMZtM8NeO6fCDRvS1H4XHnfP82lzR5M/tlcEEeHy7jde
 O1Q9SChVONBgjRfKxazgWaIbbrc1CA06cUgu/WF1cpR9V25Nm+Ok57aABPSqa1Id+d+V
 g+lIKjY3YRs1IWx521zj6n5P28WwwPmslLB4yZzSC6OawThbu5pAwciJ0tN3Ofy4S3cf
 RS6PchPTHdmgeDPgofx/svNYUc3EgpxsR2f/Zw29iJrnKsb2JsmZ7GANWVdEKFbYoXSZ
 hF4FNPdMPmNfrQ3fzNtYbWNGE8zRviXX+K0R4pag3MjYbNPCUw9WuJ1Rq+39/JNNV+sB
 GIVA==
X-Gm-Message-State: APjAAAVHWpfFcJXRmA2u2e/AUur0Xi1FyF5aettFEym2q7HVMtxGhKSD
 6S3RdldjvlflwebYga/5tgshf+t37UwjWA==
X-Google-Smtp-Source: APXvYqwYAOGBmuaEjTe92vOKMT+u9G2sjLCS7YvY2BT22bofCR9zDqtFoejgzjWhZRqQELfVyHzZTA==
X-Received: by 2002:adf:db4f:: with SMTP id f15mr8592292wrj.188.1562256494977; 
 Thu, 04 Jul 2019 09:08:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s2sm3849690wmj.33.2019.07.04.09.08.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 04 Jul 2019 09:08:14 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  4 Jul 2019 17:07:59 +0100
Message-Id: <20190704160802.12419-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190704160802.12419-1-peter.maydell@linaro.org>
References: <20190704160802.12419-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-devel] [PULL 6/9] target/arm: Use _ra versions of
 cpu_stl_data() in v7M helpers
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

In the various helper functions for v7M/v8M instructions, use
the _ra versions of cpu_stl_data() and friends. Otherwise we
may get wrong behaviour or an assert() due to not being able
to locate the TB if there is an exception on the memory access
or if it performs an IO operation when in icount mode.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20190617175317.27557-5-peter.maydell@linaro.org
---
 target/arm/m_helper.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 1b0ad95a05f..dc6dbd8b961 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -537,8 +537,8 @@ void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
     }
 
     /* Note that these stores can throw exceptions on MPU faults */
-    cpu_stl_data(env, sp, nextinst);
-    cpu_stl_data(env, sp + 4, saved_psr);
+    cpu_stl_data_ra(env, sp, nextinst, GETPC());
+    cpu_stl_data_ra(env, sp + 4, saved_psr, GETPC());
 
     env->regs[13] = sp;
     env->regs[14] = 0xfeffffff;
@@ -953,6 +953,7 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
     /* fptr is the value of Rn, the frame pointer we store the FP regs to */
     bool s = env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_S_MASK;
     bool lspact = env->v7m.fpccr[s] & R_V7M_FPCCR_LSPACT_MASK;
+    uintptr_t ra = GETPC();
 
     assert(env->v7m.secure);
 
@@ -978,7 +979,7 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
      * Note that we do not use v7m_stack_write() here, because the
      * accesses should not set the FSR bits for stacking errors if they
      * fail. (In pseudocode terms, they are AccType_NORMAL, not AccType_STACK
-     * or AccType_LAZYFP). Faults in cpu_stl_data() will throw exceptions
+     * or AccType_LAZYFP). Faults in cpu_stl_data_ra() will throw exceptions
      * and longjmp out.
      */
     if (!(env->v7m.fpccr[M_REG_S] & R_V7M_FPCCR_LSPEN_MASK)) {
@@ -994,10 +995,10 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
             if (i >= 16) {
                 faddr += 8; /* skip the slot for the FPSCR */
             }
-            cpu_stl_data(env, faddr, slo);
-            cpu_stl_data(env, faddr + 4, shi);
+            cpu_stl_data_ra(env, faddr, slo, ra);
+            cpu_stl_data_ra(env, faddr + 4, shi, ra);
         }
-        cpu_stl_data(env, fptr + 0x40, vfp_get_fpscr(env));
+        cpu_stl_data_ra(env, fptr + 0x40, vfp_get_fpscr(env), ra);
 
         /*
          * If TS is 0 then s0 to s15 and FPSCR are UNKNOWN; we choose to
@@ -1018,6 +1019,8 @@ void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
 
 void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
 {
+    uintptr_t ra = GETPC();
+
     /* fptr is the value of Rn, the frame pointer we load the FP regs from */
     assert(env->v7m.secure);
 
@@ -1051,13 +1054,13 @@ void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
                 faddr += 8; /* skip the slot for the FPSCR */
             }
 
-            slo = cpu_ldl_data(env, faddr);
-            shi = cpu_ldl_data(env, faddr + 4);
+            slo = cpu_ldl_data_ra(env, faddr, ra);
+            shi = cpu_ldl_data_ra(env, faddr + 4, ra);
 
             dn = (uint64_t) shi << 32 | slo;
             *aa32_vfp_dreg(env, i / 2) = dn;
         }
-        fpscr = cpu_ldl_data(env, fptr + 0x40);
+        fpscr = cpu_ldl_data_ra(env, fptr + 0x40, ra);
         vfp_set_fpscr(env, fpscr);
     }
 
-- 
2.20.1


