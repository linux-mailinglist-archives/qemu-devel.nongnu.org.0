Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D9639CB6C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 00:15:52 +0200 (CEST)
Received: from localhost ([::1]:35736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpea7-00070w-Se
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 18:15:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeYa-00066m-17
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:14:16 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeYX-0006Kr-Sk
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:14:15 -0400
Received: by mail-pg1-x533.google.com with SMTP id t9so10807950pgn.4
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 15:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ch4/PIbrzUawveB5cBKf/HXBwMIDZk9V7lpdvUKfu3U=;
 b=j+/etm1teDijmRNbYJlpYBRrdKOGr4yZOnpKx3agWoKmWmUxq2C4HjChO6GBSS1iUm
 m2o1I2XgDGyK5mWBUsyk7fvqkLr00uMnd8h1L6++G09lmuSYdgjFiPWvtF29qpFdVF2j
 fOfdpiRT3tKEVBTHMCu3mWQUwXCL3EDtjgc1CH99kb7RsN039lAzZFyzfJ+SvwFQxYYD
 L7ChVQA3vyVPVfsnUj8d/DegpBsp926cLk6Eb31xrkpWyFJJ0MroWWuNQYrqnJT0MfxD
 S6PH9WPTUF872AUtjnP1+xCiBEH7QDsVjc04QbSY70NRS6ry9Qmmy57GIKD/frg5yL2L
 nM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ch4/PIbrzUawveB5cBKf/HXBwMIDZk9V7lpdvUKfu3U=;
 b=f15MKhbaAzWPKsYBCl0Y8Pp+UVKizlLDo7IQDmgScAOEEPaGz4LZzrak3ro6aAHQCL
 ESTbnGZKGKA+kKuhmYaFBUGUSNfJqSXnaPk9bqFB/m8uKw0+tRbTxuI+ih+wRoGX+pO8
 RRIXAb/Vhc//QIv4ZcCxMBaKdCOUUlitL8YSYkFR6cDXWP8bwG94ItLmXibE05algh79
 CxVMP+gwHdf6UxQI1a86w6z5QpYZw313vjxvyfiSvDQh7NjAqOrczsixlECfrFPoZgjT
 /VnhXO75MqkH74poo23v6Ppdhp0IgiYT7o2mGCpZ01tS1kBozW33PD4oHcDZlXdq63er
 gyPQ==
X-Gm-Message-State: AOAM5314C0UiNk/Miczj/hkSIBujGT3qprG0jl3brSId5zkuxQju4wf0
 KJNMXuoCEzjtkkO4pyxzuzcAxQ==
X-Google-Smtp-Source: ABdhPJzQedStELT7z+saYLHHX71gtqS930a8UPNW2GJ/X2ZsEbs2SkhvHtKmAkX7BUEPiRM/PECP2w==
X-Received: by 2002:a63:475b:: with SMTP id w27mr11186935pgk.305.1622931252425; 
 Sat, 05 Jun 2021 15:14:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 m1sm5161438pgd.78.2021.06.05.15.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 15:14:12 -0700 (PDT)
Subject: Re: [PATCH v16 87/99] target/arm: move arm_cpu_finalize_features into
 cpu64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-88-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a9724660-5f12-ebe3-883b-40b8d8906276@linaro.org>
Date: Sat, 5 Jun 2021 15:14:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-88-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/4/21 8:53 AM, Alex Bennée wrote:
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index fefb6954fc..c762f3f07a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -469,6 +469,40 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
>       return g_strdup("aarch64");
>   }
>   
> +void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
> +{
> +    Error *local_err = NULL;
> +
> +#ifdef TARGET_AARCH64
> +    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +        if (!cpu_sve_finalize_features(cpu, &local_err)) {
> +            error_propagate(errp, local_err);
> +            return;
> +        }
> +
> +        /*
> +         * KVM does not support modifications to this feature.
> +         * We have not registered the cpu properties when KVM
> +         * is in use, so the user will not be able to set them.
> +         */
> +        if (tcg_enabled()) {
> +            if (!cpu_pauth_finalize(cpu, &local_err)) {
> +                error_propagate(errp, local_err);
> +                return;
> +            }
> +        }
> +    }
> +#endif /* TARGET_AARCH64 */

These ifdefs are useless.

> diff --git a/target/arm/monitor.c b/target/arm/monitor.c
> index 0c72bf7c31..95c1e72cd1 100644
> --- a/target/arm/monitor.c
> +++ b/target/arm/monitor.c
> @@ -184,9 +184,11 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>           if (!err) {
>               visit_check_struct(visitor, &err);
>           }
> +#ifdef TARGET_AARCH64
>           if (!err) {
>               arm_cpu_finalize_features(ARM_CPU(obj), &err);
>           }
> +#endif /* TARGET_AARCH64 */
>           visit_end_struct(visitor, NULL);
>           visit_free(visitor);
>           if (err) {
> @@ -195,7 +197,9 @@ CpuModelExpansionInfo *qmp_query_cpu_model_expansion(CpuModelExpansionType type,
>               return NULL;
>           }
>       } else {
> +#ifdef TARGET_AARCH64
>           arm_cpu_finalize_features(ARM_CPU(obj), &error_abort);
> +#endif /* TARGET_AARCH64 */

Not keen on all of the extra ifdefs here.


r~

