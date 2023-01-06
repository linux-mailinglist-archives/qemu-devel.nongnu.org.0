Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB7565F84D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 01:48:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDasv-0005Jh-If; Thu, 05 Jan 2023 19:47:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pDast-0005JS-9K; Thu, 05 Jan 2023 19:46:59 -0500
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1pDasr-0008L0-2L; Thu, 05 Jan 2023 19:46:58 -0500
Received: by mail-ua1-x929.google.com with SMTP id d14so7210968uak.12;
 Thu, 05 Jan 2023 16:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0l41fp31veQi/wynlTsSf5TodSUaRGNpBOlsPbWp4fI=;
 b=USCz2MofJgwYIqn+bYZu61PN2T7R/Y44nyuAoHWiFOlzbejoVENj1/N2LuN9r1GMRo
 2iBbx+QztNWpSZGbTeUfhNQLu628jD+zbgjOe1P99s+oTbrObGqbI/emgzCkmOdj9lnI
 h05t503Q5XaPrqWSdZJ+XCNvcoIiJNThxS/uBymLYTo4zTwagrQieYbQJwKd5LmIGFUW
 niwzjxTZneX3n2PEHuYhuUO0nDFHlqCvhjPw6vnrSZFg+zsGYFZrp0iErI8sL/VNihYy
 3mfeDxli/JAqevpAdgb+GdjXMZcNqQ3NS+xgCdx4paul6/kaxYQG1ehOKYOMAFBn+te3
 fP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0l41fp31veQi/wynlTsSf5TodSUaRGNpBOlsPbWp4fI=;
 b=X0ntePxBWP1fmn4eZ+2j6wMS9a5WHAgl3r+SAk2dJW5vLcGLR9sBW9MAu7js64PdyP
 ZHYZ2jkEA9cgNOuRlMmQvCe1q8cHbVI9CXixIrYlMFMY6a3/NG38GXdwQAQy6qUY24dZ
 uY50doUC+rjJQSPAA1dAsP9L1+HvxnqLZAaoJqY9mDjobWq3CQT0MouLk4UrsvnH4ZII
 dTIM1c36dF7+ZOyC9H3yaxPi0iuo1jitX+ugGKvwwqRVDYO5RuMP94Pzi9mSWkrCKMnT
 x1+DdT9j9yVPN6wouHi7EC65jJyD4HWF02dmq0SJzSQkEsm5fKr0pWEqf7nV7+gKuXxC
 5Uxg==
X-Gm-Message-State: AFqh2kpk3YYVy6nZKVz37RM2FOmiF6u+MAf2+/Sg3goQhjCRRPRUE8Mb
 x0zpnHtG9g3734dcjSaTMIU0wPvLWxPGpjQhJEc=
X-Google-Smtp-Source: AMrXdXvqxu9vcESbGJw1c2UYBK7IVOmTPxcoRcGRmiiKNZukUOXx9O18Zm3oOsmAtxcpF63KRDfReJEWzZW6Ff/H8gw=
X-Received: by 2002:ab0:1547:0:b0:418:f948:259f with SMTP id
 p7-20020ab01547000000b00418f948259fmr4800321uae.38.1672966015122; Thu, 05 Jan
 2023 16:46:55 -0800 (PST)
MIME-Version: 1.0
References: <20221230145733.200496-1-balbi@kernel.org>
 <20221230145733.200496-3-balbi@kernel.org>
In-Reply-To: <20221230145733.200496-3-balbi@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 6 Jan 2023 10:46:29 +1000
Message-ID: <CAKmqyKPx5ed-uvT3VQ5k=DL3KWd0cYDie_fJzhPFb5pW-U5Y2Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/arm: Add Olimex H405
To: Felipe Balbi <balbi@kernel.org>
Cc: Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, 
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=alistair23@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

