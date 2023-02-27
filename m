Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE3A6A4301
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:37:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdgf-0002Qc-7L; Mon, 27 Feb 2023 08:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWdgY-0002FO-3A
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:37:00 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWdgW-0000Li-6m
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:36:57 -0500
Received: by mail-wr1-x430.google.com with SMTP id bt28so6241761wrb.8
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 05:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZQ2vrDZNBIsBSNb8eZfl8obWkEBYq4wdGAnGqJmvtwg=;
 b=uOFohQpziXBAU0D9SGHCow3EsJIqS6N5R38I3C9fyBAOEaAhaDHztbbKHkkARxYzlk
 R9k+aplI2sVeoEsrszc3SOe6yeZzvqDBFkhHUUGDiLjZ8pTI9ckwToOR8PEERIDMzhWr
 Td/I/zCrxxQ617A+MY03VX0T5enYzs1CoLz47cRgPbB3jctdkRrHUFtMMS1Yp5DiR97g
 WqXJ9CZq3t2AjJuRNBb6YDITy13VmSYC8uUb8Jc1kYKB0RQrOaAjH03pm81hrCjZTslp
 Rm2F/bKNjzzlnAVay5Zevhpx6ENE1Drfeq0m5UeVQxdY4p4T9X3ySCGXnn1PMKd6AlEJ
 3rhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZQ2vrDZNBIsBSNb8eZfl8obWkEBYq4wdGAnGqJmvtwg=;
 b=w3GOUa3zu0IyBZtTdpHzm45CYoN6AYfMnDUXIMevYwv2zx9KnRb6R7pksaxVO/q2vp
 D6WkP5QcN/qBj6pVP3H/1juTrIyzGhkG+kJCx75E9UhJH2iUzauK+KxabLgZmo+rNqGl
 tR2/dskLSpNR0Jv9DN/mE6hpYdZrkgfrC20vnR8isj0Ii6+QJ3Imb07DQfvXpreTGpSA
 V1rvx3V3djSs26bbp3q9BZnpwMl8NAl4AVQ+gOAwwyzhagfEvTpJ+cENJ7tqU1CaA1M0
 aRrd6UoO4QYKmMm3Kz2LPthBdnlS2mXGlZcFteAz8vLO0uuiPg8x+ACzAd6eU9Y69iAc
 Gmsg==
X-Gm-Message-State: AO0yUKV0vKgeKGSERIxZsO+wjA8bask/8NwdMDdBCamlDqCEVsN66LXh
 p4DdE18qwHtQrmCDaxGzR61t8S9OR/ZexAwQ
X-Google-Smtp-Source: AK7set/MuLQtA7HsvATf8PuxEFWk2B9CxzBdKKljA6H2Xiecho2VSE43vdUyIrj20C3ACP2xmb0TQw==
X-Received: by 2002:a05:6000:5c1:b0:2c5:4ca3:d56c with SMTP id
 bh1-20020a05600005c100b002c54ca3d56cmr5797965wrb.0.1677505014578; 
 Mon, 27 Feb 2023 05:36:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b6-20020a5d4b86000000b002c5691f13eesm7085390wrt.50.2023.02.27.05.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 05:36:54 -0800 (PST)
Message-ID: <efb25519-b134-e8d0-14ac-58189b39103d@linaro.org>
Date: Mon, 27 Feb 2023 14:36:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 12/15] hw/display/sm501: Unify common QOM properties
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-13-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203145536.17585-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 3/2/23 15:55, Philippe Mathieu-Daudé wrote:
> Since now PCI and SysBus properties are identical, unify them.
> 
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/display/sm501.c | 11 +++--------
>   1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index efebd93f1e..98375138b2 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1975,7 +1975,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>       /* TODO : chain irq to IRL */
>   }
>   
> -static Property sm501_sysbus_properties[] = {
> +static Property sm501_common_properties[] = {
>       DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
>       DEFINE_PROP_END_OF_LIST(),
>   };


> @@ -2062,11 +2062,6 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
>                        &s->state.mmio_region);
>   }
>   
> -static Property sm501_pci_properties[] = {
> -    DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),

Patch is invalid:

$ ./qemu-system-ppc -S -M sam460ex
qemu-system-ppc: Invalid VRAM size, nearest valid size is 2097152

> -    DEFINE_PROP_END_OF_LIST(),
> -};



