Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FD14AAD75
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 03:13:06 +0100 (CET)
Received: from localhost ([::1]:58276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGX33-0006XB-0v
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 21:13:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGX1y-0005JX-0l
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 21:11:58 -0500
Received: from [2607:f8b0:4864:20::634] (port=34486
 helo=mail-pl1-x634.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGX1v-0006mV-5j
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 21:11:57 -0500
Received: by mail-pl1-x634.google.com with SMTP id 10so553291plj.1
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 18:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=schmzfMhhpKQ1PwUv1iJuqca/R5eJgSH9k9LB3Uj6Nk=;
 b=yKIAr5ASg8r5Rb3H69QmMHGu0HcoPzzBj4BpRazpuRe1g71a6WY30T3cgDmH4uR4YW
 dfwyPzUZ4XAvZRnCqzeYgFrWoSpW6VlTfd/WRYJhGNuEB0wCouEL7E72WXnThq/l7dA1
 m4haSYpkFujNyFVjxpa++1zH/jf8fx8twzpaAQ4y6gwjmnJGn2onE2Lp9q7n5ChA+WlT
 Hzr49MOTaVaSYpeNwjCnLl95zJyZ/fNM40Ryr/MGqbrveWtzwvG73Huck0CiyYucC+gv
 JPDFE3AExJDpY3f8ZeKanekVsCDnfX+naal7Sn7hyoPGy9aobAlQDwUjye87rNt93hHK
 ZnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=schmzfMhhpKQ1PwUv1iJuqca/R5eJgSH9k9LB3Uj6Nk=;
 b=KBawvvWcdivJi0HGtrkvQEGh/FBMh8kZWSoYyH/6rXcaVjA5xvT6+IBnMkhUKFRK++
 7c1LW3KbCAYlcMuzt2XP//fLRI8GkQug+2NLwH/VVbsQkNd943OPlHAgeiRgVNHlHV6k
 7Qg0OsCpKzvKivCsQFgaBXzsdYTqEiB2iGFjXuQJo9zmAYBFgaBmfWbM/V1zwDQuG5J3
 oFQEE8yaA1rUd4zmgcoQZYrpQayoLZo13TquZBKpiqm4w1wAdCExcPv+VrwCgQXNB5/8
 SOKEK4w4fuw8IJOagC7RV6dRyE/fveNlIie7A7k2SCGcLy0yAqZ1DdQ2Riu3vR8TOygs
 MbPQ==
X-Gm-Message-State: AOAM533UttX4RReipVJKEecAQklOK0EEclwH4crsjqsUUHK9Rvw+pGt1
 SCIh6otwbpd9zdjse6uy4qINZw==
X-Google-Smtp-Source: ABdhPJxwHRodrPdHE/vWHgvYwefe3cEbKckxrrCmnF5o9b4j1wIilVEvoerwgzGhZLiSVxYZH2vcyg==
X-Received: by 2002:a17:90a:4045:: with SMTP id
 k5mr11377589pjg.98.1644113455851; 
 Sat, 05 Feb 2022 18:10:55 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id c11sm4783061pgl.92.2022.02.05.18.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 18:10:55 -0800 (PST)
Message-ID: <9d460def-1d50-94af-f6c8-e6208421eb41@linaro.org>
Date: Sun, 6 Feb 2022 13:10:49 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] arm: force flag recalculation when messing with DAIF
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220202122353.457084-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220202122353.457084-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::634
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 23:23, Alex Bennée wrote:
> The recently introduced debug tests in kvm-unit-tests exposed an error
> in our handling of singlestep cause by stale hflags. This is caught by
> --enable-debug-tcg when running the tests.

You could mention that PSTATE_D is used by aa64_generate_debug_exceptions.

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Andrew Jones <drjones@redhat.com>
> ---
>   target/arm/helper-a64.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/helper-a64.c b/target/arm/helper-a64.c
> index d6a6fd73d9..7cf953b1e6 100644
> --- a/target/arm/helper-a64.c
> +++ b/target/arm/helper-a64.c
> @@ -83,12 +83,14 @@ void HELPER(msr_i_daifset)(CPUARMState *env, uint32_t imm)
>   {
>       daif_check(env, 0x1e, imm, GETPC());
>       env->daif |= (imm << 6) & PSTATE_DAIF;
> +    arm_rebuild_hflags(env);
>   }
>   
>   void HELPER(msr_i_daifclear)(CPUARMState *env, uint32_t imm)
>   {
>       daif_check(env, 0x1f, imm, GETPC());
>       env->daif &= ~((imm << 6) & PSTATE_DAIF);
> +    arm_rebuild_hflags(env);
>   }

You could call helper_rebuild_hflags_a64 directly, since we know that we must be in a64 
state to get here.  Regardless,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

