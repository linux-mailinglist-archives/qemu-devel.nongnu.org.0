Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC08EC029
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 09:58:45 +0100 (CET)
Received: from localhost ([::1]:57568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQSlY-0007i8-5f
	for lists+qemu-devel@lfdr.de; Fri, 01 Nov 2019 04:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56507)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iQSex-00018B-DA
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 04:51:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iQSes-0000AG-Rd
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 04:51:54 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52748)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iQSes-00006k-Hn
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 04:51:50 -0400
Received: by mail-wm1-x332.google.com with SMTP id c17so1231115wmk.2
 for <qemu-devel@nongnu.org>; Fri, 01 Nov 2019 01:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=J5hD5yYPUwyTUfswMlBAMvVW6dnoBoogw5pUaxy5laQ=;
 b=HgdgYAlChr3DoSybsWHTwoOs/scbz6pLERzKvnOrXD41ERt2VozL5HhAFWdlB4bctX
 1DI1GwaSCQvbzE8iboXRy9RGie1+XTM2TLEsLRtlprFL037V+HuzdRrGFHhxJsHTgcH8
 KeuRqjcnefB/w+huTSWVuTzTChkOEGJQI6IpHkc8ybn82T5wz1z+HLqSVBVNKANHrozc
 X1Wy50e9DAW0LmLgoeZDlssUxWaG/jOu7kyB5qB3dQD8jdYyCPgs0Tj+gMna71f8v40/
 NhQ5Nl107GDPlybNvU90zUvMOWgKMllOuI1M+nwPmT1rOwq3GHjddH1MZ9F0nzm6bh4S
 H7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J5hD5yYPUwyTUfswMlBAMvVW6dnoBoogw5pUaxy5laQ=;
 b=KKrfcEKqRcmE8cZZ5rZX+PkkUQdansCd1kU/QM5+c6FTGMv1DbSoX1NEHiENoStS9R
 cQVM95aRxyPOQJWHCUGsSBEUdlth9V3LrCz5GmHtyyxGsrqsUQp8loF2nNhK9t2K6q91
 5XhnK4WrGisqt9KIONrtMtXYAdF/hjQN9DdGsn7Cxolq7HMmc9slLTYtjWPYV+Y2vRkb
 JFU3JJ8S+eI1/Zql+8r5m7wdBJOEgVcMA0Fq+whTViI8LQzY+Km/z/82fOfROWRS6mAI
 d/25af/iHQSEVbPrKPqUXXRpVf/rJ2lVANco1/Bj868KE7z2YFU36h1FpzvMydTyADp+
 EZDg==
X-Gm-Message-State: APjAAAXsSBAvCZJgMq4FstxVZu4B3oxUzhR1OJjLVnxv9VkGcU2TSEVy
 25I6zg5kCIy8R+zVPOILnSEpEoBX21sTvV8U
X-Google-Smtp-Source: APXvYqzN/3lqqqjqwzW9nkUwTTmcSA+hncJq+0JYQZqCeijUwsZZCMF6wypWPPrqsQzYjJFGrag73w==
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr9391547wmi.65.1572598309236;
 Fri, 01 Nov 2019 01:51:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d20sm8818922wra.4.2019.11.01.01.51.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 01:51:48 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/11] target/arm/kvm64: Add kvm_arch_get/put_sve
Date: Fri,  1 Nov 2019 08:51:34 +0000
Message-Id: <20191101085140.5205-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101085140.5205-1-peter.maydell@linaro.org>
References: <20191101085140.5205-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::332
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

From: Andrew Jones <drjones@redhat.com>

