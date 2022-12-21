Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5508652F70
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 11:26:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7wI0-0003ko-Tz; Wed, 21 Dec 2022 05:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7wHy-0003kZ-Up; Wed, 21 Dec 2022 05:25:30 -0500
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1p7wHu-0001QX-Da; Wed, 21 Dec 2022 05:25:27 -0500
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1443a16b71cso18596514fac.13; 
 Wed, 21 Dec 2022 02:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5cn2zeNnPTWsSOpZUontcUcebDXNAaDXzsbNdd1cN1c=;
 b=L1P5bppPLMDambWy84B0zn9IcD1Tzxv3mTbKu5bshK7BjRw3QVf++bLJZZeqTuCQTs
 R3cWK+zE/c0gUcXPu+Xe9hvfCvFaFaw+DIqWd0sRnnMZJOqzgNC5z3HsDU88pg+cPFX5
 XvpIiy4QfG+4zz1EGrLdO+SmqScIl1rCeE5O5gu8t/seAcKAuPq88g6UFL5gN0C7LgA4
 Iw+PkbCl5iVKOILGy+MKrctYTJbK1xy8nDVUytcj+TgHcuZG7frPJa/qxcTjOaJQ7eAk
 1G6w3+OfsvbleG74x5SOB9prL1oHL8Afzd5B0knoQJDpHja1IJy5qUM0U0ErxWPRdzwC
 42sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5cn2zeNnPTWsSOpZUontcUcebDXNAaDXzsbNdd1cN1c=;
 b=h7CvaDQBxbPTEgOjIpB0fob3siwgHSD3SgBZ1Pbl37Wv4QrVooz28SEJ0wDPpiYdJU
 +5uEbkrCuRqxp897n62jSjymsnqta2YPVb5Sy0JzBEXh9c42FNY8ExCOH3qjxi9CcKGT
 pp6QiG05hLX1xD+lP/G/2e4DVC90EmwKhJmLy6OXlzhlGnUbT24CMcT8Y3ThYpW/bFxt
 bzRDOGX+m84nZWK/knw5jAdb+YaEl19+9qrtsGJLIKyssc489OSzUO87tYwngNM5+NEV
 MJ1h+Bzj0ZVhYrUqoMGfhoqwAEO5wAbiW19Tc7pEBpy2CKEQod/owirBXMVcBckq8asZ
 ncYA==
X-Gm-Message-State: AFqh2koj4tYdWKThKuRx6vid4HntjJH3q9Ng0nN5Is2Sdx/ZnzLZuAGd
 Sw+DWhrcdRoGlvpGeKdO/JQ=
X-Google-Smtp-Source: AMrXdXtRtYMedm+eMaUWqcJFINeGqQWLicT/mvXAsCLi4b0tkH75CJJTh+pQBDJ5Di73h/vjX6uZIA==
X-Received: by 2002:a05:6870:4b4f:b0:144:ff2a:220c with SMTP id
 ls15-20020a0568704b4f00b00144ff2a220cmr496529oab.8.1671618324525; 
 Wed, 21 Dec 2022 02:25:24 -0800 (PST)
Received: from [192.168.68.106] (201-43-103-101.dsl.telesp.net.br.
 [201.43.103.101]) by smtp.gmail.com with ESMTPSA id
 ne8-20020a056871448800b00144a3c526d9sm6886153oab.52.2022.12.21.02.25.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Dec 2022 02:25:24 -0800 (PST)
Message-ID: <fd084256-95d0-8155-f019-8d5f88554443@gmail.com>
Date: Wed, 21 Dec 2022 07:25:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PULL 00/15] ppc queue
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
References: <20221220135251.155176-1-danielhb413@gmail.com>
 <CAFEAcA_52bvonP4YN1tr-W3x6rpRyJZe9jfw76yxw6SDyRzmZw@mail.gmail.com>
 <e7450c62-5132-72d3-97d8-6bcde5e27c37@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <e7450c62-5132-72d3-97d8-6bcde5e27c37@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.161,
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



