Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA31B55E6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Apr 2020 09:38:15 +0200 (CEST)
Received: from localhost ([::1]:38324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRWR5-0001Yh-0O
	for lists+qemu-devel@lfdr.de; Thu, 23 Apr 2020 03:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWNc-0005Xx-9w
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 03:34:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jRWNZ-0007Ef-RQ
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 03:34:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37376
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jRWNZ-0007Dg-Cp
 for qemu-devel@nongnu.org; Thu, 23 Apr 2020 03:34:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587627276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KIT0zlND0aAS0dE2ecQZ4M0IAOeqIMY9fe5R4TJ2NTg=;
 b=BLrefDKJY19/eaeSHEO7cl9CRyNrf3vjlMGtEP58avvOWseXCKvK5pcsNBDnyjrBE36wWD
 Wd/3DR6Fo/CqeN06akBD/2wsSsgUqd8kq9UrN+WgTqzpg05UOPNnO5LAzraaE2cJZgAA8U
 c5NuNELAXFRHG1SCkQv3z6p4J7W+Ysc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-5guU03U6O8We3ySTywSzUQ-1; Thu, 23 Apr 2020 03:34:33 -0400
X-MC-Unique: 5guU03U6O8We3ySTywSzUQ-1
Received: by mail-wr1-f70.google.com with SMTP id r11so2409643wrx.21
 for <qemu-devel@nongnu.org>; Thu, 23 Apr 2020 00:34:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XMg0i+OdUd3/dollQEcrmabsdzJOL6JdRgjEF6fPlC0=;
 b=Lhtf5mJQVg+qD1EZUHmeD6iQXDY3lzwf8BezrpMQx0ztuR8fokeocz7KU935LyxS7G
 a6GtRZFUH2udnTMoeMnRSqRQotnMnug89nAWmQJ/AMEiR6yGOLBcNMtW6kI5kiV4oC9j
 ZWMq3fT0yH7wJYFmV8PLyy6wiMVMrUFGb9yw8OwPhk3/U1EjFTQs5JJb08HCafmMyRzi
 lRKOjXr4G/gqVwmKw006jFcfhKtOkry6PatEc+hZX/iw8xKltMvFA6QVbxPkIwlOx1Zw
 ZhyrzXxIfQe/Wjvc21Er6yB33O5mjGusEbyEt7DcgvutZcnQdp2KjWwEpbFjHG533sHa
 i/lw==
X-Gm-Message-State: AGi0PuaFN29/t4sIg1PoUh4H5rnf8eymbWm5o6RdiIRoDdB2msEa+m+k
 gkyG7gFrblSOOF1+KzyiV/tgjZ62lbbE411GjWL7+gFlsfHz1taA2/UCNHeMIMRtdoaoHY1JkCl
 z+Lj333HKEQb3Vxw=
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr2716384wmj.185.1587627271284; 
 Thu, 23 Apr 2020 00:34:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypIDdjWSVGnslY0rOZAYK+dJ+O4u9kp1bUSQlDIEqKHq3KjmRZNFDqd7r3C3kPF80ktStc9Alg==
X-Received: by 2002:a7b:ce89:: with SMTP id q9mr2716286wmj.185.1587627270030; 
 Thu, 23 Apr 2020 00:34:30 -0700 (PDT)
Received: from localhost.localdomain (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id d5sm2446945wrp.44.2020.04.23.00.34.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 00:34:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] target/arm: Restrict TCG cpus to TCG accel
Date: Thu, 23 Apr 2020 09:33:58 +0200
Message-Id: <20200423073358.27155-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200423073358.27155-1-philmd@redhat.com>
References: <20200423073358.27155-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/23 03:23:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A KVM-only build won't be able to run TCG cpus.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 target/arm/cpu.c         | 634 -------------------------------------
 target/arm/cpu_tcg.c     | 664 +++++++++++++++++++++++++++++++++++++++
 target/arm/Makefile.objs |   1 +
 3 files changed, 665 insertions(+), 634 deletions(-)
 create mode 100644 target/arm/cpu_tcg.c

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a1e38b38ba..fed9ccf6d5 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -574,32 +574,6 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrup=
t_request)
     return true;
 }
