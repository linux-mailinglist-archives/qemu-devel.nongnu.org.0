Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2673CC4FC
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 19:46:50 +0200 (CEST)
Received: from localhost ([::1]:59630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4oOn-0006UK-Aa
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 13:46:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oM4-000571-74
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:44:00 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4oM2-0003Vl-OY
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 13:43:59 -0400
Received: by mail-ej1-x62f.google.com with SMTP id gb6so20398935ejc.5
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 10:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f+mIdhKHBJSW5QFVLJ9sVZH7p+HL+AgjM5yL9oS6U/g=;
 b=fVemPdr57Rni2gBO8P8OUVXLYVxXturMP8oxmvjISVk7VVMDVsoQhHNLcr1Tq6Eua7
 XhvAXtSbBmQTSX3nJUOvqWP0zgxlJxeQXmY+xQ2BOBH2yPeb4dVREEPfTmwjqsLGeFSE
 Au/35lhdLw+vcEbWLFzCh18I8NqBRRMDeo51nj6ZlWa8/CCnx+kYnXfAWxJ84XGU3e8w
 TkPItXrHFsTXmbFVD+BY4cCG76+Jzung+CI7bHG5E/0jGOVGVcYa8ORy+fpb2CKXysep
 N679af5vROSbS/x5cZi+OtTuTAdaqdSGuj2GNAch0LWOjDGvkFsl/YGKP1j43n5vmirJ
 +EKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f+mIdhKHBJSW5QFVLJ9sVZH7p+HL+AgjM5yL9oS6U/g=;
 b=jFXLQmjKh8YMT4GxHjMnqFLtg4sz73cq4xCLeUsxvCjK4u8xyO2tgG+og5okG5CDy4
 b+XYV3eTJbYWeNN+/SvQUhfk4aMBmmskoVfxtcOrXiSnfgrvJLZnX502hbeFXPzNyrHe
 i5vTLXmhlPOB7cxMuwqLV/KUVUNEFw5HrCoeSRQ0uQnzaigq0oiaiQKYrq5I8qJHb6Jg
 hTwTL5rBF8Rlfl34/mWV+KRlxiV+Buf89ugBR1n6zHN5zPqlgvmO3O7rFgMOGyM3i5YS
 dkmHq/vUS6IdsJUVDWuqA5My8ePBVMLLCG2rOIJJf/aeZ0iXpUx9pgZSORXPKf67qy55
 Xvxg==
X-Gm-Message-State: AOAM530aWD+S/SObgdzmMDQG2FSGw3x0wAbEG8/cUMRS+kwkZtCyVb59
 sohx0Y/v90TWo4EVtVZpbKZiNwik1LMaTUjoRoSyKA==
X-Google-Smtp-Source: ABdhPJwOBRqAQsUHJ1KpVfTZlU33wnTvIRc9jPp4+GkLhTTqYrMOKVJax/kRrV/0IWKg0BU+x9hQE+xdw3c8kIpTLfY=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr18337479ejc.4.1626543837249; 
 Sat, 17 Jul 2021 10:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-7-richard.henderson@linaro.org>
In-Reply-To: <20210712154004.1410832-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Jul 2021 18:43:16 +0100
Message-ID: <CAFEAcA_TGeJiBk_jCzkK0wS3+BpLh3CK640pbtYi8s7sAp_98A@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] accel/tcg: Use CF_NO_GOTO_{TB,
 PTR} in cpu_exec_step_atomic
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 12 Jul 2021 at 16:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Request that the one TB returns immediately, so that
> we release the exclusive lock as soon as possible.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/cpu-exec.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 2206c463f5..5bb099174f 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -330,8 +330,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
>      CPUArchState *env = (CPUArchState *)cpu->env_ptr;
>      TranslationBlock *tb;
>      target_ulong cs_base, pc;
> -    uint32_t flags;
> -    uint32_t cflags = (curr_cflags(cpu) & ~CF_PARALLEL) | 1;
> +    uint32_t flags, cflags;
>      int tb_exit;
>
>      if (sigsetjmp(cpu->jmp_env, 0) == 0) {
> @@ -341,8 +340,14 @@ void cpu_exec_step_atomic(CPUState *cpu)
>          cpu->running = true;
>
>          cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
> -        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
>
> +        cflags = curr_cflags(cpu);
> +        /* Execute in a serial context. */
> +        cflags &= ~CF_PARALLEL;
> +        /* After 1 insn, return and release the exclusive lock. */
> +        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;
> +
> +        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
>          if (tb == NULL) {
>              mmap_lock();
>              tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);

So previously we would have executed possibly a chain of TBs
before releasing the lock, and now we definitely execute just one?
(I guess the execute-a-chain case is unlikely given the TB
only has one insn and we know it's an exclusive insn...)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

