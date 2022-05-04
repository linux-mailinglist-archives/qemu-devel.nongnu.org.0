Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C78519B36
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 11:09:26 +0200 (CEST)
Received: from localhost ([::1]:44490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmB0f-0005RT-0L
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 05:09:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmAtM-0000zF-Cs
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:01:52 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:44831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nmAtK-0007pf-Lw
 for qemu-devel@nongnu.org; Wed, 04 May 2022 05:01:51 -0400
Received: by mail-io1-xd35.google.com with SMTP id e194so819875iof.11
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 02:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IxPK1o3Pq76O9Ka04Y3QKCovPcsQevTP93IXh6LlM/o=;
 b=Dw2z96noPN8j/ZNEZc0TuZ1H+YUM0ZApLPutvN1KIECy6tUNqAPxMGspI9ik9I86sj
 ek7N0r+j+zp9ySKWBh74WTYBr+NUzoofP0ZuVJL35ZpMvyRia3BxEP8sR1uLw8g/si9i
 xEaT7U6f/giuz0/+eNGh00XCnMjZAmo/nyn7cQGLP77udBzywkd+VAZmYAycmS+G5ulE
 o2PYJdIhZIcFerdCoV3lrtd3el7A65kBpYGWImB3msfmZcfXASHKkMakWjLbjrfUv6Gw
 BpJib3salM61kygz/ZWZg2y+hMhoM4Z8hBguSTkWCJfKiQy0uUB/o3bVPpt9fSG4LJei
 qFDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IxPK1o3Pq76O9Ka04Y3QKCovPcsQevTP93IXh6LlM/o=;
 b=N83LyVGYbgdudYbQD1abnikcHoAo90/AjDSyD1S69mGejpPA03JP7A2rTT3jZqKF7M
 Bz8mt+XDJqQZX8rkA6CZubo+4wuk27Iq3HDcWb2PPxoKu4kLguUKJUs2b49cDh7JLgrC
 adlJt0jbuB3nUZLUW0h6UcWmryaWF2vAUCoYeN6W0JVgFuXJ4Ym/wsfS+IgQL6MBXSSr
 ZzJgJEm336jHenZiBOgF2lvlJbTc85YNPzS+otDPsMOcUCzXPIbMvwKh+J0epG5DsUxx
 jOcYjYoVqlOUlJ7nOuTutV/V+sPRBWCyqHjg75T8ny7jWD6jonIpen+yXxQE7isBqpxw
 Gyrg==
X-Gm-Message-State: AOAM533vYSN/d9NspCMFDqhE4EBVScE7B3Ie7mmlDVr3dDH0RuBPvbhQ
 MhYR8GKrncYxWCQfi+DJtC5qIVjDOFdCo2Ycv7GhTN9bpgF6Uw==
X-Google-Smtp-Source: ABdhPJwwuZhCb/z3i9k4MWRIGco4c/9z9L4EXaSsAeyhiW9FK4JycviSmMDa2b6LeilSLeGo/0EyaC8/6A4FRPfYJS0=
X-Received: by 2002:a5d:924e:0:b0:649:af51:9c1a with SMTP id
 e14-20020a5d924e000000b00649af519c1amr7842166iol.203.1651654909497; Wed, 04
 May 2022 02:01:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-19-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-19-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 4 May 2022 19:01:23 +1000
Message-ID: <CAKmqyKM1FLKYSpn_Nss5PC72ardbwi-gJjESiSic8S8NjGxxtA@mail.gmail.com>
Subject: Re: [PATCH v2 18/74] semihosting: Split out common_semi_has_synccache
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d35;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd35.google.com
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

On Wed, May 4, 2022 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We already have some larger ifdef blocks for ARM and RISCV;
> split out a boolean test for SYS_SYNCCACHE.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  semihosting/arm-compat-semi.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
> index b2816e9f66..6149be404f 100644
> --- a/semihosting/arm-compat-semi.c
> +++ b/semihosting/arm-compat-semi.c
> @@ -224,6 +224,12 @@ static inline target_ulong common_semi_stack_bottom(CPUState *cs)
>      CPUARMState *env = &cpu->env;
>      return is_a64(env) ? env->xregs[31] : env->regs[13];
>  }
> +
> +static inline bool common_semi_has_synccache(CPUArchState *env)
> +{
> +    /* Invalid for A32/T32. */
> +    return !is_a64(env);
> +}
>  #endif /* TARGET_ARM */
>
>  #ifdef TARGET_RISCV
> @@ -260,6 +266,11 @@ static inline target_ulong common_semi_stack_bottom(CPUState *cs)
>      CPURISCVState *env = &cpu->env;
>      return env->gpr[xSP];
>  }
> +
> +static inline bool common_semi_has_synccache(CPUArchState *env)
> +{
> +    return true;
> +}
>  #endif
>
>  /*
> @@ -1103,16 +1114,11 @@ void do_common_semihosting(CPUState *cs)
>           * virtual address range. This is a nop for us since we don't
>           * implement caches. This is only present on A64.
>           */
> -#ifdef TARGET_ARM
> -        if (is_a64(cs->env_ptr)) {
> +        if (common_semi_has_synccache(env)) {
>              common_semi_set_ret(cs, 0);
>              break;
>          }
> -#endif
> -#ifdef TARGET_RISCV
> -        common_semi_set_ret(cs, 0);
> -#endif
> -        /* fall through -- invalid for A32/T32 */
> +        /* fall through */
>      default:
>          fprintf(stderr, "qemu: Unsupported SemiHosting SWI 0x%02x\n", nr);
>          cpu_dump_state(cs, stderr, 0);
> --
> 2.34.1
>
>

