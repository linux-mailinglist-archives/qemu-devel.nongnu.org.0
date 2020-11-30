Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB6E2C91E4
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 00:03:37 +0100 (CET)
Received: from localhost ([::1]:56912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjsCl-00023r-OL
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 18:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kjsBE-0001Un-64
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 18:02:00 -0500
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:36970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kjsBA-0003Nx-S9
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 18:01:59 -0500
Received: by mail-il1-x12e.google.com with SMTP id k8so13005146ilr.4
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 15:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LVLH7WVWSJh2Ra6fvtz4N58jOWURYF45fblu11EBIXA=;
 b=bX/Zj5Ks15X+ZF2EcdeK8vOlNTGddAo9v+twVOpH0aj7On/cbrDCvKNed2emPegQ5j
 dK4EJjMxD1ZO4tJ+cNcAc4MhqfwdUOExU9ixiMV1Rudl0wlIOrD6YkPewPcPNVmFljtv
 pHPBq3/rDNBz+VKTGwlMeudu3wstDOklP/dK22Xxqwdo7yAZCwUCc2cNCe1eFFQJWI1l
 qk7WfJVbVRxIXGmvslF44souQfJpWie4QhX6MtO3SxrW+6qTc3t0KnsHrpjO9n3vpLoj
 o2G9oXpdQczg12ddh8fzyqxpC9MAYGAFkiu9Yj0rawGS8rEYSsCmcr1q5Ai3ISW/mHjm
 4ioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LVLH7WVWSJh2Ra6fvtz4N58jOWURYF45fblu11EBIXA=;
 b=GZiLlqVCIK8uR9dL3Y/Rp7af5dwwebG7sAi7IBYEBi846AyoSbuqZLfhaxBzKsFeoq
 +uLxjqpeNa0b5mgEvl9o0ZH2RV7+co3SoyoWM3ePc8aAECnqwomBq5pUJspOmzzEAPCG
 rsFET96yROQ1XdutA76lK+PNXkOLKS+JYZf7fZvyDz5o4FmqcOZzloMe79ISOQ++QLr/
 KkblwkHh+y0jtYPiGkGDt0oTTwqrLnN5++nlUp//LCQhc4mJzYe4arKe2zGcGsmdE6d/
 A9BXOk0Vi4bMoYmHkNDZ0Wyy6R8EO9Vs8R6/pB49GDq3oanL35xWO8PzfDPrhSiin9pM
 /pnQ==
X-Gm-Message-State: AOAM530AS0D7S6t9NkUGyG/8f4HJR+O2e+oaOSVXtRUz1EKw9fWdc3yF
 fvjNBMhwaLMfvnXYm70ZO6Dw+PJV9MneCLAIKeQ/2w==
X-Google-Smtp-Source: ABdhPJyVExpM4XEizH7PY0EFjAc+yxJJu6yeBCHsOaYZcGA1SvNGUuYVeAHo9EodmA+uMzo2W//QzwavHMV0YoHSNNY=
X-Received: by 2002:a92:9904:: with SMTP id p4mr20966512ili.145.1606777315256; 
 Mon, 30 Nov 2020 15:01:55 -0800 (PST)
MIME-Version: 1.0
References: <20201126215017.41156-1-agraf@csgraf.de>
 <20201126215017.41156-3-agraf@csgraf.de>
 <20201127200054.GC56950@SPB-NB-133.local>
 <392c2465-157e-e15a-0a2c-2e3faa166d22@csgraf.de>
 <CAEkmjvUArgL+Mcvy6nUhfJrdX3OaF=U8UdWia7ZDo9GWk0VF=g@mail.gmail.com>
 <CAEkmjvVJ5zup4NR2+DStt_NvV2cV7+7dj2=fJ3DQBkth8pAfcw@mail.gmail.com>
 <cecd20d0-278b-0a4b-ba9c-0207504c99d7@csgraf.de>
 <CAEkmjvVOAYP6wJyVpAtZE3d=iNOOWGZeHptQ9xJDGcTi4qQ0hQ@mail.gmail.com>
 <CAMn1gO7jqjsqJHtSaV7F+2qmtfF-YFDJwo=O8ot2iem+Uz4Zrw@mail.gmail.com>
 <6975b4a3-1568-df40-8594-bfcf488ac425@csgraf.de>
In-Reply-To: <6975b4a3-1568-df40-8594-bfcf488ac425@csgraf.de>
From: Peter Collingbourne <pcc@google.com>
Date: Mon, 30 Nov 2020 15:01:44 -0800
Message-ID: <CAMn1gO5xs8RniRYm+Gnbh8S3GVah2+2Ew2V6tFL6PNuSJ7o5Hw@mail.gmail.com>
Subject: Re: [PATCH 2/8] hvf: Move common code out
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=pcc@google.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 30, 2020 at 1:40 PM Alexander Graf <agraf@csgraf.de> wrote:
>
> Hi Peter,
>
> On 30.11.20 22:08, Peter Collingbourne wrote:
> > On Mon, Nov 30, 2020 at 12:56 PM Frank Yang <lfy@google.com> wrote:
> >>
> >>
> >> On Mon, Nov 30, 2020 at 12:34 PM Alexander Graf <agraf@csgraf.de> wrot=
e:
> >>> Hi Frank,
> >>>
> >>> Thanks for the update :). Your previous email nudged me into the righ=
t direction. I previously had implemented WFI through the internal timer fr=
amework which performed way worse.
> >> Cool, glad it's helping. Also, Peter found out that the main thing kee=
ping us from just using cntpct_el0 on the host directly and compare with cv=
al is that if we sleep, cval is going to be much < cntpct_el0 by the sleep =
time. If we can get either the architecture or macos to read out the sleep =
time then we might be able to not have to use a poll interval either!
> >>> Along the way, I stumbled over a few issues though. For starters, the=
 signal mask for SIG_IPI was not set correctly, so while pselect() would ex=
