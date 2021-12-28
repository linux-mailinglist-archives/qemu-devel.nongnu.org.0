Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0500648087D
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 11:40:12 +0100 (CET)
Received: from localhost ([::1]:42750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n29tr-0001Pd-4r
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 05:40:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n29so-0000bx-K2; Tue, 28 Dec 2021 05:39:06 -0500
Received: from [2a00:1450:4864:20::32c] (port=38475
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n29sm-0000k9-Sn; Tue, 28 Dec 2021 05:39:06 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso9977071wmc.3; 
 Tue, 28 Dec 2021 02:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d9TQ2zAqfG02sxjwSZPPq4Sb04K9ZzDmUPMlFg6zzF8=;
 b=diJEmawoHeiMBRfGkdGlSQAFcwS5flLHdKp+BgwgFiqTQ4XZ8BVnenuW698PF2IKWB
 Vt68B11VN2geHJ3miw2gZGW4Q6QSEO0rDYGkGy1uXmsWA33uE+WPUQAEQrCoPwMfA4Z0
 tjQJ0YDscg+u09T75zCUGP1t5PaWU0PWU03ZlQbS8uexdafiJ0WetqPgpFcGH3py1sNI
 fmHrgVWzgdzvF+9Nxq+48oieYA8MxzNP+fMJrtEd0x9/kswvOcu+32F54kT1YEoVitCB
 4aJvhyoz+LCrH0e6Sbn6NKhnL0pZIWXKoC0PZkIBbmzIkeLVdRGxGBBw0t3hEQgfSo40
 KW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d9TQ2zAqfG02sxjwSZPPq4Sb04K9ZzDmUPMlFg6zzF8=;
 b=EU1/rQpDHFJIAsTedAGA6yiXecqnQ+Zl2lJ6ds+4F6+ZO4g1S70DfEqBSHhfW7q9YP
 GVYvet0d9ozvoZnF9OAc6fJFmaP/0rIyCsA0ckLOfnbtYBvz2RuQm9J+XF5BsAPbyMOM
 VY8be3mlcMMaAzAwuH87ct965vmdxyE/Ack30KRJriRO1Swnad7wsoT71+t8wYJyI4fO
 jq4RDhiaD8NNx4NoRsf36V5HkT4NErqVLOobz4cNRUw2YpCj86NQcNeT8cas5qX92qq6
 TNBr4VJeWuh0hv3Go3/b9ZEpe15Km6JLU46hE1qilhNqynj1+ht5rvdobJTXcn/UGdDe
 m1gg==
X-Gm-Message-State: AOAM530DgoQjQmTogkComv0k2lmj6NycfAOn0QPglwPWbJvo/mHBVKto
 jiP0hnMKnWgcgPGQxiYiPLI=
X-Google-Smtp-Source: ABdhPJzMfy3y5AcsdVG5mPYvRUz+S37xX8gsOj/LB0+3EwXvtssuvBpGv1evKRUXQPZ/VFqKhwSxtw==
X-Received: by 2002:a05:600c:2f01:: with SMTP id
 r1mr17115300wmn.153.1640687942085; 
 Tue, 28 Dec 2021 02:39:02 -0800 (PST)
Received: from [192.168.1.16] (adijon-655-1-69-27.w90-13.abo.wanadoo.fr.
 [90.13.240.27])
 by smtp.gmail.com with ESMTPSA id g198sm20472534wme.23.2021.12.28.02.39.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Dec 2021 02:39:01 -0800 (PST)
Message-ID: <81325a49-b9ce-037e-b8c5-8f82eb0d3d52@amsat.org>
Date: Tue, 28 Dec 2021 11:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] hw/sd: Add SDHC support for SD card SPI-mode
Content-Language: en-US
To: frank.chang@sifive.com, qemu-devel@nongnu.org
References: <20211228015055.8709-1-frank.chang@sifive.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211228015055.8709-1-frank.chang@sifive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, Jim Shu <jim.shu@sifive.com>,
 Alexander Bulekov <alxndr@bu.edu>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/28/21 02:50, frank.chang@sifive.com wrote:
> From: Frank Chang <frank.chang@sifive.com>
> 
> In SPI-mode, SD card's OCR register: Card Capacity Status (CCS) bit
> is not set to 1 correclty when the assigned SD image size is larger
> than 2GB (SDHC). This will cause the SD card to be indentified as SDSC
> incorrectly. CCS bit should be set to 1 if we are using SDHC.
> 
> Also, as there's no power up emulation in SPI-mode.
> The OCR register: Card power up status bit bit (busy) should also
> be set to 1 when reset. (busy bit is set to LOW if the card has not
> finished the power up routine.)
> 
> Signed-off-by: Frank Chang <frank.chang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>  hw/sd/sd.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index bb5dbff68c..9169208dbc 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -294,6 +294,18 @@ static void sd_set_ocr(SDState *sd)
>  {
>      /* All voltages OK */
>      sd->ocr = R_OCR_VDD_VOLTAGE_WIN_HI_MASK;
> +
> +    if (sd->spi) {
> +        /*
> +         * We don't need to emulate power up sequence in SPI-mode.
> +         * Thus, the card's power up status bit should be set to 1 when reset.
> +         * The card's capacity status bit should also be set if SD card size
> +         * is larger than 2GB for SDHC support.
> +         */
> +        sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_POWER_UP, 1);
> +        sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY,
> +                             sd->size > SDSC_MAX_CAPACITY);

Simply call sd_ocr_powerup() instead, so we get the trace event.

Calling sd_ocr_powerup():
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    }
>  }
>  
>  static void sd_ocr_powerup(void *opaque)
> @@ -560,6 +572,7 @@ static void sd_reset(DeviceState *dev)
>  
>      sd->state = sd_idle_state;
>      sd->rca = 0x0000;
> +    sd->size = size;
>      sd_set_ocr(sd);
>      sd_set_scr(sd);
>      sd_set_cid(sd);
> @@ -574,7 +587,6 @@ static void sd_reset(DeviceState *dev)
>      memset(sd->function_group, 0, sizeof(sd->function_group));
>      sd->erase_start = INVALID_ADDRESS;
>      sd->erase_end = INVALID_ADDRESS;
> -    sd->size = size;
>      sd->blk_len = 0x200;
>      sd->pwd_len = 0;
>      sd->expecting_acmd = false;

