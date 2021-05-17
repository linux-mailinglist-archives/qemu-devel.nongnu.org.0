Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB7B3836C3
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:36:58 +0200 (CEST)
Received: from localhost ([::1]:42918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifIe-00079K-SE
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lifHC-0005gJ-Vv
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:35:27 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:41753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lifHB-0008MI-6P
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:35:26 -0400
Received: by mail-ed1-x52d.google.com with SMTP id v5so7414286edc.8
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 08:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fufZkw1BPef8cDixLXRz+u78AA0ntEZtNtVZJa6Lpl0=;
 b=JKUbyCW+bDgp27nkelEZK5RisUVr5xGx2yGCSRlCkineNWQE7UoMwsai1pNrIScaQO
 sSKKLhfOfvjvx1U2enaUoSqzvz3/1iEnLA3DL4UXY5l9or10hrxk6nEemlbTqrsZJbf/
 tdYX70jsMVFW1W1/LBLzFoq9sXrG1M/lb9cgdGNXT3PzpU/Vu1gp+MedNHJ03wPa3EEX
 AaSoUcQBD8ElF0DnhOAt+C2cyXMwtoUuG/JT0g64Z0RfL7vUQ73DOtOM9UjFnreyZ46Z
 W+5PJ2SFpXG/meFZHwlLYOpVJq/5oBj3bOF6S2TmPPmvRttiOzSMYnUl6yOHmy2ssPSh
 y1EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fufZkw1BPef8cDixLXRz+u78AA0ntEZtNtVZJa6Lpl0=;
 b=Zu6l2s5Twq3feh6T4cAU5F+Ew2jw/LqJ1INRaB2UbKHciUFDWYO/qOPJuM6GilxHqb
 QXxGVRAoqFt43g8+NDcbiAWXvLwE+r/yPNpbKXp7S9hJUJ1HooS1DE/Z72ynqDC/EAmh
 t82rds3tZLYMpmNhzFFfp+gHQ1XzDr3tGCEW+DgMLHLDke3zKV/Qxk6zthZnCYaGQAGd
 EQzUSVTP6xPmk8cbM5x6eOXl60EWZckjMQcSCzJ4ZNuFVdl0RCctaXr6Qrh6+/5Y65Ug
 bADqZjemHB/RSFgYJmBvHWk/Lq5EkvfLVd4fJMueeaL6OQO1355a5fp4mKrJGqbr4HRQ
 enEQ==
X-Gm-Message-State: AOAM5324J8t+rZEfwscPeFAGQcAgzWvoKeXZRTvU/Dwktrxkpb785dY2
 PnGwuCU1HBPpkKoeFBiPeP/4YDwluweYG0v80tg=
X-Google-Smtp-Source: ABdhPJySAGCOWtIg01lDtWO0ZvV6qYSdyx8GCjKwXlMX7PC4Hq2Clu0xbJna4uQXZQidtqPteqCKpf/LQa3e0MZA5SU=
X-Received: by 2002:a50:fd13:: with SMTP id i19mr739781eds.386.1621265723763; 
 Mon, 17 May 2021 08:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190114074855.16891-1-jcmvbkbc@gmail.com>
 <20190114074855.16891-8-jcmvbkbc@gmail.com>
 <CAAdtpL5NoHLoUZR6MQKMg92h=Cm-Fqyc+zJvXz-GWqbtobyu2A@mail.gmail.com>
 <CAMo8BfLotZPVu5XWZ=EKZPgW3yir1Fsddj31Q6jzGcYehhzGbQ@mail.gmail.com>
 <CAMo8Bf+zdmFgRgpq_kCi=jP0KDbHw=9+Ai_46i_Z8veek+qemg@mail.gmail.com>
 <c8189bc2-79e3-3b57-2f4a-54012ed6ebb7@amsat.org>
 <CAMo8BfKE_TQJ7FG9gYwstahO7z67voDsp9GJP8j5si=78z+1EA@mail.gmail.com>
In-Reply-To: <CAMo8BfKE_TQJ7FG9gYwstahO7z67voDsp9GJP8j5si=78z+1EA@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 17 May 2021 08:35:12 -0700
Message-ID: <CAMo8Bf+rUTKMsjyKJSi+zcmNvtwuGH+8KA5DLpdDR1=NR5hb1g@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 7/7] target/xtensa: move non-HELPER functions
 to helper.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.999, HK_RANDOM_FROM=1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 17, 2021 at 8:25 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> On Mon, May 17, 2021 at 6:10 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >
