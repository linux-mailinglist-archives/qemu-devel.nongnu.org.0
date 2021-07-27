Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A703D7D17
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 20:08:44 +0200 (CEST)
Received: from localhost ([::1]:60770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8RVS-0002vk-Vv
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 14:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1m8RUC-00028B-VE
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 14:07:25 -0400
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a]:36373)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1m8RUB-00017x-Ba
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 14:07:24 -0400
Received: by mail-vs1-xe2a.google.com with SMTP id o12so7644846vst.3
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 11:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=evV/+zfh10OvbCoeNSu7Wm/Bx8fBcTqzIZUh4ZbCbzw=;
 b=WumxpoRjqSBpjXZK9Oaqq1NFygulJPmzdeZnvf9cH12sCjBYCH1zNYsNFqYEoMz+xM
 xV6h1T5xWxL/zFTxVZmbm0vgYKxXa4F9f4H+n4fJIO8/3ZmMxmOLyPoUOkNDctQXkNvr
 xOfmNjA5VlI0vM5GgmhujMbMto34M/qXgzlyns31NzVBIG4OwkAvCNA9egCYCk3oyxaL
 US7KWjTMnOcOpm9KqeseL22+kA+CseRomLpgQAW9QRIhvBzwrs463NDRaQEwQ+Gj7uef
 40H++JANMYGT338PuRWiNuZ6pEVTG9ZdHqgyUaiHlRt9Hisj1KHqF7l/sDFkd2IAQIpj
 H9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=evV/+zfh10OvbCoeNSu7Wm/Bx8fBcTqzIZUh4ZbCbzw=;
 b=JUEdo5Z1B00qO9Oqxbw5odfEPwwQWmqx4EvVsrYM3WosZY5FX+u5jYIU7sz8vr/JPQ
 PdnYdBoET+UrDL0n7QMMc2Qx0suIMhHEBTQ2hr6xMXiTfNKaY7PcERxJHYibUBUyo8hW
 nqTTSUif4zgcY9g3I5RW4qIVj8FR5aRVNqs8DathaCSI3dT0exvz6TN9qDOYRyRIR1LS
 vAXBJVzqEwbysLzEyD0XrpaLzjBrm04Ap4e0enaOcX/Ca/6mwiRJANXQK7mSb0Rwl9Kl
 UpGlV7B9n2/e9LiEJKzShwR7FfZe304caFcTUAraSLu07wWmrGTFCfpHJ6cC13Vg88r4
 kbzg==
X-Gm-Message-State: AOAM533NtkDzh1pUQFNabfUfi6voH12ZUvfWuARNPV/vwvVTk6y9etHy
 D5NnFlTcuCAeeHGrO56O5k568bl6wWvyWOnwOewd1w==
X-Google-Smtp-Source: ABdhPJxLA2i2neC8cdlaNXnDmJ1lITpb2XC4tAhuq3xd29xroyqcQjQltgpDcbTH00/4i6rKhAxykVIaSlbtwBNVEn8=
X-Received: by 2002:a05:6102:390e:: with SMTP id
 e14mr17575165vsu.9.1627409241272; 
 Tue, 27 Jul 2021 11:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-17-peter.maydell@linaro.org>
 <d1811f65-b08e-57c6-d0a7-5c498f8eb3ff@amsat.org>
 <CAGcCb13FAMS6q0jPfc4uJS+03HtO1OO7z3c5UQ_41=rUiBPSKg@mail.gmail.com>
 <CAFEAcA_wrBcdeNVJVOfCYR2E-zoUsKFnGocF18xvN=S5d=iY0g@mail.gmail.com>
In-Reply-To: <CAFEAcA_wrBcdeNVJVOfCYR2E-zoUsKFnGocF18xvN=S5d=iY0g@mail.gmail.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Tue, 27 Jul 2021 11:07:09 -0700
Message-ID: <CAFQmdRYqb9GPi=Ng8LtJAHR8rbJxaCP9yCxyugkwU6MEebh0jg@mail.gmail.com>
Subject: Re: [PULL 16/21] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Hao Wu <wuhaotsh@google.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Tyrone Ting <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2a;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe2a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Tue, Jul 27, 2021 at 7:19 AM Peter Maydell <peter.maydell@linaro.org> wr=
ote:
>
> On Thu, 4 Feb 2021 at 22:38, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > I don't see this error. It could be some error in the clock that the ti=
mer module does not get a correct clock input.
> > How do you reproduce this?
> >
> > On Thu, Feb 4, 2021 at 1:39 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >>
> >> Hi,
> >>
> >> On Tue, Jan 12, 2021 at 6:20 PM Peter Maydell <peter.maydell@linaro.or=
g>
> >> wrote:
> >> >
> >> > From: Hao Wu <wuhaotsh@google.com>
> >> >
> >> > This patch makes NPCM7XX Timer to use a the timer clock generated by=
 the
> >> > CLK module instead of the magic number TIMER_REF_HZ.
> >> >
> >> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> >> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> >> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> >> > Message-id: 20210108190945.949196-3-wuhaotsh@google.com
> >> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> >> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >> > ---
> >> >  include/hw/misc/npcm7xx_clk.h    |  6 -----
> >> >  include/hw/timer/npcm7xx_timer.h |  1 +
> >> >  hw/arm/npcm7xx.c                 |  5 ++++
> >> >  hw/timer/npcm7xx_timer.c         | 39 +++++++++++++++--------------=
---
> >> >  4 files changed, 24 insertions(+), 27 deletions(-)
> >>
> >> Is that a spurious error (building with Clang)?
> >>
> >> Running test qtest-arm/npcm7xx_timer-test
> >> ERROR:../tests/qtest/npcm7xx_timer-test.c:475:test_periodic_interrupt:
> >> assertion failed (tim_read(td, TISR) =3D=3D tim_timer_bit(td)): (0x000=
00000
> >> =3D=3D 0x00000004)
> >> ERROR:../tests/qtest/npcm7xx_timer-test.c:476:test_periodic_interrupt:
> >> 'qtest_get_irq(global_qtest, tim_timer_irq(td))' should be TRUE
> >> FAIL 155 qtest-arm/npcm7xx_timer-test
> >> /arm/npcm7xx_timer/tim[2]/timer[2]/periodic_interrupt
> >> make: *** [Makefile.mtest:1033: run-test-127] Error 1
>
> This intermittent is still with us:
>
> /arm/npcm7xx_timer/tim[2]/timer[0]/periodic_interrupt: **
> ERROR:../../tests/qtest/npcm7xx_timer-test.c:475:test_periodic_interrupt:
> assertion failed (tim_read(td, TISR) =3D=3D tim_timer_bit(td)):
> (0x00000000 =3D=3D 0x00000001)
> **
> ERROR:../../tests/qtest/npcm7xx_timer-test.c:476:test_periodic_interrupt:
> 'qtest_get_irq(global_qtest, tim_timer_irq(td))' should be TRUE
> FAIL

It looks like the interrupt fires consistently with the status bit. It
also only happens once during that loop of four timer periods (the
test calls g_test_set_nonfatal_assertions() so we would have seen more
failures reported if this wasn't the case).

I'm wondering if the clock_step_next() call is occasionally hitting a
different timer, causing it to return before it has advanced to the
next period of the timer module? If so, it might help to use
clock_step(tim_calculate_step(...)) like some of the other tests do.
This would also verify that the timer is actually firing at the right
interval.

Havard

