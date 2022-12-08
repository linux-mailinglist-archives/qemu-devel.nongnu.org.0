Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9678664762B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 20:26:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3MWM-0001sq-2M; Thu, 08 Dec 2022 14:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p3MVt-0001ro-Fj; Thu, 08 Dec 2022 14:24:58 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p3MVr-0000Zd-1t; Thu, 08 Dec 2022 14:24:56 -0500
Received: by mail-ej1-x62c.google.com with SMTP id m18so6362809eji.5;
 Thu, 08 Dec 2022 11:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=j7qS7tQtLyatYc46KzK/dPvzwPaD60+V1ALLeTswBEs=;
 b=n58yRU461UWucl89mnwHO4wXMmx6YJt8XRi5qEMKl7qmN5Ll0KFP8FNpts3Gu0PbNj
 eYrFdH6JnMeG4sqcjEGxraodNCmaoQF2caCP7nujdT5HEwR0aqYJ+rph0Pgc8tJnqdUx
 t4WNpckioXwf6AHWWmwAwOEl/UWFxJ5FsO2n+Sq3BGbhpK/Rxn9p8z1FfXHYtGDg99ZU
 4z2AQpy/NF96nokXywJxlSrt3Xz7ebohmAj/B6RHpvOWYRzhUrhXLN8sUefHhneceNbW
 fVU6+N7EpupPdbZG8FDJbPVnJQWa9Kj1xPMLELpWcokgBNGaEvpROFSpmBL4g7ZRD6bg
 zTrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j7qS7tQtLyatYc46KzK/dPvzwPaD60+V1ALLeTswBEs=;
 b=eQbvx8wx/8ezV6Grpbhag7dGyyfnhVppEVC7ujWOKMoMV1z5bN8q+oiHleHd1ScGCp
 mfnN1i59LnYGJx86F8ghkvsBTPgNyKjjrQ9QdRyY/NF5vsjOIfcCz97Ti6TmOCuWglqr
 zA5LXQcRpd5dhbbOfSH+M4n5EEUXA5AktJ+6/isbN2nU93EHmSSv0qdFApH8+kTTwc5H
 nuONzB2varKxlKgRBv6zz7yc2g+NdTKvjrxTPNRsxLLNWlNnygnlvvgLLI3MoaIh5VeT
 K3GlRNDMbNhg2BjiinqYN9Yj/DwxDUMdHy148AQ0MoIYd8fog5mk9sHPp/uVhNgZP0XS
 hnUA==
X-Gm-Message-State: ANoB5pliGuyDirTf7gh3wW2eQd6Ily7VFtwFPURt/6wAOwlUv38Je1Zi
 Td8/DMiki+wr4CxkWBBdxdRlPpXQzWCt0D0WRMYfwBWXutGkoRvI
X-Google-Smtp-Source: AA0mqf7Mf5DNMXi1omIYQLIgEMjyM+cO5zE+4dhFlN6CUh2UZilDWNPWr+KRJotdVt7stJ2decl+aEMwOc0e5FVK8J8=
X-Received: by 2002:a17:907:9c0a:b0:7ae:1e53:8dd4 with SMTP id
 ld10-20020a1709079c0a00b007ae1e538dd4mr36669771ejc.42.1670527491298; Thu, 08
 Dec 2022 11:24:51 -0800 (PST)
MIME-Version: 1.0
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
 <CAPan3WoHZXTY4+EAkgwcHdYTice62OtRdLyjW7hdn8oQ-Swa-A@mail.gmail.com>
In-Reply-To: <CAPan3WoHZXTY4+EAkgwcHdYTice62OtRdLyjW7hdn8oQ-Swa-A@mail.gmail.com>
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Date: Thu, 8 Dec 2022 20:24:40 +0100
Message-ID: <CABtshVTVG=YqWemmG56eOAR5UouDXnTHBtp42Tu6N_w4EgDpUA@mail.gmail.com>
Subject: Re: [PATCH 0/6] Enable Cubieboard A10 boot SPL from SD card
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Hi Niek,

On Wed, Dec 7, 2022 at 9:25 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> Hello Strahinja,
>
> Thanks for contribution these patches, and also taking the H3 into account :-)

Thank you for looking into these patches and all of the comments. I
will try to submit V2 of this patch set in the following days.

