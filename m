Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ACA6944E3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 12:53:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRXO0-00045y-ML; Mon, 13 Feb 2023 06:52:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRXNz-000451-5l
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:52:43 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pRXNx-0005Le-CZ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 06:52:42 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 24so7926440pgt.7
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 03:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676289159;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Rfr0vB/rPk3zdU4Xx55SHy2XeRyBDOkTls6Yb2BvMsc=;
 b=Hf5v5UoStgKxQLJw9aYgBgJisc8pbs2ZXKfYykHvGu48ud7vtjtMQ9SQ7j+PuHE4BL
 NFwWP4sZ3JCEptiAvobhvtC9Z3eOGrglPNzdgfDXDm7UbvWbCgZXgbeZYeVSWVCYuaJg
 NQXSV6drMgOtskNvfToGFrvdo7ukeSn+4MQXbS5cfvC/iVru7Fs5ewB2n3TMdKCRYCly
 p6B0vI33WSTKpY7r8eoJzLDJPphJybG6q3icu7f0bkcQPuiTO0GfenueCFk2kFx5XZrp
 3fl1vHxxjZ5Fdy+mgeUja9rvaGZsYQPjvPP3K+BUOlpNclrBTUCP8ShgabSP8p8kO4af
 JuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676289159;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rfr0vB/rPk3zdU4Xx55SHy2XeRyBDOkTls6Yb2BvMsc=;
 b=zgAUXPQfZw9OnJ2sGzkTNCEJAXHVTzj34WsVPc46euWnZxWEdLybXmW+2KJHps9yhY
 /eS06S8bHjY/G7DQjKQoWle5XWu5/Tl/+9HGVBUzDPWPfpae5k0aqmILECeoRBGUILwN
 JpGDsES7xUMUisNJYwCSzbysiHen7AZZuQ2piC0m19BRZywOpKFK2iigRMZCLbU9sguj
 BPJxezXr/k2c0XTT97LHk1ENVbpkFIdsXmyeYhPnO8JzF3RwOJO2bO4NFWQ3QmcAlDFR
 lZk+vEnmeBWL4aGwD4Xjs+FjdoxGqHeIlfxoAH9nRncjPmF7CmTcUuX9u4GNE+g+Zj06
 PfAg==
X-Gm-Message-State: AO0yUKXCs+qa9eI4yIWl8eTnHQDri/GVd8cSavDjOZ8YeBLi07Tic8Xs
 mDJVstgx7bGpn/KVmJloFBtX7YJ9P4j4R7i3iL0Iuw==
X-Google-Smtp-Source: AK7set+VvmNtHODiG0To9RK3O9dwwfTqS9j+HowuTm1ExRgon2bWio611ixArq44BF04gURYcarSNR6nQ3AnPxrIqmU=
X-Received: by 2002:a62:1c8c:0:b0:593:ef2a:5ea8 with SMTP id
 c134-20020a621c8c000000b00593ef2a5ea8mr4586052pfc.7.1676289159100; Mon, 13
 Feb 2023 03:52:39 -0800 (PST)
MIME-Version: 1.0
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
 <20230114161302.94595-3-fcagnin@quarkslab.com>
In-Reply-To: <20230114161302.94595-3-fcagnin@quarkslab.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Feb 2023 11:52:27 +0000
Message-ID: <CAFEAcA_qaOD_6uCLdGwsGFibDo1B5DQ30r51XHk_HKJmC9NPyA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hvf: implement guest debugging on Apple Silicon
 hosts
To: francesco.cagnin@gmail.com
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com, 
 alex.bennee@linaro.org, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 14 Jan 2023 at 16:13, <francesco.cagnin@gmail.com> wrote:
>
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
>
> Guests can be debugged through the gdbstub.
>
> While guest debugging is enabled, the guest can still read and write the
> DBG*_EL1 registers but they don't have any effect.
>
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>

This fails to build on x86 macos:
Undefined symbols for architecture x86_64:
  "_hvf_arch_insert_hw_breakpoint", referenced from:
      _hvf_insert_breakpoint in accel_hvf_hvf-accel-ops.c.o
  "_hvf_arch_insert_sw_breakpoint", referenced from:
      _hvf_insert_breakpoint in accel_hvf_hvf-accel-ops.c.o
  "_hvf_arch_remove_all_hw_breakpoints", referenced from:
      _hvf_remove_all_breakpoints in accel_hvf_hvf-accel-ops.c.o
  "_hvf_arch_remove_hw_breakpoint", referenced from:
      _hvf_remove_breakpoint in accel_hvf_hvf-accel-ops.c.o
  "_hvf_arch_remove_sw_breakpoint", referenced from:
      _hvf_remove_breakpoint in accel_hvf_hvf-accel-ops.c.o
      _hvf_remove_all_breakpoints in accel_hvf_hvf-accel-ops.c.o
  "_hvf_arch_update_guest_debug", referenced from:
      _hvf_update_guest_debug in accel_hvf_hvf-all.c.o

