Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9137226A7B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 21:05:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49750 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTWY2-0000CU-Nb
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 15:05:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTWOm-00086f-OQ
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:55:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTWCV-0008Dm-Rq
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:42:56 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:46137)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hTWCV-0008DO-MX
	for qemu-devel@nongnu.org; Wed, 22 May 2019 14:42:55 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id z22so1237577ybi.13
	for <qemu-devel@nongnu.org>; Wed, 22 May 2019 11:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GpDCiQN8/aZvZ+AXeAAwaFQMM4p0yaXjgzSjXp1WzGU=;
	b=tunQmnmfmjy9xX7MhYnbid1kucG1KYVHbJNaY9b1xAq2m0EteoLPV0LGI3SV/XFWcS
	fTt5mVJDu65uROeWIBs0fVvDVkABwdm2PL3xHQlqOMWosbzx9FXrHGBSNmk1DLlMqzE2
	c+tQ5avOPrNlWkk7OUwiLVK0fVHRXLSUMAmItCcuoP/z2B9ABNLpwPlK9Daa6ce6zkei
	NVGlCJIN6qQTd/GZsEeRDy+cLtgifVcwPSFL8xUqP8ayDIEk6Wq1VcPKeyWrWrcCcb0S
	SOsCAylOdYFDDPUX71RcSge/HJEBiCYr+DTMlGVPGbzVEDj9/4hQeTsyvyqHqgt3KcIr
	Q0dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GpDCiQN8/aZvZ+AXeAAwaFQMM4p0yaXjgzSjXp1WzGU=;
	b=r70g/YMOcfdcmP4dpai/0f2LMFNGNNpMWsTNdl6IeUT/aQVclhVWbKzrBBwi4V4mlG
	NvyfBbVeQqJG/Dk7Dlx/Py6VpRwDaPNLvi7gFU2zsJviUchU9hp5ehnQ+Batsw27heCA
	1+6KZN1RWIXuNInUiaOFhLXLcw053BvMhl8AYam6Gd88Sjq5nHDUKzW2zYSax/G8wT3q
	KoMn19eBtANwxE30tEWnKPVDrR8gvVg/G2H5+ef7dMg0mVgoEZaE4DwZBDqarYmJ+dGB
	Ce3L5LGRuYJpQ+Yah2Z+4Y8Rm0+rKTDEy4BVYvqfFmdgP9xYt30GnifRd3hKFiK58oBG
	UMZg==
X-Gm-Message-State: APjAAAWr4jrF/UAZpyMLA8gwPzWEBsE77Jm5lc1qzrXEgi/TQEy/SZqX
	1UYV0NWaIbK6FUPm1+ET+gTDVhyDC5s=
X-Google-Smtp-Source: APXvYqyGvSjFjm5VZOnmY7Omo9st7pqwNnHapFpchckXm6nhvesRH867O/zAwmtKr+euXAzGb7RNCQ==
X-Received: by 2002:a25:33c5:: with SMTP id
	z188mr12793969ybz.359.1558550574685; 
	Wed, 22 May 2019 11:42:54 -0700 (PDT)
Received: from localhost.localdomain ([71.46.56.17])
	by smtp.gmail.com with ESMTPSA id
	206sm1299445ywq.74.2019.05.22.11.42.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 11:42:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 22 May 2019 14:42:26 -0400
Message-Id: <20190522184226.17871-26-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522184226.17871-1-richard.henderson@linaro.org>
References: <20190522184226.17871-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b2f
Subject: [Qemu-devel] [PULL 25/25] target/i386: Implement CPUID_EXT_RDRAND
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We now have an interface for guest visible random numbers.

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h     |  2 ++
 target/i386/cpu.c        |  5 ++--
 target/i386/int_helper.c | 21 ++++++++++++++
 target/i386/translate.c  | 62 ++++++++++++++++++++++++++++++----------
 4 files changed, 73 insertions(+), 17 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 6fb8fb9b74..8f9e1905c3 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -226,3 +226,5 @@ DEF_HELPER_3(rcrl, tl, env, tl, tl)
 DEF_HELPER_3(rclq, tl, env, tl, tl)
 DEF_HELPER_3(rcrq, tl, env, tl, tl)
 #endif
+
+DEF_HELPER_1(rdrand, tl, env)
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2df56fa977..357d3c43a1 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -730,13 +730,14 @@ static void x86_cpu_vendor_words2str(char *dst, uint32_t vendor1,
           CPUID_EXT_MONITOR | CPUID_EXT_SSSE3 | CPUID_EXT_CX16 | \
           CPUID_EXT_SSE41 | CPUID_EXT_SSE42 | CPUID_EXT_POPCNT | \
           CPUID_EXT_XSAVE | /* CPUID_EXT_OSXSAVE is dynamic */   \
-          CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR)
+          CPUID_EXT_MOVBE | CPUID_EXT_AES | CPUID_EXT_HYPERVISOR | \
+          CPUID_EXT_RDRAND)
           /* missing:
           CPUID_EXT_DTES64, CPUID_EXT_DSCPL, CPUID_EXT_VMX, CPUID_EXT_SMX,
           CPUID_EXT_EST, CPUID_EXT_TM2, CPUID_EXT_CID, CPUID_EXT_FMA,
           CPUID_EXT_XTPR, CPUID_EXT_PDCM, CPUID_EXT_PCID, CPUID_EXT_DCA,
           CPUID_EXT_X2APIC, CPUID_EXT_TSC_DEADLINE_TIMER, CPUID_EXT_AVX,
-          CPUID_EXT_F16C, CPUID_EXT_RDRAND */
+          CPUID_EXT_F16C */
 
 #ifdef TARGET_X86_64
 #define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