These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
swabbing is different than it is for fpsmid because the vector format
is a little-endian stream of words.

Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
Message-id: 20191031142734.8590-6-drjones@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/kvm64.c | 185 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 156 insertions(+), 29 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 28f6db57d5e..4c0b11d105a 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -671,11 +671,12 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
 bool kvm_arm_reg_syncs_via_cpreg_list(uint64_t regidx)
 {
     /* Return true if the regidx is a register we should synchronize
-     * via the cpreg_tuples array (ie is not a core reg we sync by
-     * hand in kvm_arch_get/put_registers())
+     * via the cpreg_tuples array (ie is not a core or sve reg that
+     * we sync by hand in kvm_arch_get/put_registers())
      */
     switch (regidx & KVM_REG_ARM_COPROC_MASK) {
     case KVM_REG_ARM_CORE:
+    case KVM_REG_ARM64_SVE:
         return false;
     default:
         return true;
@@ -721,10 +722,8 @@ int kvm_arm_cpreg_level(uint64_t regidx)
 
 static int kvm_arch_put_fpsimd(CPUState *cs)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
+    CPUARMState *env = &ARM_CPU(cs)->env;
     struct kvm_one_reg reg;
-    uint32_t fpr;
     int i, ret;
 
     for (i = 0; i < 32; i++) {
@@ -742,17 +741,73 @@ static int kvm_arch_put_fpsimd(CPUState *cs)
         }
     }
 
-    reg.addr = (uintptr_t)(&fpr);
-    fpr = vfp_get_fpsr(env);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
-    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
+    return 0;
+}
+
+/*
+ * SVE registers are encoded in KVM's memory in an endianness-invariant format.
+ * The byte at offset i from the start of the in-memory representation contains
+ * the bits [(7 + 8 * i) : (8 * i)] of the register value. As this means the
+ * lowest offsets are stored in the lowest memory addresses, then that nearly
+ * matches QEMU's representation, which is to use an array of host-endian
+ * uint64_t's, where the lower offsets are at the lower indices. To complete
+ * the translation we just need to byte swap the uint64_t's on big-endian hosts.
+ */
+static uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
+{
+#ifdef HOST_WORDS_BIGENDIAN
+    int i;
+
+    for (i = 0; i < nr; ++i) {
+        dst[i] = bswap64(src[i]);
     }
 
-    reg.addr = (uintptr_t)(&fpr);
-    fpr = vfp_get_fpcr(env);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
+    return dst;
+#else
+    return src;
+#endif
+}
+
+/*
+ * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
+ * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
+ * code the slice index to zero for now as it's unlikely we'll need more than
+ * one slice for quite some time.
+ */
+static int kvm_arch_put_sve(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    uint64_t tmp[ARM_MAX_VQ * 2];
+    uint64_t *r;
+    struct kvm_one_reg reg;
+    int n, ret;
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
+        r = sve_bswap64(tmp, &env->vfp.zregs[n].d[0], cpu->sve_max_vq * 2);
+        reg.addr = (uintptr_t)r;
+        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
+        r = sve_bswap64(tmp, r = &env->vfp.pregs[n].p[0],
+                        DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
+        reg.addr = (uintptr_t)r;
+        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    r = sve_bswap64(tmp, &env->vfp.pregs[FFR_PRED_NUM].p[0],
+                    DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
+    reg.addr = (uintptr_t)r;
+    reg.id = KVM_REG_ARM64_SVE_FFR(0);
     ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
     if (ret) {
         return ret;
@@ -765,6 +820,7 @@ int kvm_arch_put_registers(CPUState *cs, int level)
 {
     struct kvm_one_reg reg;
     uint64_t val;
+    uint32_t fpr;
     int i, ret;
     unsigned int el;
 
@@ -855,7 +911,27 @@ int kvm_arch_put_registers(CPUState *cs, int level)
         }
     }
 
-    ret = kvm_arch_put_fpsimd(cs);
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret = kvm_arch_put_sve(cs);
+    } else {
+        ret = kvm_arch_put_fpsimd(cs);
+    }
+    if (ret) {
+        return ret;
+    }
+
+    reg.addr = (uintptr_t)(&fpr);
+    fpr = vfp_get_fpsr(env);
+    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+
+    reg.addr = (uintptr_t)(&fpr);
+    fpr = vfp_get_fpcr(env);
+    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
+    ret = kvm_vcpu_ioctl(cs, KVM_SET_ONE_REG, &reg);
     if (ret) {
         return ret;
     }
@@ -878,10 +954,8 @@ int kvm_arch_put_registers(CPUState *cs, int level)
 
 static int kvm_arch_get_fpsimd(CPUState *cs)
 {
-    ARMCPU *cpu = ARM_CPU(cs);
-    CPUARMState *env = &cpu->env;
+    CPUARMState *env = &ARM_CPU(cs)->env;
     struct kvm_one_reg reg;
-    uint32_t fpr;
     int i, ret;
 
     for (i = 0; i < 32; i++) {
@@ -899,21 +973,53 @@ static int kvm_arch_get_fpsimd(CPUState *cs)
         }
     }
 
-    reg.addr = (uintptr_t)(&fpr);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
-    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
-    if (ret) {
-        return ret;
-    }
-    vfp_set_fpsr(env, fpr);
+    return 0;
+}
 
-    reg.addr = (uintptr_t)(&fpr);
-    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
+/*
+ * KVM SVE registers come in slices where ZREGs have a slice size of 2048 bits
+ * and PREGS and the FFR have a slice size of 256 bits. However we simply hard
+ * code the slice index to zero for now as it's unlikely we'll need more than
+ * one slice for quite some time.
+ */
+static int kvm_arch_get_sve(CPUState *cs)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    CPUARMState *env = &cpu->env;
+    struct kvm_one_reg reg;
+    uint64_t *r;
+    int n, ret;
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_ZREGS; ++n) {
+        r = &env->vfp.zregs[n].d[0];
+        reg.addr = (uintptr_t)r;
+        reg.id = KVM_REG_ARM64_SVE_ZREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+        sve_bswap64(r, r, cpu->sve_max_vq * 2);
+    }
+
+    for (n = 0; n < KVM_ARM64_SVE_NUM_PREGS; ++n) {
+        r = &env->vfp.pregs[n].p[0];
+        reg.addr = (uintptr_t)r;
+        reg.id = KVM_REG_ARM64_SVE_PREG(n, 0);
+        ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+        if (ret) {
+            return ret;
+        }
+        sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
+    }
+
+    r = &env->vfp.pregs[FFR_PRED_NUM].p[0];
+    reg.addr = (uintptr_t)r;
+    reg.id = KVM_REG_ARM64_SVE_FFR(0);
     ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
     if (ret) {
         return ret;
     }