I think your abstraction layer between generic hvf code and
architecture-specific hvf code is missing x86 "do nothing"
implementations of functions.



> +static bool hvf_supports_guest_debug(void)
> +{
> +#ifdef TARGET_AARCH64
> +    return true;
> +#else
> +    return false;
> +#endif

This should defer to an architecture-specific function (or just
be an architecture specific function) rather than using an inline
ifdef.


> index bb70082e45..3e99c80416 100644
> --- a/include/sysemu/hvf.h
> +++ b/include/sysemu/hvf.h
> @@ -36,4 +36,33 @@ typedef struct HVFState HVFState;
>  DECLARE_INSTANCE_CHECKER(HVFState, HVF_STATE,
>                           TYPE_HVF_ACCEL)
>
> +#ifdef NEED_CPU_H
> +#include "cpu.h"

Please don't put #include lines in the middle of files -- keep them at the top.

> +
> +int hvf_update_guest_debug(CPUState *cpu);

Ideally new global functions declared in headers should
have documentation comments.

> +            case HV_SYS_REG_DBGWVR15_EL1:
> +            case HV_SYS_REG_DBGWCR15_EL1: {
> +                const ARMCPRegInfo *ri;
> +                ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_sreg_match[i].key);
> +                val = read_raw_cp_reg(env, ri);
> +
> +                arm_cpu->cpreg_values[hvf_sreg_match[i].cp_idx] = val;

This would be much easier to understand if there was some commentary
explaining what it was doing.

> +                continue;
> +            }
> +            }
> +        }
> +
>          ret = hv_vcpu_get_sys_reg(cpu->hvf->fd, hvf_sreg_match[i].reg, &val);
>          assert_hvf_ok(ret);




> +void hvf_arch_update_guest_debug(CPUState *cpu)
> +{
> +    ARMCPU *arm_cpu = ARM_CPU(cpu);
> +    CPUARMState *env = &arm_cpu->env;
> +    hv_return_t r = HV_SUCCESS;
> +
> +    guest_debug_enabled = cpu->singlestep_enabled ||
> +        hvf_sw_breakpoints_active(cpu) ||
> +        hvf_arm_hw_debug_active(cpu);
> +
> +    cpu_synchronize_state(cpu);
> +
> +    if (cpu->singlestep_enabled) {
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 1);
> +        pstate_write(env, pstate_read(env) | PSTATE_SS);
> +    } else {
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 0);
> +    }
> +
> +    if (hvf_arm_hw_debug_active(cpu)) {
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 1);
> +
> +        int i;
> +        for (i = 0; i < cur_hw_bps; i++) {
> +            HWBreakpoint *bp = get_hw_bp(i);
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbcr_regs[i], bp->bcr);
> +            assert_hvf_ok(r);
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbvr_regs[i], bp->bvr);
> +            assert_hvf_ok(r);
> +        }
> +        for (i = 0; i < cur_hw_wps; i++) {
> +            HWWatchpoint *bp = get_hw_wp(i);
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwcr_regs[i], bp->wcr);
> +            assert_hvf_ok(r);
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwvr_regs[i], bp->wvr);
> +            assert_hvf_ok(r);
> +        }
> +    } else {
> +        env->cp15.mdscr_el1 =
> +            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 0);
> +
> +        int i;
> +        for (i = 0; i < max_hw_bps; i++) {
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbcr_regs[i], env->cp15.dbgbcr[i]);
> +            assert_hvf_ok(r);
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgbvr_regs[i], env->cp15.dbgbvr[i]);
> +            assert_hvf_ok(r);
> +        }
> +        for (i = 0; i < max_hw_wps; i++) {
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwcr_regs[i], env->cp15.dbgwcr[i]);
> +            assert_hvf_ok(r);
> +            r = hv_vcpu_set_sys_reg(cpu->hvf->fd, dbgwvr_regs[i], env->cp15.dbgwvr[i]);
> +            assert_hvf_ok(r);
> +        }
> +    }

Can you describe what's going on here? Conceptually there are two lots
of debug register state -- the one the guest vCPU has, and the one we
want to be using when we're doing gdbstub debugging. Where are we
keeping the two copies of the state, how do we decide which one to
feed to hvf as the live version, etc ?

More generally, I would prefer to be able to determine your design
by looking at the commit message and comments, rather than by
reverse-engineering it from the code :-)

thanks
-- PMM