=20
-#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request=
)
-{
-    CPUClass *cc =3D CPU_GET_CLASS(cs);
-    ARMCPU *cpu =3D ARM_CPU(cs);
-    CPUARMState *env =3D &cpu->env;
-    bool ret =3D false;
-
-    /*
-     * ARMv7-M interrupt masking works differently than -A or -R.
-     * There is no FIQ/IRQ distinction. Instead of I and F bits
-     * masking FIQ and IRQ interrupts, an exception is taken only
-     * if it is higher priority than the current execution priority
-     * (which depends on state like BASEPRI, FAULTMASK and the
-     * currently active exception).
-     */
-    if (interrupt_request & CPU_INTERRUPT_HARD
-        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
-        cs->exception_index =3D EXCP_IRQ;
-        cc->do_interrupt(cs);
-        ret =3D true;
-    }
-    return ret;
-}
-#endif
-
 void arm_cpu_update_virq(ARMCPU *cpu)
 {
     /*
@@ -1830,406 +1804,6 @@ static ObjectClass *arm_cpu_class_by_name(const cha=
r *cpu_model)
 /* CPU models. These are not needed for the AArch64 linux-user build. */
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
=20
-static void arm926_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "arm,arm926";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
-    cpu->midr =3D 0x41069265;
-    cpu->reset_fpsid =3D 0x41011090;
-    cpu->ctr =3D 0x1dd20d2;
-    cpu->reset_sctlr =3D 0x00090078;
-
-    /*
-     * ARMv5 does not have the ID_ISAR registers, but we can still
-     * set the field to indicate Jazelle support within QEMU.
-     */
-    cpu->isar.id_isar1 =3D FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELL=
E, 1);
-    /*
-     * Similarly, we need to set MVFR0 fields to enable vfp and short vect=
or
-     * support even though ARMv5 doesn't have this register.
-     */
-    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
-    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
-}
-
-static void arm946_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "arm,arm946";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_PMSA);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    cpu->midr =3D 0x41059461;
-    cpu->ctr =3D 0x0f004006;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void arm1026_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "arm,arm1026";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_AUXCR);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
-    cpu->midr =3D 0x4106a262;
-    cpu->reset_fpsid =3D 0x410110a0;
-    cpu->ctr =3D 0x1dd20d2;
-    cpu->reset_sctlr =3D 0x00090078;
-    cpu->reset_auxcr =3D 1;
-
-    /*
-     * ARMv5 does not have the ID_ISAR registers, but we can still
-     * set the field to indicate Jazelle support within QEMU.
-     */
-    cpu->isar.id_isar1 =3D FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELL=
E, 1);
-    /*
-     * Similarly, we need to set MVFR0 fields to enable vfp and short vect=
or
-     * support even though ARMv5 doesn't have this register.
-     */
-    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
-    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
-    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
-
-    {
-        /* The 1026 had an IFAR at c6,c0,0,1 rather than the ARMv6 c6,c0,0=
,2 */
-        ARMCPRegInfo ifar =3D {
-            .name =3D "IFAR", .cp =3D 15, .crn =3D 6, .crm =3D 0, .opc1 =
=3D 0, .opc2 =3D 1,
-            .access =3D PL1_RW,
-            .fieldoffset =3D offsetof(CPUARMState, cp15.ifar_ns),
-            .resetvalue =3D 0
-        };
-        define_one_arm_cp_reg(cpu, &ifar);
-    }
-}
-
-static void arm1136_r2_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-    /*
-     * What qemu calls "arm1136_r2" is actually the 1136 r0p2, ie an
-     * older core than plain "arm1136". In particular this does not
-     * have the v6K features.
-     * These ID register values are correct for 1136 but may be wrong
-     * for 1136_r2 (in particular r0p2 does not actually implement most
-     * of the ID registers).
-     */
-
-    cpu->dtb_compatible =3D "arm,arm1136";
-    set_feature(&cpu->env, ARM_FEATURE_V6);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
-    cpu->midr =3D 0x4107b362;
-    cpu->reset_fpsid =3D 0x410120b4;
-    cpu->isar.mvfr0 =3D 0x11111111;
-    cpu->isar.mvfr1 =3D 0x00000000;
-    cpu->ctr =3D 0x1dd20d2;
-    cpu->reset_sctlr =3D 0x00050078;
-    cpu->id_pfr0 =3D 0x111;
-    cpu->id_pfr1 =3D 0x1;
-    cpu->isar.id_dfr0 =3D 0x2;
-    cpu->id_afr0 =3D 0x3;
-    cpu->isar.id_mmfr0 =3D 0x01130003;
-    cpu->isar.id_mmfr1 =3D 0x10030302;
-    cpu->isar.id_mmfr2 =3D 0x01222110;
-    cpu->isar.id_isar0 =3D 0x00140011;
-    cpu->isar.id_isar1 =3D 0x12002111;
-    cpu->isar.id_isar2 =3D 0x11231111;
-    cpu->isar.id_isar3 =3D 0x01102131;
-    cpu->isar.id_isar4 =3D 0x141;
-    cpu->reset_auxcr =3D 7;
-}
-
-static void arm1136_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "arm,arm1136";
-    set_feature(&cpu->env, ARM_FEATURE_V6K);
-    set_feature(&cpu->env, ARM_FEATURE_V6);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
-    cpu->midr =3D 0x4117b363;
-    cpu->reset_fpsid =3D 0x410120b4;
-    cpu->isar.mvfr0 =3D 0x11111111;
-    cpu->isar.mvfr1 =3D 0x00000000;
-    cpu->ctr =3D 0x1dd20d2;
-    cpu->reset_sctlr =3D 0x00050078;
-    cpu->id_pfr0 =3D 0x111;
-    cpu->id_pfr1 =3D 0x1;
-    cpu->isar.id_dfr0 =3D 0x2;
-    cpu->id_afr0 =3D 0x3;
-    cpu->isar.id_mmfr0 =3D 0x01130003;
-    cpu->isar.id_mmfr1 =3D 0x10030302;
-    cpu->isar.id_mmfr2 =3D 0x01222110;
-    cpu->isar.id_isar0 =3D 0x00140011;
-    cpu->isar.id_isar1 =3D 0x12002111;
-    cpu->isar.id_isar2 =3D 0x11231111;
-    cpu->isar.id_isar3 =3D 0x01102131;
-    cpu->isar.id_isar4 =3D 0x141;
-    cpu->reset_auxcr =3D 7;
-}
-
-static void arm1176_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "arm,arm1176";
-    set_feature(&cpu->env, ARM_FEATURE_V6K);
-    set_feature(&cpu->env, ARM_FEATURE_VAPA);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
-    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
-    set_feature(&cpu->env, ARM_FEATURE_EL3);
-    cpu->midr =3D 0x410fb767;
-    cpu->reset_fpsid =3D 0x410120b5;
-    cpu->isar.mvfr0 =3D 0x11111111;
-    cpu->isar.mvfr1 =3D 0x00000000;
-    cpu->ctr =3D 0x1dd20d2;
-    cpu->reset_sctlr =3D 0x00050078;
-    cpu->id_pfr0 =3D 0x111;
-    cpu->id_pfr1 =3D 0x11;
-    cpu->isar.id_dfr0 =3D 0x33;
-    cpu->id_afr0 =3D 0;
-    cpu->isar.id_mmfr0 =3D 0x01130003;
-    cpu->isar.id_mmfr1 =3D 0x10030302;
-    cpu->isar.id_mmfr2 =3D 0x01222100;
-    cpu->isar.id_isar0 =3D 0x0140011;
-    cpu->isar.id_isar1 =3D 0x12002111;
-    cpu->isar.id_isar2 =3D 0x11231121;
-    cpu->isar.id_isar3 =3D 0x01102131;
-    cpu->isar.id_isar4 =3D 0x01141;
-    cpu->reset_auxcr =3D 7;
-}
-
-static void arm11mpcore_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "arm,arm11mpcore";
-    set_feature(&cpu->env, ARM_FEATURE_V6K);
-    set_feature(&cpu->env, ARM_FEATURE_VAPA);
-    set_feature(&cpu->env, ARM_FEATURE_MPIDR);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    cpu->midr =3D 0x410fb022;
-    cpu->reset_fpsid =3D 0x410120b4;
-    cpu->isar.mvfr0 =3D 0x11111111;
-    cpu->isar.mvfr1 =3D 0x00000000;
-    cpu->ctr =3D 0x1d192992; /* 32K icache 32K dcache */
-    cpu->id_pfr0 =3D 0x111;
-    cpu->id_pfr1 =3D 0x1;
-    cpu->isar.id_dfr0 =3D 0;
-    cpu->id_afr0 =3D 0x2;
-    cpu->isar.id_mmfr0 =3D 0x01100103;
-    cpu->isar.id_mmfr1 =3D 0x10020302;
-    cpu->isar.id_mmfr2 =3D 0x01222000;
-    cpu->isar.id_isar0 =3D 0x00100011;
-    cpu->isar.id_isar1 =3D 0x12002111;
-    cpu->isar.id_isar2 =3D 0x11221011;
-    cpu->isar.id_isar3 =3D 0x01102131;
-    cpu->isar.id_isar4 =3D 0x141;
-    cpu->reset_auxcr =3D 1;
-}
-
-static void cortex_m0_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_V6);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-
-    cpu->midr =3D 0x410cc200;
-}
-
-static void cortex_m3_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
-    cpu->midr =3D 0x410fc231;
-    cpu->pmsav7_dregion =3D 8;
-    cpu->id_pfr0 =3D 0x00000030;
-    cpu->id_pfr1 =3D 0x00000200;
-    cpu->isar.id_dfr0 =3D 0x00100000;
-    cpu->id_afr0 =3D 0x00000000;
-    cpu->isar.id_mmfr0 =3D 0x00000030;
-    cpu->isar.id_mmfr1 =3D 0x00000000;
-    cpu->isar.id_mmfr2 =3D 0x00000000;
-    cpu->isar.id_mmfr3 =3D 0x00000000;
-    cpu->isar.id_isar0 =3D 0x01141110;
-    cpu->isar.id_isar1 =3D 0x02111000;
-    cpu->isar.id_isar2 =3D 0x21112231;
-    cpu->isar.id_isar3 =3D 0x01111110;
-    cpu->isar.id_isar4 =3D 0x01310102;
-    cpu->isar.id_isar5 =3D 0x00000000;
-    cpu->isar.id_isar6 =3D 0x00000000;
-}
-
-static void cortex_m4_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
-    cpu->midr =3D 0x410fc240; /* r0p0 */
-    cpu->pmsav7_dregion =3D 8;
-    cpu->isar.mvfr0 =3D 0x10110021;
-    cpu->isar.mvfr1 =3D 0x11000011;
-    cpu->isar.mvfr2 =3D 0x00000000;
-    cpu->id_pfr0 =3D 0x00000030;
-    cpu->id_pfr1 =3D 0x00000200;
-    cpu->isar.id_dfr0 =3D 0x00100000;
-    cpu->id_afr0 =3D 0x00000000;
-    cpu->isar.id_mmfr0 =3D 0x00000030;
-    cpu->isar.id_mmfr1 =3D 0x00000000;
-    cpu->isar.id_mmfr2 =3D 0x00000000;
-    cpu->isar.id_mmfr3 =3D 0x00000000;
-    cpu->isar.id_isar0 =3D 0x01141110;
-    cpu->isar.id_isar1 =3D 0x02111000;
-    cpu->isar.id_isar2 =3D 0x21112231;
-    cpu->isar.id_isar3 =3D 0x01111110;
-    cpu->isar.id_isar4 =3D 0x01310102;
-    cpu->isar.id_isar5 =3D 0x00000000;
-    cpu->isar.id_isar6 =3D 0x00000000;
-}
-
-static void cortex_m7_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
-    cpu->midr =3D 0x411fc272; /* r1p2 */
-    cpu->pmsav7_dregion =3D 8;
-    cpu->isar.mvfr0 =3D 0x10110221;
-    cpu->isar.mvfr1 =3D 0x12000011;
-    cpu->isar.mvfr2 =3D 0x00000040;
-    cpu->id_pfr0 =3D 0x00000030;
-    cpu->id_pfr1 =3D 0x00000200;
-    cpu->isar.id_dfr0 =3D 0x00100000;
-    cpu->id_afr0 =3D 0x00000000;
-    cpu->isar.id_mmfr0 =3D 0x00100030;
-    cpu->isar.id_mmfr1 =3D 0x00000000;
-    cpu->isar.id_mmfr2 =3D 0x01000000;
-    cpu->isar.id_mmfr3 =3D 0x00000000;
-    cpu->isar.id_isar0 =3D 0x01101110;
-    cpu->isar.id_isar1 =3D 0x02112000;
-    cpu->isar.id_isar2 =3D 0x20232231;
-    cpu->isar.id_isar3 =3D 0x01111131;
-    cpu->isar.id_isar4 =3D 0x01310132;
-    cpu->isar.id_isar5 =3D 0x00000000;
-    cpu->isar.id_isar6 =3D 0x00000000;
-}
-
-static void cortex_m33_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V8);
-    set_feature(&cpu->env, ARM_FEATURE_M);
-    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
-    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
-    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
-    cpu->midr =3D 0x410fd213; /* r0p3 */
-    cpu->pmsav7_dregion =3D 16;
-    cpu->sau_sregion =3D 8;
-    cpu->isar.mvfr0 =3D 0x10110021;
-    cpu->isar.mvfr1 =3D 0x11000011;
-    cpu->isar.mvfr2 =3D 0x00000040;
-    cpu->id_pfr0 =3D 0x00000030;
-    cpu->id_pfr1 =3D 0x00000210;
-    cpu->isar.id_dfr0 =3D 0x00200000;
-    cpu->id_afr0 =3D 0x00000000;
-    cpu->isar.id_mmfr0 =3D 0x00101F40;
-    cpu->isar.id_mmfr1 =3D 0x00000000;
-    cpu->isar.id_mmfr2 =3D 0x01000000;
-    cpu->isar.id_mmfr3 =3D 0x00000000;
-    cpu->isar.id_isar0 =3D 0x01101110;
-    cpu->isar.id_isar1 =3D 0x02212000;
-    cpu->isar.id_isar2 =3D 0x20232232;
-    cpu->isar.id_isar3 =3D 0x01111131;
-    cpu->isar.id_isar4 =3D 0x01310132;
-    cpu->isar.id_isar5 =3D 0x00000000;
-    cpu->isar.id_isar6 =3D 0x00000000;
-    cpu->clidr =3D 0x00000000;
-    cpu->ctr =3D 0x8000c000;
-}
-
-static void arm_v7m_class_init(ObjectClass *oc, void *data)
-{
-    ARMCPUClass *acc =3D ARM_CPU_CLASS(oc);
-    CPUClass *cc =3D CPU_CLASS(oc);
-
-    acc->info =3D data;
-#ifndef CONFIG_USER_ONLY
-    cc->do_interrupt =3D arm_v7m_cpu_do_interrupt;
-#endif
-
-    cc->cpu_exec_interrupt =3D arm_v7m_cpu_exec_interrupt;
-}
-
-static const ARMCPRegInfo cortexr5_cp_reginfo[] =3D {
-    /* Dummy the TCM region regs for the moment */
-    { .name =3D "ATCM", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 1, .=
opc2 =3D 0,
-      .access =3D PL1_RW, .type =3D ARM_CP_CONST },
-    { .name =3D "BTCM", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 1, .=
opc2 =3D 1,
-      .access =3D PL1_RW, .type =3D ARM_CP_CONST },
-    { .name =3D "DCACHE_INVAL", .cp =3D 15, .opc1 =3D 0, .crn =3D 15, .crm=
 =3D 5,
-      .opc2 =3D 0, .access =3D PL1_W, .type =3D ARM_CP_NOP },
-    REGINFO_SENTINEL
-};
-
-static void cortex_r5_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    set_feature(&cpu->env, ARM_FEATURE_V7);
-    set_feature(&cpu->env, ARM_FEATURE_V7MP);
-    set_feature(&cpu->env, ARM_FEATURE_PMSA);
-    set_feature(&cpu->env, ARM_FEATURE_PMU);
-    cpu->midr =3D 0x411fc153; /* r1p3 */
-    cpu->id_pfr0 =3D 0x0131;
-    cpu->id_pfr1 =3D 0x001;
-    cpu->isar.id_dfr0 =3D 0x010400;
-    cpu->id_afr0 =3D 0x0;
-    cpu->isar.id_mmfr0 =3D 0x0210030;
-    cpu->isar.id_mmfr1 =3D 0x00000000;
-    cpu->isar.id_mmfr2 =3D 0x01200000;
-    cpu->isar.id_mmfr3 =3D 0x0211;
-    cpu->isar.id_isar0 =3D 0x02101111;
-    cpu->isar.id_isar1 =3D 0x13112111;
-    cpu->isar.id_isar2 =3D 0x21232141;
-    cpu->isar.id_isar3 =3D 0x01112131;
-    cpu->isar.id_isar4 =3D 0x0010142;
-    cpu->isar.id_isar5 =3D 0x0;
-    cpu->isar.id_isar6 =3D 0x0;
-    cpu->mp_is_up =3D true;
-    cpu->pmsav7_dregion =3D 16;
-    define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
-}
-
-static void cortex_r5f_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cortex_r5_initfn(obj);
-    cpu->isar.mvfr0 =3D 0x10110221;
-    cpu->isar.mvfr1 =3D 0x00000011;
-}
-
 static const ARMCPRegInfo cortexa8_cp_reginfo[] =3D {
     { .name =3D "L2LOCKDOWN", .cp =3D 15, .crn =3D 9, .crm =3D 0, .opc1 =
=3D 1, .opc2 =3D 0,
       .access =3D PL1_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 },
@@ -2456,174 +2030,6 @@ static void cortex_a15_initfn(Object *obj)
     define_arm_cp_regs(cpu, cortexa15_cp_reginfo);
 }