On 12/20/22 19:13, Philippe Mathieu-Daudé wrote:
> On 20/12/22 22:34, Peter Maydell wrote:
>> On Tue, 20 Dec 2022 at 13:53, Daniel Henrique Barboza
>> <danielhb413@gmail.com> wrote:
> 
>> This fails 'make check'; I think the sdhci changes have
>> broken the npmcm7xx-sdhci device:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/3504313175
>>

Ouch, my bad. I saw a clang error and thought it was just a script
timeout error :|

>> 46/106 ERROR:../tests/qtest/npcm7xx_sdhci-test.c:101:sdwrite_read:
>> assertion failed: (!memcmp(rmsg, msg, len)) ERROR
>> 46/106 qemu:qtest+qtest-arm / qtest-arm/npcm7xx_sdhci-test ERROR 1.67s
>> killed by signal 6 SIGABRT
> 
> 5218b3960738a6da041aa6f54ac4b37566311cca is the first bad commit
> commit 5218b3960738a6da041aa6f54ac4b37566311cca
> Author: Philippe Mathieu-Daudé <philmd@linaro.org>
> Date:   Tue Nov 1 23:29:32 2022 +0100
> 
>      hw/sd/sdhci: MMIO region is implemented in 32-bit accesses
> @@ -14,2898 +14,914 @@
>   sdcard_reset
>   sdcard_reset
>   sdhci_set_inserted card state changed: insert
> -memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf084202f value 0x1 size 1 name 'sdhci'
> +memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf084202f value 0x1 size 4 name 'sdhci'
>   sdhci_set_inserted card state changed: insert
> -sdhci_access wr8: addr[0x002f] <- 0x00000001 (1)
> -memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf0842030 value 0x0 size 1 name 'sdhci'
> -sdhci_access wr8: addr[0x0030] <- 0x00000000 (0)
> -memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf084202c value 0x7 size 2 name 'sdhci'
> -sdhci_access wr16: addr[0x002c] <- 0x00000007 (7)
> -memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf0842004 value 0x0 size 2 name 'sdhci'
> -sdhci_access wr16: addr[0x0004] <- 0x00000000 (0)
> -memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf0842006 value 0x0 size 2 name 'sdhci'
> -sdhci_access wr16: addr[0x0006] <- 0x00000000 (0)
> -memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf0842008 value 0x0 size 4 name 'sdhci'
> +sdhci_access wr32: addr[0x002f] <- 0x00000001 (1)
> +memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf0842030 value 0x0 size 4 name 'sdhci'
> +sdhci_access wr32: addr[0x0030] <- 0x00000000 (0)
> +memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf084202c value 0x7 size 4 name 'sdhci'
> +sdhci_access wr32: addr[0x002c] <- 0x00000007 (7)
> +memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf0842004 value 0x0 size 4 name 'sdhci'
> +sdhci_access wr32: addr[0x0004] <- 0x00000000 (0)
> +memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf0842006 value 0x0 size 4 name 'sdhci'
> +sdhci_access wr32: addr[0x0006] <- 0x00000000 (0)
> +memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf0842008 value 0x0 size 4 name 'sdhci'
>   sdhci_access wr32: addr[0x0008] <- 0x00000000 (0)
> -memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf084200c value 0x0 size 2 name 'sdhci'
> -sdhci_access wr16: addr[0x000c] <- 0x00000000 (0)
> -memory_region_ops_write cpu -1 mr 0x1581ff440 addr 0xf084200e value 0x3700 size 2 name 'sdhci'
> +memory_region_ops_write cpu -1 mr 0x1481ff440 addr 0xf084200c value 0x0 size 4 name 'sdhci'
> 
> Apparently we aren't modeling some bus translator on the NPCM7xx.
> 
> Daniel, I apologize. Could you respin without the "hw/sd/sdhci:
> MMIO region is implemented in 32-bit accesses" patch?

Sure, I'll do that later today.


Daniel

> 
> Thanks,
> 
> Phil.

