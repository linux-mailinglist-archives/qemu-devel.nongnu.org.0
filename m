Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3C160F39D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 11:23:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onz5w-0002vr-Mu; Thu, 27 Oct 2022 05:22:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1onz5b-0002LK-27
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:22:15 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1onz5Y-0006Ot-Pc
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 05:22:14 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-36ad4cf9132so7548067b3.6
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 02:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WN58ntQl1V0jaj2zhj8FyXhIvxCsQMggD5QmwXnZx04=;
 b=MubGdjoyjn8r5DxqjXSuI6M5QEZMuneBKnnfvAPGGxrRRb8s7ZSsvbNFwfmt15gTRX
 IVBkWtwAXj5QHI0S81RvYmKaeBNcmIApybDu10gwJ8AGCMoTCVqElAkKJuzAT0Mr90d3
 ZsrD14mDpUiva4h1wWA0dJP5ruUB9XHk2SM/t9VZPiNZ1AArnIzDlwE/FYmGweF1GRTx
 r0Daxb9SlcBhvLiPrghE/0zNuI15MY37pSA9/Q9+t/Y+YjT5n8ojMBXzCpA81vaDfwpt
 z059Uw96L3h4kb01qbAc0QzXntReZZsF5Ox8vvpykCXmc++hm7TQ9ktXEc/ENZ9qOX6f
 4GvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WN58ntQl1V0jaj2zhj8FyXhIvxCsQMggD5QmwXnZx04=;
 b=piQmCnoaZtT45hJEqJrF9S2pd1tnLJajurZhCQjypPrYmihfNQ74pLp83prJfU8Tix
 7rr/kHOecOF4whxN4wC0RYlJ7NOW+NRpPdR8o4RELJ7XYUZ8b835iVXMqCBX+QHK90aH
 OspE8LbdYrB8mNploAYS3HRTHfVJCJpRHjvOzmkgdzTYmeEq+j0b2vxvvAzBRr26PYyo
 XzB3LrA6aSJC8+tZY9REbFSKYP0HT3HiEeRrMi4Rpa37WDNMkFJpLGlwZQ2rRj2gFr4k
 CTqEMOLt+Fk9yrO9Xs0VYuIBFEdOi4vb2rrYGDrswTbdhmnrtokyYQbhWQL9TG3fHist
 j14g==
X-Gm-Message-State: ACrzQf1//ddxz6r9pOSaor7BrO/NC0QO52lq44cXhqIl9UE+EOEB0bfo
 nyBua2oIidjvgPNCn7l9wjswOxojGs5+F/HoZkbPK733DBs=
X-Google-Smtp-Source: AMsMyM4bpOmQfPo2yv27yMhyDy6UwwoQicG58C8ZWxjpekjCFIfTdqvralaYeHjdFnmbt4pNGNQflTUcNq6aaK8ymro=
X-Received: by 2002:a81:4c07:0:b0:367:494c:3174 with SMTP id
 z7-20020a814c07000000b00367494c3174mr38004460ywa.306.1666862531136; Thu, 27
 Oct 2022 02:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221019121537.255477-1-tkutergin@gmail.com>
 <CAFEAcA-6ZyWbRvy9VOFJd0RR1h3bk9GNNzH4Uh0pznzT6RkOnA@mail.gmail.com>
In-Reply-To: <CAFEAcA-6ZyWbRvy9VOFJd0RR1h3bk9GNNzH4Uh0pznzT6RkOnA@mail.gmail.com>
From: Timofey Kutergin <tkutergin@gmail.com>
Date: Thu, 27 Oct 2022 12:22:00 +0300
Message-ID: <CACKEeROBkPn0pPcH1vv4pRDFYztS3eWSLVZ3=rPN1dqopeRPng@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fixed Privileged Access Never (PAN) for
 aarch32
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000ed24605ec00ad77"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=tkutergin@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000000ed24605ec00ad77
Content-Type: text/plain; charset="UTF-8"

Hi Peter,
> V8 always implies V7, so we only need to check V7 here.
From silicon perspective - yes, but as I see in qemu,
ARM_FEATURE_V7 and ARM_FEATURE_V8 are independent bits which do not affect
each
other in arm_feature() and set_feature() so they should be tested
separately.
Did I miss something?

Thanks
Best regards
Timofey



