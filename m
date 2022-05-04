Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C800519B26
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:07:11 +0200 (CEST)
Received: from localhost ([::1]:41338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmAyU-00038M-0Z
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:07:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmArc-0008TW-Tw
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:00:05 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:46722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmAra-0007Ia-K2
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:00:04 -0400
Received: by mail-io1-xd29.google.com with SMTP id g21so811138iom.13
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0zFYd4hFHE0KxCUZ6uNd5UBnk/yjbNr2Lz0W/zcXq78=;
 b=qUqQZaUyR7TGNbT65SwjWTpSnMcco8t+m0IO/dVvU9R7QpdBNxLDeQdb58VNqExiYr
 fH99kLkQ+k1O2TDkSnKJ35/NTKx2VFgDq7Kx94MuBSw6WB19q+aFSjMRwVYJehyeCTRe
 FWZ4SqKvA321dhyyipcrIJYZIzthKCh2Sr/zNAYN9ACTOc3Jczjiiv1ywEiOe6pKWvMh
 DZcQMPzW+sM9BRQJpBydj72hjfQUItn7qHKCeAbWcoVYM4a1RjNjoFFhD8A6R5byRBpV
 bPhXEtvIyfWiHg6wUcVdAZALCman3HsQjGe2h3F/3TGkppg9m4k+kYgXma3dWFM17gDE
 Q9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0zFYd4hFHE0KxCUZ6uNd5UBnk/yjbNr2Lz0W/zcXq78=;
 b=P/HOPBW6qmKZsBHFVTD05FIgx2zPutemTynSg0u/YR/qt00VrIqdnMwv8fjo87Vj6V
 QM6aTFwGUI3WWZNpZVUXUt+r3sRHq82nbmzDWadmYs8Ea5asuHiDXPJWgt2eoSRMC/ud
 hQKzLmfkhg4gUR0F9HA4q88MiSJeV9g0VKTexeoMhZH3YOoAJ9wKFJZI4LtRLbOttVd2
 0Fql8Z6BEEbHaAl/40tZOx7jj/XgudvZ2IZHawx5ry+V0JNSkefoNjDqdrlFuy/dKKuS
 4JfV8yNtxWGJr89S/LzAcnWaMw1TaOJWKM0VrZKobn5mDz9EtxpuY6534yLDInmWZe7w
 43ww==
X-Gm-Message-State: AOAM532nefOH+yzpBypZZEHCp2ftF1sQ6ShylajWumYIlYKNdDc9WG3w
 MCjg6ECI/2z0ewY00PT/+vVqW9BRPPSLa7ngrPU=
X-Google-Smtp-Source: ABdhPJxdPhi/iT7h9LLWvKr1mvThD9PpViaupqqnFjrRyzU+gCnPgHbgaGq6hPjnRF6/nR1TS1Vx7vluRK+iibVB08E=
X-Received: by 2002:a05:6638:14c1:b0:32a:aa03:93e1 with SMTP id
 l1-20020a05663814c100b0032aaa0393e1mr8808366jak.66.1651654801448; Wed, 04 May
 2022 02:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-18-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-18-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 May 2022 18:59:35 +1000
Message-ID: <CAKmqyKP0Sx4AjFE+eVptXp-6wHxBDLMtGyROcMDtkYUnmXrZVA@mail.gmail.com>
Subject: Re: [PATCH v2 17/74] semihosting: Split common_semi_flen_buf per
 target
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, May 4, 2022 at 5:59 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We already have some larger ifdef blocks for ARM and RISCV;
> split out common_semi_stack_bottom per target.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  semihosting/arm-compat-semi.c | 44 +++++++++++++++++------------------
>  1 file changed, 21 insertions(+), 23 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index 7fc60e223a..b2816e9f66 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -217,6 +217,13 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
>  {
>      return is_a64(env);
>  }
> +
> +static inline target_ulong common_semi_stack_bottom(CPUState *cs)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    return is_a64(env) ? env->xregs[31] : env->regs[13];
> +}
>  #endif /* TARGET_ARM */
>
>  #ifdef TARGET_RISCV
> @@ -246,6 +253,13 @@ static inline bool is_64bit_semihosting(CPUArchState *env)
>  {
>      return riscv_cpu_mxl(env) != MXL_RV32;
>  }
> +
> +static inline target_ulong common_semi_stack_bottom(CPUState *cs)
> +{
> +    RISCVCPU *cpu = RISCV_CPU(cs);
> +    CPURISCVState *env = &cpu->env;
> +    return env->gpr[xSP];
> +}
>  #endif
>
>  /*
> @@ -301,31 +315,15 @@ static void common_semi_cb(CPUState *cs, target_ulong ret, target_ulong err)
>      common_semi_set_ret(cs, ret);
>  }
>
> +/*
> + * Return an address in target memory of 64 bytes where the remote
> + * gdb should write its stat struct. (The format of this structure
> + * is defined by GDB's remote protocol and is not target-specific.)
> + * We put this on the guest's stack just below SP.
> + */
>  static target_ulong common_semi_flen_buf(CPUState *cs)
>  {
> -    target_ulong sp;
> -#ifdef TARGET_ARM
> -    /* Return an address in target memory of 64 bytes where the remote
> -     * gdb should write its stat struct. (The format of this structure
> -     * is defined by GDB's remote protocol and is not target-specific.)
> -     * We put this on the guest's stack just below SP.
> -     */
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -
> -    if (is_a64(env)) {
> -        sp = env->xregs[31];
> -    } else {
> -        sp = env->regs[13];
> -    }
> -#endif
> -#ifdef TARGET_RISCV
> -    RISCVCPU *cpu = RISCV_CPU(cs);
> -    CPURISCVState *env = &cpu->env;
> -
> -    sp = env->gpr[xSP];
> -#endif
> -
> +    target_ulong sp = common_semi_stack_bottom(cs);
>      return sp - 64;
>  }
>
> --
> 2.34.1
>
>

