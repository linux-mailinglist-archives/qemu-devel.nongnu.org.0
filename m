Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84454C36B5
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 21:15:44 +0100 (CET)
Received: from localhost ([::1]:52192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNKWd-0005bS-KD
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 15:15:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNKV8-0004Mm-0T; Thu, 24 Feb 2022 15:14:10 -0500
Received: from [2607:f8b0:4864:20::229] (port=35521
 helo=mail-oi1-x229.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nNKV5-0002El-M2; Thu, 24 Feb 2022 15:14:09 -0500
Received: by mail-oi1-x229.google.com with SMTP id k2so4729354oia.2;
 Thu, 24 Feb 2022 12:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Yw3/S8c55QZKZEOE9PGP5PN82aSOnc7uGqnEYSly03o=;
 b=AnT1qd8PCe10vX68XMcpBojIVJK7mAOLUCwdcZOYoN7pH9Q7GJIX3Ejj8Elz7EfVWI
 SkKoF1FxobRP0wrcDVpjBCiYvwf+65QDuk2dOmXuwZYRUTExuAzP0U3V9kFAFNVhjswC
 j6eu/1i812RdChug4QWRb5OlykeuK6khICeC98w3Z8loIRHN+g9yAk4XgoTiNIQAgvfF
 nblfN/VqHhu/sWPWPf2glfmaDdVaSFyjvZdguQ4k9gX1c+Air1D9WIAkjznNNO4u8lS/
 QB7M0aHhS0mpPUiX0n2o1Y/U0usOXNntuaMYMzxcvhZC+cRX3Q/M7eexA8rNUaAZgZxX
 Vs+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Yw3/S8c55QZKZEOE9PGP5PN82aSOnc7uGqnEYSly03o=;
 b=7EhBmbslHe0ltfWGbUd83Iewe5En2gG8VN2E1hWJLBDdTvB20A+5FLEj1ktKK/aufj
 NjvuoSeuEJl7GJsHBvU1PVhoW1aD1Y1QORAtSCPrftZ5zOt7d2bLveXMY0QqpbpLBrix
 jyXkOrBMO6VlG8AN1z17qyQEoqWnL/5mzHQh3wo0NmbXOZLE8a9/vzXFss7b7zkS5qqM
 SyWTHaQ+SCp3wi6MbzkmQ0L+1srip+QaxuwmFCYveSKZhOSwdV12g4eRYKFCQQKCdgOE
 NpxH3sBriF0z0awW1kYBfjFgnkUjnlfoCFue6SCv7cWmy5PeZThFIKibPrkudYWhyvoK
 Otog==
X-Gm-Message-State: AOAM533ammDvTrIgtDBSYM0qdMIV2vHcCFPjnbzF75EIDjkt0jTBlEAH
 AL8RWFigxsQeJ+/IOMkuw2w=
X-Google-Smtp-Source: ABdhPJwMgNRddeheVCQPf6YNJhDef1+xcj1SvRIhdTv9OpRvS7OdfCUF0LfgEFT5+rngnegI6jRdsw==
X-Received: by 2002:a05:6808:191d:b0:2d4:e1b0:e4e2 with SMTP id
 bf29-20020a056808191d00b002d4e1b0e4e2mr2372899oib.296.1645733645981; 
 Thu, 24 Feb 2022 12:14:05 -0800 (PST)
Received: from ?IPV6:2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377?
 ([2804:431:c7c6:bec1:d9bb:8ce0:5ce7:a377])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a0568080ecd00b002d44f01f1d7sm239247oiv.40.2022.02.24.12.14.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:14:05 -0800 (PST)
Message-ID: <7f068345-8d5c-ff6b-8445-c5471cec964f@gmail.com>
Date: Thu, 24 Feb 2022 17:14:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v12 2/5] target/ppc: make power8-pmu.c CONFIG_TCG only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220216101102.179158-1-danielhb413@gmail.com>
 <20220216101102.179158-3-danielhb413@gmail.com>
 <4256be2c-ff77-e4a2-1cb6-0e750a988618@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <4256be2c-ff77-e4a2-1cb6-0e750a988618@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::229
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x229.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 2/17/22 19:17, Richard Henderson wrote:
> On 2/16/22 21:10, Daniel Henrique Barboza wrote:
>>   static void init_tcg_pmu_power8(CPUPPCState *env)
>>   {
>> -#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
>> +#if defined(CONFIG_TCG)
>>       /* Init PMU overflow timers */
>>       if (!kvm_enabled()) {
>>           cpu_ppc_pmu_init(env);
>> @@ -7872,10 +7872,9 @@ static void ppc_cpu_reset(DeviceState *dev)
>>       if (env->mmu_model != POWERPC_MMU_REAL) {
>>           ppc_tlb_invalidate_all(env);
>>       }
>> +    pmu_update_summaries(env);
>>   #endif /* CONFIG_TCG */
>>   #endif
>> -
>> -    pmu_update_summaries(env);
> 
> It looks like you could remove all of the ifdefs if you simply use tcg_enabled() rather than !kvm_enabled().  If !defined(CONFIG_TCG), tcg_enabled() will be constant false, and the block will be optimized away.


Just tested and it works. Thanks for the tip.

I'll re-send with this change.


Thanks,


Daniel

> 
> 
> r~

