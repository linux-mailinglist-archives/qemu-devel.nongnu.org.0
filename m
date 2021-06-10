Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CE03A2956
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 12:28:13 +0200 (CEST)
Received: from localhost ([::1]:38812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrHv2-0004da-Gt
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 06:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrHl5-0001PV-Jp
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:17:55 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lrHkz-0002CK-Ok
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 06:17:55 -0400
Received: by mail-ed1-x52c.google.com with SMTP id cb9so32368005edb.1
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 03:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FEtovbJuiq5QTZMfa17jeZZhNg44bxYYtb8WIPWuxZ4=;
 b=c0NENKiECeKhFNLDXIt7mRQmtPC7ooRuoni/yu8yBX8fSfE9lmqIC533q1vOUlc1CY
 NgJ87sDua2ua8M+ikFva9tuRfKCQoKT/tjBe8/DtnuHMQ/B2FGOzK77z2TsczFAK2JTJ
 kidbyezv5Eflui21PQFDGMwpTmr1BxtAFTwLWE21wq5zrdM1tnl4wuydP596cEmxjORT
 dFDY1KHYbVhBz3pLDRE+dYdcG2qsCy3ybN2k2RpvyeX60f5hBdxLDCLY25is5xOPBphw
 6i4bAKaQcMdmrYtuyUhsjyDOPp7dV8OeddNbuyURQ7DqZDFiJhhojIi6QLEOytim1KNs
 juBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FEtovbJuiq5QTZMfa17jeZZhNg44bxYYtb8WIPWuxZ4=;
 b=AT7OaJ1xxQGlQUtAcF4V7dgWJhHeAKQstMveGS2kUfn5U+iBGwqp9gHlPiyo3tNZFN
 2lCphFjHG6LhyfuABmfnpyVVKz3c8+Tx5fWs6uehQsInAV9g0aiW2QtaWQ8aiiBpEPgg
 mnGcIPJXIapLVKmLuJZWEtbp6j2gBzPCaArGcFYY9ySeWEi8VRaV7dKwn4SAk7AuG1bN
 0fVRaJ7x6mh3eAOCRQNB/ehf7IMRe7EAn09Qoc7KoYZLzqyvAPHBKwQaDhOclbRDqqeK
 FssIHW5q096Nex+QvTR+SYgRXSDOQyWBGPs+fJ4xy1y9fyY77Irc9WAxmx2pYq2R1Vte
 h1vw==
X-Gm-Message-State: AOAM530OJW44FoLauB8k0VlWg15TQlIEShr/QoDxTWbUbsIpU5AU2Doo
 6uMP195ysz3SlJ6/i8QhM2iSZZScIULSgLg2ULzZAQ==
X-Google-Smtp-Source: ABdhPJy+sC+FX8Z6VrLZDePtchJ+b4nIDJlmxeeruObL+QeafgtkymiNmgbhJtwgv4P7MuIq1MO62Gdfi94BFssmzpM=
X-Received: by 2002:aa7:dc12:: with SMTP id b18mr3871359edu.52.1623320268162; 
 Thu, 10 Jun 2021 03:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-5-peter.maydell@linaro.org>
 <d54b1117-b25a-ff6f-3166-87fd282b674c@linaro.org>
In-Reply-To: <d54b1117-b25a-ff6f-3166-87fd282b674c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Jun 2021 11:17:13 +0100
Message-ID: <CAFEAcA_0P=3fE8arF3j90s1z8A-3TJGnmHjHLThxTALvqt3PXA@mail.gmail.com>
Subject: Re: [PATCH 04/55] target/arm: Add handling for PSR.ECI/ICI
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Jun 2021 at 00:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:57 AM, Peter Maydell wrote:
> > +void clear_eci_state(DisasContext *s)
> > +{
> > +    /*
> > +     * Clear any ECI/ICI state: used when a load multiple/store
> > +     * multiple insn executes.
> > +     */
> > +    if (s->eci) {
> > +        TCGv_i32 tmp = tcg_temp_new_i32();
> > +        tcg_gen_movi_i32(tmp, 0);
>
> tcg_const_i32 or preferably tcg_constant_i32.

I'll use tcg_const_i32(), yep. (I think I copied this absent-mindedly
from some of the existing code in translate.c that uses tcg_gen_movi_i32().)
Can't use tcg_constant_i32() because store_cpu_field() wants to
tcg_temp_free_i32() its argument.

> > +    if (condexec & 0xf) {
> > +        dc->condexec_mask = (condexec & 0xf) << 1;
> > +        dc->condexec_cond = condexec >> 4;
> > +        dc->eci = 0;
> > +    } else {
> > +        dc->condexec_mask = 0;
> > +        dc->condexec_cond = 0;
> > +        if (arm_feature(env, ARM_FEATURE_M)) {
> > +            dc->eci = condexec >> 4;
> > +        }
>
> This else leaves eci uninitialized.

Strictly speaking it doesn't, because gen_intermediate_code
zero-initializes the DisasContext with a "{ }" struct initializer.
But it's clearer to explicitly initialize here I guess. Fixed.

> >       dc->insn = insn;
> >
> > +    if (dc->eci) {
> > +        /*
> > +         * For M-profile continuable instructions, ECI/ICI handling
> > +         * falls into these cases:
> > +         *  - interrupt-continuable instructions
> > +         *     These are the various load/store multiple insns (both
> > +         *     integer and fp). The ICI bits indicate the register
> > +         *     where the load/store can resume. We make the IMPDEF
> > +         *     choice to always do "instruction restart", ie ignore
> > +         *     the ICI value and always execute the ldm/stm from the
> > +         *     start. So all we need to do is zero PSR.ICI if the
> > +         *     insn executes.
> > +         *  - MVE instructions subject to beat-wise execution
> > +         *     Here the ECI bits indicate which beats have already been
> > +         *     executed, and we must honour this. Each insn of this
> > +         *     type will handle it correctly. We will update PSR.ECI
> > +         *     in the helper function for the insn (some ECI values
> > +         *     mean that the following insn also has been partially
> > +         *     executed).
> > +         *  - Special cases which don't advance ECI
> > +         *     The insns LE, LETP and BKPT leave the ECI/ICI state
> > +         *     bits untouched.
> > +         *  - all other insns (the common case)
> > +         *     Non-zero ECI/ICI means an INVSTATE UsageFault.
> > +         *     We place a rewind-marker here. Insns in the previous
> > +         *     three categories will set a flag in the DisasContext.
> > +         *     If the flag isn't set after we call disas_thumb_insn()
> > +         *     or disas_thumb2_insn() then we know we have a "some other
> > +         *     insn" case. We will rewind to the marker (ie throwing away
> > +         *     all the generated code) and instead emit "take exception".
> > +         */
> > +        dc->eci_handled = false;
>
> This should be done in arm_tr_init_disas_context, I think, unconditionally,
> next to eci.
>
> > +        dc->insn_eci_rewind = tcg_last_op();
>
> I believe that this is identical to dc->insn_start.  Certainly there does not
> seem to be any possibility of any opcodes emitted in between.

There's quite a wide separation between where we set insn_start and here
(we set insn_start in arm_tr_insn_start, then there's whatever the accel/tcg
framework chooses to do between the insn_start callback and the translate_insn
callback, then the arm_pre_translate_insn() code). So I felt that a separate
pointer was easier to reason about.

In fact, looking again at the accel/tcg code, if we rewind to insn_start
that will delete any code emitted by the breakpoint_check hook,
anything emitted by plugin_gen_insn_start(), and anything emitted by
gen_io_start() if this is a CF_LAST_IO insn. I think we want to keep
all of those.

> If you think we should use a different field, then initialize it to null next
> to eci/eci_handled.

Done.

-- PMM

