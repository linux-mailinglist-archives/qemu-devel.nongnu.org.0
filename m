Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 104A956541F
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:50:03 +0200 (CEST)
Received: from localhost ([::1]:46118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8KaX-0007O2-N3
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8KWR-00046q-Sh
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:45:54 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:41565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8KWQ-0002DO-Bg
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:45:47 -0400
Received: by mail-yb1-xb30.google.com with SMTP id b85so3183824yba.8
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 04:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tMfic92cSy2HLh69YDuv0HrdXNx+q6QBthatWY3S4/8=;
 b=a6/Td5ked2/etP+MyMTOMX9qS18LkrV3w83nLnI+tRBwbVXxwPjisysMtMm6MeP7Qb
 BZ4/aOAw9RRJhCQf4IcCHH5OTeZ9Mdly8CznT1WWFf4RjAOfm0gLbZBn/cm3nxrXsCQA
 wEFe17H8nJQ4MfCnGlIbklos27FWPLjDV0mvkxzn0zhnKgy3oUUZS1cIeaTQZsOAE2cp
 SW+dQLw1/nWKetLaSdZW3tEGm39WshOXpFQdrgs6lZw+/XkALJPkZgabhVzmUGJFssky
 Jg/3ZvNg23EW4F104IAAK2SEJpmYZKQv58JejjZQAOAsvF2ZWIEC4UqegF4YAAJv9euV
 wLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tMfic92cSy2HLh69YDuv0HrdXNx+q6QBthatWY3S4/8=;
 b=7Gtcw+xuiXbdF40i3ZkT6FyrX8TvBxaGg+dLaoFrRnpT+MpZ2MqMpa/FWh/Rpd/NxG
 D4xY1QFirdQ3h6O2wxlgN8iGuvtfTT5uBJwwRoNyCh72ZKwSVHc3UCmljh0eMPq8rkNm
 +FDjcs/O76nT3WH6ImhIHKH+Zb8nlCar9cxQau8pr5alb2sEhy/yUpcJ1Zz5+NnMf3OI
 PqS2Gg2fUFS9zbwQ74+BUseODxnOAlMR/UqqoBWOJzanXAF6VU0mpjtFX1f7u2ySDIyo
 27vlw2hTSSR0SA3LwMuYm3mXZT4P96A6ruV7JDjU0MxT35GQPq7D+CO07715kJ7/udSs
 kh+g==
X-Gm-Message-State: AJIora9gWGLBZ5eJl68UydZyDGtRu9KANLLJuigW+dQMe/3Ksu1FIlPs
 /FKLpisjqFZIm2njLkqVwTpJ4qN0hE745zkt8idqNw==
X-Google-Smtp-Source: AGRyM1verDZ1ezdwuXZeV4lWEni3JqFhdtRCLE5qgJgK4M1uTF7V1PNYSnAcQLUytVqU3jF5r14oA3dQkSIFzIhNO44=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr29965569ybr.39.1656935144810; Mon, 04
 Jul 2022 04:45:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-34-richard.henderson@linaro.org>
In-Reply-To: <20220628042117.368549-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 12:45:33 +0100
Message-ID: <CAFEAcA-PeBbdXQAXJboNkPMkbGk+Sb_4VXNZKXiscp1n5d9c1w@mail.gmail.com>
Subject: Re: [PATCH v4 33/45] linux-user/aarch64: Clear tpidr2_el0 if
 CLONE_SETTLS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 28 Jun 2022 at 05:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/aarch64/target_cpu.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/linux-user/aarch64/target_cpu.h b/linux-user/aarch64/target_cpu.h
> index 97a477bd3e..f90359faf2 100644
> --- a/linux-user/aarch64/target_cpu.h
> +++ b/linux-user/aarch64/target_cpu.h
> @@ -34,10 +34,13 @@ static inline void cpu_clone_regs_parent(CPUARMState *env, unsigned flags)
>
>  static inline void cpu_set_tls(CPUARMState *env, target_ulong newtls)
>  {
> -    /* Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
> +    /*
> +     * Note that AArch64 Linux keeps the TLS pointer in TPIDR; this is
>       * different from AArch32 Linux, which uses TPIDRRO.
>       */
>      env->cp15.tpidr_el[0] = newtls;
> +    /* TPIDR2_EL0 is cleared with CLONE_SETTLS. */
> +    env->cp15.tpidr2_el0 = 0;
>  }
>
>  static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

