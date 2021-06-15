Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324593A8B75
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 23:55:15 +0200 (CEST)
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltH1d-0003rg-Ib
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 17:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ltH0f-0003AG-Vr; Tue, 15 Jun 2021 17:54:14 -0400
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29]:39593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ltH0c-0006Wn-9A; Tue, 15 Jun 2021 17:54:13 -0400
Received: by mail-io1-xd29.google.com with SMTP id f10so804747iok.6;
 Tue, 15 Jun 2021 14:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L8Wr+vVlpS7RBuWeP7oXdC87KRHJWCD4XNU58f8BPXg=;
 b=Jaug9ABo7c46Po3YPqEoGTX+eZj6Nq3/lnXelPODBrmWghtcWOXuNBP7w4EoFVLob8
 kOhuSVtrqGG5G+MxuFBHYycHulgx6kjHZvMLYa1iOhCWPZOaQUW5chUaEcFuc9xaIAS8
 a9iI+WMTMVJnBEqd+rgEjSVzAVfLediT8ixnkZ8WN+nx4VLt6rPc5SAUkytoF6rXVFqN
 tc6FBelixjmw+gGSymHGi7uVLUojbn9dgLxjJ35EpeC0Do5kZ5ZN9qmiQnbuh6n3mE0g
 CMeVCwvYQzXM68tYZIZLc+ALVKGmZ2OvSKT7I5/dTDAInpp039k1mVj7OqfzeweD6AG5
 NVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L8Wr+vVlpS7RBuWeP7oXdC87KRHJWCD4XNU58f8BPXg=;
 b=s18yrSp17qp3pWjBpyTJVlglFSB78ReGMONejqUwetxD8mp018Mf7gAdadHMozDh/p
 dU12aEsx7xvlUVirmwDrOLijFYs6ELdFl8n87vhu3XemHJGf7pRIFeD3HhTGL57Uqrmo
 vm7KcbNOZDfk8DcWiRAwWb6XW18KtjC6i2TI12hZBUtVYU9VkPFuY+CSlYTwAxKZ3xEN
 J58LlIntU8p39BS+E+i5iSYZdr6DbBr1OW00n866rMN+urPajlXnrfRSWGhaweWXtDD7
 CYncV4GcRXakcUPPRLuClmfB3tZd/bnxCIXNTrZFGGemFo8Gtpbrw2n1o6cYZj6AFzW/
 35XA==
X-Gm-Message-State: AOAM532r+F7I66u9N/MlNw93VcSjkbIDF1abDxY+U1+196zBAbRIoXex
 dWfQxF/sMXrKz9ts7nZqUsO40ngfRAymjN1HK6s=
X-Google-Smtp-Source: ABdhPJxy8KOp8ivNg/hBEhMINN/ehOuwIbxaAaEYLqOl/tc3rbUARyGO/H4xkWQ2/wFa9wEvBmcgoIRECOjJwIS0z2U=
X-Received: by 2002:a6b:490d:: with SMTP id u13mr1066217iob.176.1623794048827; 
 Tue, 15 Jun 2021 14:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210615153440.1307729-1-erdnaxe@crans.org>
 <20210615153440.1307729-4-erdnaxe@crans.org>
In-Reply-To: <20210615153440.1307729-4-erdnaxe@crans.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Jun 2021 07:53:42 +1000
Message-ID: <CAKmqyKMDO7LpvBSG98=EX+vHqkveWFLu-J57EcwLAKuA7YUSsg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs/system: arm: Add stm32 boards description
To: Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d29;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd29.google.com
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
 "open list:STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 1:35 AM Alexandre Iooss <erdnaxe@crans.org> wrote:
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

