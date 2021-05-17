Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E48A4382BEA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 14:16:54 +0200 (CEST)
Received: from localhost ([::1]:35772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1licB3-0002xM-W4
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 08:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lic5f-0004zh-13
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:11:19 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:35529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1lic5d-0003Qg-El
 for qemu-devel@nongnu.org; Mon, 17 May 2021 08:11:18 -0400
Received: by mail-ej1-x631.google.com with SMTP id k14so5351384eji.2
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 05:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+HhYfYRy1yPWzdREktyNIfW9l3bwyb1oVhLddaPHZ30=;
 b=p06FZDfwVXQHytsRhOVor30qhY8mkAZc6PFErvCRCTiqxmzmcCcSdx9NowYeJtFora
 /2KNRaVlLAuAfsHUlWpbUymcrKtXTuQa9DgJYpzw1bstN7/e28iPOJ9u83EW3+mKhDjz
 gc3tB/9yn8RWcUl+EYw0B/yJaY6cp2LvQ7oYUFu+wekMf+UYTPVauc9vvkCznE5sX5pU
 WTk01n3S6d2zrIEipWVN7x4kOoUgam9AKTmvHpMdxYEXS+RmW2gPhG8pA4o1/9E1rWWA
 uiYWCISAHvl+AZbMuwCkLHhPmkUb5RUpY6e5Wjg0p/8k/3kS1rwUHIV235zFu0SxC0KH
 o2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+HhYfYRy1yPWzdREktyNIfW9l3bwyb1oVhLddaPHZ30=;
 b=Is1KrsHY5qKJc5YTr5wlMSPbfsarN0Bo3hQDC6GDRWvQnyT0WGc5tU6XHd/5+iyq3E
 i/7SKCb515smGPIj1WeTf8oEevyrMVY+HKm5hn1wnBR79rlE0KNZ5+Zg1pJQiFnmPF/m
 69hxNcVT2fhKa2HdzOakgX65Bg/3YHPrWwZQn83jSdRGLPVwGKPYKV4wSHpp9RVt4lIW
 SUTHl5w6IwKOa0JGSLw6H58I+7PrtiCro9/SPmkOzUx0Cfyrq1e8jDbloqVKEnM5XxtT
 HykgZ0geQmbJAWaJsgMOiP9Ldrk7wWnLxmcy4Q3+/iJFjF8SQKlRIUvJIV6bCdY2JBLs
 F1iA==
X-Gm-Message-State: AOAM533HpV0pO31hombAm5qEB8h9KRO957GEpk6R3O7UANqGOk32Sd0e
 uBlVdLQCm6bC2aVa9sCwPNpEcechwSXwqIBdQZQ=
X-Google-Smtp-Source: ABdhPJyHn8Z3xIQEKyFTFyW7XBgolb3m8zPeUWXXfysiP2e4zTgd9eElTj2a3P4VyoTiaagV2+rqk3dBGkeYtlu7Dhc=
X-Received: by 2002:a17:906:1815:: with SMTP id
 v21mr19085036eje.376.1621253475445; 
 Mon, 17 May 2021 05:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190114074855.16891-1-jcmvbkbc@gmail.com>
 <20190114074855.16891-8-jcmvbkbc@gmail.com>
 <CAAdtpL5NoHLoUZR6MQKMg92h=Cm-Fqyc+zJvXz-GWqbtobyu2A@mail.gmail.com>
 <CAMo8BfLotZPVu5XWZ=EKZPgW3yir1Fsddj31Q6jzGcYehhzGbQ@mail.gmail.com>
In-Reply-To: <CAMo8BfLotZPVu5XWZ=EKZPgW3yir1Fsddj31Q6jzGcYehhzGbQ@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 17 May 2021 05:11:04 -0700
Message-ID: <CAMo8Bf+zdmFgRgpq_kCi=jP0KDbHw=9+Ai_46i_Z8veek+qemg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH 7/7] target/xtensa: move non-HELPER functions
 to helper.c
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe@mathieu-daude.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-ej1-x631.google.com
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

On Mon, May 17, 2021 at 4:50 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> Hi Philippe,
>
> On Sun, May 16, 2021 at 10:05 PM Philippe Mathieu-Daud=C3=A9
> <philippe@mathieu-daude.net> wrote:
> >
> > Hi Max,
> >
> > On Mon, Jan 14, 2019 at 8:52 AM Max Filippov <jcmvbkbc@gmail.com> wrote=
:
> > >
> > > Move remaining non-HELPER functions from op_helper.c to helper.c.
> > > No functional changes.
> > >
> > > Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> > > ---
> > >  target/xtensa/helper.c    | 61 +++++++++++++++++++++++++++++++++++++=
+++++++---
> > >  target/xtensa/op_helper.c | 56 -------------------------------------=
------
> > >  2 files changed, 58 insertions(+), 59 deletions(-)
> >
> > > +void xtensa_cpu_do_unaligned_access(CPUState *cs,
> > > +                                    vaddr addr, MMUAccessType access=
_type,
> > > +                                    int mmu_idx, uintptr_t retaddr)
> > > +{
> > > +    XtensaCPU *cpu =3D XTENSA_CPU(cs);
> > > +    CPUXtensaState *env =3D &cpu->env;
> > > +
> > > +    if (xtensa_option_enabled(env->config, XTENSA_OPTION_UNALIGNED_E=
XCEPTION) &&
> > > +        !xtensa_option_enabled(env->config, XTENSA_OPTION_HW_ALIGNME=
NT)) {
> >
> > I know this is a simple code movement, but I wonder, what should
> > happen when there is
> > an unaligned fault and the options are disabled? Is this an impossible
> > case (unreachable)?
>
> It should be unreachable when XTENSA_OPTION_UNALIGNED_EXCEPTION
> is disabled. In that case the translation code generates access on aligne=
d
> addresses according to the xtensa ISA, see the function
> gen_load_store_alignment in target/xtensa/translate.c

There's also a case when both options are enabled, i.e. the
xtensa core has support for transparent unaligned access.
In that case the helper does nothing and the generic TCG
code is supposed to deal with the unaligned access correctly,

--=20
Thanks.
-- Max