> > On 5/17/21 2:11 PM, Max Filippov wrote:
> > > On Mon, May 17, 2021 at 4:50 AM Max Filippov <jcmvbkbc@gmail.com> wro=
te:
> > >>
> > >> Hi Philippe,
> > >>
> > >> On Sun, May 16, 2021 at 10:05 PM Philippe Mathieu-Daud=C3=A9
> > >> <philippe@mathieu-daude.net> wrote:
> > >>>
> > >>> Hi Max,
> > >>>
> > >>> On Mon, Jan 14, 2019 at 8:52 AM Max Filippov <jcmvbkbc@gmail.com> w=
rote:
> > >>>>
> > >>>> Move remaining non-HELPER functions from op_helper.c to helper.c.
> > >>>> No functional changes.
> > >>>>
> > >>>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> > >>>> ---
> > >>>>  target/xtensa/helper.c    | 61 ++++++++++++++++++++++++++++++++++=
++++++++++---
> > >>>>  target/xtensa/op_helper.c | 56 ----------------------------------=
---------
> > >>>>  2 files changed, 58 insertions(+), 59 deletions(-)
> > >>>
> > >>>> +void xtensa_cpu_do_unaligned_access(CPUState *cs,
> > >>>> +                                    vaddr addr, MMUAccessType acc=
ess_type,
> > >>>> +                                    int mmu_idx, uintptr_t retadd=
r)
> > >>>> +{
> > >>>> +    XtensaCPU *cpu =3D XTENSA_CPU(cs);
> > >>>> +    CPUXtensaState *env =3D &cpu->env;
> > >>>> +
> > >>>> +    if (xtensa_option_enabled(env->config, XTENSA_OPTION_UNALIGNE=
D_EXCEPTION) &&
> > >>>> +        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIG=
NMENT)) {
> > >>>
> > >>> I know this is a simple code movement, but I wonder, what should
> > >>> happen when there is
> > >>> an unaligned fault and the options are disabled? Is this an impossi=
ble
> > >>> case (unreachable)?
> > >>
> > >> It should be unreachable when XTENSA_OPTION_UNALIGNED_EXCEPTION
> > >> is disabled. In that case the translation code generates access on a=
ligned
> > >> addresses according to the xtensa ISA, see the function
> > >> gen_load_store_alignment in target/xtensa/translate.c
> > >
> > > There's also a case when both options are enabled, i.e. the
> > > xtensa core has support for transparent unaligned access.
> > > In that case the helper does nothing and the generic TCG
> > > code is supposed to deal with the unaligned access correctly,
> >
> > IIRC we can simplify as:
> >
> > -- >8 --
> > diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
> > index eeffee297d1..6e8a6cdc99e 100644
> > --- a/target/xtensa/helper.c
> > +++ b/target/xtensa/helper.c
> > @@ -270,13 +270,14 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
> >      XtensaCPU *cpu =3D XTENSA_CPU(cs);
> >      CPUXtensaState *env =3D &cpu->env;
> >
> > -    if (xtensa_option_enabled(env->config,
> > XTENSA_OPTION_UNALIGNED_EXCEPTION) &&
> > -        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNMENT=
)) {
> > -        cpu_restore_state(CPU(cpu), retaddr, true);
> > -        HELPER(exception_cause_vaddr)(env,
> > -                                      env->pc, LOAD_STORE_ALIGNMENT_CA=
USE,
> > -                                      addr);
> > -    }
> > +    assert(xtensa_option_enabled(env->config,
> > +                                 XTENSA_OPTION_UNALIGNED_EXCEPTION));
>
> This part -- yes.
>
> > +    assert(!xtensa_option_enabled(env->config,
> > XTENSA_OPTION_HW_ALIGNMENT));
>
> This part -- no, because the call to the TCGCPUOps::do_unaligned_access
> is unconditional

Oh, I've checked get_alignment_bits and now I see that it's conditional.
This change can be done then, but the translation part also needs to be cha=
nged
to put MO_UNALN on cores with XTENSA_OPTION_HW_ALIGNMENT.

--=20
Thanks.
-- Max

