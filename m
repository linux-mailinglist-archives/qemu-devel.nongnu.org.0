Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD24A3EA4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 09:35:15 +0100 (CET)
Received: from localhost ([::1]:46382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nES9a-0003g0-2A
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 03:35:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERkx-0006Kp-Ty
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:09:49 -0500
Received: from [2607:f8b0:4864:20::434] (port=41884
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nERkw-0004Fr-Co
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 03:09:47 -0500
Received: by mail-pf1-x434.google.com with SMTP id i30so12225482pfk.8
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 00:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=K9PHSmzQT0cxQD81dO3PaonqG2wYx11DIXsGZN7p6mw=;
 b=pJ+SosqSXiBvFKNpgqw7V+opiTFAWHS22l0091NvVZdXakoofHynciu7siv9dhNhX0
 yT4zAmKzbtRr/q6BXKfkILJ7DzD4FTV7If2SjY9J1volVTIEzp3Sfw3Z0WbrIJkwhVyV
 +Kt18ZUN4vDJa/oslyr6NH96TjzNXcD4mePfT12WfkKcdGNpbX6qhuBvP3ZSUkUUaNs7
 c3IQL405rSHzT0doXFzdf9TTFPx7Hxx6/YxZX0hDp8B6IPLBgWjExF/YtG2+I1raJSev
 91KB4MzCTPjH7peIs97hFHipv41+CT+u3hytzFDN97Ms0pCDVbqZRmGx0W/8fIUX4yNx
 MoEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K9PHSmzQT0cxQD81dO3PaonqG2wYx11DIXsGZN7p6mw=;
 b=66ODm9lbup9asIsmNnYU+ZGzAIZcH5BXZ46AuXff5maBzJRo1uBR1YYI2UF1xjzKLj
 9SGxPChxwZhHARaoQ9AzcbcHHL1bmjeTfSM5GhQrl+SE4GjCPdKmuGdicXejROknwteE
 TbNaXwYyv0CyTtEuvHBAMD2tBXrToI0nNsTagU8QuKPov5IvcvXEzzWguZxA4eUtdD0T
 ENhK8vZ1TS1JmKqYzJANIfkzPUgWJdLRdf4lV+kAqZWlBrT/eYc/S6u1MYMGJ+2x2Vro
 +rlr6YehvF0GRkistfmE8llBVPsOKxDTUUcmxJGUs1GuT8wDRjqzklh3YxQmjWoe94DJ
 /z+A==
X-Gm-Message-State: AOAM533NxT/zjP5gt05XCUgxFQb/n4PGpxMhL4sKa8yY8M4zkv8Y/lqU
 858qXAkOglXth0AL4+7C9/NS3Q==
X-Google-Smtp-Source: ABdhPJyZ6p8oka+cmO1xbCsjNNtoeg3S4/vczPxJxvBK8J+n5ySrFqnAOSepWM1yDhUYSxNVx345Zw==
X-Received: by 2002:a63:6486:: with SMTP id
 y128mr13808059pgb.152.1643616585159; 
 Mon, 31 Jan 2022 00:09:45 -0800 (PST)
Received: from [192.168.15.130] ([60.231.85.5])
 by smtp.gmail.com with ESMTPSA id 202sm28680716pga.72.2022.01.31.00.09.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 00:09:44 -0800 (PST)
Message-ID: <eacd074c-1c26-da1a-72dd-dfbcebf85ae7@linaro.org>
Date: Mon, 31 Jan 2022 19:09:34 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 15/16] hw/arm/boot: Drop nb_cpus field from arm_boot_info
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220127154639.2090164-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/28/22 02:46, Peter Maydell wrote:
> We use the arm_boot_info::nb_cpus  field in only one place, and that
> place can easily get the number of CPUs locally rather than relying
> on the board code to have set the field correctly.  (At least one
> board, xlnx-versal-virt, does not set the field despite having more
> than one CPU.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/boot.h   | 1 -
>   hw/arm/aspeed.c         | 1 -
>   hw/arm/boot.c           | 7 +++----
>   hw/arm/exynos4_boards.c | 1 -
>   hw/arm/highbank.c       | 1 -
>   hw/arm/imx25_pdk.c      | 3 +--
>   hw/arm/kzm.c            | 1 -
>   hw/arm/mcimx6ul-evk.c   | 1 -
>   hw/arm/mcimx7d-sabre.c  | 1 -
>   hw/arm/npcm7xx.c        | 3 ---
>   hw/arm/orangepi.c       | 4 +---
>   hw/arm/raspi.c          | 1 -
>   hw/arm/realview.c       | 1 -
>   hw/arm/sabrelite.c      | 1 -
>   hw/arm/sbsa-ref.c       | 1 -
>   hw/arm/vexpress.c       | 1 -
>   hw/arm/virt.c           | 1 -
>   hw/arm/xilinx_zynq.c    | 1 -
>   18 files changed, 5 insertions(+), 26 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

