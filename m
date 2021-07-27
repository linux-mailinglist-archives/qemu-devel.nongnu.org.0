Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5F73D7860
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 16:21:18 +0200 (CEST)
Received: from localhost ([::1]:43592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8NxL-0002CN-S1
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 10:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Nw9-0000y8-SU
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:20:02 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Nw8-00073X-6Q
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 10:20:01 -0400
Received: by mail-ej1-x634.google.com with SMTP id go31so8571174ejc.6
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 07:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OZeq+DfmekumnV/hqmfKborL7HvYRT/6rRrTncCqLb0=;
 b=rFeSoZQrl38hWsJnTl+Ts69SyjYBLwr1UaGlZoMlPCmPYxgCzjvdy/dZvL5V6acp2/
 o1HasPPXl/cw1fCUR5kAcIAnFwFAYCmiPhfgvwiqY8QD1qrRx6jClUynxxZTYIRjjVJI
 rjRugZ9NMzAamrS40VDalnxoDsd6rzB7xih3yK6XlSW0BcqXJBIhePY5m8XesSVCkWeB
 EFilLnFnr5Koa+1WpeCOqhoW0P4VKcA4/Ii+g2QfvrIN444ajqr9cl80t83iRI3jLtP+
 cBDB+ftCKyb4TlTB5QVvrGshgV8J5TbB+7vlF75gy1vBQOcFJLxAyL8cGHijuHupvU/e
 iEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OZeq+DfmekumnV/hqmfKborL7HvYRT/6rRrTncCqLb0=;
 b=JjCXTuXRHq+GsVz8HY+HC4j/fompJM2/PM4Kkw0XChP8DJK3ReJtrowLVAWVS/X8lr
 kS3LGwWNIr1L6pgcFXJdmnO9obrJRxcg2wOtFmZ/82G0gSNkEX2NKKnycc9XN4L6jj8s
 2rxWHoPPsuyXZhJ9puuCmawNRZapGBpFbF97GvBwqHAKLGiNsPRXglrG4H/drSryFRA7
 rGQOgykwk0/BvmONT5YE+ED3QDAhk211roQiYp1O9Vfytb+EoSSiGuJOWquyZOIHakkk
 8EOYk5TtK5+iH5D3D51Jtt80usn+kXarmmwueEmNlXJVUWN9uYjSikEXP1IVGVB/bSy+
 Ngng==
X-Gm-Message-State: AOAM5321lEJiPTZ+7eWtEW05W/doccPqOrA+U0BXRIYPnfnlmpjCVxSx
 EFcjRG+Td4TXk80DQQfPFs0b6NuTq/ax6L4f25uw4w==
X-Google-Smtp-Source: ABdhPJwJQDuUlKuLM7jJi506HiKUNTvEyA5zCmuVcugnw5Fwmp1Qn2/lBqp5OiufvueXKKr5Bc0p3Ad94Sr2CfzahKo=
X-Received: by 2002:a17:907:364:: with SMTP id
 rs4mr3580425ejb.56.1627395598695; 
 Tue, 27 Jul 2021 07:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210112165750.30475-1-peter.maydell@linaro.org>
 <20210112165750.30475-17-peter.maydell@linaro.org>
 <d1811f65-b08e-57c6-d0a7-5c498f8eb3ff@amsat.org>
 <CAGcCb13FAMS6q0jPfc4uJS+03HtO1OO7z3c5UQ_41=rUiBPSKg@mail.gmail.com>
In-Reply-To: <CAGcCb13FAMS6q0jPfc4uJS+03HtO1OO7z3c5UQ_41=rUiBPSKg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jul 2021 15:19:16 +0100
Message-ID: <CAFEAcA_wrBcdeNVJVOfCYR2E-zoUsKFnGocF18xvN=S5d=iY0g@mail.gmail.com>
Subject: Re: [PULL 16/21] hw/timer: Refactor NPCM7XX Timer to use CLK clock
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Havard Skinnemoen <hskinnemoen@google.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Feb 2021 at 22:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> I don't see this error. It could be some error in the clock that the time=
r module does not get a correct clock input.
> How do you reproduce this?
>
> On Thu, Feb 4, 2021 at 1:39 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>>
>> Hi,
>>
>> On Tue, Jan 12, 2021 at 6:20 PM Peter Maydell <peter.maydell@linaro.org>
>> wrote:
>> >
>> > From: Hao Wu <wuhaotsh@google.com>
>> >
>> > This patch makes NPCM7XX Timer to use a the timer clock generated by t=
he
>> > CLK module instead of the magic number TIMER_REF_HZ.
>> >
>> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
>> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
>> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
>> > Message-id: 20210108190945.949196-3-wuhaotsh@google.com
>> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> > ---
>> >  include/hw/misc/npcm7xx_clk.h    |  6 -----
>> >  include/hw/timer/npcm7xx_timer.h |  1 +
>> >  hw/arm/npcm7xx.c                 |  5 ++++
>> >  hw/timer/npcm7xx_timer.c         | 39 +++++++++++++++----------------=
-
>> >  4 files changed, 24 insertions(+), 27 deletions(-)
>>
>> Is that a spurious error (building with Clang)?
>>
>> Running test qtest-arm/npcm7xx_timer-test
>> ERROR:../tests/qtest/npcm7xx_timer-test.c:475:test_periodic_interrupt:
>> assertion failed (tim_read(td, TISR) =3D=3D tim_timer_bit(td)): (0x00000=
000
>> =3D=3D 0x00000004)
>> ERROR:../tests/qtest/npcm7xx_timer-test.c:476:test_periodic_interrupt:
>> 'qtest_get_irq(global_qtest, tim_timer_irq(td))' should be TRUE
>> FAIL 155 qtest-arm/npcm7xx_timer-test
>> /arm/npcm7xx_timer/tim[2]/timer[2]/periodic_interrupt
>> make: *** [Makefile.mtest:1033: run-test-127] Error 1

This intermittent is still with us:

/arm/npcm7xx_timer/tim[2]/timer[0]/periodic_interrupt: **
ERROR:../../tests/qtest/npcm7xx_timer-test.c:475:test_periodic_interrupt:
assertion failed (tim_read(td, TISR) =3D=3D tim_timer_bit(td)):
(0x00000000 =3D=3D 0x00000001)
**
ERROR:../../tests/qtest/npcm7xx_timer-test.c:476:test_periodic_interrupt:
'qtest_get_irq(global_qtest, tim_timer_irq(td))' should be TRUE
FAIL

I was able to reproduce it by running the test in a tight loop:

while QTEST_QEMU_BINARY=3D./build/x86/qemu-system-arm
./build/x86/tests/qtest/npcm7xx_timer-test ; do true ;done

and eventually it hit the assert.

-- PMM

