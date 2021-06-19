Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADBD3AD962
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 12:29:16 +0200 (CEST)
Received: from localhost ([::1]:53724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luYDz-0003XJ-6b
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 06:29:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luYC8-0002cT-1H; Sat, 19 Jun 2021 06:27:23 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luYC6-0000GP-1h; Sat, 19 Jun 2021 06:27:19 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 n35-20020a05600c3ba3b02901cdecb6bda8so10258959wms.5; 
 Sat, 19 Jun 2021 03:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nc5VNATnJB1OuvV3i6163i6nDpvBOrIOQIN1kwM7sUk=;
 b=uTDSbMgpwDroudoL4KDQNyXm2Rv94fGz+beB9zCpYWHw6kYYp0zDeAbMYU6KsTVJGD
 mibur8IQUZ/BWJ066pAZ/wsu+59OY3SPtWKifaLo4rO1bBctEkYYr4B1hssipZiPvgFS
 gKGngPm6KmD3h0gfG/Ipij6eWMUPb2GbJCQgpMM0B7TRN6nYWqV8OTg4BDaiIN6zOBIS
 TZaMqV1qdlmYgVAllOmfeQv6Qrq27M4U12IyoaHO28W3mgyWHIqZqIKdWVI+xV6faAQR
 G8qx0E81quoDuWUfo0ry3/qkXHdeiSTKozS2+zCmReeE7CPzx54r5gH/S2IOgl9IkNFx
 dYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nc5VNATnJB1OuvV3i6163i6nDpvBOrIOQIN1kwM7sUk=;
 b=Vq2HJ2ipvnmaf6J0X7tlB7TV646h/ZFZS23Yfdozkhzz+HiQvxF/ajsnHlXuYkPD5x
 P8oUctH82EL7jvF/iJB8s1EWg/DRm7VP6M6+riZp9f+iua5nwBEf6H++rULPLI3qyFZH
 Zg2v1Gl9flbRCiIzIFl3D9RfQkTdgwjkQ7+bBtejjsJLC8oSocguwqLxaEMJH21W6Uhz
 YQP1z4qNkaK2SH/J6MLcPPm+4Ki2b10JPJ+g4WerBfStDC1YPZ0F2n/Ekm+XYe6p2Qwn
 8WIsZCUAk/wCqxYVCmFdH7UI4lh3Om58iY75HId51AJigz5IvCl86CjSgec/S0BOwtve
 RyIg==
X-Gm-Message-State: AOAM530lgCa6Pfdtd+GIpbsAYc5lp/68vUF1acdaedhozivrcDw/W4Mv
 OZQcg9kTrjObcVz3+DEpJMk=
X-Google-Smtp-Source: ABdhPJyvkMj1WSWnZ6KzhjeJD+x6Mbh82i4OmADINXB4VlxRhnLEY/+kg0QYpSL1daidt5iS5gFY9g==
X-Received: by 2002:a1c:2604:: with SMTP id m4mr12380626wmm.131.1624098435589; 
 Sat, 19 Jun 2021 03:27:15 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p8sm3677639wmi.46.2021.06.19.03.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 03:27:14 -0700 (PDT)
Subject: Re: [PATCH] docs/system: arm: Add nRF boards description
To: Alexandre Iooss <erdnaxe@crans.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20210619095750.3216150-1-erdnaxe@crans.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ce559a20-4abc-7810-f76c-1572feaa7e9e@amsat.org>
Date: Sat, 19 Jun 2021 12:27:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210619095750.3216150-1-erdnaxe@crans.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Su Hang <suhang16@mails.ucas.ac.cn>,
 =?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
 "open list:NRF51" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Julia / Su / Steffen

On 6/19/21 11:57 AM, Alexandre Iooss wrote:
> This adds the target guide for BBC Micro:bit.
> 
> Information is taken from https://wiki.qemu.org/Features/MicroBit
> and from hw/arm/nrf51_soc.c.

Great idea :)

> 
> Signed-off-by: Alexandre Iooss <erdnaxe@crans.org>
> ---
>  MAINTAINERS                |  1 +
>  docs/system/arm/nrf.rst    | 49 ++++++++++++++++++++++++++++++++++++++
>  docs/system/target-arm.rst |  1 +
>  3 files changed, 51 insertions(+)
>  create mode 100644 docs/system/arm/nrf.rst
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 636bf2f536..7c54611cc2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1031,6 +1031,7 @@ F: hw/*/microbit*.c
>  F: include/hw/*/nrf51*.h
>  F: include/hw/*/microbit*.h
>  F: tests/qtest/microbit-test.c
> +F: docs/system/arm/nrf.rst
>  
>  AVR Machines
>  -------------
> diff --git a/docs/system/arm/nrf.rst b/docs/system/arm/nrf.rst
> new file mode 100644
> index 0000000000..e30aba8b06
> --- /dev/null
> +++ b/docs/system/arm/nrf.rst
> @@ -0,0 +1,49 @@
> +Nordic nRF boards (``microbit``)
> +================================
> +
> +The `Nordic nRF`_ chips are a family of ARM-based System-on-Chip that
> +are designed to be used for low-power and short-range wireless solutions.
> +
> +.. _Nordic nRF: https://www.nordicsemi.com/Products
> +
> +The nRF51 series is the first series for short range wireless applications.
> +It is superseded by the nRF51 series.
> +The following machines are based on this chip :
> +
> +- ``microbit``       BBC micro:bit board with nRF51822 SoC
> +
> +There are other series such as nRF52, nRF53 and nRF91 which are currently not
> +supported by QEMU.
> +
> +Supported devices
> +-----------------
> +
> + * ARM Cortex-M0 (ARMv6-M)
> + * Serial ports (UART)
> + * Clock controller
> + * Timers
> + * Random Number Generator (RNG)
> + * GPIO controller
> + * NVMC
> + * SWI
> +
> +Missing devices
> +---------------
> +
> + * Watchdog
> + * Real-Time Clock (RTC) controller
> + * TWI (i2c)
> + * SPI controller
> + * Analog to Digital Converter (ADC)
> + * Quadrature decoder
> + * Radio
> +
> +Boot options
> +------------
> +
> +The Micro:bit machine can be started using the ``-device`` option to load a
> +firmware in hexadecimal format. Example:

I'd use "ihex format" instead of "hexadecimal format", see

https://en.wikipedia.org/wiki/Intel_HEX

and also commit e4a25ed91947af1ec87f23725de4ac86a3353b48:

    loader: Implement .hex file loader

    This patch adds Intel Hexadecimal Object File format support to the
    generic loader device.  The file format specification is available
    here: http://www.piclist.com/techref/fileext/hex/intel.htm

    This file format is often used with microcontrollers such as the
    micro:bit, Arduino, STM32, etc.  Users expect to be able to run .hex
    files directly with without first converting them to ELF.  Most
    micro:bit code is developed in web-based IDEs without direct user
    access to binutils so it is important for QEMU to handle this file
    format natively.

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +
> +.. code-block:: bash
> +
> +  $ qemu-system-arm -M microbit -device loader,file=test.hex
> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index edd013c7bb..5277ac0242 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -87,6 +87,7 @@ undocumented; you can get a complete list by running
>     arm/digic
>     arm/musicpal
>     arm/gumstix
> +   arm/nrf
>     arm/nseries
>     arm/nuvoton
>     arm/orangepi
> 


