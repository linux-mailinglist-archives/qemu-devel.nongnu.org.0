Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F56339ED5
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 16:11:47 +0100 (CET)
Received: from localhost ([::1]:46662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lL5ve-00061M-FF
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 10:11:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL5ur-0005bA-V1
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 10:10:58 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:41570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lL5uq-0001oK-B4
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 10:10:57 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso16829227wmi.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 07:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kWQeWOZIK8wv3aQEjHlFN4+/HwewT3bG/TS63CRruHM=;
 b=FWe9oLHXgjiWsVs1nLz3/naP1aUGAvALcm9i71rm+PDNrhu4hu74gGXW/YsQvef+rr
 MiFBWjNzIOnKFwYa4embFpdk56fXJhivmLTEGzmMgt0uEv8M3DtfSQv6MM3wD83M1PuU
 Q9oEUTZIrzORij1MQZmTJcyzXtDROsR2gmt97F6aswx3aUnVlgOPQ9ph8fJrVMV47QPe
 /QffqRVrdrJ4mn+kompD08iXCLs5Q/bVAybqpvs1g9kZDQ1CW+bYt2ax+IC0C5kSvpxO
 MJRy9BH4nMZoxq98KPSz2RSwIOZV2/UHowStjSv+X+axKLbcpW1cOitUYM2H8Xi20yUz
 14+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kWQeWOZIK8wv3aQEjHlFN4+/HwewT3bG/TS63CRruHM=;
 b=kAY9cXSoaLPvMD08uU0ojRPS5PdLdLPZg9sEINjNx+fWL10cqwPpIElFRSg1+L28Ly
 TXc6yrlo0/f/ne7Gl1o3Pd06mvFBLwSK0ooL+wxlWpJBEhsVT1bBccni2v9D1msQr5iV
 wut42dcRYBXdvb95ikDcEmGepTZ1kk3n+E5VWb1JFopBqeO20+qSTMzVLLO4XdZ3x/f6
 dM10IGBy739GuOPT7zK3xVN8GWkQWqg2nHaTRTPqDIcMVAa87W2YU7awBJpNKwXAUvCa
 1D2NbyC3MGlit7G8ST5H1evU3vCG+ANYSSVEofMyAxdAsdRHEq77t8fMqNMmgPhJHo4p
 i6DA==
X-Gm-Message-State: AOAM5338FHuzsEd0YRuksGmwIpMDPem83hO64MZyFX6H45N4ZRZCbFnd
 SInEJ1Sh2YRzWX+3yJwz7q0=
X-Google-Smtp-Source: ABdhPJzrsUGcp3l6pznuhggxKazNMrWHor1ZI+J4zC6O8FzAS9ux5AcNWc9ZMuO8XJXbVQ2Nru5nDg==
X-Received: by 2002:a05:600c:35cd:: with SMTP id
 r13mr18333376wmq.186.1615648254258; 
 Sat, 13 Mar 2021 07:10:54 -0800 (PST)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 12sm6687227wmw.43.2021.03.13.07.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 Mar 2021 07:10:53 -0800 (PST)
Subject: Re: [PATCH 3/3] avr/arduino: Add D13 LED
To: G S Niteesh Babu <niteesh.gs@gmail.com>, qemu-devel@nongnu.org
References: <20210311135539.10206-1-niteesh.gs@gmail.com>
 <20210311135539.10206-4-niteesh.gs@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ba00a853-8d3b-9f67-61e8-6f6e04fa64cd@amsat.org>
Date: Sat, 13 Mar 2021 16:10:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311135539.10206-4-niteesh.gs@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: S.E.Harris@kent.ac.uk, mrolnik@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/11/21 2:55 PM, G S Niteesh Babu wrote:
> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
> ---
>  hw/avr/Kconfig   |  1 +
>  hw/avr/arduino.c | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/hw/avr/Kconfig b/hw/avr/Kconfig
> index 16a57ced11..e0d4fc5537 100644
> --- a/hw/avr/Kconfig
> +++ b/hw/avr/Kconfig
> @@ -8,3 +8,4 @@ config AVR_ATMEGA_MCU
>  config ARDUINO
>      select AVR_ATMEGA_MCU
>      select UNIMP
> +    select LED
> diff --git a/hw/avr/arduino.c b/hw/avr/arduino.c
> index 3c8388490d..5cdba3201c 100644
> --- a/hw/avr/arduino.c
> +++ b/hw/avr/arduino.c
> @@ -13,6 +13,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/boards.h"
> +#include "hw/misc/led.h"
>  #include "atmega.h"
>  #include "boot.h"
>  #include "qom/object.h"
> @@ -22,6 +23,8 @@ struct ArduinoMachineState {
>      MachineState parent_obj;
>      /*< public >*/
>      AtmegaMcuState mcu;
> +
> +    LEDState *onboard_led;
>  };
>  typedef struct ArduinoMachineState ArduinoMachineState;
>  
> @@ -49,6 +52,18 @@ static void arduino_machine_init(MachineState *machine)
>                               amc->xtal_hz, &error_abort);
>      sysbus_realize(SYS_BUS_DEVICE(&ams->mcu), &error_abort);
>  
> +    ams->onboard_led = led_create_simple(OBJECT(ams),
> +                                         GPIO_POLARITY_ACTIVE_HIGH,
> +                                         LED_COLOR_BLUE,
> +                                         "D13 LED");
> +
> +    /* TODO: Add macro or function to map pins to ports */
> +    /* The onboard led is connected to PIN 13 in all boards currently supported

Yes,

> +     * in QEMU. And PIN 13 is mapped to PORT B BIT 5.

No. Only on the Duemilanove / UNO. On both Mega it is bit 7.

> +     */
> +    qdev_connect_gpio_out(DEVICE(&ams->mcu.gpio[1]), 5,
> +                          qdev_get_gpio_in(DEVICE(ams->onboard_led), 0));
> +
>      if (machine->firmware) {
>          if (!avr_load_firmware(&ams->mcu.cpu, machine,
>                                 &ams->mcu.flash, machine->firmware)) {
> 

