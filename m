Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428E22CA7BB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 17:06:12 +0100 (CET)
Received: from localhost ([::1]:41016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk8AN-0003uH-3L
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 11:06:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk88s-0002gW-B3
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:04:38 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kk88o-0002CO-Ch
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 11:04:38 -0500
Received: by mail-oi1-x243.google.com with SMTP id s18so2282049oih.1
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 08:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=BSz1wRtOvjA9FHxwS2c4YNPY35m15JjGZY0uSm5I6V8=;
 b=sEMWBZVedz/ebjITlKv2kcpKL1U3q4SOngFEnd6t9zkSLfSgVoMJ34ZtAvzp7YQHRS
 cvoEIBuVtNfxlnazeBMkf+bIyWPperY+twB7gMaHjYvOODdwVExqXHH8g2yjtIEISOjD
 m52/44oqpoXn7Qy4KXQQXvouqGpwVBZhw4TYthrAOmz99QHQve1TzY46FWqzZfgam4W3
 kLhEdXGVMZZA+uexPG7Zzt/idqLzQ+Hem8ihl0Rmh1aplqjeZOM8exc0/VMGeUt9MVeS
 E1JOAfgAPC8iC5VtlXt7e4SpqN5RSSWTTY68O0EerC63OZIH5LG6k3A8k5Dto2Z0fLpN
 aKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BSz1wRtOvjA9FHxwS2c4YNPY35m15JjGZY0uSm5I6V8=;
 b=Sq/H5+zm2tID9nvT602jBLYCRcBeVwN/izv9rdRZZci38MSoqVgTXFBHkeUbuu0uRh
 F+FI/U7hP1zCYvECzo4niylfnCTKUiEB2gqqJGDR3V5EiYz8ri7Xzsjp+S9s/n6x35fO
 OkeilqGuCXva8RmuocUSHV81sUBpg9BeT6orEbVMiPA9fq1LEs+4ZZder4U99AJZpOKa
 hGBlfL6uxjHRRWagBVUP+OSUOii1d2KOpEjtMeSDpzp2v1tC3DqryTtwzMNsHLcGPPxZ
 8xB7+chCvQEXxOREX3bIU8KJNH8cidlZpEAlIip7KGlBt2MTcF/3A2LOuHqDUFahzS2I
 TLtQ==
X-Gm-Message-State: AOAM531ODzPbkZbwhzyWsjy8nssCnnvYDi6BWfaHJxnjL5zAll8eYqRJ
 896USjlSMQgWBtOqlduFiPzqj99GlN/sbU94
X-Google-Smtp-Source: ABdhPJyBp51H3HPUSlyIM+zQSxpGHNMwF/pL/n85bAA9fDDD+vJwInUrdA0e9PRLBCLrXSdtuM8CoA==
X-Received: by 2002:a05:6808:562:: with SMTP id j2mr2148901oig.1.1606838672362; 
 Tue, 01 Dec 2020 08:04:32 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id o135sm25914ooo.38.2020.12.01.08.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 08:04:31 -0800 (PST)
Subject: Re: [PATCH v2 25/28] target/arm: Implement M-profile "minimal RAS
 implementation"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201119215617.29887-1-peter.maydell@linaro.org>
 <20201119215617.29887-26-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf94e884-9245-293d-c47c-d7a9fc3e6bcb@linaro.org>
Date: Tue, 1 Dec 2020 10:04:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119215617.29887-26-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/19/20 3:56 PM, Peter Maydell wrote:
> For v8.1M the architecture mandates that CPUs must provide at
> least the "minimal RAS implementation" from the Reliability,
> Availability and Serviceability extension. This consists of:
>  * an ESB instruction which is a NOP
>    -- since it is in the HINT space we need only add a comment
>  * an RFSR register which will RAZ/WI
>  * a RAZ/WI AIRCR.IESB bit
>    -- the code which handles writes to AIRCR does not allow setting
>       of RES0 bits, so we already treat this as RAZ/WI; add a comment
>       noting that this is deliberate
>  * minimal implementation of the RAS register block at 0xe0005000
>    -- this will be in a subsequent commit
>  * setting the ID_PFR0.RAS field to 0b0010
>    -- we will do this when we add the Cortex-M55 CPU model
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      | 14 ++++++++++++++
>  target/arm/t32.decode |  4 ++++
>  hw/intc/armv7m_nvic.c | 13 +++++++++++++
>  3 files changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~



