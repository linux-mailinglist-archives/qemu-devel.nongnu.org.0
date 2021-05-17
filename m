Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25B538360E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:28:51 +0200 (CEST)
Received: from localhost ([::1]:60168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifAo-0007Ly-OI
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lif8B-0004T7-7n
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:26:07 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lif89-0002AP-GH
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:26:06 -0400
Received: by mail-ej1-x635.google.com with SMTP id lg14so9792699ejb.9
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 08:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3Wf4QIYNJPy+7/l8W27sic5Ux9o2aTMkSpwteSQ2/eE=;
 b=C1FeAsQUWq4SWfshD6q0Rn2g1iSZlapeyK6TT43nty2jiErTE4kGcO2IhBxfOd7Cb3
 mqPcT2cD6QssfBLO9xAhNStJSVzUfCtGFEQdnERnPTkW/5rH5rNtRrIva3HyZuM0no/X
 DL+l50S/LgcWAsRYQvUyubksulnvRN34OEetd6lhOMTP6uwQdKembHLC0mMhfYrnb+wB
 oRsmKQlDAbm77vBBc2roHGbkUizxEfmEZZ4TWxflhCtQPP/y3D+mo06aBLXhxd+IbyL1
 /54leGeVFOz8nN9EQiXjfiEt1jdmbatzYeyJB9XBknTozqtYe5V19pc3s0d0f5K4N9OX
 YkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3Wf4QIYNJPy+7/l8W27sic5Ux9o2aTMkSpwteSQ2/eE=;
 b=M9MqvWAeExK+a3mD9FRtmZnVXNOGYs3Q/JCarWAH7+zQvw8rJ3KT0t7RzjZvE5/pV8
 cFb3PmpcQRSu+4NVKDlStQef+ondNhn+j15tzD9BW1tQrJ2gPW///dWmwWvKI0GHdu7o
 EcflgUeYQtf85fUpMf5C9OVLIBjEwE5WOI31YQb+EwDaKhZHPHxS56QNLnmbKagKCs12
 5dx6+ouTdc8XnXn70QThpAd19puLk/NHzfn33142a3VGLWk3R1UVvsVb2HwCiMHtNHhA
 ypRACTb3t2QVS8GB6cElYM8GdGTVWcLjAnVokt9YPQGeJb4nriGUQOdoAwmpciSBOrwL
 dGkQ==
X-Gm-Message-State: AOAM532BK2gwbKo+K35vCPBWLL6j/u+ZFE5lb5VUlCFNLFpFxQM1B/fK
 d0mrogYGvqD4ZaSOIjNHBWTBgveznvxwa1bYpQM=
X-Google-Smtp-Source: ABdhPJwxHi25NxZJwnBQtF6T0koQoWHWM9tDGnYNQQqcVDmks52lCXOw7DvkvAPdO2P/aVa0qKdagvZmmGWM8RGelMI=
X-Received: by 2002:a17:907:10c7:: with SMTP id
 rv7mr453342ejb.125.1621265163359; 
 Mon, 17 May 2021 08:26:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190114074855.16891-1-jcmvbkbc@gmail.com>
 <20190114074855.16891-8-jcmvbkbc@gmail.com>
 <CAAdtpL5NoHLoUZR6MQKMg92h=Cm-Fqyc+zJvXz-GWqbtobyu2A@mail.gmail.com>
 <CAMo8BfLotZPVu5XWZ=EKZPgW3yir1Fsddj31Q6jzGcYehhzGbQ@mail.gmail.com>
 <CAMo8Bf+zdmFgRgpq_kCi=jP0KDbHw=9+Ai_46i_Z8veek+qemg@mail.gmail.com>
 <c8189bc2-79e3-3b57-2f4a-54012ed6ebb7@amsat.org>
In-Reply-To: <c8189bc2-79e3-3b57-2f4a-54012ed6ebb7@amsat.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 17 May 2021 08:25:52 -0700
Message-ID: <CAMo8BfKE_TQJ7FG9gYwstahO7z67voDsp9GJP8j5si=78z+1EA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 7/7] target/xtensa: move non-HELPER functions
 to helper.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ej1-x635.google.com
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

