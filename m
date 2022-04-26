Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CF5510B51
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 23:31:54 +0200 (CEST)
Received: from localhost ([::1]:38274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njSmm-0001BS-Mr
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 17:31:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njSkr-0000C4-QD
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 17:29:53 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:47002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njSkq-0002T0-6O
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 17:29:53 -0400
Received: by mail-pl1-x635.google.com with SMTP id u7so16045408plg.13
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 14:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0m4kPAbYcuXfrDilkk0k6fTStCuzr47TKa2h1n9AL1o=;
 b=onwWT1SpdtyXzN3NJFOVd+HHcO4PGSeQekTSQimLnV/Gv6OUq/GvH426uAvHxGfRSQ
 CyPjG8LuX/du4jNkmtVu4Rhk+MVdpqu12GKLJ/9ZjEBrLYKPNeO+ExUojMjN/ZTaZ3s8
 XI8GFC+cxo9OyeiHLLCamwoJdGOjgrsPLnq6p9hLqdDX1QtcJseGGNZXs8trMcT0FZft
 b25h1jaBTW/HbUBchPBj2G9ptn9AMnjqz5DRnUAn9Z9TcDF+jqD7kaxQPTiTMoR1yfKu
 M6zKg287RrZjFv4y0S8IbH7mED1u5g5eJ2i4gROB0a71AtLeTTCUbIDhnYnAOUwxEK6y
 1dSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0m4kPAbYcuXfrDilkk0k6fTStCuzr47TKa2h1n9AL1o=;
 b=hECjCJjhijvBkyKCuI8BS9JuJFVvkg/Psa7iWhyfgFTwNXoXcJpEThCfHlL41jbDU1
 R5avze+2kb12ZGW5okbzud+KYsl9Llvz8zOx414+NH/hQO1PHj55zCMG9ut2NErCM8W3
 fzrI1NkZZ65Nh2mBEHhlSTEA3xf5lcEMOPWjmQXOiavLeoN5TgXA5+IZPteXlqErJcjy
 5fNeNBA46x3BrlG4jeUir596gJ9Q0uVSPT1/32KxQ/r2wlUcGpJvuEPkmcaiGZp4v+Yn
 9UttmT3JwES8xSGDhnVDgFl544xaOOddRcexuIoawZDuLiw3VsDt2jcNXEKguBPZedF9
 7hjg==
X-Gm-Message-State: AOAM533H7BIWgEpJ34f/5uQC7+owGAhbWJyViXO/guvnXA1BQOSwvENY
 1TihIImMMVK0E7FEc8vryknErg==
X-Google-Smtp-Source: ABdhPJwuw+3cMmtruXlCZ+uUPl94mqfEsWFR3If21EGhk9vXIEKyA6pjs04awCBtlUWJM2V4ZibRPA==
X-Received: by 2002:a17:90a:4413:b0:1cd:2d00:9d0b with SMTP id
 s19-20020a17090a441300b001cd2d009d0bmr28890206pjg.81.1651008590707; 
 Tue, 26 Apr 2022 14:29:50 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a17090a784200b001cd4989ff42sm3735856pjl.9.2022.04.26.14.29.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 14:29:50 -0700 (PDT)
Message-ID: <fd0087dc-10ec-7867-44df-ba84f8b55aee@linaro.org>
Date: Tue, 26 Apr 2022 14:29:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 03/20] target/ppc: Substitute msr_pr macro with new
 M_MSR_PR macro
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
 <20220422185450.107256-4-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220422185450.107256-4-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 11:54, Víctor Colombo wrote:
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
> ---
>   hw/ppc/pegasos2.c        |  2 +-
>   hw/ppc/spapr.c           |  2 +-
>   target/ppc/cpu.h         |  3 ++-
>   target/ppc/cpu_init.c    |  4 ++--
>   target/ppc/excp_helper.c |  6 +++---
>   target/ppc/mem_helper.c  |  4 ++--
>   target/ppc/mmu-radix64.c |  4 ++--
>   target/ppc/mmu_common.c  | 23 ++++++++++++-----------
>   8 files changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
> index 56bf203dfd..27ed54a71d 100644
> --- a/hw/ppc/pegasos2.c
> +++ b/hw/ppc/pegasos2.c
> @@ -461,7 +461,7 @@ static void pegasos2_hypercall(PPCVirtualHypervisor *vhyp, PowerPCCPU *cpu)
>       /* The TCG path should also be holding the BQL at this point */
>       g_assert(qemu_mutex_iothread_locked());
>   
> -    if (msr_pr) {
> +    if (env->msr & M_MSR_PR) {

I'm not sure I'm keen on the M_ prefix, but I'll defer to Cedric or Daniel if they're ok 
with it.

In general there are inconsistencies with the use of MSR_PR (1 vs 1ull), which makes it 
tempting to replace MSR_PR the bit number with MSR_PR the mask and leave off the M_ 
prefix.  It's somewhat easy for MSR_PR, since missed conversions will certainly result in 
compiler warnings for out-of-range shift (the same would not be true with bits 0-6, LE 
through EP).

Another possibility would be to use hw/registerfields.h.  Missed conversions are missing 
symbol errors.  You'd write FIELD_EX64(env->msr, MSR, PR) in cases like this and 
R_MSR_PR_MASK in cases like cpu_init.c.  It's more verbose for single bits like this, but 
much easier to work with multi-bit fields like MSR.TS.


r~

