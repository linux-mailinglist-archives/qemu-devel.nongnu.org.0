Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F9F65439E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 16:05:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8N6k-0008NQ-LL; Thu, 22 Dec 2022 10:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8N6b-0008JP-RO
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 10:03:35 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8N6Z-00056w-EJ
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 10:03:32 -0500
Received: by mail-lf1-x130.google.com with SMTP id y25so3094585lfa.9
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 07:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bYB27TogxpwypzUmCcWbKBZhi+QrbE+jluz3XJ8G/CQ=;
 b=wSWzPYpCQdcvu2vwBweUT4f1zTEwe8wwcqatn5vIImRhR+ilfjzUzjFDmA75AKS2N4
 LktXOumICSZO5s7WZLiaZ0HwVFwfihpgaRE6w1bhOaLK+rIpSx/w4LZMVvfgeH0SBPxA
 1NRaNe91pBDig5PMV/9uNSXr04L5DlbvdIf988rWdywP9vTFGSygRLeA0HTecVuLiQ59
 uZHh7dd2SK9d8lympwsbpTX2RLtHhAXbU+7QuacynQ/u5nVRQ4znCAMOQFmjZrZeM3vF
 kVzWMaf+0+XusiCSvRi/gG7vdPrVrVG9+C/fTXKl+eRazt01huNz2/RR6yrohsbw/qJq
 Db7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bYB27TogxpwypzUmCcWbKBZhi+QrbE+jluz3XJ8G/CQ=;
 b=rQrnUijiNjSz1CmbEo9B+t6Jzp6hC46UmvLMo/+BF0AFl5h5X3ObAm2Kh3ufULEC97
 SkqUGmXlPHEUKQg+CwEyEUbKiFAMTXE5qO2ocpBFhcxlIQi4KMN1/+QR8r5umQJq9olV
 4mytJU/8bWyyv6kWarhDl2g7F6923gJTeWoEqbTRjyec1DZzb2oFMGGO2+JFCvWfGW2n
 V5J2uF8fUdyYwhFQBm4Vz4KsGKTuLwi0IjQL1NGuFgeOCp2Ql0TGzfAf9VIA113mUXF4
 9p0EOo2MfgrTdw37tHxi1gEiB5fbUzLI/BSquJuqresY1p0B0+ZRekSPi/4QqER4+FTt
 czBg==
X-Gm-Message-State: AFqh2kre85wYZJbc76Ydba26BdRzdw1dU4vZJrCeKJrLavS3cpucyd4P
 OlHSBFXWeBhmDrWPc54wSRy3JQ==
X-Google-Smtp-Source: AMrXdXsfp8GGdXOXPnQNDBRfzgV/c/oHVWcUw0UGIJdpqwSf41sL71QyQVN+M2hXhwWV2rNcjk1PMA==
X-Received: by 2002:a05:6512:79:b0:4b5:43ef:a555 with SMTP id
 i25-20020a056512007900b004b543efa555mr1686710lfo.69.1671721409272; 
 Thu, 22 Dec 2022 07:03:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b0026a4bb75477sm759539wrf.28.2022.12.22.07.03.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 07:03:28 -0800 (PST)
Message-ID: <6ccd925d-b965-4da0-13f2-365bd75abe88@linaro.org>
Date: Thu, 22 Dec 2022 16:03:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v9 08/14] hw/nvram: NPCM7xx OTP device model
Content-Language: en-US
To: Havard Skinnemoen <hskinnemoen@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com, Alexander Bulekov <alxndr@bu.edu>,
 Shengtan Mao <stmao@google.com>, Hao Wu <wuhaotsh@google.com>,
 Chris Rauer <crauer@google.com>, Tyrone Ting <kfting@nuvoton.com>
References: <20200911052101.2602693-1-hskinnemoen@google.com>
 <20200911052101.2602693-9-hskinnemoen@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20200911052101.2602693-9-hskinnemoen@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,

(old patch)

On 11/9/20 07:20, Havard Skinnemoen wrote:
> This supports reading and writing OTP fuses and keys. Only fuse reading
> has been tested. Protection is not implemented.
> 
> Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Tested-by: Alexander Bulekov <alxndr@bu.edu>
> Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> ---
>   include/hw/arm/npcm7xx.h       |   3 +
>   include/hw/nvram/npcm7xx_otp.h |  79 ++++++
>   hw/arm/npcm7xx.c               |  29 +++
>   hw/nvram/npcm7xx_otp.c         | 440 +++++++++++++++++++++++++++++++++
>   hw/nvram/meson.build           |   1 +
>   5 files changed, 552 insertions(+)
>   create mode 100644 include/hw/nvram/npcm7xx_otp.h
>   create mode 100644 hw/nvram/npcm7xx_otp.c

> +/**
> + * npcm7xx_otp_array_write - ECC encode and write data to OTP array.
> + * @s: OTP module.
> + * @data: Data to be encoded and written.
> + * @offset: Offset of first byte to be written in the OTP array.
> + * @len: Number of bytes before ECC encoding.
> + *
> + * Each nibble of data is encoded into a byte, so the number of bytes written
> + * to the array will be @len * 2.
> + */
> +extern void npcm7xx_otp_array_write(NPCM7xxOTPState *s, const void *data,
> +                                    unsigned int offset, unsigned int len);

> +static void npcm7xx_init_fuses(NPCM7xxState *s)
> +{
> +    NPCM7xxClass *nc = NPCM7XX_GET_CLASS(s);
> +    uint32_t value;
> +
> +    /*
> +     * The initial mask of disabled modules indicates the chip derivative (e.g.
> +     * NPCM750 or NPCM730).
> +     */
> +    value = tswap32(nc->disabled_modules);

In which endianness do you want this 32-bit fuse value to be written?

I suppose you used a little-endian host, so we want it big-endian in
the OTP? In that case it would be better to use cpu_to_be32(), to
be able to use the OTP on a big-endian host such s390x.

> +    npcm7xx_otp_array_write(&s->fuse_array, &value, NPCM7XX_FUSE_DERIVATIVE,
> +                            sizeof(value));
> +}

For completeness:

 > +static void npcm730_class_init(ObjectClass *oc, void *data)
 > +{
 > +    NPCM7xxClass *nc = NPCM7XX_CLASS(oc);
 > +
 > +    /* NPCM730 is optimized for data center use, so no graphics, etc. */
 > +    nc->disabled_modules = 0x00300395;
 > +    nc->num_cpus = 2;
 > +}
 > +
 > +static void npcm750_class_init(ObjectClass *oc, void *data)
 > +{
 > +    NPCM7xxClass *nc = NPCM7XX_CLASS(oc);
 > +
 > +    /* NPCM750 has 2 cores and a full set of peripherals */
 > +    nc->disabled_modules = 0x00000000;
 > +    nc->num_cpus = 2;
 > +}

Thanks,

Phil.

