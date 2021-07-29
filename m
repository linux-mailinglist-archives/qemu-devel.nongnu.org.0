Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAA53D9F08
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 09:57:31 +0200 (CEST)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m90v4-0008CO-EF
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 03:57:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90tT-0006xs-2k
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:55:51 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m90tR-0006CN-FE
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 03:55:50 -0400
Received: by mail-wr1-x433.google.com with SMTP id z4so5700582wrv.11
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 00:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tdkYli2Tk8BaC74RTV1mONuyFgGWbPhWPhtFxhHG90o=;
 b=Iu6dTbYp0DFtPjZT7cjynBAn4chhWiBjwx78COfCRGXtgaitHCfaqzFOv8aKCXB+Np
 CPGeG4AATYsrUPF7XQplrbyarrqXr8AUhn+YZgObRD7b4k5AXS5c2U89Gt4C+Fo/y5t0
 Fv+xr8vUZPUZz4RsHR0MGt5Pe1sV6jJXEFxqJ6OuDoihv+GuvZUBS2D0RSXyC3vt1k1x
 jU98lLa32aTfBMdp/SeSs0sU4cRqRE0iLtrOafxOkj+58lNuoDM2xm6a+B6PXX6xSKF+
 Pjn5IuQuq0+7N0FMqotFGKJENaq0KlmoPsqQWdy5xWRJibQX/UGmsOUAxapqY6BMpgAh
 ekHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tdkYli2Tk8BaC74RTV1mONuyFgGWbPhWPhtFxhHG90o=;
 b=MgTyEnImlJjk61vnSBXjgVb7wJuhapV2GblemStp+WqVX477Mxbdvis0qh2om9D8Vp
 EbD9d6dNDqNrJyHCQsCclmV53Dvg5sffVjldnVGSps/4Wl0XD+OgN8e9wW5nrscmc23j
 p/FJNMmlLr4/rDsPHLoNv8/TplUvD/PHCraKycNuFVEfAHSQBFWuqVZrPxUOSQ2uah5v
 txAbzMfXPGqiRMgiP8ooXw9Ap/jZ4Wzogax08v6wtR6HC/Bt4RvC8GIPD+HY9EQGoW+5
 l48FcWiNg96bhkC3mMmi2AF/yRVGLCBYXWTpM69BjDVGNV+Itybe/xhkY7aOi5niCepU
 f6mg==
X-Gm-Message-State: AOAM531LCABZ/DS13ZtogmxDLBAVTGfb8LWtWosqyChpQ/X4rPEYyz8A
 ruQeCVdruwBYkiqPerBZ6O0=
X-Google-Smtp-Source: ABdhPJx11Ixc2B2fV1QdVdktFfLLwdDowr68ce5pqXOH4h+K6hptk9L6oafdhlFYOkqUCkWiSqg7eg==
X-Received: by 2002:a5d:59ab:: with SMTP id p11mr2271926wrr.238.1627545347795; 
 Thu, 29 Jul 2021 00:55:47 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id e5sm2884005wrr.36.2021.07.29.00.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 00:55:47 -0700 (PDT)
Subject: Re: [PATCH 1/3] hw/mips/boston: Massage memory map information
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210729033959.6454-1-jiaxun.yang@flygoat.com>
 <20210729033959.6454-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ee274e68-f569-627a-d764-8dac7084372d@amsat.org>
Date: Thu, 29 Jul 2021 09:55:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729033959.6454-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
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
Cc: aleksandar.rikalo@syrmia.com, paulburton@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/29/21 5:39 AM, Jiaxun Yang wrote:
> Use memmap array to unfiy address of memory map.
> That would allow us reuse address information for FDT generation.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  hw/mips/boston.c | 95 ++++++++++++++++++++++++++++++++++++------------
>  1 file changed, 71 insertions(+), 24 deletions(-)

> +static const MemMapEntry boston_memmap[] = {
> +    [BOSTON_LOWDDR] =     {        0x0,    0x10000000 },
> +    [BOSTON_PCIE0] =      { 0x10000000,     0x2000000 },
> +    [BOSTON_PCIE1] =      { 0x12000000,     0x2000000 },
> +    [BOSTON_PCIE2] =      { 0x14000000,     0x2000000 },
> +    [BOSTON_PCIE2_MMIO] = { 0x16000000,      0x100000 },
> +    [BOSTON_CM] =         { 0x16100000,       0x20000 },
> +    [BOSTON_GIC] =        { 0x16120000,       0x20000 },
> +    [BOSTON_CDMM] =       { 0x16140000,        0x8000 },
> +    [BOSTON_CPC] =        { 0x16200000,        0x8000 },
> +    [BOSTON_PLATREG] =    { 0x17ffd000,        0x1000 },
> +    [BOSTON_UART] =       { 0x17ffe000,        0x1000 },

0x20?

> +    [BOSTON_LCD] =        { 0x17fff000,           0x8 },
> +    [BOSTON_FLASH] =      { 0x18000000,     0x8000000 },
> +    [BOSTON_PCIE1_MMIO] = { 0x20000000,    0x20000000 },
> +    [BOSTON_PCIE0_MMIO] = { 0x40000000,    0x40000000 },
> +    [BOSTON_HIGHDDR] =    { 0x80000000,           0x0 },
> +};

>      /*
>       * Setup argument registers to follow the UHI boot protocol:
> @@ -333,8 +369,9 @@ static const void *boston_fdt_filter(void *opaque, const void *fdt_orig,
>      ram_low_sz = MIN(256 * MiB, machine->ram_size);
>      ram_high_sz = machine->ram_size - ram_low_sz;
>      qemu_fdt_setprop_sized_cells(fdt, "/memory@0", "reg",
> -                                 1, 0x00000000, 1, ram_low_sz,
> -                                 1, 0x90000000, 1, ram_high_sz);
> +                                 1, boston_memmap[BOSTON_LOWDDR].base, 1, ram_low_sz,
> +                                 1, boston_memmap[BOSTON_HIGHDDR].base + ram_low_sz
> +                                 , 1, ram_high_sz);

Misplaced comma.

BTW shouldn't we check whether ram_high_sz > 0 before adding this cell?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

