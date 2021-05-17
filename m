Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4823383AAC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:03:46 +0200 (CEST)
Received: from localhost ([::1]:49514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligef-0006xB-Ry
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:03:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ligZC-00069d-B0
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:58:06 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1ligZA-00009S-4M
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:58:05 -0400
Received: by mail-ed1-x530.google.com with SMTP id s6so7728217edu.10
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8N0lrIJQ4oExyljOg9abcMM1RUz0u7gXb6d+brVCQwA=;
 b=p1fXwJbYAm1y9yqrAaUcHp7G9VkV68ka7s418ac7ULG4rwQRg7IKZWSjgrkkSGmILE
 ImHOExDhbyUzixlFk3J/AJwBwWAeIIRaRmnHhS9Vq3SfQAU+4BWIERwC/QF/7tNMAyte
 KfS+BX1PGje2XPRoHIVkKuuENo7mqI5JfSqtp71uMFZLMXLb8LVQZDDV7wSvAKjDIQVg
 xIivG5dGDapwqTb8aSpqig0Cft3HS49cwWnIg1JKnmW7Axd9Idx9gswsWgIs5cvlLezr
 8cmqRKz1HSjcfJHcOnIc6/EZEPrlP3M1FpEBoLV0m69g6zcH0iju1uZq5xfv5s7X234r
 J5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8N0lrIJQ4oExyljOg9abcMM1RUz0u7gXb6d+brVCQwA=;
 b=DbFQo8saNF8UueIVtgZHTXiYn0uGtKXWe+hIgu4eofIikQylzNVd9038W/qVpNbUre
 lXO14lWlfC4uFG0kiNkxYKeAdi3rHtdiPw/ygcP8vtHNA4PaBvZeRo3Q8NJ7dpVhFLYd
 1XoX1kTOInNrMyxqMygso5kcqcQgPH0YEKLug1pfFFRnBgfqDD5cd/Rlsb8a0hjCMY1A
 id0wUZHqc5gWSxvUiDMpWwQwTHVVN/02uxQ0ZfGyrwHxziFYk8mwCjR5aDFT2YpYfkY8
 f7btHeiTAyIB1/1WJmj8ewNwc8eeZUFN6cgSl9AdN7S1NCwUXZWEvWt7420tWU22QGVU
 mFxg==
X-Gm-Message-State: AOAM5337/25Jgt5Qca6UIqOfegANuYn0FuodfCLwnvgMUuF8qz3EwSCX
 LijbGv/sIxhFZs9UxOe+OfxUvnRjO9acRedOGWU=
X-Google-Smtp-Source: ABdhPJyM2UkHaOz2lZqg+JXi3IZhsHb+kz2G2IHkaJUe0Z2+9/JOfJhUr9tfilY+A2wwf43+Kt6id5tmo7NooUC/5FI=
X-Received: by 2002:a50:fd13:: with SMTP id i19mr1204480eds.386.1621270682557; 
 Mon, 17 May 2021 09:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190114074855.16891-1-jcmvbkbc@gmail.com>
 <20190114074855.16891-8-jcmvbkbc@gmail.com>
 <CAAdtpL5NoHLoUZR6MQKMg92h=Cm-Fqyc+zJvXz-GWqbtobyu2A@mail.gmail.com>
 <CAMo8BfLotZPVu5XWZ=EKZPgW3yir1Fsddj31Q6jzGcYehhzGbQ@mail.gmail.com>
 <CAMo8Bf+zdmFgRgpq_kCi=jP0KDbHw=9+Ai_46i_Z8veek+qemg@mail.gmail.com>
 <c8189bc2-79e3-3b57-2f4a-54012ed6ebb7@amsat.org>
 <CAMo8BfKE_TQJ7FG9gYwstahO7z67voDsp9GJP8j5si=78z+1EA@mail.gmail.com>
 <CAMo8Bf+rUTKMsjyKJSi+zcmNvtwuGH+8KA5DLpdDR1=NR5hb1g@mail.gmail.com>
 <583c9827-901f-67f1-004f-59c8310a92e5@amsat.org>
In-Reply-To: <583c9827-901f-67f1-004f-59c8310a92e5@amsat.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 17 May 2021 09:57:51 -0700
Message-ID: <CAMo8Bf+q6uQTAPu1cAJGL1qDJALJpd--NjJuE1WO3a1=D1+3Dg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 7/7] target/xtensa: move non-HELPER functions
 to helper.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ed1-x530.google.com
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

