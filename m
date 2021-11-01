Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EEE442008
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:28:56 +0100 (CET)
Received: from localhost ([::1]:49610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhc3C-00048u-Bv
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:28:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbBt-0006AR-Im
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:33:49 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:45590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhbBr-0002fe-7H
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:33:49 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id s186so22277831yba.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mNOnMb6zRoGFHmrcwv7GaRkCv9qiP7ZEe4AjNcesU1g=;
 b=fnbdV+PI0nh+rnDJkb+lJ0BK5OPJA25BzqW8kVHC9+nIJFwejoQhy/DfRhfNetfMSh
 C+CAN3qZMhJQW3pLacYABW7Kof0xB9A3XKXIS/0qzMlJHrbHVw2slzcAxz8vBo5206Wt
 5mo2ToqOXo+gZEGBecXyAkVJgo13094B0C5H40af5FXyNROLUCU9LSiMWUBNwq0QYvMI
 RLOS6R93dr2O8ZkYE/IzWPOjVHIk5SOHNiWtmR9QZa9TWIMGJ3J8sTB2ktu18eeHm6hQ
 2djpzpzEq292ymSzQAzhHpO1tXIc16uY4pMP3VDbaBlSM46GhXq1jFLtuxKesO2kRI6A
 WZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mNOnMb6zRoGFHmrcwv7GaRkCv9qiP7ZEe4AjNcesU1g=;
 b=0la28Ey2cSLXInAlvc2dECPzgE0oRmFImXhT0949XOap09eMt3HsyELZEAtgEY9GUZ
 +jYq80YKhCkorzr+BN84Ypb09uIL30Eako2vdYGXCFiUgzFrwGQd3s9PENvlXv9XMA9p
 BBiN4psQlwV5p8BX6tSy0zbDdffIQW0sHS1R2igdZL3JuNkgMFxRgOLt9Vb0XAv5b0La
 Yjxohf4BjxidKHoC9/kZm/YVANsno//Ek3M0bXkX1tPm17WrX/f9Yhxdemr7IJGwp9KT
 OXMmuhBmp0tz9OTgOF7R1OaZODvgD9odsNGoeR7ukiPdjv3WvN/KHD0nyMHPIfWUUD5O
 7wEw==
X-Gm-Message-State: AOAM533Q/IGSmfV2WvN8ix8gl3vNqY/zyv9mlDUeE3rC4fp3DE+eZYKQ
 eO6MEuUp142IHtpmk3aM+fvSPPJK3mRQ8LGT1FlaZg==
X-Google-Smtp-Source: ABdhPJyJ/XWfF+Ypn3FeLZSHHQybQw8MeLYJI//tqLgPZD94NSpr0o4hHOp1M7M7EVi1qMX9E+o/M1YsoVFO87j+/44=
X-Received: by 2002:a25:2391:: with SMTP id
 j139mr29318342ybj.382.1635788026157; 
 Mon, 01 Nov 2021 10:33:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210311180855.149764-1-wuhaotsh@google.com>
In-Reply-To: <20210311180855.149764-1-wuhaotsh@google.com>
From: Richard Henderson <richard.henderson@linaro.org>
Date: Mon, 1 Nov 2021 13:33:34 -0400
Message-ID: <CAFXwXrnm2yveebfyq0cPPZBAeW33_sVu0jrkpbNQNUDBRBFQUQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] hw/arm: Add NPCM7XX Tachometer Device
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, venture@google.com, hskinnemoen@google.com,
 qemu-devel@nongnu.org, kfting@nuvoton.com, qemu-arm@nongnu.org,
 Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 13:11, Hao Wu <wuhaotsh@google.com> wrote:
>
> This patch set implements the Tachometer (a.k.a Multi Functional Timer/MFT)
> device in NPCM7XX SoC. This device is used by NPCM7XX boards to measure
> the RPM of PWM fans.
>
> To provide the RPM of a certain fan, since RPM = MAX_RPM * duty_percentage.
> We convert the duty output in NPCM7XX PWM module into GPIOs and feed them
> into the MFT module.
>
> The connection of PWM modules and fan modules are derived from their specific
> Linux device trees and coded in hw/arm/npcm7xx_boards.c.
>
> We amend the QTest for the PWM module to include verifying the reading from
> the Tachometer is correct.
>
> Changes since v1:
> - Split implementation of device and addition to board file to separate patches
> - Adapt to new Clock API and address conflicts
> - Use the new clock_ns_to_ticks API to calculate tachometer counts
>
> Hao Wu (5):
>   hw/misc: Add GPIOs for duty in NPCM7xx PWM
>   hw/misc: Add NPCM7XX MFT Module
>   hw/arm: Add MFT device to NPCM7xx Soc
>   hw/arm: Connect PWM fans in NPCM7XX boards
>   tests/qtest: Test PWM fan RPM using MFT in PWM test
>
>  docs/system/arm/nuvoton.rst    |   2 +-
>  hw/arm/npcm7xx.c               |  45 ++-
>  hw/arm/npcm7xx_boards.c        |  99 ++++++
>  hw/misc/meson.build            |   1 +
>  hw/misc/npcm7xx_mft.c          | 540 +++++++++++++++++++++++++++++++++
>  hw/misc/npcm7xx_pwm.c          |   4 +
>  hw/misc/trace-events           |   8 +
>  include/hw/arm/npcm7xx.h       |  13 +-
>  include/hw/misc/npcm7xx_mft.h  |  70 +++++
>  include/hw/misc/npcm7xx_pwm.h  |   4 +-
>  tests/qtest/npcm7xx_pwm-test.c | 205 ++++++++++++-
>  11 files changed, 974 insertions(+), 17 deletions(-)
>  create mode 100644 hw/misc/npcm7xx_mft.c
>  create mode 100644 include/hw/misc/npcm7xx_mft.h

Thanks, queued to target-arm.next.

r~