=20
-static void ti925t_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_V4T);
-    set_feature(&cpu->env, ARM_FEATURE_OMAPCP);
-    cpu->midr =3D ARM_CPUID_TI925T;
-    cpu->ctr =3D 0x5109149;
-    cpu->reset_sctlr =3D 0x00000070;
-}
-
-static void sa1100_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "intel,sa1100";
-    set_feature(&cpu->env, ARM_FEATURE_STRONGARM);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    cpu->midr =3D 0x4401A11B;
-    cpu->reset_sctlr =3D 0x00000070;
-}
-
-static void sa1110_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-    set_feature(&cpu->env, ARM_FEATURE_STRONGARM);
-    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
-    cpu->midr =3D 0x6901B119;
-    cpu->reset_sctlr =3D 0x00000070;
-}
-
-static void pxa250_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    cpu->midr =3D 0x69052100;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa255_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    cpu->midr =3D 0x69052d00;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa260_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    cpu->midr =3D 0x69052903;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa261_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    cpu->midr =3D 0x69052d05;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa262_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    cpu->midr =3D 0x69052d06;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa270a0_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
-    cpu->midr =3D 0x69054110;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa270a1_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
-    cpu->midr =3D 0x69054111;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa270b0_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
-    cpu->midr =3D 0x69054112;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa270b1_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
-    cpu->midr =3D 0x69054113;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa270c0_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
-    cpu->midr =3D 0x69054114;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
-static void pxa270c5_initfn(Object *obj)
-{
-    ARMCPU *cpu =3D ARM_CPU(obj);
-
-    cpu->dtb_compatible =3D "marvell,xscale";
-    set_feature(&cpu->env, ARM_FEATURE_V5);
-    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
-    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
-    cpu->midr =3D 0x69054117;
-    cpu->ctr =3D 0xd172172;
-    cpu->reset_sctlr =3D 0x00000078;
-}
-
 #ifndef TARGET_AARCH64
 /* -cpu max: if KVM is enabled, like -cpu host (best possible with this ho=
st);
  * otherwise, a CPU with as many features enabled as our emulation support=
s.
@@ -2697,50 +2103,10 @@ static void arm_max_initfn(Object *obj)
=20
 static const ARMCPUInfo arm_cpus[] =3D {
 #if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
-    { .name =3D "arm926",      .initfn =3D arm926_initfn },
-    { .name =3D "arm946",      .initfn =3D arm946_initfn },
-    { .name =3D "arm1026",     .initfn =3D arm1026_initfn },
-    /*
-     * What QEMU calls "arm1136-r2" is actually the 1136 r0p2, i.e. an
-     * older core than plain "arm1136". In particular this does not
-     * have the v6K features.
-     */
-    { .name =3D "arm1136-r2",  .initfn =3D arm1136_r2_initfn },
-    { .name =3D "arm1136",     .initfn =3D arm1136_initfn },
-    { .name =3D "arm1176",     .initfn =3D arm1176_initfn },
-    { .name =3D "arm11mpcore", .initfn =3D arm11mpcore_initfn },
-    { .name =3D "cortex-m0",   .initfn =3D cortex_m0_initfn,
-                             .class_init =3D arm_v7m_class_init },
-    { .name =3D "cortex-m3",   .initfn =3D cortex_m3_initfn,
-                             .class_init =3D arm_v7m_class_init },
-    { .name =3D "cortex-m4",   .initfn =3D cortex_m4_initfn,
-                             .class_init =3D arm_v7m_class_init },
-    { .name =3D "cortex-m7",   .initfn =3D cortex_m7_initfn,
-                             .class_init =3D arm_v7m_class_init },
-    { .name =3D "cortex-m33",  .initfn =3D cortex_m33_initfn,
-                             .class_init =3D arm_v7m_class_init },
-    { .name =3D "cortex-r5",   .initfn =3D cortex_r5_initfn },
-    { .name =3D "cortex-r5f",  .initfn =3D cortex_r5f_initfn },
     { .name =3D "cortex-a7",   .initfn =3D cortex_a7_initfn },
     { .name =3D "cortex-a8",   .initfn =3D cortex_a8_initfn },
     { .name =3D "cortex-a9",   .initfn =3D cortex_a9_initfn },
     { .name =3D "cortex-a15",  .initfn =3D cortex_a15_initfn },
