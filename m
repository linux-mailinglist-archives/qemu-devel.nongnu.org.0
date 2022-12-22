Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E5E65481E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 22:59:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8TbM-0002ci-C9; Thu, 22 Dec 2022 16:59:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8Tb4-0002Yy-Tf
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:59:34 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p8Tb1-0007MR-Kd
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 16:59:25 -0500
Received: by mail-ed1-x532.google.com with SMTP id e13so4748950edj.7
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 13:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hbbn77NUViSOyswVgXPVzdpAB7XgeibI5aierP8pZe0=;
 b=jI/AbY1qPeteipfgpGPvDlsgqcOZpv0eyRQwy+/vQoDlt729HRvBT/SvI4FMd7nTkh
 ezYjJSC30CWg7YFlOctGutNc2WKEq+gRsDAeyVLz1hAdj8i6Yzq9vEG+b+HMFzzvE2Kt
 YZq158yJny+asXsk+LkBbiHfbV4UTT4RXHKoWH1j7umdqWQ5g69b3gn4/+e9Hm6QOEFX
 TObx2HPSVy7hhycz4B4LGmqe9+4BS+WcNmFmNBcxpOLGUDWlXoYKp4HGYUku4T7UYe+y
 Lle27Jy900naaG5w/3Uiu0C7uY2izJQep/qnoNLZuz842v+FsS81OG4d16fL0lKT8RJl
 Y/fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hbbn77NUViSOyswVgXPVzdpAB7XgeibI5aierP8pZe0=;
 b=1PiTqA3YC38XEgLKLf7RMNkSipNB3ISLvdoGcvltaT8t83K4YXNuoolOgXYPUvBDKa
 0nCD4XL/8xNmEA/viTn0hU0pjXuEYz+6NATQWG1wKzmZUPq9Lq38+RPV2MxbRhKKs8Jh
 vFxhwAse9bhPcYUYRz0BesY1OGGkP6oEO/Lx0/NYH/jJ5s6VCwlz6DHeXecy9NvOW0/i
 eCgvNF2085ROV2DDCp9PTYQ0Ub1qk2cCBcvodsqS58jtokEiA2SjOXUSQJCDLokzkpFO
 I0LtZpKmr8EaXlejzsdFR+DffTbATeqpjTTcfxpIfFgWa51IQwuDn7S2jD2xbG++9gSb
 HKBQ==
X-Gm-Message-State: AFqh2krzSaGD955MKOtaopV75o7Da4BRY+Z1FaIQbrTtqgWDCDuJvXh3
 AolCtBiavYFoFHpsaoCcpJl4LAy0I96kGP8cf6w=
X-Google-Smtp-Source: AMrXdXv4MRjsTWKt4YOu5Su8ark+Lfr0yn3A5K/nrKyBxaY7Rnl9zIfmXUIshU2YSVRSamWqHGqLtg==
X-Received: by 2002:a05:6402:1caa:b0:475:9918:37c7 with SMTP id
 cz10-20020a0564021caa00b00475991837c7mr6211995edb.32.1671746362100; 
 Thu, 22 Dec 2022 13:59:22 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q27-20020a170906145b00b007ad69e9d34dsm666412ejc.54.2022.12.22.13.59.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 13:59:21 -0800 (PST)
Message-ID: <7fe7cbd7-ffde-48ab-317c-4c9e6450ec82@linaro.org>
Date: Thu, 22 Dec 2022 22:59:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH 0/6] hw/arm: Fix smpboot[] on big-endian hosts and remove
 tswap32()
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Igor Mitsyanko <i.mitsyanko@gmail.com>, 
 Joel Stanley <joel@jms.id.au>, Havard Skinnemoen <hskinnemoen@google.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>
References: <20221222215549.86872-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221222215549.86872-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 22/12/22 22:55, Philippe Mathieu-Daudé wrote:
> ARM CPUs fetch instructions in little-endian.
> 
> smpboot[] encoded instructions are written in little-endian.
> 
> We call tswap32() on the array. tswap32 function swap a 32-bit
> value if the target endianness doesn't match the host one.
> Otherwise it is a NOP.
> 
> * On a little-endian host, the array is stored as it. tswap32()
>    is a NOP, and the vCPU fetches the instructions as it, in
>    little-endian.
> 
> * On a big-endian host, the array is stored as it. tswap32()
>    swap the instructions to little-endian, and the vCPU fetches
>    the instructions as it, in little-endian.
> 
> Using tswap() on system emulation is a bit odd: while the target
> particularities might change the system emulation, the host ones
> (such its endianness) shouldn't interfere.
> 
> We can simplify by using const_le32() to always store the
> instructions in the array in little-endian, removing the need
> for the dubious tswap().
> 
> Two boards which weren't swapping (aspeed and raspi) are fixed.
> 
> Tested running ARM avocado tests on x86_64 and s390x.
> 
> Philippe Mathieu-Daudé (6):
>    hw/arm/aspeed: Fix smpboot[] on big-endian hosts
>    hw/arm/raspi: Fix smpboot[] on big-endian hosts
>    hw/arm/exynos4210: Remove tswap32() calls and constify smpboot[]
>    hw/arm/npcm7xx: Remove tswap32() calls and constify smpboot[]
>    hw/arm/xilinx_zynq: Remove tswap32() calls and constify smpboot[]
>    hw/arm/boot: Remove tswap32() calls and constify board_setup_blob[]
> 
>   hw/arm/aspeed.c      | 28 ++++++++++++------------
>   hw/arm/boot.c        | 52 +++++++++++++++++++-------------------------
>   hw/arm/exynos4210.c  | 48 ++++++++++++++++++----------------------
>   hw/arm/npcm7xx.c     | 49 +++++++++++++++++------------------------
>   hw/arm/raspi.c       | 46 +++++++++++++++++++--------------------
>   hw/arm/xilinx_zynq.c | 27 ++++++++++-------------
>   6 files changed, 112 insertions(+), 138 deletions(-)

I forgot to mention, checkpatch warns for 11 lines over 80chars, and
errors for 2 over 90chars. Since these are the assembler comments,
I choose to keep it that way for readability.

