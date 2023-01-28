Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077FF67F8B7
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 15:36:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLmI9-0000Y6-0A; Sat, 28 Jan 2023 09:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLmI6-0000XL-Lq
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 09:34:50 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLmI4-0004xg-U3
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 09:34:50 -0500
Received: by mail-pl1-x62e.google.com with SMTP id k13so7650926plg.0
 for <qemu-devel@nongnu.org>; Sat, 28 Jan 2023 06:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Y41jnePD/0n08qsGPNOrpCvCVcpHuz+/LFkK0hxmsmk=;
 b=vpOnhNCx5mM8sCtCVPSd9gYVlgLactWlki4G998+aTNgcZmys+rXXjsdwuqmbNZvoF
 gQXnjIH3vTtQckcbP4F6WgVV+SIit5ANAnXmK0AnV2zVcNGQjCXdZTSUOVRJzaLxxMa/
 c//sXPZo1myqcKEH6e4rl43PpcXWEdwB1a5LnBhJrH6WOxTAL1nAywC9ZQFRDzjkJ8gm
 gY/xbiEapIVE3iCiNxTYAKISPDmQyZn++9f7CRZ+DU6giME8Rm0H/26DVoRwQXZi+ccn
 Bgn1SXF72DbBdRqjJtjcg6aMTezfEf7Fn6GN+LS3rVzSPI7udq0Py9aWSOVi3yXWx8eD
 nlBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y41jnePD/0n08qsGPNOrpCvCVcpHuz+/LFkK0hxmsmk=;
 b=Z+HsM+9x4sHB9wrqAMz5Ga6WpS2gQmlXpQ29wRJOnTM+B2wc2oe6Ast7zVJv0BTnpH
 0iM3R0A1Y0etgPr5duleayJTudYnor/YTquYgYTqq12D+/DQC6rSUIjYltmZDVttEyt1
 4PT7c80SOaEeWgKLIVPViw9e1IwvTskhvlNbIBoyoAdon98DrH5IaJ3t8V8TZtqg9k8g
 0DdIsT6TncZRDYQYTWeibxgNxC+tQZ8vCb7x7CBbSADeyyL2m3tq0Z/AB6yPlPvcJUA4
 V1xGOHn2X6oYL1mCcqYBZxFnrK5JkpmZSXUR9YU3QRvapz6z3l/M3QVGkrwpIxcs8V62
 muxw==
X-Gm-Message-State: AO0yUKXTSO9hFnypYZKcJ3vRTq8fOoRzveGrzzi5htEelAotn+3CwZCi
 Vd608m/50PJ4yUcJ8ppZMMHIqd8a1WR2BN5Z97C10g==
X-Google-Smtp-Source: AK7set8w2J1y8wOLG0MSQRYlv2AoW9JPay+LTmrNtp4Z4jenGvCs/1x92lZZGQFCrZHv9Am2C2jJTN9kTLSYPZ0IxQ8=
X-Received: by 2002:a17:902:6b86:b0:196:3b96:6a1a with SMTP id
 p6-20020a1709026b8600b001963b966a1amr1560959plk.28.1674916486028; Sat, 28 Jan
 2023 06:34:46 -0800 (PST)
MIME-Version: 1.0
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-7-peter.maydell@linaro.org>
 <351b2481-4e80-57db-f06c-3dbf95db06fe@linaro.org>
In-Reply-To: <351b2481-4e80-57db-f06c-3dbf95db06fe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 28 Jan 2023 14:34:34 +0000
Message-ID: <CAFEAcA9hRd2ZEvJhS5brfsnw5WqvFqVvDhA-aZpb4uzFyF-xDw@mail.gmail.com>
Subject: Re: [PATCH 06/23] target/arm: Make HSTR_EL2 traps take priority over
 UNDEF-at-EL1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
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

On Sat, 28 Jan 2023 at 01:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/27/23 07:54, Peter Maydell wrote:
> > +void HELPER(hstr_trap_check)(CPUARMState *env, uint32_t mask, uint32_t syndrome)
> > +{
> > +    if (env->cp15.hstr_el2 & mask) {
> > +        raise_exception(env, EXCP_UDEF, syndrome, 2);
> > +    }
>
> This is so simple...
>
>
> > @@ -4760,6 +4761,28 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
> >           break;
> >       }
> >
> > +    if (s->hstr_active && cpnum == 15 && s->current_el == 1) {
> > +        /*
> > +         * At EL1, check for a HSTR_EL2 trap, which must take precedence
> > +         * over the UNDEF for "no such register" or the UNDEF for "access
> > +         * permissions forbid this EL1 access". HSTR_EL2 traps from EL0
> > +         * only happen if the cpreg doesn't UNDEF at EL0, so we do those in
> > +         * access_check_cp_reg(), after the checks for whether the access
> > +         * configurably trapped to EL1.
> > +         */
> > +        uint32_t maskbit = is64 ? crm : crn;
> > +
> > +        if (maskbit != 4 && maskbit != 14) {
> > +            /* T4 and T14 are RES0 so never cause traps */
> > +            gen_set_condexec(s);
> > +            gen_update_pc(s, 0);
> > +            emitted_update_pc = true;
> > +            gen_helper_hstr_trap_check(cpu_env,
> > +                                       tcg_constant_i32(1 << maskbit),
> > +                                       tcg_constant_i32(syndrome));
> > +        }
>
> How about
>
>      if (maskbit...) {
>          TCGv_i32 t = load_cpu_offset(offsetoflow32(CPUARMState, hstr_el2));
>          DisasLabel *over = gen_disas_label(s);
>
>          tcg_gen_andi_i32(t, t, 1u << maskbit);
>          tcg_gen_brcondi_i32(TCG_COND_EQ, t, 0, over.label);
>          tcg_temp_free_i32(t);
>
>          gen_exception_insn(s, 0, EXCP_UDEF, syndrome);
>          set_disas_label(s, over);
>      }
>
> which also eliminates the need for emitted_update_pc.

I really dislike use of brcond in generated TCG, because of the
massive beartrap it sets up where all your temporaries get nuked
but there's no compile-time checking that you didn't try to keep
using one after the brcond. So I generally prefer an approach that
avoids brcond over one that uses it, if it's available.

thanks
-- PMM

