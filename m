Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 936DB4BAC73
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 23:19:15 +0100 (CET)
Received: from localhost ([::1]:36262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKp7K-0007cA-6L
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 17:19:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKp5T-0006jA-9c
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 17:17:19 -0500
Received: from [2607:f8b0:4864:20::536] (port=37772
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKp5R-0006fC-Jy
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 17:17:18 -0500
Received: by mail-pg1-x536.google.com with SMTP id 75so6197431pgb.4
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 14:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1Ap3Psiiayely5mfFsQPimci9t689tNtqgGkZYHluRI=;
 b=NC1MZf7kKNrIc71M7F/CvH5ZfG0RUIZTXg2n9NPZBMdvaXB4/qUQLvpqVUdFCdKON0
 tp7GHmHRtbtBrL7LVlzOl7OS19Jip1ITfGOzvs7pVKKkJWZTKRMGwc1JIajn4Iubi/OY
 7S8Kp93O7jWWikkC3WjwQbmZKHRw/W1trOG0FeOvEN+nz+uSVQ8vSX//vmYlWWobwXkt
 mEhD04+WnvpCwQ5CeBHwEeImmSEMHr/OcKqEuUz7wKCFnoo3naCJAXbpFtOp7MK2ojTZ
 KWp/arozQH+SqRlNrG88w11RtkzmhNzOtTf5fKTwCzkMiyMdAoKOOcjN+19v/NRVfH9u
 veGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Ap3Psiiayely5mfFsQPimci9t689tNtqgGkZYHluRI=;
 b=XC36qVL5ecNUm2/GA/ISUnCeP0aQ0xVQRiiU4XstLYu7Nf5jIhmAQgb7gMayLU5CbN
 MZYmyxAvXGbHqM+rh6cHKnaNTS9iCvXiYFMFz2Kz9T96ygu2TBshQgVtHIKVTijMoRHC
 WBHyrqDbZPdYhgJuzrpX2F0nmRs9nYbFI74M2OB/m8obAEZrKARvXdjdPYhFrDgBAnQO
 Fh/pnqy6E5sQc1O6MyP5OEI6r4K1hd3V9P8t2d6sc9llWOfaiSo/d1Un3yajL460GMQU
 tHL7VbveBny51ZvqicwzYBhIn4WxVEXgWxHRX69PHNAZZn4rSglmnBq+MjOW6l3Oh3Bo
 Kuvg==
X-Gm-Message-State: AOAM532cNYk26ibgsj+OmzOrBCrw/61ETvNsFzYoOK1VEsYHSDpzkaGj
 nTHMbeRybBS+lwxlsVjDNzcRaw==
X-Google-Smtp-Source: ABdhPJzEEQb7O2xfEm9SgNwlkAoYtvxpseDgErGQAGwiY5IUnXbsoY0Sv7NE4P11NjOeeY725D1LwA==
X-Received: by 2002:a63:cd58:0:b0:364:bca8:55a with SMTP id
 a24-20020a63cd58000000b00364bca8055amr4054255pgj.56.1645136235624; 
 Thu, 17 Feb 2022 14:17:15 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id i17sm8111961pgn.82.2022.02.17.14.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 14:17:15 -0800 (PST)
Message-ID: <4256be2c-ff77-e4a2-1cb6-0e750a988618@linaro.org>
Date: Fri, 18 Feb 2022 09:17:09 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v12 2/5] target/ppc: make power8-pmu.c CONFIG_TCG only
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220216101102.179158-1-danielhb413@gmail.com>
 <20220216101102.179158-3-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220216101102.179158-3-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, clg@kaod.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 21:10, Daniel Henrique Barboza wrote:
>   static void init_tcg_pmu_power8(CPUPPCState *env)
>   {
> -#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
> +#if defined(CONFIG_TCG)
>       /* Init PMU overflow timers */
>       if (!kvm_enabled()) {
>           cpu_ppc_pmu_init(env);
> @@ -7872,10 +7872,9 @@ static void ppc_cpu_reset(DeviceState *dev)
>       if (env->mmu_model != POWERPC_MMU_REAL) {
>           ppc_tlb_invalidate_all(env);
>       }
> +    pmu_update_summaries(env);
>   #endif /* CONFIG_TCG */
>   #endif
> -
> -    pmu_update_summaries(env);

It looks like you could remove all of the ifdefs if you simply use tcg_enabled() rather 
than !kvm_enabled().  If !defined(CONFIG_TCG), tcg_enabled() will be constant false, and 
the block will be optimized away.


r~

