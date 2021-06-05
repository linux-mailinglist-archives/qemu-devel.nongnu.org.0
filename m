Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C7039C9F7
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 18:55:40 +0200 (CEST)
Received: from localhost ([::1]:43616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpZaF-0001ro-4i
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 12:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpZZJ-0000w8-RO
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 12:54:41 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:36812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpZZH-0002VU-H2
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 12:54:41 -0400
Received: by mail-pg1-x531.google.com with SMTP id 27so10387598pgy.3
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 09:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZO+DyZ1fUy+kvlyAg/MjXMo6ajXXE+n+Yb2OEz6f7nc=;
 b=vMY34mpuXRs68p1nxehZQpprEc0HXkHOpSHTzgrwHog0HkABXHukqJwgrqi+BGqOKQ
 eiEEpwdByoEfBFQ12mWqJSZC6l9I21yuaAB3L8qeWWqzwD/Sdv1lNjcehhgqy3pJWC2+
 EkfqbpzQ2HuYmRHq2Mgx0/qeCOazHG2UjsnipfD5IkSUyGM+uVFYoG/7pPt5utpPf8eZ
 FZmfsoDVE8xgC4ra3Dyi2g068tFv5H+CA0dqzMbYGtYCWs0oFX8oKmduf2TN/u76dl+6
 W/Q9qaOsqvJfZk2ttEJzO7n0m1Z/mxU+MUN3D6Lr380Ca+alluJ6HGHvp9VbffPzNIdI
 BoIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZO+DyZ1fUy+kvlyAg/MjXMo6ajXXE+n+Yb2OEz6f7nc=;
 b=AJ2Quk69U5pNeAaA5ae+EgMmLBlxsep+N3QvTi1ZmVYkF3ZrqZWTXB8UazCyjKbT+m
 ArILW+4DH5luxNgrhRm2fDs6FeRW2Tqe1eT57dtwb4W8R70YVUWoToXIZHCY74Bdl4BH
 Fv5/wskWEQKlRPcqcSMmuZJ6zer33u/i3chkrseQRHlc1zCTOHXSzYB6gtjLv5X23z7e
 x2LZzKng000YoJLx1GLDib1gyabEgvfYgMtwGKOyxvevgFS5LaSYuq6ree9UiaF0MHPY
 SlqFeMDdctGY8A0zDWz6TtBBdsy0nZyaG1a32c0ro/yt4YzWWvOh+nJMTjIiz8Z98eIi
 KoKA==
X-Gm-Message-State: AOAM531rDZPMJIoZbVYXsMjTKIRNLytlzDinxYNNAafdHbXKyF96po2v
 LOegy15n6Kt8NUYUyem0kaADvQ==
X-Google-Smtp-Source: ABdhPJz8BP3o1RjtwcF9OL1mG7c2/1PDTArAAE/KXp7tmRfo5Ob3Jt+d4b+FGj89EGi8HqRf/+ZAfw==
X-Received: by 2002:a63:5052:: with SMTP id q18mr10438460pgl.349.1622912077894; 
 Sat, 05 Jun 2021 09:54:37 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u21sm4471193pfh.163.2021.06.05.09.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 09:54:37 -0700 (PDT)
Subject: Re: [PATCH v16 69/99] target/arm: add tcg cpu accel class
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-70-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <17f14974-a922-dcda-4eb4-8754bf1fd45c@linaro.org>
Date: Sat, 5 Jun 2021 09:54:35 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-70-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> move init, realizefn and reset code into it.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/tcg/tcg-cpu.h        |  4 ++-
>   target/arm/cpu.c                | 44 ++------------------------
>   target/arm/tcg/sysemu/tcg-cpu.c | 27 ++++++++++++++++
>   target/arm/tcg/tcg-cpu-models.c | 10 +++---
>   target/arm/tcg/tcg-cpu.c        | 55 +++++++++++++++++++++++++++++++--
>   5 files changed, 92 insertions(+), 48 deletions(-)
> 
> diff --git a/target/arm/tcg/tcg-cpu.h b/target/arm/tcg/tcg-cpu.h
> index d93c6a6749..dd08587949 100644
> --- a/target/arm/tcg/tcg-cpu.h
> +++ b/target/arm/tcg/tcg-cpu.h
> @@ -22,15 +22,17 @@
>   
>   #include "cpu.h"
>   #include "hw/core/tcg-cpu-ops.h"
> +#include "hw/core/accel-cpu.h"

Ideally we'd have a qemu/typedef.h entry so this include isn't needed...

>   
>   void arm_cpu_synchronize_from_tb(CPUState *cs,
>                                    const TranslationBlock *tb);
>   
> -extern struct TCGCPUOps arm_tcg_ops;
> +void tcg_arm_init_accel_cpu(AccelCPUClass *accel_cpu, CPUClass *cc);

... simply for this declaration.
Also, can we now remove the tcg-cpu-ops.h include?

> @@ -1467,7 +1429,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
>       cc->disas_set_info = arm_disas_set_info;
>   
>   #ifdef CONFIG_TCG
> -    cc->tcg_ops = &arm_tcg_ops;
> +    cc->init_accel_cpu = tcg_arm_init_accel_cpu;
>   #endif /* CONFIG_TCG */

Is this already inside tcg_enabled()?  Because otherwise it looks as if this is 
overwriting a field also used by kvm.  Whereas the code that's being replaced 
set a field only used by tcg.

KVM sets its hooks differently, via kvm_cpu_accel_register_types, so I don't 
understand this hook at all.  But it seems like there should not be two 
different ways to set acc->cpu_instance_init.


r~