On Tue, Oct 25, 2022 at 4:45 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 19 Oct 2022 at 13:15, Timofey Kutergin <tkutergin@gmail.com>
> wrote:
> >
> > - synchronize PSTATE.PAN with changes in CPSR.PAN in aarch32 mode
> > - set PAN bit automatically on exception entry if SCTLR_SPAN bit
> >   is set
> > - throw permission fault during address translation when PAN is
> >   enabled and kernel tries to access user acessible page
> > - ignore SCTLR_XP bit for armv7 and armv8 (conflicts with SCTLR_SPAN).
> >
> > Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>
> > ---
> >  target/arm/helper.c |  6 ++++++
> >  target/arm/ptw.c    | 11 ++++++++++-
> >  2 files changed, 16 insertions(+), 1 deletion(-)
>
> Thanks for this patch. I think you've caught all the places
> we aren't correctly implementing AArch32 PAN handling.
>
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index dde64a487a..5299f67e3f 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -9052,6 +9052,11 @@ void cpsr_write(CPUARMState *env, uint32_t val,
> uint32_t mask,
> >      }
> >      mask &= ~CACHED_CPSR_BITS;
> >      env->uncached_cpsr = (env->uncached_cpsr & ~mask) | (val & mask);
> > +    if (env->uncached_cpsr & CPSR_PAN) {
> > +        env->pstate |= PSTATE_PAN;
> > +    } else {
> > +        env->pstate &= ~PSTATE_PAN;
> > +    }
>
> This approach means we're storing the PAN bit in two places,
> both in env->uncached_cpsr and in env->pstate. We don't do
> this for any other bits as far as I can see. I think we should
> either:
>  (1) have the code that changes behaviour based on PAN look
>      at either env->pstate or env->uncached_cpsr depending
>      on whether we're AArch64 or AArch32
>  (2) always store the state in env->pstate only, and handle
>      this in read/write of the CPSR the same way we do with
>      other "cached" bits
>
> I think the intention of the current code is (1), and the
> only place we get this wrong is in arm_mmu_idx_el(),
> which is checking env->pstate only. (The other places that
> directly check env->pstate are all in AArch64-only code,
> and various AArch32-only bits of code already check
> env->uncached_cpsr.) A function like
>
> bool arm_pan_enabled(CPUARMState *env)
> {
>     if (is_a64(env)) {
>         return env->pstate & PSTATE_PAN;
>     } else {
>         return env->uncached_cpsr & CPSR_PAN;
>     }
> }
>
> and then using that in arm_mmu_idx_el() should I think
> mean you don't need to change either cpsr_write() or
> take_aarch32_exception().
>
> >      if (rebuild_hflags) {
> >          arm_rebuild_hflags(env);
> >      }
> > @@ -9592,6 +9597,7 @@ static void take_aarch32_exception(CPUARMState
> *env, int new_mode,
> >                  /* ... the target is EL1 and SCTLR.SPAN is 0.  */
> >                  if (!(env->cp15.sctlr_el[new_el] & SCTLR_SPAN)) {
> >                      env->uncached_cpsr |= CPSR_PAN;
> > +                    env->pstate |= PSTATE_PAN;
> >                  }
> >                  break;
> >              }
> > diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> > index 23f16f4ff7..204a73350f 100644
> > --- a/target/arm/ptw.c
> > +++ b/target/arm/ptw.c
> > @@ -659,6 +659,13 @@ static bool get_phys_addr_v6(CPUARMState *env,
> uint32_t address,
> >              goto do_fault;
> >          }
> >
> > +        if (regime_is_pan(env, mmu_idx) && !regime_is_user(env,
> mmu_idx) &&
> > +            simple_ap_to_rw_prot_is_user(ap >> 1, 1) &&
> > +            access_type != MMU_INST_FETCH) {
> > +            fi->type = ARMFault_Permission;
> > +            goto do_fault;
> > +        }
>
> This assumes we're using the SCTLR.AFE==1 simplified
> permissions model, but PAN should apply even if we're using the
> old model. So we need a ap_to_rw_prot_is_user() to check the
> permissions in that model.
>
> The check is also being done before the Access fault check, but
> the architecture says that Access faults take priority over
> Permission faults.
>
> > +
> >          if (arm_feature(env, ARM_FEATURE_V6K) &&
> >                  (regime_sctlr(env, mmu_idx) & SCTLR_AFE)) {
> >              /* The simplified model uses AP[0] as an access control
> bit.  */
> > @@ -2506,7 +2513,9 @@ bool get_phys_addr_with_secure(CPUARMState *env,
> target_ulong address,
> >      if (regime_using_lpae_format(env, mmu_idx)) {
> >          return get_phys_addr_lpae(env, address, access_type, mmu_idx,
> >                                    is_secure, false, result, fi);
> > -    } else if (regime_sctlr(env, mmu_idx) & SCTLR_XP) {
> > +    } else if (arm_feature(env, ARM_FEATURE_V7) ||
> > +               arm_feature(env, ARM_FEATURE_V8) || (
>
> V8 always implies V7, so we only need to check V7 here.
>
> > +               regime_sctlr(env, mmu_idx) & SCTLR_XP)) {
> >          return get_phys_addr_v6(env, address, access_type, mmu_idx,
> >                                  is_secure, result, fi);
> >      } else {
>
> thanks
> -- PMM
>

--0000000000000ed24605ec00ad77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div>&gt; V8 always implies V7, so we only need t=
o check V7 here.</div><div>From silicon perspective - yes, but as I see in =
qemu,</div><div><div style=3D"color:rgb(191,191,191);background-color:rgb(1=
8,18,18);font-family:&quot;Droid Sans Mono&quot;,&quot;monospace&quot;,mono=
space;font-size:14px;line-height:19px;white-space:pre"><div>ARM_FEATURE_V7 =
and <span style=3D"color:rgb(191,191,191)">ARM_FEATURE_V8 are independent b=
its which do not affect each </span></div><div><span style=3D"color:rgb(191=
,191,191)">other in </span><span style=3D"color:rgb(187,215,167)">arm_featu=
re() and </span><span style=3D"color:rgb(187,215,167)">set_feature() so the=
y should be tested separately.</span></div><div><span style=3D"color:rgb(18=
7,215,167)">Did I miss something?</span></div><div><span style=3D"color:rgb=
(187,215,167)"><br></span></div><div><span style=3D"color:rgb(187,215,167)"=
>Thanks</span></div><div><span style=3D"color:rgb(187,215,167)">Best regard=
s</span></div><div><span style=3D"color:rgb(187,215,167)">Timofey</span></d=
iv><div><span style=3D"color:rgb(187,215,167)"><br></span></div></div></div=
><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Oct 25, 2022 at 4:45 PM Peter Maydell &lt;<a href=
=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 19 Oct=
 2022 at 13:15, Timofey Kutergin &lt;<a href=3D"mailto:tkutergin@gmail.com"=
 target=3D"_blank">tkutergin@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; - synchronize PSTATE.PAN with changes in CPSR.PAN in aarch32 mode<br>
