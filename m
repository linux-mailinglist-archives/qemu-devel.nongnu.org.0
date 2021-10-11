Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B94DF429969
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 00:24:09 +0200 (CEST)
Received: from localhost ([::1]:40830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma3iK-00060S-9j
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 18:24:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3g8-0004XL-SX
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:21:52 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ma3g5-0007EK-IR
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 18:21:52 -0400
Received: by mail-wr1-x433.google.com with SMTP id g25so14113587wrb.2
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 15:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SVjMBRpAFrFEt6QM8OaQ7tL3c1sySvze9cQ+itkUrxE=;
 b=WVCKtnimAPNgYS1fQNZdrLDzySFBdQb3HiZA0+7Xk7XCfArk+9Mk89zfcLfV1O/J1F
 dCDuR6g4XG2MSMKGaHTk9B+ummVNITitGPHtBwpNDmKajpTbGEn0US0SxVacUKNXjt8v
 n/VDZEkRsubLIy3PPN+f4GlI4t5vl1Qrnhd5Algd8jgPxV9sCKumFtl2p0P9v+ViHLhl
 E6QhcYXIFW/5XZx8X6cKZosvYZjVnTVkYBJ8WywUAbn7vk6Sy6MKprUEf16zz7KTjg1j
 kpF5EMe4GFj9i/DsSO7/xURPRzgjvD0UuN3SpYAorWOTJfJgLLD4oAETLQa5JsEIbdFa
 WFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SVjMBRpAFrFEt6QM8OaQ7tL3c1sySvze9cQ+itkUrxE=;
 b=obQBfE73v3qOACcgWTXpmDQRIZxZIXLh6A5ngdYCQHQkkUa9JfPcPCbDx5DdCo1eoy
 0LDWEuynnkn/dsQcxbwG+SmIy5J1B9iKjwU5Nz30W1wGS1m0K+Acd7hVKFfKVUTsLGi5
 zkyhrqyzEaQuKZ3rM+IeRZr1VuppBVE8fhL9Tda0J7boo7yP5IY9TtQVDFYE7Zn79A1Z
 XiDWqQohICj0fhy768wF7qZRA9fZ/wALHqQ/sb3dA3Rf3y/5nrAXLNlSo39UxtkEwLvk
 Ih9Nqm5fxqfb1fIzWlf3KCD6pBu4bDI5tSHkTjDo9RV6jOdqxsEEYZHPxt317gFxroWU
 +TBw==
X-Gm-Message-State: AOAM533CQzwp+PRCqdazdQQplZDY7VsGVnRaZkt/mxiGIAvx0fLnduDi
 ZxIssba8f2J/CajB5CRsuE8xDY07KeM=
X-Google-Smtp-Source: ABdhPJyqXXAQ13pWPomN4NPc/RmZPUw4C9rLaI50LhqFPa83VvrssHk8yuvNOaiuZl18MbM/x64Iew==
X-Received: by 2002:a1c:9dd1:: with SMTP id g200mr1792217wme.42.1633990907737; 
 Mon, 11 Oct 2021 15:21:47 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id o19sm9164128wrg.60.2021.10.11.15.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 15:21:47 -0700 (PDT)
Message-ID: <bac271eb-bae1-d13f-5605-b82559222ef1@amsat.org>
Date: Tue, 12 Oct 2021 00:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 2/4] MAINTAINERS: Add entries to cover MIPS CPS / GIC
 hardware
Content-Language: en-US
To: qemu-devel@nongnu.org, Paul Burton <paulburton@kernel.org>
References: <20211004092515.3819836-1-f4bug@amsat.org>
 <20211004092515.3819836-3-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211004092515.3819836-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paul,

You are the maintainer of the Boston machine which is the
only one using these peripherals; would you agree to be
(co-)maintainer of these files?

Regards,

Phil.

On 10/4/21 11:25, Philippe Mathieu-Daudé wrote:
> MIPS CPS and GIC models are unrelated to the TCG frontend.
> Move them as new sections under the 'Devices' group.
> 
> Cc: Paul Burton <paulburton@kernel.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  MAINTAINERS | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cfee52a3046..a5268ad0651 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -239,14 +239,8 @@ F: target/mips/
>  F: configs/devices/mips*/*
>  F: disas/mips.c
>  F: docs/system/cpu-models-mips.rst.inc
> -F: hw/intc/mips_gic.c
>  F: hw/mips/
> -F: hw/misc/mips_*
> -F: hw/timer/mips_gictimer.c
> -F: include/hw/intc/mips_gic.h
>  F: include/hw/mips/
> -F: include/hw/misc/mips_*
> -F: include/hw/timer/mips_gictimer.h
>  F: tests/tcg/mips/
>  
>  MIPS TCG CPUs (nanoMIPS ISA)
> @@ -2271,6 +2265,22 @@ S: Odd Fixes
>  F: hw/intc/openpic.c
>  F: include/hw/ppc/openpic.h
>  
> +MIPS CPS
> +M: Paul Burton <paulburton@kernel.org>
> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +S: Odd Fixes
> +F: hw/misc/mips_*
> +F: include/hw/misc/mips_*
> +
> +MIPS GIC
> +M: Paul Burton <paulburton@kernel.org>
> +M: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +S: Odd Fixes
> +F: hw/intc/mips_gic.c
> +F: hw/timer/mips_gictimer.c
> +F: include/hw/intc/mips_gic.h
> +F: include/hw/timer/mips_gictimer.h
> +
>  Subsystems
>  ----------
>  Overall Audio backends
> 