On Mon, May 17, 2021 at 6:10 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> On 5/17/21 2:11 PM, Max Filippov wrote:
> > On Mon, May 17, 2021 at 4:50 AM Max Filippov <jcmvbkbc@gmail.com> wrote=
:
> >>
> >> Hi Philippe,
> >>
> >> On Sun, May 16, 2021 at 10:05 PM Philippe Mathieu-Daud=C3=A9
> >> <philippe@mathieu-daude.net> wrote:
> >>>
> >>> Hi Max,
> >>>
> >>> On Mon, Jan 14, 2019 at 8:52 AM Max Filippov <jcmvbkbc@gmail.com> wro=
te:
> >>>>
> >>>> Move remaining non-HELPER functions from op_helper.c to helper.c.
> >>>> No functional changes.
> >>>>
> >>>> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> >>>> ---
> >>>>  target/xtensa/helper.c    | 61 ++++++++++++++++++++++++++++++++++++=
++++++++---
> >>>>  target/xtensa/op_helper.c | 56 ------------------------------------=
-------
> >>>>  2 files changed, 58 insertions(+), 59 deletions(-)
> >>>
> >>>> +void xtensa_cpu_do_unaligned_access(CPUState *cs,
> >>>> +                                    vaddr addr, MMUAccessType acces=
s_type,
> >>>> +                                    int mmu_idx, uintptr_t retaddr)
> >>>> +{
> >>>> +    XtensaCPU *cpu =3D XTENSA_CPU(cs);
> >>>> +    CPUXtensaState *env =3D &cpu->env;
> >>>> +
> >>>> +    if (xtensa_option_enabled(env->config, XTENSA_OPTION_UNALIGNED_=
EXCEPTION) &&
> >>>> +        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNM=
ENT)) {
> >>>
> >>> I know this is a simple code movement, but I wonder, what should
> >>> happen when there is
> >>> an unaligned fault and the options are disabled? Is this an impossibl=
e
> >>> case (unreachable)?
> >>
> >> It should be unreachable when XTENSA_OPTION_UNALIGNED_EXCEPTION
> >> is disabled. In that case the translation code generates access on ali=
gned
> >> addresses according to the xtensa ISA, see the function
> >> gen_load_store_alignment in target/xtensa/translate.c
> >
> > There's also a case when both options are enabled, i.e. the
> > xtensa core has support for transparent unaligned access.
> > In that case the helper does nothing and the generic TCG
> > code is supposed to deal with the unaligned access correctly,
>
> IIRC we can simplify as:
>
> -- >8 --
> diff --git a/target/xtensa/helper.c b/target/xtensa/helper.c
> index eeffee297d1..6e8a6cdc99e 100644
> --- a/target/xtensa/helper.c
> +++ b/target/xtensa/helper.c
> @@ -270,13 +270,14 @@ void xtensa_cpu_do_unaligned_access(CPUState *cs,
>      XtensaCPU *cpu =3D XTENSA_CPU(cs);
>      CPUXtensaState *env =3D &cpu->env;
>
> -    if (xtensa_option_enabled(env->config,
> XTENSA_OPTION_UNALIGNED_EXCEPTION) &&
> -        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNMENT))=
 {
> -        cpu_restore_state(CPU(cpu), retaddr, true);
> -        HELPER(exception_cause_vaddr)(env,
> -                                      env->pc, LOAD_STORE_ALIGNMENT_CAUS=
E,
> -                                      addr);
> -    }
> +    assert(xtensa_option_enabled(env->config,
> +                                 XTENSA_OPTION_UNALIGNED_EXCEPTION));

This part -- yes.

> +    assert(!xtensa_option_enabled(env->config,
> XTENSA_OPTION_HW_ALIGNMENT));

This part -- no, because the call to the TCGCPUOps::do_unaligned_access
is unconditional and would happen on CPUs that have
XTENSA_OPTION_HW_ALIGNMENT enabled. They could have a different
CPUClass::tcg_ops, but I'm not sure it's worth it.

--=20
Thanks.
-- Max

