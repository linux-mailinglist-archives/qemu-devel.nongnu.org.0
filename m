Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3E42F658C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 17:18:29 +0100 (CET)
Received: from localhost ([::1]:40066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l05KO-0000xp-BZ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 11:18:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l052u-0002Fc-6y; Thu, 14 Jan 2021 11:00:26 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:53435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l052p-0001Gv-EU; Thu, 14 Jan 2021 11:00:22 -0500
Received: by mail-wm1-x330.google.com with SMTP id k10so4969511wmi.3;
 Thu, 14 Jan 2021 08:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5XT/S1rmYl0aWz2RdxT7IxZAvLzn8PyBUJ4yxYv5shI=;
 b=BT8rT0TyBSUawHM+bnX+b+enr+CCK8H5JsispZcM83yBu7JIwgg563RdExVPTylEJ7
 k8qy1SFEYyAtSnF/b8U6f+20Y5JwpuI9Ecv05/Z8FMdePDsz1WoyjpWC2vpOqdA8VtpB
 k1g90Z8jEDVAbTMsVCB0oekZgDhzH4JoS5bccGXWjT+HrGTGy5KCRyubeCrVNZcL4zYp
 3LYXXDH9fTeEAkfHnLF4+kdZCvdM/QL1dAIQe4HYdEJsZWBCjLftriMF3KNCBjt5T22m
 d2gvXxe+hSssQ7oExRlKlNePNVN1oLUGhlqjeGnzUz4GDwVKzOmgpT6vzQWQkCkaEzCD
 OFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5XT/S1rmYl0aWz2RdxT7IxZAvLzn8PyBUJ4yxYv5shI=;
 b=uJnb4jChu02SjBzpXUbT9fAB/CFsNy/hqPyY9QVK5CJLCClUkmoE5rtp2gLnpr2rGn
 3y+0Mns6uc/ji6gH/1roLKpzRKuPFoNJLqSrfDEy8wgo08VsalHgFd0YCO2qGGKd6pFy
 UrBSLdUFV5c8BABJNxzVvoXFMUOetvK2zPUn4HmCdsazHIFBjirESGmCv5StDmeG/6+P
 +YKIgmjnrZoh8PRI7uQVyNOytgRkyd7D4yrhM3+HmuFjVsCl0VmELSxj/tCNba7oL19c
 bTPFtk9MfITRtSNcc1lqJA9ucJRf2SR1A2Z50q3m/OkQSTGDhXUYVdeJ0YAPz4m5AT/N
 C0tA==
X-Gm-Message-State: AOAM531e8jLWohCWU/eFHWifvmdlLmYg97ZlZmxt1E8LQaMeHGIXfSVc
 9N88VUgm5bLuq0LsDV6dmDk=
X-Google-Smtp-Source: ABdhPJziXEgOFCA2hXbICC05y4iYG6fN8J9F7joacO9vFAlu1/gMVI+LWcXeSIodBoctmKm4XPlOiQ==
X-Received: by 2002:a1c:220b:: with SMTP id i11mr4671626wmi.8.1610640017531;
 Thu, 14 Jan 2021 08:00:17 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id a24sm2979691wmj.17.2021.01.14.08.00.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 08:00:16 -0800 (PST)
Subject: Re: [RFC PATCH v6 00/11] hw/ssi: imx_spi: Fix various bugs in the
 imx_spi model
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210112183529.2011863-1-f4bug@amsat.org>
 <CAEUhbmVmqYzCg0Edirp4UFhLpGGWbm5jFiTjOw=0=EhnSMsz3g@mail.gmail.com>
 <74a2566b-cd32-743f-8088-c59e992be755@amsat.org>
 <CAEUhbmU4wDdjY+nEiqHFpFsa6H1vJVpAitSjKt1+p1POEAONEQ@mail.gmail.com>
 <7c8e33c2-d86a-44ef-8d4c-0f6dcf9f7b2c@amsat.org>
Message-ID: <c3782f79-10d0-1796-6b29-56f435ec96e8@amsat.org>
Date: Thu, 14 Jan 2021 17:00:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7c8e33c2-d86a-44ef-8d4c-0f6dcf9f7b2c@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.237,
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
 Alistair Francis <alistair@alistair23.me>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Ben,

On 1/13/21 6:56 PM, Philippe Mathieu-Daudé wrote:
> On 1/13/21 2:27 PM, Bin Meng wrote:
>> Hi Philippe,
>>
>>>> Unfortunately this series breaks SPI flash testing under both U-Boot
>>>> and VxWorks 7.
>>>
>>> Thanks for testing :) Can you provide the binary tested and the command
>>> line used? At least one, so I can have a look.
>>
>> Sure, will send you offline.
> 
> Arf, stupid mistake in patch 7 :) With this diff I can run your
> test:
> 
> -- >8 --
> --- a/hw/ssi/imx_spi.c
> +++ b/hw/ssi/imx_spi.c
> @@ -343,7 +343,7 @@ static void imx_spi_write(void *opaque, hwaddr
> offset, uint64_t value,
>              return;
>          }
>          s->regs[ECSPI_CONREG] = value;
> -        if (value & ECSPI_CONREG_EN) {
> +        if (!(value & ECSPI_CONREG_EN)) {
>              /* Keep disabled */
>              return;
>          }
> ---

Could you have a try at this? Do you prefer I resubmit
the whole series?

Thanks,

Phil.

