Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D01D320C6A
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 19:09:12 +0100 (CET)
Received: from localhost ([::1]:48862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDtAN-0008Ng-3Y
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 13:09:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDt8T-0007iX-Av; Sun, 21 Feb 2021 13:07:13 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:34835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDt8Q-0006pL-RX; Sun, 21 Feb 2021 13:07:13 -0500
Received: by mail-wm1-x32b.google.com with SMTP id n10so12376639wmq.0;
 Sun, 21 Feb 2021 10:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Gcg80TfxzKTqkIGF62wHhQ7iUTIekqQbi0dt5k1Oh0=;
 b=gCOqBFXdQLuwfZmClfclEOcTJp74jWUkEOVA1z0GMBv8enYHoFI9l4nsiiXA1q+yVb
 2mU5/jC7LkpRq5jvbztkGCvELgYutR/wa9FAM6DeVD4z+VJqWeCzfTdS2FaNsDaotHS6
 WuZ48KYZ8347be2j712YLrrGBfrqzU+dXKJE3sepsfsQ+YbYuUgYoJYFP1XAJlJeH1yf
 YS6xLRj0vQeTfVcL1a35P1/fXIwW1NYvbRE3XuVBODoTnL0WcPPhV6qI59Kb2gffR3Zd
 njlxQsV3K5YgeY0UsU4yjqZLSCIeOlDZwoXJz+fkekWolS0FF4FOfwnDYsBdeNb2UPsw
 K86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Gcg80TfxzKTqkIGF62wHhQ7iUTIekqQbi0dt5k1Oh0=;
 b=fu9wMXUeOX2V4WWzpxlNTrE7Z17zbBMfQ1CreFAkiSoWZUdLbtpwBKR/wqvzzRydRu
 3LOuac2BMXWPmi+TgXGNd3SFMOSt5HCq/XWAOLG4dGDt3u+obQDoyjqIov/Xx1XMeFnm
 LgwBhayVJ2VQaTRFSuWZ2VlUxFpgd0b40Q+eoMoE5uBeTrDC8wSrCglV3BkSqQlmHjap
 okKPWQka/jV3q+CA31GX5diFv7kGzRNiDhygnichozwHAhuRboGMm6Hq+0P5QXg0jYGf
 p1mPa0mAUEcID4yyGf4l+xk8bo9EzOUKanPI/i41YjkzAoSBARExL6UPmn8qPETvr1Zl
 qyhg==
X-Gm-Message-State: AOAM532KV5PzR7DSKOGUFDxNXy2kvsHk56n24HvAzn/UEuyfRQmSPkgk
 WsY29EPzWV+fWuK0+NdxOY4=
X-Google-Smtp-Source: ABdhPJzTHZLkHrjED2SD2gArt6g9U/vBTNkq4GP/L7Af2Mq4yhY7vIVEmBuLPQyv2WcZsIOKAk8AZg==
X-Received: by 2002:a1c:c90c:: with SMTP id f12mr17203565wmb.98.1613930828428; 
 Sun, 21 Feb 2021 10:07:08 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j2sm2611674wrt.81.2021.02.21.10.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 10:07:07 -0800 (PST)
Subject: Re: [PATCH 1/4] hw/sh4/Kconfig: Rename CONFIG_SH4 ->
 CONFIG_SH4_DEVICES
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210208135048.2601693-1-f4bug@amsat.org>
 <20210208135048.2601693-2-f4bug@amsat.org>
 <CAFEAcA-CYk2XpngH_r3adYmb2t=39wfJA0pae8jmcOPCgofOvw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <56febf1b-db70-d934-615d-88a9ff0cdaaf@amsat.org>
Date: Sun, 21 Feb 2021 19:07:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-CYk2XpngH_r3adYmb2t=39wfJA0pae8jmcOPCgofOvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Michael Walle <michael@walle.cc>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 9:22 PM, Peter Maydell wrote:
> On Mon, 8 Feb 2021 at 20:04, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> We want to be able to use the 'SH4' config for architecture
>> specific features. As CONFIG_SH4 is only used to select
>> peripherals, rename it CONFIG_SH4_DEVICES.
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/block/meson.build | 2 +-
>>  hw/char/meson.build  | 2 +-
>>  hw/intc/meson.build  | 2 +-
>>  hw/sh4/Kconfig       | 6 +++---
>>  hw/timer/meson.build | 2 +-
>>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> We could if we wished be more fine-grained about this, eg by
> adding new CONFIG options for each device:
>  CONFIG_TC58128
>  CONFIG_SH_SERIAL
>  CONFIG_SH_INTC
>  CONFIG_SH_TIMER
>  CONFIG_SH_PCI
> 
> and then in hw/sh4/Kconfig
>  * config SH7750:
>    add 'select SH_SERIAL', 'select SH_INTC', 'select SH_TIMER'
>  * config R2D:
>    add 'select SH7750' (it's a pre-existing bug that it doesn't, since
>    r2d.c has a call to sh7750_init(). Harmless at the moment because
>    nothing actually uses CONFIG_SH7750 -- hw/sh4/meson.build always
>    compiles sh7750.c and sh7750_regnames.c unconditionally...)
>    add 'select SH_PCI' (and make hw/sh4/meson.build build sh_pci.c
>    only if it is set...)
>  * config SHIX
>    add 'select TC58128'

OK.

> Do we have a general preference for how fine-grained we go with the
> Kconfig switches ? Looking at the arm code, in some cases we have
> a CONFIG_ for the SoC that uses 'select' to turn on a separate
> CONFIG_ for each device (the STM32 SoCs are done this way), and
> in some cases we just have the meson.build use the SoC's CONFIG_*
> to control whether we compile its devices (the Xilinx and Exynos4
> SoCs are done this way). When reviewing new code it would be helpful
> to know whether to suggest doing it one way or the other :-)

My view is:

- Use fine granularity with shared/reusable models, so if someone
  wants to build a QEMU for a single machine, it is possible (using
  --without-default-devices and a specific target config.mak).
  Example: STM32F205_SOC and STM32F405_SOC

- For some (family of) SoC, a single switch is acceptable. In
  particular when all models are implemented in the same source file.
  Example: ASPEED_SOC

- Do not look at hw/i386/Kconfig

I have an old branch where I was generating a .dot of the Kconfig tree
for easier visualization, fine granularity was helpful. I'll try to
update it.

Regards,

Phil.