On Mon, May 17, 2021 at 9:54 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 5/17/21 5:35 PM, Max Filippov wrote:
> > On Mon, May 17, 2021 at 8:25 AM Max Filippov <jcmvbkbc@gmail.com> wrote=
:
> >>
> >> On Mon, May 17, 2021 at 6:10 AM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> >>>
> >>> On 5/17/21 2:11 PM, Max Filippov wrote:
> >>>> On Mon, May 17, 2021 at 4:50 AM Max Filippov <jcmvbkbc@gmail.com> wr=
ote:
> >>>>>
> >>>>> Hi Philippe,
> >>>>>
> >>>>> On Sun, May 16, 2021 at 10:05 PM Philippe Mathieu-Daud=C3=A9
> >>>>> <philippe@mathieu-daude.net> wrote:
> >>>>>>
> >>>>>> Hi Max,
> >>>>>>
> >>>>>> On Mon, Jan 14, 2019 at 8:52 AM Max Filippov <jcmvbkbc@gmail.com> =
wrote:
> >>>>>>>
> >>>>>>> Move remaining non-HELPER functions from op_helper.c to helper.c.
> >>>>>>> No functional changes.
> >>>>>>>
> >>>>>>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> >>>>>>> ---
> >>>>>>>  target/xtensa/helper.c    | 61 +++++++++++++++++++++++++++++++++=
+++++++++++---
> >>>>>>>  target/xtensa/op_helper.c | 56 ---------------------------------=
----------
> >>>>>>>  2 files changed, 58 insertions(+), 59 deletions(-)
> >>>>>>
> >>>>>>> +void xtensa_cpu_do_unaligned_access(CPUState *cs,
> >>>>>>> +                                    vaddr addr, MMUAccessType ac=
cess_type,
> >>>>>>> +                                    int mmu_idx, uintptr_t retad=
dr)
> >>>>>>> +{
> >>>>>>> +    XtensaCPU *cpu =3D XTENSA_CPU(cs);
> >>>>>>> +    CPUXtensaState *env =3D &cpu->env;
> >>>>>>> +
> >>>>>>> +    if (xtensa_option_enabled(env->config, XTENSA_OPTION_UNALIGN=
ED_EXCEPTION) &&
> >>>>>>> +        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALI=
GNMENT)) {
> >>>>>>
> >>>>>> I know this is a simple code movement, but I wonder, what should
> >>>>>> happen when there is
> >>>>>> an unaligned fault and the options are disabled? Is this an imposs=
ible
> >>>>>> case (unreachable)?
> >>>>>
> >>>>> It should be unreachable when XTENSA_OPTION_UNALIGNED_EXCEPTION
> >>>>> is disabled. In that case the translation code generates access on =
aligned
> >>>>> addresses according to the xtensa ISA, see the function
> >>>>> gen_load_store_alignment in target/xtensa/translate.c
> >>>>
> >>>> There's also a case when both options are enabled, i.e. the
> >>>> xtensa core has support for transparent unaligned access.
> >>>> In that case the helper does nothing and the generic TCG
> >>>> code is supposed to deal with the unaligned access correctly,
> >>>
> >>> IIRC we can simplify as:
> >>>
> >>> -- >8 --
> >>> diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
> >>> index eeffee297d1..6e8a6cdc99e 100644
> >>> --- a/target/xtensa/helper.c
> >>> +++ b/target/xtensa/helper.c
> >>> @@ -270,13 +270,14 @@ void xtensa_cpu_do_unaligned_access(CPUState *c=
s,
> >>>      XtensaCPU *cpu =3D XTENSA_CPU(cs);
> >>>      CPUXtensaState *env =3D &cpu->env;
> >>>
> >>> -    if (xtensa_option_enabled(env->config,
> >>> XTENSA_OPTION_UNALIGNED_EXCEPTION) &&
> >>> -        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNME=
NT)) {
> >>> -        cpu_restore_state(CPU(cpu), retaddr, true);
> >>> -        HELPER(exception_cause_vaddr)(env,
> >>> -                                      env->pc, LOAD_STORE_ALIGNMENT_=
CAUSE,
> >>> -                                      addr);
> >>> -    }
> >>> +    assert(xtensa_option_enabled(env->config,
> >>> +                                 XTENSA_OPTION_UNALIGNED_EXCEPTION))=
;
> >>
> >> This part -- yes.
> >>
> >>> +    assert(!xtensa_option_enabled(env->config,
> >>> XTENSA_OPTION_HW_ALIGNMENT));
> >>
> >> This part -- no, because the call to the TCGCPUOps::do_unaligned_acces=
s
> >> is unconditional
> >
> > Oh, I've checked get_alignment_bits and now I see that it's conditional=
.
> > This change can be done then, but the translation part also needs to be=
 changed
> > to put MO_UNALN on cores with XTENSA_OPTION_HW_ALIGNMENT.
>
> If you don't mind writing the patch, I'd prefer you do it because
> you have a better understanding and will likely get it right, otherwise
> I'll add it to my TODO and come back to it when other of my in-flight
> series get merged :)

Almost done, will send it after some testing.
Thanks for drawing my attention to it (:

--=20
Thanks.
-- Max

