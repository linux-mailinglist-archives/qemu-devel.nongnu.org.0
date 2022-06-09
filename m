Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DED54526D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:52:48 +0200 (CEST)
Received: from localhost ([::1]:34294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzLOp-0002GH-4P
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:52:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzL8T-0007Qc-AM
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:35:53 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:41095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzL8R-0004UB-7o
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:35:53 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-30ce6492a60so247031727b3.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oBuqN8xiMOq6drksl3AVp4GbOUZVsbn0VDict9J9nF8=;
 b=MbjOoJmujxA/KQdql/OoOLwgMGAHWb/lKs3p7+n88Efr4DoWOU1Qfxz1lToQUqkBfd
 zxx1n5HmmJ7ozrn3KggiCYmJ8trt4R7ffPNwqbNSk1Lyi3jVFZ6xCWg8f9GT5romwINF
 eA+rpfwVBYClHy6aSJOYxbtnLSK3EWXR5/W0VYrqUee5W/jRsj5Iz2xvSFVa+K8hdOTp
 m/4HPt0jfpsQT5O27V0z45/VyVV0gUR6bDtoQazpqMuR+kiOpvaLb8LphEGfUomc46ol
 lBQazvsdxZ+qG2Fe9i6yFqsw9TZej3El3EzmR5Q/qQiXY6GVNTHKbW4ZGtrXXy3YBxCF
 q8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oBuqN8xiMOq6drksl3AVp4GbOUZVsbn0VDict9J9nF8=;
 b=7Uvw7a/9fvKak7Rb0HdAFBfWBLK9HmaHjtktsE0pVO/D6DnRe1oTwgW+C7dDtcpwxW
 blX9PzDgDhbVl+cr76ocaSlLG4otI1eG0hxdbUQzbiWTQn3I1DXfXAqCUV5bQkP6dq7m
 aAZJFaUb1PnTi3YeT2noSRshzLzSb/7I8Mwb5HLg1PGTBWX53xxIAlF9vKwLkXZDTTxl
 epkMyGLQaC7hNRmpz1o074a1tP0YmdkQzEGHbxoXqBay6HIB7s/ZLimUUK6UGOh3rcPF
 AYYo1aykcWkiNRESWMAw46mNhM+nNcaDair7LTdBSgy+JndhBzWgmFMXXqrO+54hDWlg
 I09A==
X-Gm-Message-State: AOAM531L+fWW2iHrWEkSioV4J9fRCiKCyWgkGyNumgnfA3YUr8BVVF1x
 FQ1WnjRST9sQ5DlOjWjTBgCvLb+u527Y3a/AGu18HA==
X-Google-Smtp-Source: ABdhPJygXqJ5AMJtIzK65kbsfzLdYzj7N8CJ3s9gu/rXakH+PtOoCC1Yt1YlGBvXAQ/0FAGawnrmuIoSA4OsxwCfwvE=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr44098558ywb.257.1654792550010; Thu, 09
 Jun 2022 09:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-15-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:35:39 +0100
Message-ID: <CAFEAcA8yZ8aJz5vEKnUSsL7mbVrec6r7hiO4jRE0TZ3yzkpyRA@mail.gmail.com>
Subject: Re: [PATCH v2 14/25] target/arm: Create helper_exception_swstep
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 7 Jun 2022 at 03:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the computation from gen_swstep_exception into a helper.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h       |  1 +
>  target/arm/translate.h    | 12 +++---------
>  target/arm/debug_helper.c | 16 ++++++++++++++++
>  3 files changed, 20 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/helper.h b/target/arm/helper.h
> index aca86612b4..afc0f1a462 100644
> --- a/target/arm/helper.h
> +++ b/target/arm/helper.h
> @@ -48,6 +48,7 @@ DEF_HELPER_2(exception_internal, noreturn, env, i32)
>  DEF_HELPER_4(exception_with_syndrome_el, noreturn, env, i32, i32, i32)
>  DEF_HELPER_3(exception_advsimdfp_access, noreturn, env, i32, i32)
>  DEF_HELPER_2(exception_bkpt_insn, noreturn, env, i32)
> +DEF_HELPER_2(exception_swstep, noreturn, env, i32)
>  DEF_HELPER_2(exception_pc_alignment, noreturn, env, tl)
>  DEF_HELPER_1(setend, void, env)
>  DEF_HELPER_2(wfi, void, env, i32)
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index 04d45da54e..c720a7e26c 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -350,15 +350,9 @@ static inline void gen_exception_advsimdfp_access(DisasContext *s,
>  /* Generate an architectural singlestep exception */
>  static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
>  {
> -    bool same_el = (s->debug_target_el == s->current_el);
> -
> -    /*
> -     * If singlestep is targeting a lower EL than the current one,
> -     * then s->ss_active must be false and we can never get here.
> -     */
> -    assert(s->debug_target_el >= s->current_el);
> -
> -    gen_exception(EXCP_UDEF, syn_swstep(same_el, isv, ex), s->debug_target_el);
> +    /* Fill in the same_el field of the syndrome in the helper. */
> +    uint32_t syn = syn_swstep(false, isv, ex);
> +    gen_helper_exception_swstep(cpu_env, tcg_constant_i32(syn));
>  }
>
>  /*
> diff --git a/target/arm/debug_helper.c b/target/arm/debug_helper.c
> index a743061e89..a3a1b98de2 100644
> --- a/target/arm/debug_helper.c
> +++ b/target/arm/debug_helper.c
> @@ -487,6 +487,22 @@ void HELPER(exception_bkpt_insn)(CPUARMState *env, uint32_t syndrome)
>      raise_exception(env, EXCP_BKPT, syndrome, debug_el);
>  }
>
> +void HELPER(exception_swstep)(CPUARMState *env, uint32_t syndrome)
> +{
> +    int debug_el = arm_debug_target_el(env);
> +    int cur_el = arm_current_el(env);
> +
> +    /*
> +     * If singlestep is targeting a lower EL than the current one, then
> +     * DisasContext.ss_active must be false and we can never get here.
> +     */
> +    assert(debug_el >= cur_el);

This is a little trickier than it first looks, because in the old
setup the assert in gen_swstep_exception() is checking the translate
time state (which corresponds to the EL we executed the insn in),
whereas this assert is checked at runtime, so it happens after all
the effects of the insn have taken place, which might include a
change of exception level, if the insn is "eret". Similarly we'll
now calculate the "same_el" bit based on the EL after execution of
the eret, rather than the one before.

I think however that:
 * the assertion is still fine, because we can only go down in EL
   (going up in EL means taking an exception, in which case we won't
   be here)
 * setting the same-el bit based on the cur_el after the eret
   changes it is actually fixing a bug in a corner case:
    - EL_D is using MDSCR_EL1.KDE == 1 to enable debug exceptions
      within EL_D itself
    - we singlestep an eret from EL_D to some lower EL
   Here the 'same EL' bit should be based on the EL we end up with
   after the 'eret' (architecturally we only take the swstep
   exception when we are in the Active-Pending state, which is
   after we have completed execution of the instruction proper),
   so it ought to be 0. But in the old code we calculate it using
   the DisasContext::current_el, so it would incorrectly be 1.
   (Writing a test case to demonstrate this theory is left as an
   exercise for the reader :-))

So as far as the code changes are concerned,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but since this is pretty subtle we should probably discuss it in
the commit message, and definitely we should note that this is
fixing a bug.

thanks
-- PMM

