Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD3E354362
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 17:21:31 +0200 (CEST)
Received: from localhost ([::1]:44986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTR2g-0002o9-MI
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 11:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQcu-0005T0-2o
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:54:52 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:42628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lTQcs-0005WM-H4
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:54:51 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 j6-20020a17090adc86b02900cbfe6f2c96so5988463pjv.1
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Smsrc7OqF+sb2wdFaCwY7eO66Q5ezyha5qHvu4qMuPc=;
 b=TPe4rMfYr2PCCcZVfsv6q4w+9I+QEsFs9FDr5bSpurNG6QKT1xtuzaqdO0+dZCFx3W
 9qWquBwMxxqXFfRPE2tz+IgLRg6JkGu/v+k/lKqx9YhVt2aRyzqO8YrCrdYI+LkeP1vJ
 hKUCCri1KaUMTjpr7Bq3sSd/P9Ren47mPkDGbSkaKtLvmr268xsMUcr3ao2lItGoXK/k
 JjRLgUlrAxNocYyZ/BQQWvXs7WXnjADPIFqFQhPQVNR924L+++BXDJ2Cm5e7cvQTAkgF
 yQpfzcbbehD4fLVR0cy8BeER28cBq4MuU1wTW2xDX+V9gUj+LA7MQUlHFwSL2BlujarF
 Jzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Smsrc7OqF+sb2wdFaCwY7eO66Q5ezyha5qHvu4qMuPc=;
 b=ihckyCUEw6+q7wKaeWi3+QTP43ujiO96OU9YLhPp4+Cg7Om7ws7wNeIaix/G71vA5p
 9H3EP30jAVeFIhK5fofeZZKLyA/lH/Graal3wELk2bbJELwlsAWMn69Z7UFEApHrvjP1
 YIC6KFkgX87HB+aNZO5ktNLD6OwWSUip1oJTagGUPAiNKw646ZVxxRmqoCggpAEnnzBJ
 GVWjQWoWYTagUAgdAFpIracJdr+v2q0ZwpoE8xHKocPFzbsoV3ZocOXEt10NL8yPAO3P
 9/wiwuvCRbKtawSTmr+5skZwTR4iKlyvIuhUzrUVS/WbPLLgVHJjq+mYV7bzpDvLnJeK
 l9cg==
X-Gm-Message-State: AOAM531oQGpRX/m97DL/z7BBgY5OXlXQ3AKKai0AKqLJYCjh4pPOoHRz
 e7Hmn9aqyks9qbfxl7WRbIiNcA==
X-Google-Smtp-Source: ABdhPJzUKWxhU75zS9HdQEaS96va0UteSHd3q+MkbIEtJgNZ6VGPZ9a51zeYklTyMOjy+K59Ziryew==
X-Received: by 2002:a17:90a:7344:: with SMTP id
 j4mr26108760pjs.223.1617634488921; 
 Mon, 05 Apr 2021 07:54:48 -0700 (PDT)
Received: from [192.168.73.67] (50-200-230-211-static.hfc.comcastbusiness.net.
 [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id l2sm16554449pji.45.2021.04.05.07.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Apr 2021 07:54:47 -0700 (PDT)
Subject: Re: [PATCH v1 3/8] target/riscv: Remove the hardcoded HGATP_MODE macro
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <91de8cea886eaef39f8ff51d3962fc9b75ef1a0c.1617393702.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d3da671-8916-5d6f-15d8-1a9acca2accb@linaro.org>
Date: Mon, 5 Apr 2021 07:54:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <91de8cea886eaef39f8ff51d3962fc9b75ef1a0c.1617393702.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
Cc: alistair23@gmail.com, bmeng.cn@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/2/21 1:02 PM, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   target/riscv/cpu_bits.h   | 11 -----------
>   target/riscv/cpu_helper.c | 21 ++++++++++++++++-----
>   2 files changed, 16 insertions(+), 16 deletions(-)


Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> @@ -621,9 +626,15 @@ static void raise_mmu_exception(CPURISCVState *env, target_ulong address,
>               get_field(env->satp, SATP_MODE) != VM_1_10_MBARE &&
>               !pmp_violation;
>       } else {
> -        page_fault_exceptions =
> -            get_field(env->hgatp, HGATP_MODE) != VM_1_10_MBARE &&
> -            !pmp_violation;
> +        if (riscv_cpu_is_32bit(env)) {
> +            page_fault_exceptions =
> +                get_field(env->hgatp, SATP32_MODE) != VM_1_10_MBARE &&
> +                !pmp_violation;
> +        } else {
> +            page_fault_exceptions =
> +                get_field(env->hgatp, SATP64_MODE) != VM_1_10_MBARE &&
> +                !pmp_violation;
> +        }

Looks like you could simplify this to extract the vm in each if branch, then do 
the comparison afterward.

   if (first) {
     vm = ...
   } else if (32bit) {
     vm = ...
   } else {
     vm = ...
   }
   page_fault_exceptions = vm != VM_1_10_MBARE && !pmp_violation;


r~


