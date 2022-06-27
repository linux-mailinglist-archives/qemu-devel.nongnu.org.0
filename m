Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B1455B8E6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 11:13:28 +0200 (CEST)
Received: from localhost ([::1]:48260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5koB-0000Rv-4M
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 05:13:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kfJ-00071Y-0X
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:04:17 -0400
Received: from smtpout140.security-mail.net ([85.31.212.149]:53344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lmichel@kalray.eu>) id 1o5kfG-0007KT-Vk
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 05:04:16 -0400
Received: from localhost (localhost [127.0.0.1])
 by fx409.security-mail.net (Postfix) with ESMTP id 3BD52323CBF
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 11:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1656320653;
 bh=4LIE2kwSdFujlfnMmhj7V5zBRnRtTISZNFfxTe/dZDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=zk9vB8fnF067pFR0Bj3zGn2qmd424QGUaUmJvEqHAyMmZWbizFACJgzYNCBMedM00
 bbP11QD/WhJrYbk35bCEOE4HBVltpVh49XdYQqj/GAb26ZQwSbHwsAfUw7nFaBVnL1
 Pa8m2JD9Vg66SA0G3duZoCziB28PMyaoefMZA4R8=
Received: from fx409 (localhost [127.0.0.1]) by fx409.security-mail.net
 (Postfix) with ESMTP id E05F8323CBE; Mon, 27 Jun 2022 11:04:12 +0200 (CEST)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx409.security-mail.net (Postfix) with ESMTPS id BC280323BBC; Mon, 27 Jun
 2022 11:03:11 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 9DCDB27E04D6; Mon, 27 Jun 2022
 11:03:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 84E4827E04F8; Mon, 27 Jun 2022 11:03:11 +0200 (CEST)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 p3uQBLyKhO5V; Mon, 27 Jun 2022 11:03:11 +0200 (CEST)
Received: from localhost (unknown [192.168.36.68]) by zimbra2.kalray.eu
 (Postfix) with ESMTPSA id 65C6227E04D6; Mon, 27 Jun 2022 11:03:11 +0200
 (CEST)
X-Virus-Scanned: E-securemail, by Secumail
Secumail-id: <122f0.62b9724f.bb1f7.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 84E4827E04F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1656320591;
 bh=9cdoBWK7ixbQCPu2GccwiK1FZz5kRs9Iw/L8duUqNG8=;
 h=Date:From:To:Message-ID:MIME-Version;
 b=KIcyDFPUXJ2yFJ811T7tbiRtLM7lRq6SgWnWmqgcynXl3oh4avtvafCgcvYECEZvq
 oXhDCQz6iLfuGdkjnTRTUmwZfV8dcLnABHtNYOr+7XPPBQKHtbyL19m7O5j/OTAD0x
 VnAAdN8NAfKUwt2Y7Pc3PvnzmKfEZbbzPCEu5acI=
Date: Mon, 27 Jun 2022 11:03:10 +0200
From: Luc Michel <lmichel@kalray.eu>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 24/53] semihosting: Split out common-semi-target.h
Message-ID: <20220627090310.GJ1789@ws2101.lin.mbt.kalray.eu>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
 <20220607204557.658541-25-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220607204557.658541-25-richard.henderson@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Transfer-Encoding: 8bit
X-ALTERMIMEV2_out: done
Received-SPF: pass client-ip=85.31.212.149; envelope-from=lmichel@kalray.eu;
 helo=smtpout140.security-mail.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On 13:45 Tue 07 Jun     , Richard Henderson wrote:
> Move the ARM and RISCV specific helpers into
> their own header file.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Luc Michel <lmichel@kalray.eu>