&gt; - set PAN bit automatically on exception entry if SCTLR_SPAN bit<br>
&gt;=C2=A0 =C2=A0is set<br>
&gt; - throw permission fault during address translation when PAN is<br>
&gt;=C2=A0 =C2=A0enabled and kernel tries to access user acessible page<br>
&gt; - ignore SCTLR_XP bit for armv7 and armv8 (conflicts with SCTLR_SPAN).=
<br>
&gt;<br>
&gt; Signed-off-by: Timofey Kutergin &lt;<a href=3D"mailto:tkutergin@gmail.=
com" target=3D"_blank">tkutergin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 target/arm/helper.c |=C2=A0 6 ++++++<br>
&gt;=C2=A0 target/arm/ptw.c=C2=A0 =C2=A0 | 11 ++++++++++-<br>
&gt;=C2=A0 2 files changed, 16 insertions(+), 1 deletion(-)<br>
<br>
Thanks for this patch. I think you&#39;ve caught all the places<br>
we aren&#39;t correctly implementing AArch32 PAN handling.<br>
<br>
&gt; diff --git a/target/arm/helper.c b/target/arm/helper.c<br>
&gt; index dde64a487a..5299f67e3f 100644<br>
&gt; --- a/target/arm/helper.c<br>
&gt; +++ b/target/arm/helper.c<br>
&gt; @@ -9052,6 +9052,11 @@ void cpsr_write(CPUARMState *env, uint32_t val,=
 uint32_t mask,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 mask &amp;=3D ~CACHED_CPSR_BITS;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 env-&gt;uncached_cpsr =3D (env-&gt;uncached_cpsr &=
amp; ~mask) | (val &amp; mask);<br>
&gt; +=C2=A0 =C2=A0 if (env-&gt;uncached_cpsr &amp; CPSR_PAN) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pstate |=3D PSTATE_PAN;<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;pstate &amp;=3D ~PSTATE_PAN;<br>
&gt; +=C2=A0 =C2=A0 }<br>
<br>
This approach means we&#39;re storing the PAN bit in two places,<br>
both in env-&gt;uncached_cpsr and in env-&gt;pstate. We don&#39;t do<br>
this for any other bits as far as I can see. I think we should<br>
either:<br>
=C2=A0(1) have the code that changes behaviour based on PAN look<br>
=C2=A0 =C2=A0 =C2=A0at either env-&gt;pstate or env-&gt;uncached_cpsr depen=
ding<br>
=C2=A0 =C2=A0 =C2=A0on whether we&#39;re AArch64 or AArch32<br>
=C2=A0(2) always store the state in env-&gt;pstate only, and handle<br>
=C2=A0 =C2=A0 =C2=A0this in read/write of the CPSR the same way we do with<=
br>
=C2=A0 =C2=A0 =C2=A0other &quot;cached&quot; bits<br>
<br>
I think the intention of the current code is (1), and the<br>
only place we get this wrong is in arm_mmu_idx_el(),<br>
which is checking env-&gt;pstate only. (The other places that<br>
directly check env-&gt;pstate are all in AArch64-only code,<br>
and various AArch32-only bits of code already check<br>
env-&gt;uncached_cpsr.) A function like<br>
<br>
bool arm_pan_enabled(CPUARMState *env)<br>
{<br>
=C2=A0 =C2=A0 if (is_a64(env)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return env-&gt;pstate &amp; PSTATE_PAN;<br>
=C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return env-&gt;uncached_cpsr &amp; CPSR_PAN;<br=
>
=C2=A0 =C2=A0 }<br>
}<br>
<br>
and then using that in arm_mmu_idx_el() should I think<br>
mean you don&#39;t need to change either cpsr_write() or<br>
take_aarch32_exception().<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (rebuild_hflags) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm_rebuild_hflags(env);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -9592,6 +9597,7 @@ static void take_aarch32_exception(CPUARMState *=
env, int new_mode,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ... t=
he target is EL1 and SCTLR.SPAN is 0.=C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(en=
v-&gt;cp15.sctlr_el[new_el] &amp; SCTLR_SPAN)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 env-&gt;uncached_cpsr |=3D CPSR_PAN;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 env-&gt;pstate |=3D PSTATE_PAN;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/target/arm/ptw.c b/target/arm/ptw.c<br>
&gt; index 23f16f4ff7..204a73350f 100644<br>
&gt; --- a/target/arm/ptw.c<br>
&gt; +++ b/target/arm/ptw.c<br>
&gt; @@ -659,6 +659,13 @@ static bool get_phys_addr_v6(CPUARMState *env, ui=
nt32_t address,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto do_fault;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (regime_is_pan(env, mmu_idx) &amp;&amp=
; !regime_is_user(env, mmu_idx) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 simple_ap_to_rw_prot_is_use=
r(ap &gt;&gt; 1, 1) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 access_type !=3D MMU_INST_F=
ETCH) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi-&gt;type =3D ARMFault_Pe=
rmission;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto do_fault;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
This assumes we&#39;re using the SCTLR.AFE=3D=3D1 simplified<br>
permissions model, but PAN should apply even if we&#39;re using the<br>
old model. So we need a ap_to_rw_prot_is_user() to check the<br>
permissions in that model.<br>
<br>
The check is also being done before the Access fault check, but<br>
the architecture says that Access faults take priority over<br>
Permission faults.<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (arm_feature(env, ARM_FEATURE_V6K=
) &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (regime_=
sctlr(env, mmu_idx) &amp; SCTLR_AFE)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* The simplified mode=
l uses AP[0] as an access control bit.=C2=A0 */<br>
&gt; @@ -2506,7 +2513,9 @@ bool get_phys_addr_with_secure(CPUARMState *env,=
 target_ulong address,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (regime_using_lpae_format(env, mmu_idx)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return get_phys_addr_lpae(env, addre=
ss, access_type, mmu_idx,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_secure, false, r=
esult, fi);<br>
&gt; -=C2=A0 =C2=A0 } else if (regime_sctlr(env, mmu_idx) &amp; SCTLR_XP) {=
<br>
&gt; +=C2=A0 =C2=A0 } else if (arm_feature(env, ARM_FEATURE_V7) ||<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arm_feature(en=
v, ARM_FEATURE_V8) || (<br>
<br>
V8 always implies V7, so we only need to check V7 here.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0regime_sctlr(e=
nv, mmu_idx) &amp; SCTLR_XP)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return get_phys_addr_v6(env, address=
, access_type, mmu_idx,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 is_secure, result, fi);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 } else {<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000000ed24605ec00ad77--

