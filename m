Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CAC6504E9
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 23:08:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p71p8-0004cm-AV; Sun, 18 Dec 2022 17:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71ow-0004Ve-Ch
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:07:46 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p71op-0003LR-S2
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:07:46 -0500
Received: by mail-ej1-x62e.google.com with SMTP id n20so17721822ejh.0
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 14:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xYc085BKLthar7s8e2Ugs9Ze9XfqDetYGoVFOQLiwJI=;
 b=lgNi6x7Kk31lfUCWf1t9SCGfjoS4Z43k+klSNvg+K3azAqFA+RHeIyjLajYkNDnz0C
 Ez4j2rhS3XmaasWK3dqhdNk6ghYT6quy7akS5YY/awpK5qXbo+Lk0FWsK7o85cQBidkE
 fjiIrtCgNLETTAksQUAMcrsj2RFxroq/r7/rPJFa4ksyM3N7c4JR72UVa1qho9xALipf
 zKd1+/FUDCXtJ+Vvrcu14RqTeyjGoUAxXqafa8kmLYm4oPdCoePrREQrUHDIkZvt2lr5
 bXgtYE6LtdX6tncT5YrVNF+Ikssph97hv2fQsvwjp3vqCnV+zeWjo1H1/7V0TWLXPABo
 rR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xYc085BKLthar7s8e2Ugs9Ze9XfqDetYGoVFOQLiwJI=;
 b=cCc3nWB8jeE6Sz7uphVxfn3UPkLhbJECqRkQZqkWvTRKcEESepup9DcuLtNF/CsrmI
 zrIlVVf2PNTFagY3W5T1jc7vpnRaFZfg5aFNfBLrXupx8BuzVRw9vsvh90GNaWHclpPz
 lYdTP3gAGv9QgRbETbhstSDw6iyvc2vL5OWZW83GlXuEfU2zS7Qo29u1gUTUykfNb9Hr
 FUhPMIFFCFVoDgf9Nz8uvAK5qJKj9Ohud7BAnDtiUYUYhWabbEeNI9t1NkxnBxcKUyPS
 vmtBlpz1Q8RGyfSwyz87bYUOfwew2jdYJsZg5wG0DioVMcM/asU13LYzQIk+GQLb9Tg2
 nKWA==
X-Gm-Message-State: ANoB5pm5t2lHYS2UW6ZO6TgTdf1YkBwwNdMiFzUMyRNZO9mIrgO+sH7w
 JV5tUCo87nQt1zELogXRbJVfPw==
X-Google-Smtp-Source: AA0mqf7zT4v7Ji+/1Z22EcY8yBYoED4mMfxV18mRmbdLZ47Yq2xxNzW+NkDjzMu71mJ45syncjAXyQ==
X-Received: by 2002:a17:906:2a1b:b0:7ae:1724:88dd with SMTP id
 j27-20020a1709062a1b00b007ae172488ddmr33765133eje.73.1671401257510; 
 Sun, 18 Dec 2022 14:07:37 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a1709063cb200b007be3aa82543sm3589623ejh.35.2022.12.18.14.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 14:07:37 -0800 (PST)
Message-ID: <df665471-7426-f313-aece-75b8638e0da4@linaro.org>
Date: Sun, 18 Dec 2022 23:07:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 4/7] hw/misc: Allwinner AXP-209 Emulation
Content-Language: en-US
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
References: <20221218211918.3592-1-strahinja.p.jankovic@gmail.com>
 <20221218211918.3592-5-strahinja.p.jankovic@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218211918.3592-5-strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
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

On 18/12/22 22:19, Strahinja Jankovic wrote:
> This patch adds minimal support for AXP-209 PMU.
> Most important is chip ID since U-Boot SPL expects version 0x1. Besides
> the chip ID register, reset values for two more registers used by A10
> U-Boot SPL are covered.
> 
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---
>   hw/arm/Kconfig              |   1 +
>   hw/misc/Kconfig             |   4 +
>   hw/misc/allwinner-axp-209.c | 238 ++++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build         |   1 +
>   hw/misc/trace-events        |   5 +
>   5 files changed, 249 insertions(+)
>   create mode 100644 hw/misc/allwinner-axp-209.c


> diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
> index 052fb54310..3855d937fd 100644
> --- a/hw/misc/Kconfig
> +++ b/hw/misc/Kconfig
> @@ -180,4 +180,8 @@ config ALLWINNER_A10_CCM
>   config ALLWINNER_A10_DRAMC
>       bool
>   
> +config ALLWINNER_AXP_209

This controller is not specific to AllWinner. It can be plugged on any
i2c bus. Please rename it AXP209_PMU. Otherwise LGTM!

> +    bool
> +    depends on I2C
> +
>   source macio/Kconfig
> diff --git a/hw/misc/allwinner-axp-209.c b/hw/misc/allwinner-axp-209.c
> new file mode 100644
> index 0000000000..cf79175034
> --- /dev/null
> +++ b/hw/misc/allwinner-axp-209.c
> @@ -0,0 +1,238 @@
> +/*
> + * AXP-209 Emulation
> + *
> + * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

