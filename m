Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A744AAD06
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:27:00 +0100 (CET)
Received: from localhost ([::1]:47250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUSJ-0001VR-UB
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:26:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGURD-0000of-Fm
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:25:51 -0500
Received: from [2607:f8b0:4864:20::536] (port=33557
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUR8-0002XG-Bz
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:25:50 -0500
Received: by mail-pg1-x536.google.com with SMTP id 77so5457375pgc.0
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hDisQXPkafq18pBtef/pcS0RwUYtmCqiSsXg9rnFIrE=;
 b=DdFryml/PLazcLoo7jHXijns6px9gaFA6uAc9Fh7Cyg+N9g/iDRiTih8mL/mHLo87i
 dUWknE61aVCswFEiI0Tk9rOjs0/V+tv5uzi6wAI+cnrGdbxoN0vLeU0ez4FcR6lC5luH
 jN1CVICihFa1k0eGxA7JLFgAYQe7+btIazlMgyfaPqfqCdBRx/uJiN8Niccg6xwOeRgL
 zLnr+/henFwothhq3II+LA2GItFYBoj2E4cCJePSPQYwyt9q2uG7uTzUyCR6K0MgnGn9
 MUNGTGX/xon2iVUpyvMJruk77LgFdaay3olVuDt4ZOuzvZnCjm7Qbn3bB2GHP1grxBaY
 syPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hDisQXPkafq18pBtef/pcS0RwUYtmCqiSsXg9rnFIrE=;
 b=KA7lfkeKZ9iFs8q6NkXvluc1rwbWBNpEByRRBXyjDyemXVT+h8U2LlU6XEekwoqNMt
 /TZ2ubwr0KALCYmMtHFB1aFFSXSRcvLd63dYIMtce6vvu2y0YjIKNEwx4FjMdb6qSOV6
 Iz9Bm6108Ru8sWzWvFVhOeNCNg1EE9D1MFAtUZCZv6g3iZ+EsMkIUS4pm1pY5fqwFDR1
 KDePWT0Oial6msLVYBCB9KBbPRagupWxNMdKfMFiaGCYYR2MIGzMboG6Ce+WSpz6jTMH
 6+Qb698aaA3gebUBM+OYZKU8rCRSTdUAjzV3MreTPQRdLnLRUKHaqV1ud1dL/AWwAilE
 fePw==
X-Gm-Message-State: AOAM532FYhnEFb0/f42I71QJ4sOHmLNxda0s7RekgHVlDK+NKdEQUqpL
 vZDeLp1kwiMom1w43Ot8hL0qIw==
X-Google-Smtp-Source: ABdhPJzLaoUvoCVGU0XLMO+lpwoynqBRWa9Pd6RQoV//X5P0EkgvPAjnLi1q+ElStDCJROkerRNFvg==
X-Received: by 2002:a05:6a00:8d2:: with SMTP id
 s18mr9424602pfu.5.1644103544518; 
 Sat, 05 Feb 2022 15:25:44 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id nu15sm3784820pjb.5.2022.02.05.15.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:25:44 -0800 (PST)
Message-ID: <8791f8f2-2a29-d304-8a67-7e0f8f4970c0@linaro.org>
Date: Sun, 6 Feb 2022 10:25:39 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 11/21] accel: Introduce
 AccelOpsClass::cpus_are_resettable()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-12-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203191814.45023-12-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:18, Philippe Mathieu-Daudé wrote:
> Add cpus_are_resettable() to AccelOps, and implement it for the
> KVM accelerator.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/kvm/kvm-accel-ops.c  | 6 ++++++
>   include/sysemu/accel-ops.h | 2 ++
>   include/sysemu/hw_accel.h  | 5 -----
>   softmmu/cpus.c             | 5 ++++-
>   4 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
> index 95b7b08020..cd4d4a06a7 100644
> --- a/accel/kvm/kvm-accel-ops.c
> +++ b/accel/kvm/kvm-accel-ops.c
> @@ -79,12 +79,18 @@ static bool kvm_vcpu_thread_is_idle(CPUState *cpu)
>       return !kvm_halt_in_kernel();
>   }
>   
> +static bool kvm_cpus_are_resettable(void)
> +{
> +    return kvm_enabled() ? kvm_cpu_check_are_resettable() : true;
> +}

Hrm.  This is code movement, but this calls out to be rewritten with proper logical 
operations:

     !kvm_enabled() || kvm_cpu_check_are_resettable();

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

