Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E06309BFB
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 13:34:08 +0100 (CET)
Received: from localhost ([::1]:46200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Bvb-0006V2-Mc
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 07:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6Btb-0005TU-FD; Sun, 31 Jan 2021 07:32:04 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6BtZ-0005Zx-Qe; Sun, 31 Jan 2021 07:32:03 -0500
Received: by mail-wr1-x432.google.com with SMTP id d16so13532058wro.11;
 Sun, 31 Jan 2021 04:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k5JMa0AuMQ5zNAh1DKBCn904vYAejWRzzqIP53M8nVw=;
 b=Ha3/fcdJR6PMcFWNGbMzq5PKC8u7RUkC90Svf1iNXGpaYZjkU5hYa41jujxQXz07/H
 21Zpu2MCCk16Z4loWJjULKlXOR61WvgML3mOU2LX9MhRQybfjO0neZH/68stX3e08hK7
 7eG5kUgI+5i0QnJ3XYoqBC4IFeq7HByiwwwfl6nm7qDBGOFaTrV6bZCqWH4PZO2ElerW
 uBQlGSyPDSHy1fWQSsrLni4iP4EVQaPCjbscjnIBcIP26GTkFvzr4KstUrwDeGEMUBJm
 Lgo4hxuM1BYt4vvjk+hvWWDeBksOJ5MoTC0V93inam7mzujZNnuFuvVPjvkJyWx23vEn
 vTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k5JMa0AuMQ5zNAh1DKBCn904vYAejWRzzqIP53M8nVw=;
 b=S9PK/ChfCtsRnYXukjnIIt8WFSFEBudkOS2/ZsklX3Geuy+zVE6WgV2QJrWYmDDFNL
 VK3h+TBx3uCYn4W3u3v2co6pYwsQ4OSuRdfBkk/fzstZ7DIzgt/rmEpAwaOEo7e46XwP
 yG1KZKc/1RiYXQCCwknRM7Fzu5cmFjwdblj2oTGTMwzgpnlty58qwyf6o6HetjFHWLAS
 6Dd7KLvvriEKhp/LqBAjJKZc43AVG/4FQ7yJ2yNbs4U8f1ELdyai5GmerRUbr3vDNMnn
 VlwNoI+K7dRUex026H/t6D7dwxLzaFnu6chJPfjE8ZyNOtHEfoI0HHh/VEpYqsDNoXso
 e/gQ==
X-Gm-Message-State: AOAM532nakIhJXc/+2qpqvEdUT7mX0Ok1SS6tHxJFAStZzeNhhZclZgT
 rkKdHKGmHzhy3dbAF72UIy8=
X-Google-Smtp-Source: ABdhPJxx1Yq0G1qNJREk5beS0j6CmxnHuevyGU2oR/1UDrrqpn9EKWMHwYGFLVcZN7Mtr4w4+dtGkA==
X-Received: by 2002:adf:e511:: with SMTP id j17mr13465047wrm.17.1612096319701; 
 Sun, 31 Jan 2021 04:31:59 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id m22sm22890806wrh.66.2021.01.31.04.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 04:31:59 -0800 (PST)
Subject: Re: [PATCH v2 6/7] hw/arm/xlnx-zcu102: Restrict ZynqMP ZCU102 board
 to 64-bit build
To: qemu-devel@nongnu.org
References: <20210131105918.228787-1-f4bug@amsat.org>
 <20210131105918.228787-7-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5cb160b9-f9a4-05af-9a94-ade51bf4beb7@amsat.org>
Date: Sun, 31 Jan 2021 13:31:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210131105918.228787-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/31/21 11:59 AM, Philippe Mathieu-Daudé wrote:
> The ZynqMP ZCU102 board only use the Cortex-A53 CPU, which
> is only available in the 64-bit build. It is pointless to
> have this board present in the 32-bit build where this CPU
> is not available.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> ---
>  hw/arm/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/meson.build b/hw/arm/meson.build
> index 059ff7382f2..345099f5a1b 100644
> --- a/hw/arm/meson.build
> +++ b/hw/arm/meson.build
> @@ -41,7 +41,7 @@
>  arm_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_peripherals.c', 'bcm2836.c', 'raspi.c'))
>  arm_ss.add(when: 'CONFIG_STM32F205_SOC', if_true: files('stm32f205_soc.c'))
>  arm_ss.add(when: 'CONFIG_STM32F405_SOC', if_true: files('stm32f405_soc.c'))
> -arm_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))
> +arm_ss.add(when: ['CONFIG_XLNX_ZYNQMP_ARM', 'TARGET_AARCH64'], if_true: files('xlnx-zynqmp.c', 'xlnx-zcu102.c'))

Please disregard this patch, it shows that my other patch
"meson: Introduce target-specific Kconfig" is incorrect:
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07989.html
Probably because per docs/devel/kconfig.rst "devices are usually
``default y`` if and only if they have at least one ``depends on``".

I'll try another approach such:

-- >8 --
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -389,6 +391,8 @@ config XLNX_ZYNQMP_ARM

 config XLNX_VERSAL
     bool
+    default y
+    depends on AARCH64
     select ARM_GIC
     select PL011
     select CADENCE
---