On Sat, Dec 31, 2022 at 1:01 AM Felipe Balbi <balbi@kernel.org> wrote:
>
> Olimex makes a series of low-cost STM32 boards. This commit introduces
> the minimum setup to support SMT32-H405. See [1] for details
>
> [1] https://www.olimex.com/Products/ARM/ST/STM32-H405/
>
> Signed-off-by: Felipe Balbi <balbi@kernel.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>
> Changes since v1:
>         - Add a note in stm32.rst
>         - Initialize default_cpu_type to cortex-m4
>         - 0-initialize default_ram_size
>
>  MAINTAINERS                             |  6 +++
>  configs/devices/arm-softmmu/default.mak |  1 +
>  docs/system/arm/stm32.rst               |  1 +
>  hw/arm/Kconfig                          |  4 ++
>  hw/arm/meson.build                      |  1 +
>  hw/arm/olimex-stm32-h405.c              | 69 +++++++++++++++++++++++++
>  6 files changed, 82 insertions(+)
>  create mode 100644 hw/arm/olimex-stm32-h405.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3bd433b65a55..e37846df0071 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1026,6 +1026,12 @@ L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/netduinoplus2.c
>
> +Olimex STM32 H405
> +M: Felipe Balbi <balbi@kernel.org>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/arm/olimex-stm32-h405.c
> +
>  SmartFusion2
>  M: Subbaraya Sundeep <sundeep.lkml@gmail.com>
>  M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/configs/devices/arm-softmmu/default.mak b/configs/devices/arm-softmmu/default.mak
> index 6985a25377a0..1b49a7830c7e 100644
> --- a/configs/devices/arm-softmmu/default.mak
> +++ b/configs/devices/arm-softmmu/default.mak
> @@ -30,6 +30,7 @@ CONFIG_COLLIE=y
>  CONFIG_ASPEED_SOC=y
>  CONFIG_NETDUINO2=y
>  CONFIG_NETDUINOPLUS2=y
> +CONFIG_OLIMEX_STM32_H405=y
>  CONFIG_MPS2=y
>  CONFIG_RASPI=y
>  CONFIG_DIGIC=y
> diff --git a/docs/system/arm/stm32.rst b/docs/system/arm/stm32.rst
> index 508b92cf862b..d7265b763d47 100644
> --- a/docs/system/arm/stm32.rst
> +++ b/docs/system/arm/stm32.rst
> @@ -20,6 +20,7 @@ The STM32F4 series is based on ARM Cortex-M4F core. This series is pin-to-pin
>  compatible with STM32F2 series. The following machines are based on this chip :
>
>  - ``netduinoplus2``     Netduino Plus 2 board with STM32F405RGT6 microcontroller
> +- ``olimex-stm32-h405`` Olimex STM32 H405 board with STM32F405RGT6 microcontroller
>
>  There are many other STM32 series that are currently not supported by QEMU.
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 17fcde8e1ccc..9143533ef792 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -119,6 +119,10 @@ config NETDUINOPLUS2
>      bool
>      select STM32F405_SOC
>
> +config OLIMEX_STM32_H405
> +    bool
> +    select STM32F405_SOC
> +
>  config NSERIES
>      bool
>      select OMAP
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 92f9f6e000ea..76d4d650e42e 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -12,6 +12,7 @@ arm_ss.add(when: 'CONFIG_MICROBIT', if_true: files('microbit.c'))
>  arm_ss.add(when: 'CONFIG_MUSICPAL', if_true: files('musicpal.c'))
>  arm_ss.add(when: 'CONFIG_NETDUINO2', if_true: files('netduino2.c'))
>  arm_ss.add(when: 'CONFIG_NETDUINOPLUS2', if_true: files('netduinoplus2.c'))
> +arm_ss.add(when: 'CONFIG_OLIMEX_STM32_H405', if_true: files('olimex-stm32-h405.c'))
>  arm_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx.c', 'npcm7xx_boards.c'))
>  arm_ss.add(when: 'CONFIG_NSERIES', if_true: files('nseries.c'))
>  arm_ss.add(when: 'CONFIG_SX1', if_true: files('omap_sx1.c'))
> diff --git a/hw/arm/olimex-stm32-h405.c b/hw/arm/olimex-stm32-h405.c
> new file mode 100644
> index 000000000000..3aa61c91b759
> --- /dev/null
> +++ b/hw/arm/olimex-stm32-h405.c
> @@ -0,0 +1,69 @@
> +/*
> + * ST STM32VLDISCOVERY machine
> + * Olimex STM32-H405 machine
> + *
> + * Copyright (c) 2022 Felipe Balbi <balbi@kernel.org>
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a copy
> + * of this software and associated documentation files (the "Software"), to deal
> + * in the Software without restriction, including without limitation the rights
> + * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> + * copies of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> + * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> + * THE SOFTWARE.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "hw/boards.h"
> +#include "hw/qdev-properties.h"
> +#include "hw/qdev-clock.h"
> +#include "qemu/error-report.h"
> +#include "hw/arm/stm32f405_soc.h"
> +#include "hw/arm/boot.h"
> +
> +/* olimex-stm32-h405 implementation is derived from netduinoplus2 */
> +
> +/* Main SYSCLK frequency in Hz (168MHz) */
> +#define SYSCLK_FRQ 168000000ULL
> +
> +static void olimex_stm32_h405_init(MachineState *machine)
> +{
> +    DeviceState *dev;
> +    Clock *sysclk;
> +
> +    /* This clock doesn't need migration because it is fixed-frequency */
> +    sysclk = clock_new(OBJECT(machine), "SYSCLK");
> +    clock_set_hz(sysclk, SYSCLK_FRQ);
> +
> +    dev = qdev_new(TYPE_STM32F405_SOC);
> +    qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
> +    qdev_connect_clock_in(dev, "sysclk", sysclk);
> +    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
> +
> +    armv7m_load_kernel(ARM_CPU(first_cpu),
> +                       machine->kernel_filename,
> +                       0, FLASH_SIZE);
> +}
> +
> +static void olimex_stm32_h405_machine_init(MachineClass *mc)
> +{
> +    mc->desc = "Olimex STM32-H405 (Cortex-M4)";
> +    mc->init = olimex_stm32_h405_init;
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m4");
> +
> +    /* SRAM pre-allocated as part of the SoC instantiation */
> +    mc->default_ram_size = 0;
> +}
> +
> +DEFINE_MACHINE("olimex-stm32-h405", olimex_stm32_h405_machine_init)
> --
> 2.39.0
>
>

