Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241976753A0
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 12:47:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIpqH-0001e7-V4; Fri, 20 Jan 2023 06:45:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIpq8-0001dS-D8
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 06:45:48 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pIpq6-0007qY-ET
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 06:45:47 -0500
Received: by mail-pl1-x630.google.com with SMTP id z20so3119991plc.2
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 03:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Xrtw3NtuYOYrvQr8YBUKSsPnSfLWqZ1Mx6NbsQQQjkk=;
 b=FTMGzoT0FZYM6bjr5HAV3Xus24BTzw2pWvsoXvEJdtNCG1xaQRUHMxexOvuIp9lvYF
 BHtzX/u3ClElAIR1b9xb8FIldei4zkBmIs2aYXM69XFAmAyGAbZ8obKYZ1IkSd6IaYfZ
 MTpxN1bRyAeTv8XB7Q6+AoW5hj9WV/qaxhbG5l+dgQThooCpXKl1+WE6enrYEylUvXHQ
 LBDQLazMSUyJFSyD1vMv2MfhQzGqlDv6eL/6BUCNRTp5C3uTjV7AvrXsEeOmU7ghmx01
 1+MymMXTNOgM1bJWidYToclorGnkBUyzew3Clig+gKUldVXfDOnyOs9QhDF9plYfxFYU
 Anqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xrtw3NtuYOYrvQr8YBUKSsPnSfLWqZ1Mx6NbsQQQjkk=;
 b=g8ugm97I1shOwFYaurrIxD6IdYlvQhrJc/JM19oE3TaD+kg+TJNV/ZY7scvvJYYNeP
 XKdPQzummAqCbnZnTWaFT/jAS92kVM8VHPKUuSMOOrqT7tJ0PwNicY0cV1sCS0eSKRSk
 LsoBE20XIGMn4GUHU8/yVBwinvXgT+7U943mVs6DQrQvLB2p6CIp16q/C31mPXYskGr+
 vLVbV4E6HDe/YPZg3EkHA0e/syMt3B/smcAbqmudCdbAJZqm6oqfcxSxY7l5Sjhj/8Nr
 Ibb301vMgbqzczMKMS2u2FMPyb+bPwg4yuYTVCw4ExSJxPO+w4IWOWNBjLYl++0PnwoS
 YPVQ==
X-Gm-Message-State: AFqh2krveCQfj4z6SBxgMo3XQFtbQk0YvJJUm6ftyLJbOEb9iiFly9tZ
 p3WoVYloTyuhhQnAByl+iV17k7CSKXjQRlYRpBo+Vw==
X-Google-Smtp-Source: AMrXdXtF1+nRqR1bh0xq7WjnTxwMYYui/ceJ4AdppM72frAYBZrB7WXTGVkYLquCmsB3Ko1p6jFdEP9hDP3ALYb+ghQ=
X-Received: by 2002:a17:90a:53e4:b0:22b:b025:38ed with SMTP id
 y91-20020a17090a53e400b0022bb02538edmr188142pjh.19.1674215143857; Fri, 20 Jan
 2023 03:45:43 -0800 (PST)
MIME-Version: 1.0
References: <20230117220523.20911-1-eiakovlev@linux.microsoft.com>
 <20230117220523.20911-3-eiakovlev@linux.microsoft.com>
 <CAFEAcA-0sUwRy_cME7TtrcV_oh9CEkRr1P2W6BC+=uscAyt+8Q@mail.gmail.com>
 <b139bb17-4a1e-b393-d06f-67adc3310f46@linux.microsoft.com>
In-Reply-To: <b139bb17-4a1e-b393-d06f-67adc3310f46@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jan 2023 11:45:32 +0000
Message-ID: <CAFEAcA-4ZAcJ9noAM=zPWDunFXcq_gwwG50D1ro=8+HunZFunA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] hw/char/pl011: implement a reset method
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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

On Thu, 19 Jan 2023 at 21:57, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
>
> On 1/19/2023 14:27, Peter Maydell wrote:
> > On Tue, 17 Jan 2023 at 22:05, Evgeny Iakovlev
> > <eiakovlev@linux.microsoft.com> wrote:
> >> PL011 currently lacks a reset method. Implement it.
> >>
> >> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> >> ---
> >>   hw/char/pl011.c | 31 ++++++++++++++++++++++++++-----
> >>   1 file changed, 26 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> >> index 329cc6926d..404d52a3b8 100644
> >> --- a/hw/char/pl011.c
> >> +++ b/hw/char/pl011.c
> >> @@ -397,11 +397,6 @@ static void pl011_init(Object *obj)
> >>       s->clk = qdev_init_clock_in(DEVICE(obj), "clk", pl011_clock_update, s,
> >>                                   ClockUpdate);
> >>
> >> -    s->read_trigger = 1;
> >> -    s->ifl = 0x12;
> >> -    s->cr = 0x300;
> >> -    s->flags = 0x90;
> >> -
> >>       s->id = pl011_id_arm;
> >>   }
> >>
> >> @@ -413,11 +408,37 @@ static void pl011_realize(DeviceState *dev, Error **errp)
> >>                                pl011_event, NULL, s, NULL, true);
> >>   }
> >>
> >> +static void pl011_reset(DeviceState *dev)
> >> +{
> >> +    PL011State *s = PL011(dev);
> >> +    int i;
> >> +
> >> +    s->lcr = 0;
> >> +    s->rsr = 0;
> >> +    s->dmacr = 0;
> >> +    s->int_enabled = 0;
> >> +    s->int_level = 0;
> >> +    s->ilpr = 0;
> >> +    s->ibrd = 0;
> >> +    s->fbrd = 0;
> >> +    s->read_pos = 0;
> >> +    s->read_count = 0;
> >> +    s->read_trigger = 1;
> >> +    s->ifl = 0x12;
> >> +    s->cr = 0x300;
> >> +    s->flags = 0x90;
> >> +
> >> +    for (i = 0; i < ARRAY_SIZE(s->irq); i++) {
> >> +        qemu_irq_lower(s->irq[i]);
> >> +    }
> > Reset should never touch outbound qemu_irq lines.
> > (The other end of the line will also reset and will end
> > up in the correct "as if the input is 0" state.)
>
>
> Really? I saw this reset happening on other devices in hw/char (don't
> remember which ones specifically), so i though it is needed.

A few devices mess with their IRQ line in a reset handler;
this is a bug but usually one you can get away with. Some
devices use the newer "three phase reset" approach which
does allow you to change IRQ line state in the 'hold' phase.
But generally the standard is not to touch the IRQ line if
its reset state would be 'low'. You only need to do odd
things for the rare case where an IRQ line is supposed to
be taken high on reset.

(The reason for the "no touching IRQs in reset" rule is that
there's no ordering on device reset, so if you raise an
IRQ line in your reset handler, you don't know if the
device on the other end has already reset and thus will
correctly deal with the 0->1 transition it sees, or if
it has not yet reset and is about to undo the effects of
that 0->1 transition. 3-phase reset lets devices split
their reset handling up, so you know that if you do something
with an IRQ line in the 'hold' phase that the device you're
talking to has definitely already done its 'enter' phase.
Though 3-phase reset is pretty new, so a lot of devices
don't use it yet, and I have a fairly strong suspicion
that there are still some issues with the design that we
will need to iron out as we make more use of it.)

thanks
-- PMM

