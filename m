Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7B54FAA88
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 21:56:05 +0200 (CEST)
Received: from localhost ([::1]:55202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndHBk-0001eN-4B
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 15:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHAY-0000kC-Ae
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 15:54:50 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndHAW-0005VF-Iv
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 15:54:49 -0400
Received: by mail-pg1-x52b.google.com with SMTP id h5so9779692pgc.7
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 12:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uHj1JBKGUb/JAXg960pBTK6M12MZZYk6u8w96S4rdT8=;
 b=O6jFFMyCIK/TxncmJowGuk9EXXOAB9A8dX3tR8GAbGxceRS0TsJCG6/XClHKWbqn3h
 4nF/953t3s+NQ7K1kBgs2egcwT/XrjPi3/anwaw5ih6VqejGH5RGZgVeL0r3IFgp/iyi
 HMYD/ROx7y8rSM+ZHvJ8/f7xYRhLAlvwy4wVtkyLp6je+5uaJhUAJAS2VFQl40umgGOH
 HPyCMVVZM67mrxpdZOZr1dk1nJpewJoo/rBtXz/l8yTEsLu1hZRr/W+cw894MdyWzaMX
 4IsWkHizOOVT0JNFMYMBafmU8keiij5+Sz0opCpGeKkAyA5ER3+2jFYAa2b4j7dvhe0V
 GO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uHj1JBKGUb/JAXg960pBTK6M12MZZYk6u8w96S4rdT8=;
 b=G2ugbYqm8qW81dC4XNsR2d5EjITdGGASKZT8PE5/ZM06qYRhijRIKNfBCZe1nUR1PS
 R/Xs+ucOjeq/FLOXF7i0+v3CBDmX4Plf8sAhTWaelhvsAAGEPZLoLZfiMsa3fyz6Nqo7
 hKnLQr+2fUCuJ9A35GieppoohH6NxEk/4XZ1jp89OhyeVqlx9TtOwrCIBaqiPNKCdC8u
 BrHkWdU9nktdda5UVhce1Quar0a91rQJ5r6XxVMP1d0/rvxp4ZfRf0hennP2+k34s3E8
 s50yGk7mi0ChuV24nG+uoaFwpgk7itVzWRwP1uesN+CCjLwYiZz3hD4PxhF4+DqwNdsz
 p7jA==
X-Gm-Message-State: AOAM531hg7ZPf/w7souMGbrSva+Q2E1oJEDwMgJ4nJ37l/ZVylLy4t5F
 XuHzPgB5cdlhiv3FXmj1n2x8QQ==
X-Google-Smtp-Source: ABdhPJyDd5om/wqo1hK+tj0Zm+67PMNirICRS2zCtqtP+vjMEXB3yRHeAvDKA2rS3aprbWC1FnwUfw==
X-Received: by 2002:a05:6a00:15c6:b0:4fa:aaec:ef42 with SMTP id
 o6-20020a056a0015c600b004faaaecef42mr25501100pfu.74.1649534086796; 
 Sat, 09 Apr 2022 12:54:46 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 r76-20020a632b4f000000b003820643e1c2sm25456245pgr.59.2022.04.09.12.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 12:54:46 -0700 (PDT)
Message-ID: <4f8d81ad-521a-adb0-d8d5-745f57818b9a@linaro.org>
Date: Sat, 9 Apr 2022 12:54:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 28/41] hw/intc/arm_gicv3_redist: Factor out "update hpplpi
 for all LPIs" logic
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-29-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-29-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/22 07:15, Peter Maydell wrote:
> Factor out the common part of gicv3_redist_update_lpi_only() into
> a new function update_for_all_lpis(), which does a full rescan
> of an LPI Pending table and sets the specified PendingIrq struct
> with the highest priority pending enabled LPI it finds.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_redist.c | 66 ++++++++++++++++++++++++++------------
>   1 file changed, 46 insertions(+), 20 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 571e0fa8309..2379389d14e 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -103,6 +103,48 @@ static void update_for_one_lpi(GICv3CPUState *cs, int irq,
>       }
>   }
>   
> +/**
> + * update_for_all_lpis: Fully scan LPI tables and find best pending LPI
> + *
> + * @cs: GICv3CPUState
> + * @ptbase: physical address of LPI Pending table
> + * @ctbase: physical address of LPI Configuration table
> + * @ptsizebits: size of tables, specified as number of interrupt ID bits minus 1
> + * @ds: true if priority value should not be shifted
> + * @hpp: points to pending information to set
> + *
> + * Recalculate the highest priority pending enabled LPI from scratch,
> + * and set @hpp accordingly.
> + *
> + * We scan the LPI pending table @ptbase; for each pending LPI, we read the
> + * corresponding entry in the LPI configuration table @ctbase to extract
> + * the priority and enabled information.
> + *
> + * We take @ptsizebits in the form idbits-1 because this is the way that
> + * LPI table sizes are architecturally specified in GICR_PROPBASER.IDBits
> + * and in the VMAPP command's VPT_size field.
> + */
> +static void update_for_all_lpis(GICv3CPUState *cs, uint64_t ptbase,
> +                                uint64_t ctbase, unsigned ptsizebits,
> +                                bool ds, PendingIrq *hpp)
> +{
> +    AddressSpace *as = &cs->gic->dma_as;
> +    uint8_t pend;
> +    uint32_t pendt_size = (1ULL << (ptsizebits + 1));

Code movement, so ok, but no need for ull.

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

