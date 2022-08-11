Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BEC590949
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 01:44:27 +0200 (CEST)
Received: from localhost ([::1]:34870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMHqk-0007Nl-CA
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 19:44:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHp6-0005p8-QQ
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:42:46 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHp5-0005hc-8B
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:42:44 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 s5-20020a17090a13c500b001f4da9ffe5fso6800826pjf.5
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 16:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=yaUSsm9aXqh0IGoOM/GerbNL0vwXUpF7owqdNfZCOus=;
 b=diaRH3IKDM2+zrxB37iZkmTlaDplfuvzfB0jfCK3wawTUJRjTLqS/VQO0Q8MIKLBkk
 OXHxVasywI0857XOcCY4ZxX1sW25lf7a3T92zm5FBvZntBEXyphcJp762mRI6j22CZdT
 I0y4dO/CeomdRq1jygZFnHZqSDQ8/zZJ35TurZZ0Q2U5aSLHa7CXEFsrFEwSYuaw2Wog
 VgFU3VVNrLtd7jxcgkdwprEXbAus+/sAnC6keMxc/OctTkW2d7aHSuPBmEripPF+2b9Q
 hZcwQ0iZda5rYSJ7dyGSgNcRROGXWnl9vr2QkVNuFrTuS3uf7n10XbyJPeq3z0rgW/mW
 I0HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=yaUSsm9aXqh0IGoOM/GerbNL0vwXUpF7owqdNfZCOus=;
 b=k7g8Z0ubYMaAy6pUK83Kq3zJxwpDyTgZYJOpvpnDJyl7yic5JfRNQZucKAFmCA898N
 oiGfHQUWkSUVit5vxY+xXA7ChFR3O4dYlGneSQCgeMTjZNcuZ4cjwSdj5xy+J5XSf3v3
 ZY7BmQ2r58pPdrEKP/gApZWuoLNh0/PURqO/e3cg08zamM2Jdf0aCJ0GW3JeumDeZ+CJ
 rEL2QBFTNj4yONfdlsV39C7pOUSpYQ3kVF2qnBufY9Y5ukWLozlSSdA6SetVSuan0swh
 1Kbdje4pnxak3YEdSIs0CQ5eWiUC3NrPft23M7IVD3Va16CVREZSJ09V2u/rIj8IbiCO
 SWmA==
X-Gm-Message-State: ACgBeo3eXVrcCs+bbI1mM9ohV5F79Eo6dWnQQB03PFAeQsaL+Z5WLP/z
 KnxJ0P1dA8RulvwwprFvWDo=
X-Google-Smtp-Source: AA6agR7Wv2KSrQwFIBRpOIGMODzcXh+MvIri0k1QF5y9B7/rn9m1zzAMxH7DHQqjiHYNAHktdD6u+g==
X-Received: by 2002:a17:902:694c:b0:16d:cc5a:8485 with SMTP id
 k12-20020a170902694c00b0016dcc5a8485mr1491540plt.90.1660261360707; 
 Thu, 11 Aug 2022 16:42:40 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q2-20020a170902f78200b0016d1f474653sm246664pln.52.2022.08.11.16.42.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 16:42:40 -0700 (PDT)
Message-ID: <4c5e815f-468a-5626-017f-7da031d95eb8@amsat.org>
Date: Fri, 12 Aug 2022 01:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v1 5/8] ssi: cache SSIPeripheralClass to avoid GET_CLASS()
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Alistair Francis <alistair@alistair23.me>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
 <20220811151413.3350684-6-alex.bennee@linaro.org>
In-Reply-To: <20220811151413.3350684-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 11/8/22 17:14, Alex Bennée wrote:
> Investigating why some BMC models are so slow compared to a plain ARM
> virt machines I did some profiling of:
> 
>    ./qemu-system-arm -M romulus-bmc -nic user \
>      -drive
>      file=obmc-phosphor-image-romulus.static.mtd,format=raw,if=mtd \
>      -nographic -serial mon:stdio
> 
> And saw that object_class_dynamic_cast_assert was dominating the
> profile times. We have a number of cases in this model of the SSI bus.
> As the class is static once the object is created we just cache it and
> use it instead of the dynamic case macros.
> 
> Profiling against:
> 
>    ./tests/venv/bin/avocado run \
>      tests/avocado/machine_aspeed.py:test_arm_ast2500_romulus_openbmc_v2_9_0
> 
> Before: 35.565 s ±  0.087 s
> After: 15.713 s ±  0.287 s

Wow!

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Cédric Le Goater <clg@kaod.org>
> 
> ---
> v2
>   - split patches
> ---
>   include/hw/ssi/ssi.h |  3 +++
>   hw/ssi/ssi.c         | 18 ++++++++----------
>   2 files changed, 11 insertions(+), 10 deletions(-)

> @@ -48,11 +47,11 @@ static void ssi_cs_default(void *opaque, int n, int level)
>   
>   static uint32_t ssi_transfer_raw_default(SSIPeripheral *dev, uint32_t val)
>   {
> -    SSIPeripheralClass *ssc = SSI_PERIPHERAL_GET_CLASS(dev);
> +    SSIPeripheralClass *ssc = dev->spc;
>   
>       if ((dev->cs && ssc->cs_polarity == SSI_CS_HIGH) ||
> -            (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
> -            ssc->cs_polarity == SSI_CS_NONE) {
> +        (!dev->cs && ssc->cs_polarity == SSI_CS_LOW) ||
> +        ssc->cs_polarity == SSI_CS_NONE) {

Spurious de-indent?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>           return ssc->transfer(dev, val);
>       }