> ---
>  target/arm/common-semi-target.h   | 62 ++++++++++++++++++++
>  target/riscv/common-semi-target.h | 50 ++++++++++++++++
>  semihosting/arm-compat-semi.c     | 94 +------------------------------
>  3 files changed, 113 insertions(+), 93 deletions(-)
>  create mode 100644 target/arm/common-semi-target.h
>  create mode 100644 target/riscv/common-semi-target.h
> 
> diff --git a/target/arm/common-semi-target.h b/target/arm/common-semi-target.h
> new file mode 100644
> index 0000000000..629d75ca5a
> --- /dev/null
> +++ b/target/arm/common-semi-target.h
> @@ -0,0 +1,62 @@
> +/*
> + * Target-specific parts of semihosting/arm-compat-semi.c.
> + *
> + * Copyright (c) 2005, 2007 CodeSourcery.
> + * Copyright (c) 2019, 2022 Linaro
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef TARGET_ARM_COMMON_SEMI_TARGET_H
> +#define TARGET_ARM_COMMON_SEMI_TARGET_H
> +
> +#ifndef CONFIG_USER_ONLY
> +#include "hw/arm/boot.h"
> +#endif
> +
> +static inline target_ulong common_semi_arg(CPUState *cs, int argno)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    if (is_a64(env)) {
> +        return env->xregs[argno];
> +    } else {
> +        return env->regs[argno];
> +    }
> +}
> +
> +static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    if (is_a64(env)) {
> +        env->xregs[0] = ret;
> +    } else {
> +        env->regs[0] = ret;
> +    }
> +}
> +
> +static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
> +{
> +    return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
> +}
> +
> +static inline bool is_64bit_semihosting(CPUArchState *env)
> +{
> +    return is_a64(env);
> +}
> +
> +static inline target_ulong common_semi_stack_bottom(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    return is_a64(env) ? env->xregs[31] : env->regs[13];
> +}
> +
> +static inline bool common_semi_has_synccache(CPUArchState *env)
> +{
> +    /* Ok for A64, invalid for A32/T32 */
> +    return is_a64(env);
> +}
> +
> +#endif
> diff --git a/target/riscv/common-semi-target.h b/target/riscv/common-semi-target.h
> new file mode 100644
> index 0000000000..7c8a59e0cc
> --- /dev/null
> +++ b/target/riscv/common-semi-target.h
> @@ -0,0 +1,50 @@
> +/*
> + * Target-specific parts of semihosting/arm-compat-semi.c.
> + *
> + * Copyright (c) 2005, 2007 CodeSourcery.
> + * Copyright (c) 2019, 2022 Linaro
> + * Copyright © 2020 by Keith Packard <keithp@keithp.com>
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#ifndef TARGET_RISCV_COMMON_SEMI_TARGET_H
> +#define TARGET_RISCV_COMMON_SEMI_TARGET_H
> +
> +static inline target_ulong common_semi_arg(CPUState *cs, int argno)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    return env->gpr[xA0 + argno];
> +}
> +
> +static inline void common_semi_set_ret(CPUState *cs, target_ulong ret)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    env->gpr[xA0] = ret;
> +}
> +
> +static inline bool common_semi_sys_exit_extended(CPUState *cs, int nr)
> +{
> +    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
> +}
> +
> +static inline bool is_64bit_semihosting(CPUArchState *env)
> +{
> +    return riscv_cpu_mxl(env) != MXL_RV32;
> +}
> +
> +static inline target_ulong common_semi_stack_bottom(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    return env->gpr[xSP];
> +}
> +
> +static inline bool common_semi_has_synccache(CPUArchState *env)
> +{
> +    return true;
> +}
> +
> +#endif
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 50f40a2a1a..5e442e549d 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -46,9 +46,6 @@
>  #else
>  #include "qemu/cutils.h"
>  #include "hw/loader.h"
> -#ifdef TARGET_ARM
> -#include "hw/arm/boot.h"
> -#endif
>  #include "hw/boards.h"
>  #endif
>  
> @@ -182,96 +179,7 @@ static LayoutInfo common_semi_find_bases(CPUState *cs)
>  
>  #endif
>  
> -#ifdef TARGET_ARM
> -static inline target_ulong
> -common_semi_arg(CPUState *cs, int argno)
> -{
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -    if (is_a64(env)) {
> -        return env->xregs[argno];
> -    } else {
> -        return env->regs[argno];
> -    }
> -}
> -
> -static inline void
> -common_semi_set_ret(CPUState *cs, target_ulong ret)
> -{
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -    if (is_a64(env)) {
> -        env->xregs[0] = ret;
> -    } else {
> -        env->regs[0] = ret;
> -    }
> -}
> -
> -static inline bool
> -common_semi_sys_exit_extended(CPUState *cs, int nr)
> -{
> -    return (nr == TARGET_SYS_EXIT_EXTENDED || is_a64(cs->env_ptr));
> -}
> -
> -static inline bool is_64bit_semihosting(CPUArchState *env)
> -{
> -    return is_a64(env);
> -}
> -
> -static inline target_ulong common_semi_stack_bottom(CPUState *cs)
> -{
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -    return is_a64(env) ? env->xregs[31] : env->regs[13];
> -}
> -
> -static inline bool common_semi_has_synccache(CPUArchState *env)
> -{
> -    /* Ok for A64, invalid for A32/T32. */
> -    return is_a64(env);
> -}
> -#endif /* TARGET_ARM */
> -
> -#ifdef TARGET_RISCV
> -static inline target_ulong
> -common_semi_arg(CPUState *cs, int argno)
> -{
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -    CPURISCVState *env = &cpu->env;
> -    return env->gpr[xA0 + argno];
> -}
> -
> -static inline void
> -common_semi_set_ret(CPUState *cs, target_ulong ret)
> -{
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -    CPURISCVState *env = &cpu->env;
> -    env->gpr[xA0] = ret;
> -}
> -
> -static inline bool
> -common_semi_sys_exit_extended(CPUState *cs, int nr)
> -{
> -    return (nr == TARGET_SYS_EXIT_EXTENDED || sizeof(target_ulong) == 8);
> -}
> -
> -static inline bool is_64bit_semihosting(CPUArchState *env)
> -{
> -    return riscv_cpu_mxl(env) != MXL_RV32;
> -}
> -
> -static inline target_ulong common_semi_stack_bottom(CPUState *cs)
> -{
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -    CPURISCVState *env = &cpu->env;
> -    return env->gpr[xSP];
> -}
> -
> -static inline bool common_semi_has_synccache(CPUArchState *env)
> -{
> -    return true;
> -}
> -#endif
> +#include "common-semi-target.h"
>  
>  /*
>   * The semihosting API has no concept of its errno being thread-safe,
> -- 
> 2.34.1
> 
> 
> 
> 
> To declare a filtering error, please use the following link : https://www.security-mail.net/reporter.php?mid=6446.629fd294.eaef.0&r=lmichel%40kalrayinc.com&s=qemu-devel-bounces%2Blmichel%3Dkalrayinc.com%40nongnu.org&o=%5BPATCH+v4+24%2F53%5D+semihosting%3A+Split+out+common-semi-target.h&verdict=C&c=13374b21357db966099969d3ba4c82fb9d1ad90c
> 

-- 