diff --git a/target/i386/int_helper.c b/target/i386/int_helper.c
index 4dc5c65991..334469ca8c 100644
--- a/target/i386/int_helper.c
+++ b/target/i386/int_helper.c
@@ -22,6 +22,8 @@
 #include "exec/exec-all.h"
 #include "qemu/host-utils.h"
 #include "exec/helper-proto.h"
+#include "qapi/error.h"
+#include "qemu/guest-random.h"
 
 //#define DEBUG_MULDIV
 
@@ -470,3 +472,22 @@ void helper_cr4_testbit(CPUX86State *env, uint32_t bit)
         raise_exception_ra(env, EXCP06_ILLOP, GETPC());
     }
 }
+
+target_ulong HELPER(rdrand)(CPUX86State *env)
+{
+    Error *err = NULL;
+    target_ulong ret;
+
+    if (qemu_guest_getrandom(&ret, sizeof(ret), &err) < 0) {
+        qemu_log_mask(LOG_UNIMP, "rdrand: Crypto failure: %s",
+                      error_get_pretty(err));
+        error_free(err);
+        /* Failure clears CF and all other flags, and returns 0.  */
+        env->cc_src = 0;
+        return 0;
+    }
+
+    /* Success sets CF and clears all others.  */
+    env->cc_src = CC_C;
+    return ret;
+}
diff --git a/target/i386/translate.c b/target/i386/translate.c
index 77d6b73e42..03150a86e2 100644
--- a/target/i386/translate.c
+++ b/target/i386/translate.c
@@ -5332,31 +5332,63 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x1c7: /* cmpxchg8b */
         modrm = x86_ldub_code(env, s);
         mod = (modrm >> 6) & 3;
-        if ((mod == 3) || ((modrm & 0x38) != 0x8))
-            goto illegal_op;
-#ifdef TARGET_X86_64
-        if (dflag == MO_64) {
-            if (!(s->cpuid_ext_features & CPUID_EXT_CX16))
+        switch ((modrm >> 3) & 7) {
+        case 1: /* CMPXCHG8, CMPXCHG16 */
+            if (mod == 3) {
                 goto illegal_op;
-            gen_lea_modrm(env, s, modrm);
-            if ((s->prefix & PREFIX_LOCK) && (tb_cflags(s->base.tb) & CF_PARALLEL)) {
-                gen_helper_cmpxchg16b(cpu_env, s->A0);
-            } else {
-                gen_helper_cmpxchg16b_unlocked(cpu_env, s->A0);
             }
-        } else
+#ifdef TARGET_X86_64
+            if (dflag == MO_64) {
+                if (!(s->cpuid_ext_features & CPUID_EXT_CX16)) {
+                    goto illegal_op;
+                }
+                gen_lea_modrm(env, s, modrm);
+                if ((s->prefix & PREFIX_LOCK) &&
+                    (tb_cflags(s->base.tb) & CF_PARALLEL)) {
+                    gen_helper_cmpxchg16b(cpu_env, s->A0);
+                } else {
+                    gen_helper_cmpxchg16b_unlocked(cpu_env, s->A0);
+                }
+                set_cc_op(s, CC_OP_EFLAGS);
+                break;
+            }
 #endif        
-        {
-            if (!(s->cpuid_features & CPUID_CX8))
+            if (!(s->cpuid_features & CPUID_CX8)) {
                 goto illegal_op;
+            }
             gen_lea_modrm(env, s, modrm);
-            if ((s->prefix & PREFIX_LOCK) && (tb_cflags(s->base.tb) & CF_PARALLEL)) {
+            if ((s->prefix & PREFIX_LOCK) &&
+                (tb_cflags(s->base.tb) & CF_PARALLEL)) {
                 gen_helper_cmpxchg8b(cpu_env, s->A0);
             } else {
                 gen_helper_cmpxchg8b_unlocked(cpu_env, s->A0);
             }
+            set_cc_op(s, CC_OP_EFLAGS);
+            break;
+
+        case 7: /* RDSEED */
+        case 6: /* RDRAND */
+            if (mod != 3 ||
+                (s->prefix & (PREFIX_LOCK | PREFIX_REPZ | PREFIX_REPNZ)) ||
+                !(s->cpuid_ext_features & CPUID_EXT_RDRAND)) {
+                goto illegal_op;
+            }
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_io_start();
+            }
+            gen_helper_rdrand(s->T0, cpu_env);
+            rm = (modrm & 7) | REX_B(s);
+            gen_op_mov_reg_v(s, dflag, rm, s->T0);
+            set_cc_op(s, CC_OP_EFLAGS);
+            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
+                gen_io_end();
+                gen_jmp(s, s->pc - s->cs_base);
+            }
+            break;
+
+        default:
+            goto illegal_op;
         }
-        set_cc_op(s, CC_OP_EFLAGS);
         break;
 
         /**************************/
-- 
2.17.1


