Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2766BDDC
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 13:31:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHOdM-0000Tt-Bm; Mon, 16 Jan 2023 07:30:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOd9-0000Kt-5T
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:30:30 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHOd5-0003XG-05
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 07:30:26 -0500
Received: by mail-wm1-x32b.google.com with SMTP id o15so19863793wmr.4
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 04:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1DrGShFOUBrrBwFrdStrnaHBL6WWyr6QwV3pjr/pd2E=;
 b=hnYflgfgyv4vVhlfLxNgEXjQu3ey12i1KFCKuc4qieSYmPp1haNK9pZ3M1mrpcuaN+
 JoAsYskXP+gYnzwuxcjy2mu0UpgfWbP/Kb5WLA0tJgrKsmu47Yxod/fXREXZOmEWU8RG
 Ji2jZy2nqWfvwqk2N5znnayLhn/ReDTwzX2MY+oFjBMzGHhRpQiM/CMJoVwyfb/iLub3
 TSfmxBhmqf3VpM1el3fSk/3o6GUEPhZRQUlgFLNvvWPRb7N4gN9Z28u5+SIpi74e6arn
 vqiDNqO2N5mSTItxt7vG8zhkX7wNC1XUQ3axE/vAFhpPIGP8yAIwC6AgkZqxtZsenv/R
 H23g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1DrGShFOUBrrBwFrdStrnaHBL6WWyr6QwV3pjr/pd2E=;
 b=I9zvw2CAYqo0wCUaqd0fljyVfJgYpdWPcoETY15S6uX+AOE9NF9JnXNiRw1Utwun4g
 ncERXo3tKCkDMQ6UrTOQHafBTCt74MgsgsHq/qzgC/Zp8GmqgEyyW9TvwxOt/CCcxRBV
 FQtRkBMsvDkp1gCgIBkeIzAistUcbWcPjumKfBbCZEkDzuHzibvBLytH2vWsBO8T17dv
 feeqxBZFWwpY76SC3LvvG0UVNI/v87DCVdyn5sPiUjusYO0Pzjqv3B+rjXtcxH9MCHAY
 sicfs5vJmi2xOBHm5z9T1HiM3l6RGGzdTjF+JaVpmWH1lt41o1l7O8T8z5oQn1OeVYJl
 waNA==
X-Gm-Message-State: AFqh2kqkPv2UlrQgqDc2atGboxYQlqLis6xliYHeDH1WW3AS4FpGKSpM
 CRrERbeeVEFOOt90lY1YM00I6Q==
X-Google-Smtp-Source: AMrXdXvIQ+oGgg2hcJoxskvQsqGHQs3RrFG9V/bapkTW4h9hL4LMrcCc3IKLJL7DY/mUXfip+4Aa+g==
X-Received: by 2002:a05:600c:3b0e:b0:3da:fa18:a535 with SMTP id
 m14-20020a05600c3b0e00b003dafa18a535mr3794376wms.29.1673872221159; 
 Mon, 16 Jan 2023 04:30:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 g12-20020a05600c310c00b003c70191f267sm41615791wmo.39.2023.01.16.04.30.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 04:30:20 -0800 (PST)
Message-ID: <0ef1b0e3-7df0-e611-0335-bf0a24690a90@linaro.org>
Date: Mon, 16 Jan 2023 13:30:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 6/6] hw/arm/aspeed: Init fby35 BMC FRUID EEPROM
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: patrick@stwcx.xyz, clg@kaod.org, peter.maydell@linaro.org,
 andrew@aj.id.au, joal@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230114170151.87833-1-peter@pjd.dev>
 <20230114170151.87833-7-peter@pjd.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114170151.87833-7-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.097,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/1/23 18:01, Peter Delevoryas wrote:
> Signed-off-by: Peter Delevoryas <peter@pjd.dev>
> ---
>   hw/arm/aspeed.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 49 insertions(+)
> 
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index c929c61d582a..4ac8ff11a835 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -922,6 +922,52 @@ static void bletchley_bmc_i2c_init(AspeedMachineState *bmc)
>       i2c_slave_create_simple(i2c[12], TYPE_PCA9552, 0x67);
>   }
>   
> +static const uint8_t fby35_bmc_fruid[] = {
[...]

> +};
> +
>   static void fby35_i2c_init(AspeedMachineState *bmc)
>   {
>       AspeedSoCState *soc = &bmc->soc;
> @@ -1363,6 +1409,9 @@ static void fby35_reset(MachineState *state, ShutdownCause reason)
>       object_property_set_bool(OBJECT(gpio), "gpioB3", false, &error_fatal);
>       object_property_set_bool(OBJECT(gpio), "gpioB4", false, &error_fatal);
>       object_property_set_bool(OBJECT(gpio), "gpioB5", false, &error_fatal);
> +
> +    at24c_eeprom_write(aspeed_i2c_get_bus(&bmc->soc.i2c, 11),
> +                       0x54, 0, fby35_bmc_fruid, sizeof(fby35_bmc_fruid));

Why transfer the prom content on the i2c bus at each reset?

In particular this looks wrong if the prom is initialized with a 'drive'
block backend (using -global).

>   }



