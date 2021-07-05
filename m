Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AEF3BBE54
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 16:39:01 +0200 (CEST)
Received: from localhost ([::1]:35374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0PkR-0006ge-Tx
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 10:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0Pj2-00057A-AQ; Mon, 05 Jul 2021 10:37:32 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:40696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m0Pj0-0001Q3-NP; Mon, 05 Jul 2021 10:37:31 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 h18-20020a05600c3512b029020e4ceb9588so972204wmq.5; 
 Mon, 05 Jul 2021 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LppOIR9ZmFRBZNwuvu6fjl7ofcQk/QqnRSKrtpEoIHs=;
 b=Qtz1Qdd/AnidMC7mS1aHPCC6M0/vfsoTKSlqRATd6vYHDvB90+2idLdaOkjm2O1Ier
 ataQb48jLwhgBw3YLJvsAZqcP/iCJ7RR4vYiJYjMSWy4hk9MZijPqm4y5ViHgA+V8E6h
 tQejVbEruUizU2obQGOp5YbsAgGBt52qgFFJ5nHWcmdrmWy04opw8BYmkVTukDMsXtIY
 +E1YL3KC6oI7qr6pBSxNLWRVlrUmpxwO7/daCbNnFFhhyuGbEWQWruq5DY3yOoi/yTeo
 xp3CALKynQEITqeKb6OSyWVC2foUJp4yOLelXslLLZ9k15dAG8t/eudzkHEBYxIFmlcP
 /kNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LppOIR9ZmFRBZNwuvu6fjl7ofcQk/QqnRSKrtpEoIHs=;
 b=Nndiao5SdDnM1vuDCD1P8tcwpglDvdwAayypnEgkGOCITCrbKUYYpFKXddcw5EXCRX
 okzpSFU/KThUMKEmH1kQrPIbM6wydV9Dj+BjfXxvI79Af/TPRRktavBU5pGm4QZhLC0+
 SWgIyMnneiMov/0Xry6TV47DSUKFznsnJAtjdu+lvpDdIx7iqzDTDC90WaQbkm4GGLQB
 arYwRKrgckKdwCOqxfoJDW7hypEbB/0ClDnknDNKN2NSbugXELyboyQDYdp52VLbTaVF
 ms8oWM64+InAJT924r1G1B6jQGYIFG35DULhvOFTlQ4oPRny4m/0K9a+hClDpp+/vSc4
 iuFg==
X-Gm-Message-State: AOAM531K6kqEIPb36OMvJlFgU+2fCrWcNA3vUUVEgPVvuPLPRedC3zeC
 2oxCuUdUSYWR/eAThk0QBb8=
X-Google-Smtp-Source: ABdhPJwrCnI6VV72DknLCgCuGO5bo1lw9Zqfs3uBlYZHts8Em5JDgxFqdkvdQ/o3ehq1N1VPa7+Hzg==
X-Received: by 2002:a7b:cbc5:: with SMTP id n5mr15822033wmi.39.1625495848823; 
 Mon, 05 Jul 2021 07:37:28 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z7sm11150318wmi.1.2021.07.05.07.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jul 2021 07:37:28 -0700 (PDT)
Subject: Re: [PATCH 2/3] docs: Add skeletal documentation of the emcraft-sf2
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210705122011.753-1-peter.maydell@linaro.org>
 <20210705122011.753-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <706f629c-4780-552a-fac0-53ab4002db21@amsat.org>
Date: Mon, 5 Jul 2021 16:37:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705122011.753-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Rob Herring <robh@kernel.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/21 2:20 PM, Peter Maydell wrote:
> Add skeletal documentation of the emcraft-sf2 machine.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/arm/emcraft-sf2.rst | 10 ++++++++++
>  docs/system/target-arm.rst      |  1 +
>  MAINTAINERS                     |  1 +
>  3 files changed, 12 insertions(+)
>  create mode 100644 docs/system/arm/emcraft-sf2.rst
> 
> diff --git a/docs/system/arm/emcraft-sf2.rst b/docs/system/arm/emcraft-sf2.rst
> new file mode 100644
> index 00000000000..9f10b86427a
> --- /dev/null
> +++ b/docs/system/arm/emcraft-sf2.rst
> @@ -0,0 +1,10 @@
> +Emcraft SmartFusion2 SOM kit (``emcraft-sf2``)
> +==============================================
> +
> +The ``emcraft-sf2`` board emulates the SmartFusion2 SOM kit from
> +Emcraft (M2S010). This is a System-on-Module from EmCraft systems,
> +based on the SmartFusion2 SoC FPGA from Microsemi Corporation.
> +The SoC is based on a Cortex-M4 processor.
> +
> +At the moment only the system timer, system registers and SPI
> +controller are modelled.

Also UART and EMAC :)

> diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
> index 0a3ef309472..d316e684106 100644
> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -86,6 +86,7 @@ undocumented; you can get a complete list by running
>     arm/sabrelite
>     arm/digic
>     arm/cubieboard
> +   arm/emcraft-sf2
>     arm/musicpal
>     arm/gumstix
>     arm/nrf
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 76a2c608d1e..dbbd71958ac 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1007,6 +1007,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/msf2-som.c
> +F: docs/system/arm/emcraft-sf2.rst
>  
>  ASPEED BMCs
>  M: Cédric Le Goater <clg@kaod.org>
> 


