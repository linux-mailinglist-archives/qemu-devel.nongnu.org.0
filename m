Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E965179D1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 00:11:58 +0200 (CEST)
Received: from localhost ([::1]:58078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nleGr-0000Yr-Gn
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 18:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle68-0000ym-C0
 for qemu-devel@nongnu.org; Mon, 02 May 2022 18:00:52 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:47081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nle66-0005yT-Nr
 for qemu-devel@nongnu.org; Mon, 02 May 2022 18:00:52 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 cq17-20020a17090af99100b001dc0386cd8fso496017pjb.5
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 15:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SL5zPBvk0q1D3fCGNqdEDG3JJEWz3O4StXLyVxwYD5I=;
 b=r8mg+XTzjff/F+nus2GCTqLbbpwBWLO15HTzjP4RPoGWvwixOvysvpzO6H+pwUSaRz
 wSIKg7151I/iTFW2KLJJNxXrkNTS0kI/lAQu3RTcxcE7EQKekzYTtsHWwKjvvNI/BMWx
 1wLUnEtF4IfM6iYBox4ZYMuVxG7cgRFpvi4J+u7X/OU+S6cAw1MJfVrr7l77qCIKWYVs
 lUQMR6y4Grkcm+rTSmlJL2Iyr0fjKTWg7L0FDjyGgpas5+dVixmtN7+pDU2NOEjKs5vh
 bNpSQdgyRHejVhZdcnR3/JJx5uJZC6OT7yIa1Vi9nfUV8gqq3Lw/1CzIKw6Ftn4uL+RM
 VXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SL5zPBvk0q1D3fCGNqdEDG3JJEWz3O4StXLyVxwYD5I=;
 b=U6GcGwYpXSgl2sVKcXLCyKF8jyTfSH6tUPU+o7QJLKf5R8F6+mTByMAH7RzeZnIx4s
 s0PslFhWbGuqq7NeB5ngtRwH6ns0tsAK3Egnp9xV8JFMe+ZWb29Ato7MOqLH1aqQU1q4
 lDOcgEiFQb0OF75GC138hc7IUMldDQMLt/+HhYmbz98YaWyt07R45Jd0FxxGEJECN3q0
 XLIzaFIfPIDT/ZLrreufAFRSXfv60LvPjJ2+ltffwC1ECWcvAvVJzKLoKgwn0iLqsDAx
 d4iunRGTLgI1bw/LjZ5s/PcoAmLLI5Qv/ZcX++O+ZjDvvUqxsSd513npuK/+NU1DZNKl
 jrdg==
X-Gm-Message-State: AOAM530b0fI33p91UIOiuh93U6nxCayxYa/1v2Tew4gcoLpYpEWmCuJ2
 nY/1QnelmfeDGJVfeOe2KcyW9A==
X-Google-Smtp-Source: ABdhPJxYNo6g0KH7rwo1uCUXBo45fOErXUnsR3TBjSbf+oKh6xiEMFaEk4np4JL249i+CuNHgphusg==
X-Received: by 2002:a17:902:b78c:b0:15d:2431:a806 with SMTP id
 e12-20020a170902b78c00b0015d2431a806mr13939445pls.77.1651528849375; 
 Mon, 02 May 2022 15:00:49 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a170902e41300b0015ea95948ebsm2021918ple.134.2022.05.02.15.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 15:00:48 -0700 (PDT)
Message-ID: <eeb7ff2d-e9c3-a39e-598c-2cd8cc33e7f6@linaro.org>
Date: Mon, 2 May 2022 15:00:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 17/21] target/ppc: Remove msr_fe0 and msr_fe1 macros
Content-Language: en-US
To: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, balaton@eik.bme.hu
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
 <20220502143934.71908-18-victor.colombo@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220502143934.71908-18-victor.colombo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/2/22 07:39, Víctor Colombo wrote:
> msr_fe0 and msr_fe1 macros hide the usage of env->msr, which is a bad
> behavior. Substitute it with FIELD_EX64 calls that explicitly use
> env->msr as a parameter.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> -            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
> +            if ((!FIELD_EX64(env->msr, MSR, FE0) &&
> +                !FIELD_EX64(env->msr, MSR, FE1)) ||
>                   !FIELD_EX64(env->msr, MSR, FP)) {

This has 6 repetitions.  Perhaps extract to a helper for conciseness?


r~

