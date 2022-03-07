Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096644CFC7E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:17:36 +0100 (CET)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBMt-0005Rt-3T
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:17:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAV8-0001v2-LW; Mon, 07 Mar 2022 05:22:02 -0500
Received: from [2a00:1450:4864:20::32d] (port=36388
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAV7-0005sS-9F; Mon, 07 Mar 2022 05:22:02 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 h127-20020a1c2185000000b003898fc06f1eso102991wmh.1; 
 Mon, 07 Mar 2022 02:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BlQMjy4mGCEF9d6fQa+rvUeu0OeQVFwNd42LJKCEUeI=;
 b=kvg6G/vQ5j2PzrVJSFtjfWkAwdHZU1v8DTETkf1MKbJReG2KkM9oyyPb3FE5SqaHtK
 +Cr8KyO0axoJu0XIyuRHro2zMlc07auNXhwlpQVS1fcwDVpBBbjHSb18cM/OehUZWfQY
 gn3owApfE7UrqUMqT+6eCfSAWpe8OML/sqHKI0R3rB/9lU68reqlL8pdAQgPXh1CHw0W
 20GcndVQq6n3LvVe2rR83R8HG5OHcUEQ6ohboF+z6I4KA/dG0k7Q6yHzdsMFFFo63x7/
 RjrI6Ii9FUu2WoR26lqf1ifna+dA42mC8CDn/Yhha3dZfdp+SOLF0Q5/TJ3zNwIKTnP2
 EBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BlQMjy4mGCEF9d6fQa+rvUeu0OeQVFwNd42LJKCEUeI=;
 b=kRVY46dqaQNPeHe71wQsRxRvxNbmj/tQKMPtq5PWN1nWI5zUTbrLSl7vAq5SVE0iIu
 VdW8UCRhdzsCw6nAW/ABAW9RpvPg1w5ozvt2LydjrMEUwUMiyPUlC8u5E4rOAYIBHfRh
 LZG2OLVVIWRHbQYjf4FMNcQjKHkD9O5SY/FQqNmj0yGqND0TE3GBpdB1P2LKrjXScBSD
 E67IDXvuMNT0Ng0wqyUinRiXh54A80RHDfLoI8hvbOiO2dy+VKJsndpN2ONP3HKQXGA/
 YyRXr3oRd79GG2iVMZvVweldylo493BN37xwd/WlwMJh3n1LBUva3u97ZLE4T2RbRum9
 IU6A==
X-Gm-Message-State: AOAM530pIu7/l6pU8OkbhqHQ7wRLRts0ezq6RLw+SvJ25PvhzTSHd8Ho
 AXTxIbMpvhYi5VPCWfkroVo=
X-Google-Smtp-Source: ABdhPJynSv4dj+X0dFPnR7U5R4akDTruZ4aAljZuXMSfoJgfyxQLlx+uRl9DPnOc24hso9/yP734pA==
X-Received: by 2002:a7b:c5d6:0:b0:381:4127:84d3 with SMTP id
 n22-20020a7bc5d6000000b00381412784d3mr17635257wmk.24.1646648518679; 
 Mon, 07 Mar 2022 02:21:58 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p16-20020adff210000000b001f062b80091sm9814801wro.34.2022.03.07.02.21.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:21:58 -0800 (PST)
Message-ID: <0fe56065-4ceb-c9db-8231-1a7ae441dbce@gmail.com>
Date: Mon, 7 Mar 2022 11:21:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 2/6] aspeed: Rework aspeed_board_init_flashes() interface
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-3-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307071856.1410731-3-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
> Currently, the allocation of the flash devices uses the number of
> slave selects configured in the SoC realize routine. It is simpler to
> use directly the number of FMC devices defined in the machine class
> and 1 for spi devices (which is what the SoC does in the back of the
> machine).
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/arm/aspeed.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 02918a594d24..be24508a9854 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -276,9 +276,8 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t rom_size,
>       rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
>   }
>   
> -static void aspeed_board_init_flashes(AspeedSMCState *s,
> -                                      const char *flashtype,
> -                                      int unit0)
> +static void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
> +                                      int count, int unit0)

'unsigned count', otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

