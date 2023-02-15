Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C376697A47
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 11:56:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFSB-0005GJ-DM; Wed, 15 Feb 2023 05:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFS7-0005Fh-4m
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:55:55 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFS5-0008Tc-Db
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 05:55:54 -0500
Received: by mail-wr1-x433.google.com with SMTP id k3so11048149wrv.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 02:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fZu3T1bkA1+2T05879TpRUDfbanaAuof9qK1g1ByC3I=;
 b=WuKBbcwTF+FStd2MgXeej2C0EV9lsekCEFrsWUPHenzRcIVoxvEcNPhac1r+p59SNb
 K1/b/6VxcvE9FduomfECoAn6fv/wkRgWTNqURPPM++F0T3Qyo5gxypR4z+lcoRYD12u2
 bOMvuJWE2xGqxBMkE/oS1yJSJiApbPrUngEvKcGehAh2vzklYQzdnsyVDY0/zs/ZMdPN
 /Zo4heBgjAtYPDnl0j21J2VO0zm00wVJMCOeeSw46kYzOOwQkVeH+jthVcCXXbw+/9J2
 kBkCYB3aQ4tuAUWv44DjgYHgGa+lfKZngDA5017rZrjVxeWF5Xmn9intCadJNupKPy8L
 V4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fZu3T1bkA1+2T05879TpRUDfbanaAuof9qK1g1ByC3I=;
 b=Va5METN81nSmdvjI5ev6hee/yoXwBtA8wjbfusF0ez36xuS8uHqXFNc/kbCxKBhAU7
 e1TK2/PqMrsKTXxRq2s+XUbd9KtTvJKVr0els7myCQGCIS1BLis+669IMni1v70sJpgn
 evnNA9TsDkAvabVlul2ozOly2FQ5wioyMsB+CrGsNHSlwW/KfZunI/plJUrIGDtRvYfB
 k0YpqapDPqPpjJr8ZzLRb2YwJlM2K7Nc8QY1qNXJKkUUvuGUlg1KK8v3Phzl7DvyPG21
 cjvDiGMBsCUGk/IajUpEAUAvDdpL1u30VYgEMRIUF6LMn2vki3yPMju0o0qaczutvyB/
 +BWg==
X-Gm-Message-State: AO0yUKWYVdMkPvOOoXmLCRXfAVd7ID90TuZYW+x+vmFLIhDRmP+pa9hx
 2MukRfi3QR9BMuxfV0eMG6Fruw==
X-Google-Smtp-Source: AK7set93a9PhHljI201mkKlAmxylKFihqIDh4Fp/aX+seJkf/6OqqFW4ITCtAE+Cv/qUDubCct/pgw==
X-Received: by 2002:a5d:4ec6:0:b0:2c5:53e1:7417 with SMTP id
 s6-20020a5d4ec6000000b002c553e17417mr1104216wrv.23.1676458552015; 
 Wed, 15 Feb 2023 02:55:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b002c563b124basm4004132wrw.103.2023.02.15.02.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 02:55:51 -0800 (PST)
Message-ID: <e268d089-259f-07f2-6429-9eff461992f4@linaro.org>
Date: Wed, 15 Feb 2023 11:55:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 3/8] hw/misc: add a toy i2c echo device
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Klaus Jensen <k.jensen@samsung.com>
References: <20230214171830.681594-1-clg@kaod.org>
 <20230214171830.681594-4-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230214171830.681594-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 14/2/23 18:18, Cédric Le Goater wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Add an example I2C device to demonstrate how a slave may master the bus
> and send data asynchronously to another slave.

What a rebellion...

> The device will echo whatever it is sent to the device identified by the
> first byte received.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> [ clg: - Changed to build to use CONFIG_ASPEED_SOC since only supported
>           on such SoCs
>         - folded in these fixes :
>         	 https://lore.kernel.org/qemu-devel/Y3yMKAhOkYGtnkOp@cormorant.local/
> ]
> Message-Id: <20220601210831.67259-7-its@irrelevant.dk>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/misc/i2c-echo.c  | 156 ++++++++++++++++++++++++++++++++++++++++++++
>   hw/misc/meson.build |   2 +
>   2 files changed, 158 insertions(+)
>   create mode 100644 hw/misc/i2c-echo.c


> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 448e14b531..3eb1bda710 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -129,6 +129,8 @@ softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
>   
>   softmmu_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_ahb_apb_pnp.c'))
>   
> +softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: files('i2c-echo.c'))

s/CONFIG_ASPEED_SOC/CONFIG_I2C/ since this is a generic device.

>   specific_ss.add(when: 'CONFIG_AVR_POWER', if_true: files('avr_power.c'))
>   
>   specific_ss.add(when: 'CONFIG_MAC_VIA', if_true: files('mac_via.c'))