>
> I've ran the avocado based acceptance tests for both boards and got these results:
>
> $ ARMBIAN_ARTIFACTS_CACHED=yes AVOCADO_ALLOW_LARGE_STORAGE=yes ./build/tests/venv/bin/avocado --show=app,console run -t machine:orangepi-pc tests/avocado/boot_linux_console.py
> ...
> RESULTS    : PASS 5 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 114.24 s
>
> $ ./build/tests/venv/bin/avocado --show=app,console run -t machine:cubieboard tests/avocado/boot_linux_console.py
> ...
> RESULTS    : PASS 2 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 22.79 s

I did not think initially about avocado, but maybe I could also add an
SPL/SD boot test for the cubieboard, similarly to the way it is run
for Orange Pi, for V2 of the patch set?

Best regards,
Strahinja



>
> So that shows both machines are still running fine. During startup of the bionic 20.08 image for orangepi-pc it did show this message:
>   console: i2c i2c-0: mv64xxx: I2C bus locked, block: 1, time_left: 0
>   console: sy8106a: probe of 0-0065 failed with error -110
>
> The SY8106a appears to be an peripheral attached to the I2C bus on the orangepi-pc, and we don't emulate the SY8106a yet, so that's an error to be expected:
>   https://linux-sunxi.org/SY8106A
>
> So for the series:
> Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>
> I'll try to reply to each patch as well.
>
> Kind regards,
> Niek
>
> On Sun, Dec 4, 2022 at 12:19 AM Strahinja Jankovic <strahinjapjankovic@gmail.com> wrote:
>>
>> This patch series adds missing Allwinner A10 modules needed for
>> successful SPL boot:
>> - Clock controller module
>> - DRAM controller
>> - I2C0 controller (added also for Allwinner H3 since it is the same)
>> - AXP-209 connected to I2C0 bus
>>
>> It also updates Allwinner A10 emulation so SPL is copied from attached
>> SD card if `-kernel` parameter is not passed when starting QEMU
>> (approach adapted from Allwinner H3 implementation).
>>
>> Boot from SD card has been tested with Cubieboard Armbian SD card image and custom
>> Yocto image built for Cubieboard.
>> Example usage for Armbian image:
>> qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_Cubieboard_kinetic_edge_6.0.7.img
>>
>>
>> Strahinja Jankovic (6):
>>   hw/misc: Allwinner-A10 Clock Controller Module Emulation
>>   hw/misc: Allwinner A10 DRAM Controller Emulation
>>   hw/i2c: Allwinner TWI/I2C Emulation
>>   hw/misc: Allwinner AXP-209 Emulation
>>   hw/arm: Add AXP-209 to Cubieboard
>>   hw/arm: Allwinner A10 enable SPL load from MMC
>>
>>  hw/arm/Kconfig                        |   5 +
>>  hw/arm/allwinner-a10.c                |  40 +++
>>  hw/arm/allwinner-h3.c                 |  11 +-
>>  hw/arm/cubieboard.c                   |  11 +
>>  hw/i2c/Kconfig                        |   4 +
>>  hw/i2c/allwinner-i2c.c                | 417 ++++++++++++++++++++++++++
>>  hw/i2c/meson.build                    |   1 +
>>  hw/misc/Kconfig                       |  10 +
>>  hw/misc/allwinner-a10-ccm.c           | 224 ++++++++++++++
>>  hw/misc/allwinner-a10-dramc.c         | 179 +++++++++++
>>  hw/misc/allwinner-axp-209.c           | 263 ++++++++++++++++
>>  hw/misc/meson.build                   |   3 +
>>  include/hw/arm/allwinner-a10.h        |  27 ++
>>  include/hw/arm/allwinner-h3.h         |   3 +
>>  include/hw/i2c/allwinner-i2c.h        | 112 +++++++
>>  include/hw/misc/allwinner-a10-ccm.h   |  67 +++++
>>  include/hw/misc/allwinner-a10-dramc.h |  68 +++++
>>  17 files changed, 1444 insertions(+), 1 deletion(-)
>>  create mode 100644 hw/i2c/allwinner-i2c.c
>>  create mode 100644 hw/misc/allwinner-a10-ccm.c
>>  create mode 100644 hw/misc/allwinner-a10-dramc.c
>>  create mode 100644 hw/misc/allwinner-axp-209.c
>>  create mode 100644 include/hw/i2c/allwinner-i2c.h
>>  create mode 100644 include/hw/misc/allwinner-a10-ccm.h
>>  create mode 100644 include/hw/misc/allwinner-a10-dramc.h
>>
>> --
>> 2.30.2
>>
>
>
> --
> Niek Linnenbank
>