it, the signal would never get delivered to the thread! For a fix, check ou=
t
> >>>
> >>>    https://patchew.org/QEMU/20201130030723.78326-1-agraf@csgraf.de/20=
201130030723.78326-4-agraf@csgraf.de/
> >>>
> >> Thanks, we'll take a look :)
> >>
> >>> Please also have a look at my latest stab at WFI emulation. It doesn'=
t handle WFE (that's only relevant in overcommitted scenarios). But it does=
 handle WFI and even does something similar to hlt polling, albeit not with=
 an adaptive threshold.
> > Sorry I'm not subscribed to qemu-devel (I'll subscribe in a bit) so
> > I'll reply to your patch here. You have:
> >
> > +                    /* Set cpu->hvf->sleeping so that we get a
> > SIG_IPI signal. */
> > +                    cpu->hvf->sleeping =3D true;
> > +                    smp_mb();
> > +
> > +                    /* Bail out if we received an IRQ meanwhile */
> > +                    if (cpu->thread_kicked || (cpu->interrupt_request =
&
> > +                        (CPU_INTERRUPT_HARD | CPU_INTERRUPT_FIQ))) {
> > +                        cpu->hvf->sleeping =3D false;
> > +                        break;
> > +                    }
> > +
> > +                    /* nanosleep returns on signal, so we wake up on k=
ick. */
> > +                    nanosleep(ts, NULL);
> >
> > and then send the signal conditional on whether sleeping is true, but
> > I think this is racy. If the signal is sent after sleeping is set to
> > true but before entering nanosleep then I think it will be ignored and
> > we will miss the wakeup. That's why in my implementation I block IPI
> > on the CPU thread at startup and then use pselect to atomically
> > unblock and begin sleeping. The signal is sent unconditionally so
> > there's no need to worry about races between actually sleeping and the
> > "we think we're sleeping" state. It may lead to an extra wakeup but
> > that's better than missing it entirely.
>
>
> Thanks a bunch for the comment! So the trick I was using here is to
> modify the timespec from the kick function before sending the IPI
> signal. That way, we know that either we are inside the sleep (where the
> signal wakes it up) or we are outside the sleep (where timespec=3D{} will
> make it return immediately).
>
> The only race I can think of is if nanosleep does calculations based on
> the timespec and we happen to send the signal right there and then.

Yes that's the race I was thinking of. Admittedly it's a small window
but it's theoretically possible and part of the reason why pselect was
created.

> The problem with blocking IPIs is basically what Frank was describing
> earlier: How do you unset the IPI signal pending status? If the signal
> is never delivered, how can pselect differentiate "signal from last time
> is still pending" from "new signal because I got an IPI"?

In this case we would take the additional wakeup which should be
harmless since we will take the WFx exit again and put us in the
correct state. But that's a lot better than busy looping.

I reckon that you could improve things a little by unblocking the
signal and then reblocking it before unlocking iothread (e.g. with a
pselect with zero time interval), which would flush any pending
signals. Since any such signal would correspond to a signal from last
time (because we still have the iothread lock) we know that any future
signals should correspond to new IPIs.

Peter

