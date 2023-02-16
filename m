Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB183699765
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:28:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfEw-00046B-Q6; Thu, 16 Feb 2023 09:28:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfEu-00045Z-Lr
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:28:00 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSfEt-0000q3-4c
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:28:00 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1794902wmb.5
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UphD501LV9nRiE7X4Zi4rgSHUT7gzWe9G/z0VbgkVlc=;
 b=hkTXtDI6XADzChw2XtPD5Uiwr4VxVKL86PJiHLyfH+xqqHdaAzln5PMDdLr119cZTh
 D1XJT7Ajx0ZHMurSTTUdOX6bkmbkGoiCkn84gFe5TVpnBQIEldUs0vliehXZlclMUy4P
 J2ypWwW/lS2kE7xFohOhoMDjVd1VC9z/Yp1xIhooWm9KeDj2vxj20MqEWAPSQ0XZZDkj
 KRvu6GkB2e2TkWRkIH+AAY39nD4DeZ8Yj7txw5d+PLbhWoFscRlxb9gTO1ea3a2trG7W
 Qn1TwlcTYD5sfJ9oN2OsuCSDiAyGDwxc4dtg8DSGO+m3sdnt5Rg2bBO9fVpQokmRwgWe
 S0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UphD501LV9nRiE7X4Zi4rgSHUT7gzWe9G/z0VbgkVlc=;
 b=seGteSDxmRNCJQq6bn9ySLFpwFjuNBsreNOLh2EhmuwnjFRpObTYadUWg4FdC+9P/W
 t2+GG+tLPyE3QNY0zg/M5j7skXmD/A0/CeNRg3X6/wmFHQ3lOyVQC/wMdYiu/d+iAoEb
 qq6jmqyknyAiXZppNIiIKuol15Qd4vqmkESrIfo13GL5DkswcnvPYZRRfVooo6SCiEVg
 f1HGCEKGuafwpHcSkbgzU3Wr3CyThEZsr2WtpHe5S9tCU8cw41Set7v/DJmPPxDNYyM4
 AiquRYAO/ndS1sUJXEZYc20lpv5otIQKEyO7itdkfcff3D7qG2ywgRWW8VzZITblxyXn
 0yoQ==
X-Gm-Message-State: AO0yUKXzcdsaMkdBNP+FSWwHuWJPWYKiAo7jsrLQ5JymF4Pg7hFHi0QQ
 k+Qr5uFY90Xylhs0e3/DRxGK8A==
X-Google-Smtp-Source: AK7set9nOuqmzsOZNHJXjGIcdIMlSaUFII2yzenO7HLpGo9h5SHBDTB14FNEcFyBsNdPVz3QepakUA==
X-Received: by 2002:a05:600c:992:b0:3e1:fff7:e970 with SMTP id
 w18-20020a05600c099200b003e1fff7e970mr4931701wmp.30.1676557677644; 
 Thu, 16 Feb 2023 06:27:57 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o2-20020a05600c378200b003dfe5190376sm1894071wmr.35.2023.02.16.06.27.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 06:27:57 -0800 (PST)
Message-ID: <2e46db2f-d48b-bc6e-85d8-1fa80ef4082c@linaro.org>
Date: Thu, 16 Feb 2023 15:27:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3] Adding new machine Yosemitev2 in QEMU
Content-Language: en-US
To: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>, clg@kaod.org,
 peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230216133326.216017-1-pkarthikeyan1509@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230216133326.216017-1-pkarthikeyan1509@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
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

On 16/2/23 14:33, Karthikeyan Pasupathi wrote:
> This patch support Yosemitev2 in QEMU environment.
> and introduced EEPROM BMC FRU data support "add fbyv2_bmc_fruid data"
> along with the machine support.
> 
> 
> Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
> ---
>   hw/arm/aspeed.c        | 31 +++++++++++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.c | 23 +++++++++++++++++++++++
>   hw/arm/aspeed_eeprom.h |  3 +++
>   3 files changed, 57 insertions(+)

> +static void aspeed_machine_yosemitev2_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
> +
> +    mc->desc       = "Facebook YosemiteV2 BMC (ARM1176)";
> +    amc->soc_name  = "ast2500-a1";
> +    amc->hw_strap1 = AST2500_EVB_HW_STRAP1;
> +    amc->hw_strap2 = 0;
> +    amc->fmc_model = "n25q256a";
> +    amc->spi_model = "mx25l25635e";
> +    amc->num_cs    = 2;
> +    amc->i2c_init  = yosemitev2_bmc_i2c_init;
> +    mc->default_ram_size       = 512 * MiB;

Odd indentation

> +    mc->default_cpus = mc->min_cpus = mc->max_cpus =
> +        aspeed_soc_num_cpus(amc->soc_name);

Here too. What about:

        mc->default_cpus = mc->min_cpus = mc->max_cpus
                         = aspeed_soc_num_cpus(amc->soc_name);

I suppose Cédric can fix when applying, no need for v4.


