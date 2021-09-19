Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C640410D73
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 23:14:41 +0200 (CEST)
Received: from localhost ([::1]:49786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS492-0006KM-Js
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 17:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS47t-0005fW-UE
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 17:13:30 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:39647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS47r-0003bl-KB
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 17:13:28 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso14073275wme.4
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 14:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YHB5VQhk1PMYFGgCvOpFfpFfG4iWmxC01HOC5Szh0Ps=;
 b=av/p4EyDV7MeWpzkk1t0IXCsYtJ7Zqjkm6GV29lJD2/QJblgQnzIrbE7yiX4yeB5xl
 kWueyc93ALGMB3xkULAeWcZTY1pfY+CoTXptprhyVMeK9k0WpIh6xHf84P5p+d/M+IhW
 wHlnl2JYY3nKiI/gZoHITcCJF2avb6c5cCRHE0l0ekxIlwhsJdWNSKzYWY0FSRyTkJep
 QxxRR0N71KBqFpMVruGtruS+QggngCLbjHpeZ4Iqm0QfJFJ6cDjYJ0iRMgzsvoedOxaX
 4sO9c/yOdNrEEtxm/DCXBrUySKwvzppb3cQy9kPWquFsdfzQM2A3bQ1zGc29slD/fYWM
 8pUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=YHB5VQhk1PMYFGgCvOpFfpFfG4iWmxC01HOC5Szh0Ps=;
 b=cTj2cArvQCJd2wRXJspfxOOGXDzvxeA+rDy9AF6MlGmywOpmCgyOGtgcOqLzrdnta4
 4Cn/hx8Kmiemg1ANwrMaNjVAODrpD8tPIO0uzuAtpT4I2UNflFe5HEyZZVhS8o7tSTLb
 NX66AW48ybhReh/IqNLUN8rG8ZyEXuu8hHQs3cTzEf8bTt1jl4c0uaSCULT62Im6syHq
 9GQ7GALleV4A7nAFoV0lQeP6ck8PszFv6taOdEBYHRXlTeeWWFraSB9LXFCTdzK0udNp
 /XPJ2XD7BwIFTq/MCs3+RfZChbuI0n+x1DJrIcWlWEa8veBpPoa09ij3dMATnIPYUhyO
 Wk+A==
X-Gm-Message-State: AOAM531rht2mBTi/+49iVaB2PCn0zmDDq07ty28W5d9jO8uYuJLo0lc1
 n5l4iYoisp8QgR10w82UrkI=
X-Google-Smtp-Source: ABdhPJypg/uI5Qpq6laXhNZchA7zJJqciFRRsTOgHAjvGugrmh3l4Ef5unEZUnU1R3THGA+qPwuRTQ==
X-Received: by 2002:a05:600c:3585:: with SMTP id
 p5mr21585656wmq.88.1632086006271; 
 Sun, 19 Sep 2021 14:13:26 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id l26sm17259502wmi.25.2021.09.19.14.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 14:13:25 -0700 (PDT)
Message-ID: <059d1f48-2011-217a-0bf3-473d5b4b9bb9@amsat.org>
Date: Sun, 19 Sep 2021 23:13:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 19/20] q800: wire up nubus IRQs
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210916100554.10963-1-mark.cave-ayland@ilande.co.uk>
 <20210916100554.10963-20-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20210916100554.10963-20-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, CTE_8BIT_MISMATCH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 12:05, Mark Cave-Ayland wrote:
> Nubus IRQs are routed to the CPU through the VIA2 device so wire up the IRQs
> using gpios accordingly.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
> index e34df1a829..fbc45a301f 100644
> --- a/hw/m68k/q800.c
> +++ b/hw/m68k/q800.c
> @@ -396,6 +396,11 @@ static void q800_init(MachineState *machine)
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, 9 * NUBUS_SUPER_SLOT_SIZE);
>      sysbus_mmio_map(SYS_BUS_DEVICE(dev), 1, NUBUS_SLOT_BASE +
>                                              9 * NUBUS_SLOT_SIZE);
> +    for (i = 0; i < VIA2_NUBUS_IRQ_NB; i++) {
> +        qdev_connect_gpio_out(dev, 9 + i,
> +                              qdev_get_gpio_in_named(via2_dev, "nubus-irq",
> +                                                     VIA2_NUBUS_IRQ_9 + i));
> +    }

Hopefully Laurent can double-check the definition values.
Otherwise for the qdev API usage:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

