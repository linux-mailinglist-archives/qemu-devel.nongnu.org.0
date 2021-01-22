Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB74300F11
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 22:43:00 +0100 (CET)
Received: from localhost ([::1]:59602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l34Cp-0004rO-0E
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 16:42:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l34BS-00040c-KL
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:41:34 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:36309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l34BQ-0002XU-P5
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 16:41:34 -0500
Received: by mail-ed1-x534.google.com with SMTP id d2so4634728edz.3
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 13:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k3+Jjj4R0BZKvlqNRp/LxEgdbmXofi2HFjYd51zTn08=;
 b=ZQykBdKmfo/lHdEUgnxJ24MpZhJiLCblZXkgyo7HyZCa0Jw8wOpcA2HX13WjJJLODV
 RzHzojs3Mw4YNDkMrsBkPX6jRgyXNAyrNJ30Zm4/Rl78AT2GuKf+Y1TuRWasQDcgyp/b
 f4CkPUVD51yiMnqWxZj6ixFGqxRzaozzHAYsHxv6pfnkMkzVxPa7ZVaSvX4IUlXkQQWf
 zdn+WJnc5gnHcZHV4kVzjbDPhi/kevEV8iUAp0UERO7v2PyKxoehuo1C4KqYXf0q4MEM
 VjudsxMTCWR6sDugSZttpoj7i1+bhjnqw0nyQSELo3UICq5+1Je1Z64KBeUoAeW3iavA
 YlHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k3+Jjj4R0BZKvlqNRp/LxEgdbmXofi2HFjYd51zTn08=;
 b=ZVGNTi7JCK0uRMM/ACu7RwByV7peZwYe++A880AEg8We9UR/avDfORvY7ZpdBMN/Bz
 rnac/vGK6GFWUAtSMRPq58gTc1VRU0BOBFrIIqfd4k2dRO8fT/nx2Toi6ZA6oKh1zSIm
 n5x/rNDPkGGhKcG6jWFXV9RAWvLIdu8KkKCgCfqX1oKeA56pnyKohMqVNgzeoMoHN8bx
 u3S6ojPj6pc+dF7YRML/NP7y68pUr95Qsa3bHW9JOqRn+rpYa3NANIDgDuAgSfRbF6pq
 QpvSD3n70Pe+73mDgz8wIEbDDJeXDYxZwWfr8t3jHswxsRrzDgCMQTZmCQdyd4KEIUIP
 fsLw==
X-Gm-Message-State: AOAM530dHPJJGK9RSQEJnOamN6//KPkFAsQqz4MxQg3YwjE7DZJuwvvQ
 Hc+OR6fb4q5OmakJ4Tyocc2yaXmiEqh8MAdhn0hT4Q==
X-Google-Smtp-Source: ABdhPJz3ajbQgFmxkUIJLX9/f/CrNEAmbLumcCAZB0BZcFcGlLmr01Rduv1YYJSK/gMDiZe3UIArZMu1Vk772YAdRAA=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr4711369edv.36.1611351689953; 
 Fri, 22 Jan 2021 13:41:29 -0800 (PST)
MIME-Version: 1.0
References: <20210121190622.22000-1-peter.maydell@linaro.org>
 <20210121190622.22000-20-peter.maydell@linaro.org>
 <20210122204910.xadaf4zutpbu4qp5@sekoia-pc.home.lmichel.fr>
In-Reply-To: <20210122204910.xadaf4zutpbu4qp5@sekoia-pc.home.lmichel.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 21:41:18 +0000
Message-ID: <CAFEAcA8adGg+i65an_2Pser8acSmgz4D1wvmidaKNpeOt6jJKw@mail.gmail.com>
Subject: Re: [PATCH 19/25] hw/timer/cmsdk-apb-dualtimer: Convert to use Clock
 input
To: Luc Michel <luc@lmichel.fr>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 22 Jan 2021 at 20:48, Luc Michel <luc@lmichel.fr> wrote:
>
> On 19:06 Thu 21 Jan     , Peter Maydell wrote:
> > Switch the CMSDK APB dualtimer device over to using its Clock input;
> > the pclk-frq property is now ignored.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/timer/cmsdk-apb-dualtimer.c | 42 ++++++++++++++++++++++++++++++----
> >  1 file changed, 37 insertions(+), 5 deletions(-)
> >
> > diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
> > index 781b496037b..828127b366f 100644
> > --- a/hw/timer/cmsdk-apb-dualtimer.c
> > +++ b/hw/timer/cmsdk-apb-dualtimer.c
> > @@ -106,6 +106,22 @@ static void cmsdk_apb_dualtimer_update(CMSDKAPBDualTimer *s)
> >      qemu_set_irq(s->timerintc, timintc);
> >  }
> >
> > +static int cmsdk_dualtimermod_divisor(CMSDKAPBDualTimerModule *m)
> > +{
> > +    /* Return the divisor set by the current CONTROL.PRESCALE value */
> > +    switch (FIELD_EX32(m->control, CONTROL, PRESCALE)) {
> > +    case 0:
> > +        return 1;
> > +    case 1:
> > +        return 16;
> > +    case 2:
> > +    case 3: /* UNDEFINED, we treat like 2 (and complained when it was set) */
> > +        return 256;
> > +    default:
> > +        g_assert_not_reached();
> > +    }
> > +}
> > +
> >  static void cmsdk_dualtimermod_write_control(CMSDKAPBDualTimerModule *m,
> >                                               uint32_t newctrl)
> >  {
> > @@ -146,7 +162,7 @@ static void cmsdk_dualtimermod_write_control(CMSDKAPBDualTimerModule *m,
> >          default:
> >              g_assert_not_reached();
> >          }
> > -        ptimer_set_freq(m->timer, m->parent->pclk_frq / divisor);
> > +        ptimer_set_period_from_clock(m->timer, m->parent->timclk, divisor);
>
> Just a small cosmetic note, maybe you can use your new
> cmsdk_dualtimermod_divisor function to factor out the switch above?
> Something like:
>
> if (changed & R_CONTROL_PRESCALE_MASK) {
>     if (FIELD_EX32(newctrl, CONTROL, PRESCALE) == 3) {
>         qemu_log_mask(LOG_GUEST_ERROR,
>                       "CMSDK APB dual-timer: CONTROL.PRESCALE==0b11"
>                       " is undefined behaviour\n");
>     }
>
>     ptimer_set_period_from_clock(m->timer, m->parent->timclk,
>                                  cmsdk_dualtimermod_divisor(m));
> }

Nope, because cmsdk_dualtimermod_divisor() uses the current
m->control value, and at this point in the code we need the
divisor from the new control value which isn't in m->control yet.
I liked the slight duplication better than either having to
pass m->control in in all the other callsites or trying to
refactor the control write handling so that m->control is
updated before this point in the code.

thanks
-- PMM