-    vfp_set_fpcr(env, fpr);
+    sve_bswap64(r, r, DIV_ROUND_UP(cpu->sve_max_vq * 2, 8));
 
     return 0;
 }
@@ -923,6 +1029,7 @@ int kvm_arch_get_registers(CPUState *cs)
     struct kvm_one_reg reg;
     uint64_t val;
     unsigned int el;
+    uint32_t fpr;
     int i, ret;
 
     ARMCPU *cpu = ARM_CPU(cs);
@@ -1012,11 +1119,31 @@ int kvm_arch_get_registers(CPUState *cs)
         env->spsr = env->banked_spsr[i];
     }
 
-    ret = kvm_arch_get_fpsimd(cs);
+    if (cpu_isar_feature(aa64_sve, cpu)) {
+        ret = kvm_arch_get_sve(cs);
+    } else {
+        ret = kvm_arch_get_fpsimd(cs);
+    }
     if (ret) {
         return ret;
     }
 
+    reg.addr = (uintptr_t)(&fpr);
+    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpsr);
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+    vfp_set_fpsr(env, fpr);
+
+    reg.addr = (uintptr_t)(&fpr);
+    reg.id = AARCH64_SIMD_CTRL_REG(fp_regs.fpcr);
+    ret = kvm_vcpu_ioctl(cs, KVM_GET_ONE_REG, &reg);
+    if (ret) {
+        return ret;
+    }
+    vfp_set_fpcr(env, fpr);
+
     ret = kvm_get_vcpu_events(cpu);
     if (ret) {
         return ret;
-- 
2.20.1