-    { .name =3D "ti925t",      .initfn =3D ti925t_initfn },
-    { .name =3D "sa1100",      .initfn =3D sa1100_initfn },
-    { .name =3D "sa1110",      .initfn =3D sa1110_initfn },
-    { .name =3D "pxa250",      .initfn =3D pxa250_initfn },
-    { .name =3D "pxa255",      .initfn =3D pxa255_initfn },
-    { .name =3D "pxa260",      .initfn =3D pxa260_initfn },
-    { .name =3D "pxa261",      .initfn =3D pxa261_initfn },
-    { .name =3D "pxa262",      .initfn =3D pxa262_initfn },
-    /* "pxa270" is an alias for "pxa270-a0" */
-    { .name =3D "pxa270",      .initfn =3D pxa270a0_initfn },
-    { .name =3D "pxa270-a0",   .initfn =3D pxa270a0_initfn },
-    { .name =3D "pxa270-a1",   .initfn =3D pxa270a1_initfn },
-    { .name =3D "pxa270-b0",   .initfn =3D pxa270b0_initfn },
-    { .name =3D "pxa270-b1",   .initfn =3D pxa270b1_initfn },
-    { .name =3D "pxa270-c0",   .initfn =3D pxa270c0_initfn },
-    { .name =3D "pxa270-c5",   .initfn =3D pxa270c5_initfn },
 #ifndef TARGET_AARCH64
     { .name =3D "max",         .initfn =3D arm_max_initfn },
 #endif
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
new file mode 100644
index 0000000000..591baef535
--- /dev/null
+++ b/target/arm/cpu_tcg.c
@@ -0,0 +1,664 @@
+/*
+ * QEMU ARM TCG CPUs.
+ *
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+
+/* CPU models. These are not needed for the AArch64 linux-user build. */
+#if !defined(CONFIG_USER_ONLY) || !defined(TARGET_AARCH64)
+
+static bool arm_v7m_cpu_exec_interrupt(CPUState *cs, int interrupt_request=
)
+{
+    CPUClass *cc =3D CPU_GET_CLASS(cs);
+    ARMCPU *cpu =3D ARM_CPU(cs);
+    CPUARMState *env =3D &cpu->env;
+    bool ret =3D false;
+
+    /*
+     * ARMv7-M interrupt masking works differently than -A or -R.
+     * There is no FIQ/IRQ distinction. Instead of I and F bits
+     * masking FIQ and IRQ interrupts, an exception is taken only
+     * if it is higher priority than the current execution priority
+     * (which depends on state like BASEPRI, FAULTMASK and the
+     * currently active exception).
+     */
+    if (interrupt_request & CPU_INTERRUPT_HARD
+        && (armv7m_nvic_can_take_pending_exception(env->nvic))) {
+        cs->exception_index =3D EXCP_IRQ;
+        cc->do_interrupt(cs);
+        ret =3D true;
+    }
+    return ret;
+}
+
+static void arm926_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "arm,arm926";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
+    cpu->midr =3D 0x41069265;
+    cpu->reset_fpsid =3D 0x41011090;
+    cpu->ctr =3D 0x1dd20d2;
+    cpu->reset_sctlr =3D 0x00090078;
+
+    /*
+     * ARMv5 does not have the ID_ISAR registers, but we can still
+     * set the field to indicate Jazelle support within QEMU.
+     */
+    cpu->isar.id_isar1 =3D FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELL=
E, 1);
+    /*
+     * Similarly, we need to set MVFR0 fields to enable vfp and short vect=
or
+     * support even though ARMv5 doesn't have this register.
+     */
+    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
+    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
+}
+
+static void arm946_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "arm,arm946";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_PMSA);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    cpu->midr =3D 0x41059461;
+    cpu->ctr =3D 0x0f004006;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void arm1026_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "arm,arm1026";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_AUXCR);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_TEST_CLEAN);
+    cpu->midr =3D 0x4106a262;
+    cpu->reset_fpsid =3D 0x410110a0;
+    cpu->ctr =3D 0x1dd20d2;
+    cpu->reset_sctlr =3D 0x00090078;
+    cpu->reset_auxcr =3D 1;
+
+    /*
+     * ARMv5 does not have the ID_ISAR registers, but we can still
+     * set the field to indicate Jazelle support within QEMU.
+     */
+    cpu->isar.id_isar1 =3D FIELD_DP32(cpu->isar.id_isar1, ID_ISAR1, JAZELL=
E, 1);
+    /*
+     * Similarly, we need to set MVFR0 fields to enable vfp and short vect=
or
+     * support even though ARMv5 doesn't have this register.
+     */
+    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
+    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSP, 1);
+    cpu->isar.mvfr0 =3D FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
+
+    {
+        /* The 1026 had an IFAR at c6,c0,0,1 rather than the ARMv6 c6,c0,0=
,2 */
+        ARMCPRegInfo ifar =3D {
+            .name =3D "IFAR", .cp =3D 15, .crn =3D 6, .crm =3D 0, .opc1 =
=3D 0, .opc2 =3D 1,
+            .access =3D PL1_RW,
+            .fieldoffset =3D offsetof(CPUARMState, cp15.ifar_ns),
+            .resetvalue =3D 0
+        };
+        define_one_arm_cp_reg(cpu, &ifar);
+    }
+}
+
+static void arm1136_r2_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    /*
+     * What qemu calls "arm1136_r2" is actually the 1136 r0p2, ie an
+     * older core than plain "arm1136". In particular this does not
+     * have the v6K features.
+     * These ID register values are correct for 1136 but may be wrong
+     * for 1136_r2 (in particular r0p2 does not actually implement most
+     * of the ID registers).
+     */
+
+    cpu->dtb_compatible =3D "arm,arm1136";
+    set_feature(&cpu->env, ARM_FEATURE_V6);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
+    cpu->midr =3D 0x4107b362;
+    cpu->reset_fpsid =3D 0x410120b4;
+    cpu->isar.mvfr0 =3D 0x11111111;
+    cpu->isar.mvfr1 =3D 0x00000000;
+    cpu->ctr =3D 0x1dd20d2;
+    cpu->reset_sctlr =3D 0x00050078;
+    cpu->id_pfr0 =3D 0x111;
+    cpu->id_pfr1 =3D 0x1;
+    cpu->isar.id_dfr0 =3D 0x2;
+    cpu->id_afr0 =3D 0x3;
+    cpu->isar.id_mmfr0 =3D 0x01130003;
+    cpu->isar.id_mmfr1 =3D 0x10030302;
+    cpu->isar.id_mmfr2 =3D 0x01222110;
+    cpu->isar.id_isar0 =3D 0x00140011;
+    cpu->isar.id_isar1 =3D 0x12002111;
+    cpu->isar.id_isar2 =3D 0x11231111;
+    cpu->isar.id_isar3 =3D 0x01102131;
+    cpu->isar.id_isar4 =3D 0x141;
+    cpu->reset_auxcr =3D 7;
+}
+
+static void arm1136_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "arm,arm1136";
+    set_feature(&cpu->env, ARM_FEATURE_V6K);
+    set_feature(&cpu->env, ARM_FEATURE_V6);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
+    cpu->midr =3D 0x4117b363;
+    cpu->reset_fpsid =3D 0x410120b4;
+    cpu->isar.mvfr0 =3D 0x11111111;
+    cpu->isar.mvfr1 =3D 0x00000000;
+    cpu->ctr =3D 0x1dd20d2;
+    cpu->reset_sctlr =3D 0x00050078;
+    cpu->id_pfr0 =3D 0x111;
+    cpu->id_pfr1 =3D 0x1;
+    cpu->isar.id_dfr0 =3D 0x2;
+    cpu->id_afr0 =3D 0x3;
+    cpu->isar.id_mmfr0 =3D 0x01130003;
+    cpu->isar.id_mmfr1 =3D 0x10030302;
+    cpu->isar.id_mmfr2 =3D 0x01222110;
+    cpu->isar.id_isar0 =3D 0x00140011;
+    cpu->isar.id_isar1 =3D 0x12002111;
+    cpu->isar.id_isar2 =3D 0x11231111;
+    cpu->isar.id_isar3 =3D 0x01102131;
+    cpu->isar.id_isar4 =3D 0x141;
+    cpu->reset_auxcr =3D 7;
+}
+
+static void arm1176_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "arm,arm1176";
+    set_feature(&cpu->env, ARM_FEATURE_V6K);
+    set_feature(&cpu->env, ARM_FEATURE_VAPA);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_DIRTY_REG);
+    set_feature(&cpu->env, ARM_FEATURE_CACHE_BLOCK_OPS);
+    set_feature(&cpu->env, ARM_FEATURE_EL3);
+    cpu->midr =3D 0x410fb767;
+    cpu->reset_fpsid =3D 0x410120b5;
+    cpu->isar.mvfr0 =3D 0x11111111;
+    cpu->isar.mvfr1 =3D 0x00000000;
+    cpu->ctr =3D 0x1dd20d2;
+    cpu->reset_sctlr =3D 0x00050078;
+    cpu->id_pfr0 =3D 0x111;
+    cpu->id_pfr1 =3D 0x11;
+    cpu->isar.id_dfr0 =3D 0x33;
+    cpu->id_afr0 =3D 0;
+    cpu->isar.id_mmfr0 =3D 0x01130003;
+    cpu->isar.id_mmfr1 =3D 0x10030302;
+    cpu->isar.id_mmfr2 =3D 0x01222100;
+    cpu->isar.id_isar0 =3D 0x0140011;
+    cpu->isar.id_isar1 =3D 0x12002111;
+    cpu->isar.id_isar2 =3D 0x11231121;
+    cpu->isar.id_isar3 =3D 0x01102131;
+    cpu->isar.id_isar4 =3D 0x01141;
+    cpu->reset_auxcr =3D 7;
+}
+
+static void arm11mpcore_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "arm,arm11mpcore";
+    set_feature(&cpu->env, ARM_FEATURE_V6K);
+    set_feature(&cpu->env, ARM_FEATURE_VAPA);
+    set_feature(&cpu->env, ARM_FEATURE_MPIDR);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    cpu->midr =3D 0x410fb022;
+    cpu->reset_fpsid =3D 0x410120b4;
+    cpu->isar.mvfr0 =3D 0x11111111;
+    cpu->isar.mvfr1 =3D 0x00000000;
+    cpu->ctr =3D 0x1d192992; /* 32K icache 32K dcache */
+    cpu->id_pfr0 =3D 0x111;
+    cpu->id_pfr1 =3D 0x1;
+    cpu->isar.id_dfr0 =3D 0;
+    cpu->id_afr0 =3D 0x2;
+    cpu->isar.id_mmfr0 =3D 0x01100103;
+    cpu->isar.id_mmfr1 =3D 0x10020302;
+    cpu->isar.id_mmfr2 =3D 0x01222000;
+    cpu->isar.id_isar0 =3D 0x00100011;
+    cpu->isar.id_isar1 =3D 0x12002111;
+    cpu->isar.id_isar2 =3D 0x11221011;
+    cpu->isar.id_isar3 =3D 0x01102131;
+    cpu->isar.id_isar4 =3D 0x141;
+    cpu->reset_auxcr =3D 1;
+}
+
+static void cortex_m0_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    set_feature(&cpu->env, ARM_FEATURE_V6);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+
+    cpu->midr =3D 0x410cc200;
+}
+
+static void cortex_m3_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    cpu->midr =3D 0x410fc231;
+    cpu->pmsav7_dregion =3D 8;
+    cpu->id_pfr0 =3D 0x00000030;
+    cpu->id_pfr1 =3D 0x00000200;
+    cpu->isar.id_dfr0 =3D 0x00100000;
+    cpu->id_afr0 =3D 0x00000000;
+    cpu->isar.id_mmfr0 =3D 0x00000030;
+    cpu->isar.id_mmfr1 =3D 0x00000000;
+    cpu->isar.id_mmfr2 =3D 0x00000000;
+    cpu->isar.id_mmfr3 =3D 0x00000000;
+    cpu->isar.id_isar0 =3D 0x01141110;
+    cpu->isar.id_isar1 =3D 0x02111000;
+    cpu->isar.id_isar2 =3D 0x21112231;
+    cpu->isar.id_isar3 =3D 0x01111110;
+    cpu->isar.id_isar4 =3D 0x01310102;
+    cpu->isar.id_isar5 =3D 0x00000000;
+    cpu->isar.id_isar6 =3D 0x00000000;
+}
+
+static void cortex_m4_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    cpu->midr =3D 0x410fc240; /* r0p0 */
+    cpu->pmsav7_dregion =3D 8;
+    cpu->isar.mvfr0 =3D 0x10110021;
+    cpu->isar.mvfr1 =3D 0x11000011;
+    cpu->isar.mvfr2 =3D 0x00000000;
+    cpu->id_pfr0 =3D 0x00000030;
+    cpu->id_pfr1 =3D 0x00000200;
+    cpu->isar.id_dfr0 =3D 0x00100000;
+    cpu->id_afr0 =3D 0x00000000;
+    cpu->isar.id_mmfr0 =3D 0x00000030;
+    cpu->isar.id_mmfr1 =3D 0x00000000;
+    cpu->isar.id_mmfr2 =3D 0x00000000;
+    cpu->isar.id_mmfr3 =3D 0x00000000;
+    cpu->isar.id_isar0 =3D 0x01141110;
+    cpu->isar.id_isar1 =3D 0x02111000;
+    cpu->isar.id_isar2 =3D 0x21112231;
+    cpu->isar.id_isar3 =3D 0x01111110;
+    cpu->isar.id_isar4 =3D 0x01310102;
+    cpu->isar.id_isar5 =3D 0x00000000;
+    cpu->isar.id_isar6 =3D 0x00000000;
+}
+
+static void cortex_m7_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    cpu->midr =3D 0x411fc272; /* r1p2 */
+    cpu->pmsav7_dregion =3D 8;
+    cpu->isar.mvfr0 =3D 0x10110221;
+    cpu->isar.mvfr1 =3D 0x12000011;
+    cpu->isar.mvfr2 =3D 0x00000040;
+    cpu->id_pfr0 =3D 0x00000030;
+    cpu->id_pfr1 =3D 0x00000200;
+    cpu->isar.id_dfr0 =3D 0x00100000;
+    cpu->id_afr0 =3D 0x00000000;
+    cpu->isar.id_mmfr0 =3D 0x00100030;
+    cpu->isar.id_mmfr1 =3D 0x00000000;
+    cpu->isar.id_mmfr2 =3D 0x01000000;
+    cpu->isar.id_mmfr3 =3D 0x00000000;
+    cpu->isar.id_isar0 =3D 0x01101110;
+    cpu->isar.id_isar1 =3D 0x02112000;
+    cpu->isar.id_isar2 =3D 0x20232231;
+    cpu->isar.id_isar3 =3D 0x01111131;
+    cpu->isar.id_isar4 =3D 0x01310132;
+    cpu->isar.id_isar5 =3D 0x00000000;
+    cpu->isar.id_isar6 =3D 0x00000000;
+}
+
+static void cortex_m33_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V8);
+    set_feature(&cpu->env, ARM_FEATURE_M);
+    set_feature(&cpu->env, ARM_FEATURE_M_MAIN);
+    set_feature(&cpu->env, ARM_FEATURE_M_SECURITY);
+    set_feature(&cpu->env, ARM_FEATURE_THUMB_DSP);
+    cpu->midr =3D 0x410fd213; /* r0p3 */
+    cpu->pmsav7_dregion =3D 16;
+    cpu->sau_sregion =3D 8;
+    cpu->isar.mvfr0 =3D 0x10110021;
+    cpu->isar.mvfr1 =3D 0x11000011;
+    cpu->isar.mvfr2 =3D 0x00000040;
+    cpu->id_pfr0 =3D 0x00000030;
+    cpu->id_pfr1 =3D 0x00000210;
+    cpu->isar.id_dfr0 =3D 0x00200000;
+    cpu->id_afr0 =3D 0x00000000;
+    cpu->isar.id_mmfr0 =3D 0x00101F40;
+    cpu->isar.id_mmfr1 =3D 0x00000000;
+    cpu->isar.id_mmfr2 =3D 0x01000000;
+    cpu->isar.id_mmfr3 =3D 0x00000000;
+    cpu->isar.id_isar0 =3D 0x01101110;
+    cpu->isar.id_isar1 =3D 0x02212000;
+    cpu->isar.id_isar2 =3D 0x20232232;
+    cpu->isar.id_isar3 =3D 0x01111131;
+    cpu->isar.id_isar4 =3D 0x01310132;
+    cpu->isar.id_isar5 =3D 0x00000000;
+    cpu->isar.id_isar6 =3D 0x00000000;
+    cpu->clidr =3D 0x00000000;
+    cpu->ctr =3D 0x8000c000;
+}
+
+static const ARMCPRegInfo cortexr5_cp_reginfo[] =3D {
+    /* Dummy the TCM region regs for the moment */
+    { .name =3D "ATCM", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 1, .=
opc2 =3D 0,
+      .access =3D PL1_RW, .type =3D ARM_CP_CONST },
+    { .name =3D "BTCM", .cp =3D 15, .opc1 =3D 0, .crn =3D 9, .crm =3D 1, .=
opc2 =3D 1,
+      .access =3D PL1_RW, .type =3D ARM_CP_CONST },
+    { .name =3D "DCACHE_INVAL", .cp =3D 15, .opc1 =3D 0, .crn =3D 15, .crm=
 =3D 5,
+      .opc2 =3D 0, .access =3D PL1_W, .type =3D ARM_CP_NOP },
+    REGINFO_SENTINEL
+};
+
+static void cortex_r5_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    set_feature(&cpu->env, ARM_FEATURE_V7);
+    set_feature(&cpu->env, ARM_FEATURE_V7MP);
+    set_feature(&cpu->env, ARM_FEATURE_PMSA);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
+    cpu->midr =3D 0x411fc153; /* r1p3 */
+    cpu->id_pfr0 =3D 0x0131;
+    cpu->id_pfr1 =3D 0x001;
+    cpu->isar.id_dfr0 =3D 0x010400;
+    cpu->id_afr0 =3D 0x0;
+    cpu->isar.id_mmfr0 =3D 0x0210030;
+    cpu->isar.id_mmfr1 =3D 0x00000000;
+    cpu->isar.id_mmfr2 =3D 0x01200000;
+    cpu->isar.id_mmfr3 =3D 0x0211;
+    cpu->isar.id_isar0 =3D 0x02101111;
+    cpu->isar.id_isar1 =3D 0x13112111;
+    cpu->isar.id_isar2 =3D 0x21232141;
+    cpu->isar.id_isar3 =3D 0x01112131;
+    cpu->isar.id_isar4 =3D 0x0010142;
+    cpu->isar.id_isar5 =3D 0x0;
+    cpu->isar.id_isar6 =3D 0x0;
+    cpu->mp_is_up =3D true;
+    cpu->pmsav7_dregion =3D 16;
+    define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
+}
+
+static void cortex_r5f_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cortex_r5_initfn(obj);
+    cpu->isar.mvfr0 =3D 0x10110221;
+    cpu->isar.mvfr1 =3D 0x00000011;
+}
+
+static void ti925t_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    set_feature(&cpu->env, ARM_FEATURE_V4T);
+    set_feature(&cpu->env, ARM_FEATURE_OMAPCP);
+    cpu->midr =3D ARM_CPUID_TI925T;
+    cpu->ctr =3D 0x5109149;
+    cpu->reset_sctlr =3D 0x00000070;
+}
+
+static void sa1100_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "intel,sa1100";
+    set_feature(&cpu->env, ARM_FEATURE_STRONGARM);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    cpu->midr =3D 0x4401A11B;
+    cpu->reset_sctlr =3D 0x00000070;
+}
+
+static void sa1110_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    set_feature(&cpu->env, ARM_FEATURE_STRONGARM);
+    set_feature(&cpu->env, ARM_FEATURE_DUMMY_C15_REGS);
+    cpu->midr =3D 0x6901B119;
+    cpu->reset_sctlr =3D 0x00000070;
+}
+
+static void pxa250_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    cpu->midr =3D 0x69052100;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa255_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    cpu->midr =3D 0x69052d00;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa260_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    cpu->midr =3D 0x69052903;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa261_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    cpu->midr =3D 0x69052d05;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa262_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    cpu->midr =3D 0x69052d06;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa270a0_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    cpu->midr =3D 0x69054110;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa270a1_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    cpu->midr =3D 0x69054111;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa270b0_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    cpu->midr =3D 0x69054112;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa270b1_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    cpu->midr =3D 0x69054113;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa270c0_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    cpu->midr =3D 0x69054114;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void pxa270c5_initfn(Object *obj)
+{
+    ARMCPU *cpu =3D ARM_CPU(obj);
+
+    cpu->dtb_compatible =3D "marvell,xscale";
+    set_feature(&cpu->env, ARM_FEATURE_V5);
+    set_feature(&cpu->env, ARM_FEATURE_XSCALE);
+    set_feature(&cpu->env, ARM_FEATURE_IWMMXT);
+    cpu->midr =3D 0x69054117;
+    cpu->ctr =3D 0xd172172;
+    cpu->reset_sctlr =3D 0x00000078;
+}
+
+static void arm_v7m_class_init(ObjectClass *oc, void *data)
+{
+    ARMCPUClass *acc =3D ARM_CPU_CLASS(oc);
+    CPUClass *cc =3D CPU_CLASS(oc);
+
+    acc->info =3D data;
+#ifndef CONFIG_USER_ONLY
+    cc->do_interrupt =3D arm_v7m_cpu_do_interrupt;
+#endif
+
+    cc->cpu_exec_interrupt =3D arm_v7m_cpu_exec_interrupt;
+}
+
+static const ARMCPUInfo arm_tcg_cpus[] =3D {
+    { .name =3D "arm926",      .initfn =3D arm926_initfn },
+    { .name =3D "arm946",      .initfn =3D arm946_initfn },
+    { .name =3D "arm1026",     .initfn =3D arm1026_initfn },
+    /*
+     * What QEMU calls "arm1136-r2" is actually the 1136 r0p2, i.e. an
+     * older core than plain "arm1136". In particular this does not
+     * have the v6K features.
+     */
+    { .name =3D "arm1136-r2",  .initfn =3D arm1136_r2_initfn },
+    { .name =3D "arm1136",     .initfn =3D arm1136_initfn },
+    { .name =3D "arm1176",     .initfn =3D arm1176_initfn },
+    { .name =3D "arm11mpcore", .initfn =3D arm11mpcore_initfn },
+    { .name =3D "cortex-m0",   .initfn =3D cortex_m0_initfn,
+                             .class_init =3D arm_v7m_class_init },
+    { .name =3D "cortex-m3",   .initfn =3D cortex_m3_initfn,
+                             .class_init =3D arm_v7m_class_init },
+    { .name =3D "cortex-m4",   .initfn =3D cortex_m4_initfn,
+                             .class_init =3D arm_v7m_class_init },
+    { .name =3D "cortex-m7",   .initfn =3D cortex_m7_initfn,
+                             .class_init =3D arm_v7m_class_init },
+    { .name =3D "cortex-m33",  .initfn =3D cortex_m33_initfn,
+                             .class_init =3D arm_v7m_class_init },
+    { .name =3D "cortex-r5",   .initfn =3D cortex_r5_initfn },
+    { .name =3D "cortex-r5f",  .initfn =3D cortex_r5f_initfn },
+    { .name =3D "ti925t",      .initfn =3D ti925t_initfn },
+    { .name =3D "sa1100",      .initfn =3D sa1100_initfn },
+    { .name =3D "sa1110",      .initfn =3D sa1110_initfn },
+    { .name =3D "pxa250",      .initfn =3D pxa250_initfn },
+    { .name =3D "pxa255",      .initfn =3D pxa255_initfn },
+    { .name =3D "pxa260",      .initfn =3D pxa260_initfn },
+    { .name =3D "pxa261",      .initfn =3D pxa261_initfn },
+    { .name =3D "pxa262",      .initfn =3D pxa262_initfn },
+    /* "pxa270" is an alias for "pxa270-a0" */
+    { .name =3D "pxa270",      .initfn =3D pxa270a0_initfn },
+    { .name =3D "pxa270-a0",   .initfn =3D pxa270a0_initfn },
+    { .name =3D "pxa270-a1",   .initfn =3D pxa270a1_initfn },
+    { .name =3D "pxa270-b0",   .initfn =3D pxa270b0_initfn },
+    { .name =3D "pxa270-b1",   .initfn =3D pxa270b1_initfn },
+    { .name =3D "pxa270-c0",   .initfn =3D pxa270c0_initfn },
+    { .name =3D "pxa270-c5",   .initfn =3D pxa270c5_initfn },
+};
+
+static void arm_tcg_cpu_register_types(void)
+{
+    size_t i;
+
+    for (i =3D 0; i < ARRAY_SIZE(arm_tcg_cpus); ++i) {
+        arm_cpu_register(&arm_tcg_cpus[i]);
+    }
+}
+
+type_init(arm_tcg_cpu_register_types)
+
+#endif /* !CONFIG_USER_ONLY || !TARGET_AARCH64 */
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index cf26c16f5f..212b588afd 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -61,6 +61,7 @@ obj-y +=3D translate.o op_helper.o
 obj-y +=3D crypto_helper.o
 obj-y +=3D iwmmxt_helper.o vec_helper.o neon_helper.o
 obj-y +=3D m_helper.o
+obj-y +=3D cpu_tcg.o
=20
 obj-$(CONFIG_SOFTMMU) +=3D psci.o
=20
--=20
2.21.1


