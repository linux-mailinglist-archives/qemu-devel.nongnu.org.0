Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C34FAA2A
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 20:34:10 +0200 (CEST)
Received: from localhost ([::1]:35084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndFuT-00062s-BK
	for lists+qemu-devel@lfdr.de; Sat, 09 Apr 2022 14:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFtL-0004v0-RC
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:32:59 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:46763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndFtK-0002PK-8X
 for qemu-devel@nongnu.org; Sat, 09 Apr 2022 14:32:59 -0400
Received: by mail-pl1-x634.google.com with SMTP id be5so4682627plb.13
 for <qemu-devel@nongnu.org>; Sat, 09 Apr 2022 11:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=H3suunJE8tcHW09MCkmwcOH3KSLo6hnP/ifEIDcKV+Q=;
 b=zUu5XmCvD46oFj8PdIl8iLL7BlhY0kqySVSn8s8akLKKtqIaJvsazRl1+ovD8bnsmx
 AUazDkpDRJsqbfy003rFZfZSpDl2e08e/p7X9yO4E/3OpRoBa7+/RxxZwiewXPdo+j6t
 rC7A+Uj5ye+HE3Bnd3ibrpC/2zNgaOr523jW1UkojPi/+wfeA/snJ6IPGkCykVQGnkR5
 lV1LWWGp/7MpshohJOxoPrIfIFPDEy+Kj2mYnovbawK++cLg940JBSJK3vX0FjWYLGIg
 E/sOCM4WMyuXwoWVgjwl37rFbHuxngZ5YHhpVocG0cT7q4wkyrK6FToDkb0mwG/uuTO+
 PnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=H3suunJE8tcHW09MCkmwcOH3KSLo6hnP/ifEIDcKV+Q=;
 b=HTWDIe6/xnZuCDmuHuQkIIZjjFyNAShBxiFOSID+r9MyUN7EbfqAE+t58HiJ7bQ4II
 9BxN4qNk/i4mDpVVFtqRlroMgpaSTZVN0i597hhqM+ZvkcJUdhbxrooHPr+zzHM5P87h
 FFEqKSPACMDXl1DeozMVypEA4WjX2S/FILE9ZjVGKReF+RhNgGGKerSlhXSBKPi3gOHn
 evzZ4Iz2ZEOMFiBgWPo0U7oe61y9PU6/VnWcZRNEh2g8IDkFDhYzl5lzSzDX+vYC6t0s
 H1qWaeISkeMGE/MhTJGcPOwX87kFmG+5Ah64s1jTLKA3HgdTHOjsOHJAFjFRcL3FmsD5
 kCWQ==
X-Gm-Message-State: AOAM530E3jF0aR69S75kNO/Madnjate2hzyWIlUimpCCUYMAOpxzS4GR
 hIAgIX1ygmw5eQNxG8KvUcfmVQ==
X-Google-Smtp-Source: ABdhPJyq1OLFtK5RIPQZvEWqrIYUV5gVQrWhTxA0DZxUoIjNzTeuSZgmyMKzjUcA1jO/4nSdRnrZ2A==
X-Received: by 2002:a17:902:7d86:b0:156:434a:a901 with SMTP id
 a6-20020a1709027d8600b00156434aa901mr25604113plm.77.1649529176427; 
 Sat, 09 Apr 2022 11:32:56 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a056a00240500b004e15d39f15fsm30309741pfh.83.2022.04.09.11.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 11:32:56 -0700 (PDT)
Message-ID: <05bad303-e4d7-c776-5105-6b74a559fc38@linaro.org>
Date: Sat, 9 Apr 2022 11:32:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 22/41] hw/intc/arm_gicv3: Implement GICv4's new
 redistributor frame
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
 <20220408141550.1271295-23-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220408141550.1271295-23-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
> diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> index 7c75dd6f072..9f1fe09a78e 100644
> --- a/hw/intc/arm_gicv3_redist.c
> +++ b/hw/intc/arm_gicv3_redist.c
> @@ -442,8 +442,8 @@ MemTxResult gicv3_redist_read(void *opaque, hwaddr offset, uint64_t *data,
>        * in the memory map); if so then the GIC has multiple MemoryRegions
>        * for the redistributors.
>        */
> -    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
> -    offset %= GICV3_REDIST_SIZE;
> +    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
> +    offset %= gicv3_redist_size(s);
>   
>       cs = &s->cpu[cpuidx];
>   
> @@ -501,8 +501,8 @@ MemTxResult gicv3_redist_write(void *opaque, hwaddr offset, uint64_t data,
>        * in the memory map); if so then the GIC has multiple MemoryRegions
>        * for the redistributors.
>        */
> -    cpuidx = region->cpuidx + offset / GICV3_REDIST_SIZE;
> -    offset %= GICV3_REDIST_SIZE;
> +    cpuidx = region->cpuidx + offset / gicv3_redist_size(s);
> +    offset %= gicv3_redist_size(s);

In these two cases, it would be better to call the function only once.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


