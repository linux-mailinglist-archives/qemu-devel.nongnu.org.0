Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7CB5E66E7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 17:21:36 +0200 (CEST)
Received: from localhost ([::1]:47756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obO18-0000ab-Sd
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 11:21:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMs3-00052M-Np
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:08:08 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:38905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obMs2-0000uN-2s
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 10:08:07 -0400
Received: by mail-ed1-x52c.google.com with SMTP id e17so13779555edc.5
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 07:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=S725K98OzQFCUMlv+k7k4O0y+oy8C1IfAcPjFjp9wr0=;
 b=CBAcxAgbLqzmV1JDFIXgNuqZBwBsledWUh243lN9dXq7qyZe6I6KdGMcQWrWJ86Dqn
 y6ZNsyazxHEWoKMmo1jhcmxW/i85lJsaZT+Fg+5j7Fr911dfLJHPZTsqzBvSkUZLbT1X
 +jBY0pfrJZ+GMIFAA0nkgesDoE78S/E7kAXQ09lfsvp7Ttgq91n+XRZt1K/ebzJ+VKEp
 o8fbRhJqffTSakrG0d+V7PMaxWnzqTYC7h2Q3X5em45KFSouOv/wv3IaPjsovk97LSWG
 6kNjfR5xPwJmLxRTHtPJHMnLEWJKcdi5g3VdGVPBApCoie3UJcpIkVbRhj1dh7xDFrGv
 7QhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=S725K98OzQFCUMlv+k7k4O0y+oy8C1IfAcPjFjp9wr0=;
 b=aVN6A6onqLi/f257eKhJhglUB8/Gg4PTcS5erkLySkqqXCSkgb3F5q/w0JdV4Mmc8d
 sLeys9uf8K5he9SqedRkbW/qd9U1Qvjym41W4JTuXDHKp9q28WB32FZkG4dyYJrX83gM
 UwLfv6/hKoVji+IdqsfHGM1uyNtepypeC/k8JRTqX3CgjGB250BBycHYZAmolUhE01te
 UTw4wPnyUV+69+21cQ7IOM3FgplcU2T9jRzqRrQGAh3+StDdujszYG16l68VUmW8BrGJ
 63Vxx6NUVzRNcYj4jTvgZmu72nrzrRAk+TTqC4NUF/oPDYNAPnhOeoAudHv6dMtcv8jj
 0C/Q==
X-Gm-Message-State: ACrzQf08GLMiTytWGg5nNSzaNhE2usWbhMpza40nhjmUwCJYHGVhoDOe
 CnnGXkTO6ZqAZILOaNzg8iiZPjwllKLqRpU+kk/01g==
X-Google-Smtp-Source: AMsMyM45JRA8q9ZA0bf6cU2oVBEpxLS2Kz458vHWHdIcAcGaCBqZAhTvGuBVrfcZcflPX3ip+nLSeOIHMsh6D+O9ouk=
X-Received: by 2002:a05:6402:516f:b0:44e:9151:d54b with SMTP id
 d15-20020a056402516f00b0044e9151d54bmr3538791ede.241.1663855684051; Thu, 22
 Sep 2022 07:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220906100528.343244-1-richard.henderson@linaro.org>
 <20220906100528.343244-10-richard.henderson@linaro.org>
In-Reply-To: <20220906100528.343244-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2022 15:07:53 +0100
Message-ID: <CAFEAcA-jUebgHHpShKWaR48ctfYBfpFgAkGPbxbp=13gNR=U8g@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] target/arm: Enable TARGET_TB_PCREL
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 6 Sept 2022 at 11:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu-param.h     |  2 ++
>  target/arm/translate.h     |  6 ++++
>  target/arm/cpu.c           | 23 +++++++-------
>  target/arm/translate-a64.c | 37 ++++++++++++++++++-----
>  target/arm/translate.c     | 62 ++++++++++++++++++++++++++++++--------
>  5 files changed, 100 insertions(+), 30 deletions(-)
>
> diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> index 68ffb12427..ef62371d8f 100644
> --- a/target/arm/cpu-param.h
> +++ b/target/arm/cpu-param.h
> @@ -34,4 +34,6 @@
>
>  #define NB_MMU_MODES 15
>
> +#define TARGET_TB_PCREL 1
> +
>  #endif
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index d42059aa1d..7717ea3f45 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -12,6 +12,12 @@ typedef struct DisasContext {
>
>      /* The address of the current instruction being translated. */
>      target_ulong pc_curr;
> +    /*
> +     * For TARGET_TB_PCREL, the value relative to pc_curr against which
> +     * offsets must be computed for cpu_pc.  -1 if unknown due to jump.
> +     */

I'm not really sure what this comment is trying to tell me. Could
you expand it a bit ?

> +    target_ulong pc_save;
> +    target_ulong pc_cond_save;
>      target_ulong page_start;
>      uint32_t insn;
>      /* Nonzero if this instruction has been conditionally skipped.  */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 047bf3f4ab..f5e74b6c3b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -64,17 +64,18 @@ static void arm_cpu_set_pc(CPUState *cs, vaddr value)
>  void arm_cpu_synchronize_from_tb(CPUState *cs,
>                                   const TranslationBlock *tb)
>  {
> -    ARMCPU *cpu = ARM_CPU(cs);
> -    CPUARMState *env = &cpu->env;
> -
> -    /*
> -     * It's OK to look at env for the current mode here, because it's
> -     * never possible for an AArch64 TB to chain to an AArch32 TB.
> -     */
> -    if (is_a64(env)) {
> -        env->pc = tb_pc(tb);
> -    } else {
> -        env->regs[15] = tb_pc(tb);
> +    /* The program counter is always up to date with TARGET_TB_PCREL. */

Is it?

Is there some documentation in one of the other patchsets about
how TARGET_TB_PCREL works in general and what targets need to do to
support it?


thanks
-- PMM

