Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2500D3AC08E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 03:32:06 +0200 (CEST)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu3Mb-0005nd-7s
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 21:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu3Jo-0003DS-Ej; Thu, 17 Jun 2021 21:29:12 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lu3Jk-0001b9-Jm; Thu, 17 Jun 2021 21:29:12 -0400
Received: by mail-io1-xd31.google.com with SMTP id q3so5251218iop.11;
 Thu, 17 Jun 2021 18:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sq8DE34U2OBYVb/p6cCAaZPg/yRXmFcqN6BKnOjg3Tw=;
 b=M+Uztu7hAmTGYvpXDpAHYxSoznu4V8VwnLD1vXqlETMDSwEE8RzFbXH2urhelTf91C
 HmegFrvQ1Gl+2kP4ZKztE9xSpt8ef+wjPi2YkQM8gpH2n5exW9EKN1ve7rGphkptKMlc
 eDN588X9G2+DCMH2ynxnjYu7mE/qtkWmAlkjgynAqjglu9F2NdlcxKQ8OasebcV6rlwi
 nMoKn72gqZL2hrqi2QFwTAcr6NZUp3HXPnBCwfMjonlQwfwXMxUxrwlsa/jdBys/lsul
 z4O/ZBdyvLDkrB7KCkrZDoYnX7iK2jrVPMQqYSlLv7sMgD8McF3PGCrLlNxRpDHY0XBz
 /Bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sq8DE34U2OBYVb/p6cCAaZPg/yRXmFcqN6BKnOjg3Tw=;
 b=WAxHr8w0xHrn+iY3Rwstk+l4oklSTnZ+ifNe6nMLcMjaW2qIVyt1VR32AAHPQbZffL
 NRoz/Tmeeuh/mlaOdHiVS/oF50GnQaN0mvUYk07aC+GHfSz4rNHsvAdzlYpNP3hIz3zB
 cYcIsM18A3AUMTG34uVV6PwZ9chnvIXGHhe+XhYUAqJ9k2yND0d+V29OWUsm5Pbbfm8c
 XEr26VtfXL/2nHriL3HLGXrDQLHC0I1C2oxv9ECD42m6QuGvEm0IA9U2KazF7kY1seq/
 0QBtRhtTWAp0xIkE67R2m/r/hoC+SgPmYQcHS6IJsOv5nk8NvKitgvGwsF1MWHrpmCdL
 MOZw==
X-Gm-Message-State: AOAM531Lj0/numfdMD9vH7BHEZXL70C5j7IVElj30XBhdDVKhiwHNgxD
 IkpFbYf1cEIA7SExHdETRQKh7xannvs7K4aqvZI=
X-Google-Smtp-Source: ABdhPJzr3u2Uf2RXJ24UdWeKs63NU8X4EO3cm3hM8JcyirvwOPlsWAxDGpAnw00Q6iAxudIuAhn5ynlwr3skM/dtPjk=
X-Received: by 2002:a02:8816:: with SMTP id r22mr937703jai.135.1623979747239; 
 Thu, 17 Jun 2021 18:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210617165647.2575955-1-erdnaxe@crans.org>
 <20210617165647.2575955-4-erdnaxe@crans.org>
In-Reply-To: <20210617165647.2575955-4-erdnaxe@crans.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 18 Jun 2021 11:28:41 +1000
Message-ID: <CAKmqyKO2wnR27S0eM+nAkMHibQLzTbzJbfUYgJH4ajpoij+jwg@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] docs/system: arm: Add stm32 boards description
To: Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd31.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list : STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 18, 2021 at 2:56 AM Alexandre Iooss <erdnaxe@crans.org> wrote:
>
> This adds the target guide for Netduino 2, Netduino Plus 2 and STM32VLDISCOVERY.
>
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  MAINTAINERS                |  1 +
>  docs/system/arm/stm32.rst  | 66 ++++++++++++++++++++++++++++++++++++++
>  docs/system/target-arm.rst |  1 +
>  3 files changed, 68 insertions(+)
>  create mode 100644 docs/system/arm/stm32.rst
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0aa8016936..47fb06e5fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -896,6 +896,7 @@ M: Alexandre Iooss <erdnaxe@crans.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/stm32vldiscovery.c
> +F: docs/system/arm/stm32.rst
>
>  Versatile Express
>  M: Peter Maydell <peter.maydell@linaro.org>
> diff --git a/docs/system/arm/stm32.rst b/docs/system/arm/stm32.rst
> new file mode 100644
> index 0000000000..508b92cf86
> --- /dev/null
> +++ b/docs/system/arm/stm32.rst
> @@ -0,0 +1,66 @@
> +STMicroelectronics STM32 boards (``netduino2``, ``netduinoplus2``, ``stm32vldiscovery``)
> +========================================================================================
> +
> +The `STM32`_ chips are a family of 32-bit ARM-based microcontroller by
> +STMicroelectronics.
> +
> +.. _STM32: https://www.st.com/en/microcontrollers-microprocessors/stm32-32-bit-arm-cortex-mcus.html
> +
> +The STM32F1 series is based on ARM Cortex-M3 core. The following machines are
> +based on this chip :
> +
> +- ``stm32vldiscovery``  STM32VLDISCOVERY board with STM32F100RBT6 microcontroller
> +
> +The STM32F2 series is based on ARM Cortex-M3 core. The following machines are
> +based on this chip :
> +
> +- ``netduino2``         Netduino 2 board with STM32F205RFT6 microcontroller
> +
> +The STM32F4 series is based on ARM Cortex-M4F core. This series is pin-to-pin
> +compatible with STM32F2 series. The following machines are based on this chip :
> +
> +- ``netduinoplus2``     Netduino Plus 2 board with STM32F405RGT6 microcontroller
> +
> +There are many other STM32 series that are currently not supported by QEMU.
> +
> +Supported devices
> +-----------------
> +
> + * ARM Cortex-M3, Cortex M4F
> + * Analog to Digital Converter (ADC)
> + * EXTI interrupt
> + * Serial ports (USART)
> + * SPI controller
> + * System configuration (SYSCFG)
> + * Timer controller (TIMER)
> +
> +Missing devices
> +---------------
> +
> + * Camera interface (DCMI)
> + * Controller Area Network (CAN)
> + * Cycle Redundancy Check (CRC) calculation unit
> + * Digital to Analog Converter (DAC)
> + * DMA controller
> + * Ethernet controller
> + * Flash Interface Unit
> + * GPIO controller
> + * I2C controller
> + * Inter-Integrated Sound (I2S) controller
> + * Power supply configuration (PWR)
> + * Random Number Generator (RNG)
> + * Real-Time Clock (RTC) controller
> + * Reset and Clock Controller (RCC)
> + * Secure Digital Input/Output (SDIO) interface
> + * USB OTG
> + * Watchdog controller (IWDG, WWDG)
> +
> +Boot options
> +------------
> +
> +The STM32 machines can be started using the ``-kernel`` option to load a
> +firmware. Example:
> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -M stm32vldiscovery -kernel firmware.bin
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index edd013c7bb..addd3d1613 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -96,6 +96,7 @@ undocumented; you can get a complete list by running
>     arm/collie
>     arm/sx1
>     arm/stellaris
> +   arm/stm32
>     arm/virt
>     arm/xlnx-versal-virt
>
> --
> 2.25.1
>

