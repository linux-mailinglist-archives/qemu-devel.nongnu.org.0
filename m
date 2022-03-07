Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1954CFC27
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:01:28 +0100 (CET)
Received: from localhost ([::1]:34088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRB7H-0003RT-Gy
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:01:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAUY-0000oM-Le; Mon, 07 Mar 2022 05:21:26 -0500
Received: from [2a00:1450:4864:20::334] (port=40785
 helo=mail-wm1-x334.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAUW-0005kq-QK; Mon, 07 Mar 2022 05:21:26 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 bi14-20020a05600c3d8e00b00386f2897400so5259403wmb.5; 
 Mon, 07 Mar 2022 02:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=n4Vp7r6Brvg3k3EscdgMQn6cQy0JpnRXcuiHkDJoJ/8=;
 b=nzcXFyVhbOEcLfeLeSmrw/RUF8HZULLZGbwRe5AMfWJ/1zTdVXcAZFXLA44ADmqiTq
 gpkD+SeUPnIED4W4tPkqnE9vLppeE/P0Wcwt8kScoIW4YSliusBf7yTJZ8nC/pFvCUiL
 vE6D164/mg6+yNxqSyMukamrgCL+hZHeBaULRLNlxi4aKtdx6HqAQTpWwD4fQlW3flSs
 nzb3JsvKc4+PWeaKHL/EmL8q97WxM6nVXEwMSut2N0Q6UY31U341K+aDSuqBaLWRkB8N
 hQ3Zb+KUtctBbUoLyyl7kag03Q+UVareki12WSdS1yBletYZZLwKSS/f9JfjqfM3x9mZ
 cmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n4Vp7r6Brvg3k3EscdgMQn6cQy0JpnRXcuiHkDJoJ/8=;
 b=uL3YezJxiO2cwMTv5IDhDRgmbcyiG8ZnosFRId6/e42wOtC4+vQ8iLyTeYJqruj+DO
 v1M166xYVLkZOpC+Id/u05vtYQlCK0ULnn/uRDvPqPag3fnwQcyDgG+4GyhOHgJMQCo8
 7B8TnzwBcqcp6xpQvLoIYr3Ps/U/faiDiS0T9wUPIP1HqBXxY17hxC/AqC5k1IN15Bkf
 s9x3eUEhxfNd+l32HBDJGSBFskPsIfnggiaPxcdp9Aj+a+cLscWzXEBOeKTIJNdCGrYQ
 8EoZq7M2TYR/0zeUJPmZ2VyaQ2FG5ZMyIJM/KYe9wHzdEt+irQ0wBufw/JpM2FtIy/m4
 lTAg==
X-Gm-Message-State: AOAM533Ag8SNjGOwFGVTvIUqt50itYLeLon6UARzX6nVNKcZv5kMhg4F
 l7yoR1qsii0z5M/vaiNQw0s=
X-Google-Smtp-Source: ABdhPJwUHxCiWQaQo1fqwO0cm/6QyFCbSqCSUrwWqX7P8cL3uI0p4/fKIp0aCTQpBv1a0VzaUkz3ZA==
X-Received: by 2002:a05:600c:3c9b:b0:380:be98:6204 with SMTP id
 bg27-20020a05600c3c9b00b00380be986204mr17070878wmb.121.1646648483060; 
 Mon, 07 Mar 2022 02:21:23 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a5d674b000000b001f047c49e99sm11045362wrw.2.2022.03.07.02.21.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:21:22 -0800 (PST)
Message-ID: <2623a97f-503e-8985-f1ba-e0315226aa42@gmail.com>
Date: Mon, 7 Mar 2022 11:21:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 4/6] aspeed/smc: Rename 'max_peripherals' to 'max_cs'
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-5-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307071856.1410731-5-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::334
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/3/22 08:18, Cédric Le Goater wrote:
> The naming makes more sense in a SPI controller model.
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   include/hw/ssi/aspeed_smc.h |  2 +-
>   hw/ssi/aspeed_smc.c         | 42 ++++++++++++++++++-------------------
>   2 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/include/hw/ssi/aspeed_smc.h b/include/hw/ssi/aspeed_smc.h
> index 4a9354e13c7f..6501a04b8f3e 100644
> --- a/include/hw/ssi/aspeed_smc.h
> +++ b/include/hw/ssi/aspeed_smc.h
> @@ -95,7 +95,7 @@ struct AspeedSMCClass {
>       uint8_t r_timings;
>       uint8_t nregs_timings;
>       uint8_t conf_enable_w0;
> -    uint8_t max_peripherals;
> +    uint8_t max_cs;

Can we use 'cs_num_max' or 'cs_count_max' instead?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

