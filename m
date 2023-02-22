Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BE669F231
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 10:50:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUllb-0004x9-Oi; Wed, 22 Feb 2023 04:50:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUllU-0004oa-CD
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:50:20 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUllS-0003oM-8Q
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 04:50:19 -0500
Received: by mail-wr1-x433.google.com with SMTP id v3so7019351wrp.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 01:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0zOMvep8EVw3eDW5CBkP343w7vBheRjU+5z6wO3rcOo=;
 b=NIC/5NfVv7IHBeCCe8h5Mqy6JxIdiXDwwbSjvnJ1A5Frl0WGmd8cPmBpjV9rh+P0V0
 676/Qouw3Kt/nysJb9fP3RrP3hZjb2Wn+9mda3QFaINZpKtyPV9YV6LzomnP5BBe2dUR
 wVmsCuSFzNixP+NdgPtcd+g0Rw5NNKUD0u/qZWtbFWKDO13oPy1kvQ3PS2stL6uKZPA7
 eKlbgU4XcYlKqecDnm6j83u4g1R2nqVauhBtNc5eeCvGa+k5nJZlVdVDWJE9PF+LXR7L
 oYgMA4/G5vqEGK4yoGbN3OEn8mN2/YvRLn+qV3HLjCeAh1LM/zG6EEoIwtjhhh314ve8
 yfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0zOMvep8EVw3eDW5CBkP343w7vBheRjU+5z6wO3rcOo=;
 b=AcvPLon0WV8g3tDU358Pa6OHzTpjVz4xkiO29lhrrk4loSMoIgzr2Fp2C0yaYYpmFX
 P7bVD1pyi1cSfHBiXQJaddd2XcrRtl2/TmRo4otwf+7S45KjgGRAPnjPI2NI91Zk5vJV
 WVupqDiZHTUsS7L05Xb1whaAMLrQ9vOMC2FUmAvE1b6RYtT6PGb5s5NAL5gs8rnUWslt
 z9X6d6uTVua2FYxwOI34TwA2J1UMOzKDDeL515hGUznCfmT63TK6qGPoRXNybatvZfco
 QWPdYGwMQ8FCGg5HGRyeNovBYzEZTBgvjT42kr7I4/Qf2MlGgSwo57mO3Uq4ZehF13h2
 ma/g==
X-Gm-Message-State: AO0yUKVxR6K3oArwBy/ov+yrE9sqCZ18fSd2zuKoHJ0zKx1szFgt/5Ls
 ntocg4tXCq4b0hvJkWmZIyWTgg==
X-Google-Smtp-Source: AK7set/tlGbB9vFio2JZdIHvQUdOeGIBWMScoLcRwPXR+G7HxxOulYBe5fQyAsWtiy03gxw5DD3Drg==
X-Received: by 2002:a05:6000:1086:b0:2c7:454:ed41 with SMTP id
 y6-20020a056000108600b002c70454ed41mr4793173wrw.71.1677059416522; 
 Wed, 22 Feb 2023 01:50:16 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a16-20020adffb90000000b002c54c92e125sm5814608wrr.46.2023.02.22.01.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:50:16 -0800 (PST)
Message-ID: <effda1ed-c2ad-fd2c-de0c-f2785d3e46f4@linaro.org>
Date: Wed, 22 Feb 2023 10:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 20/25] target/arm: Use get_phys_addr_with_struct for
 stage2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222023336.915045-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 22/2/23 03:33, Richard Henderson wrote:
> This fixes a bug in which we failed to initialize
> the result attributes properly after the memset.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 6fa3d33a4e..7e1aa34d24 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -37,10 +37,6 @@ typedef struct S1Translate {
>       void *out_host;
>   } S1Translate;
>   
> -static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
> -                               uint64_t address, MMUAccessType access_type,
> -                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi);
> -
>   static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>                                         target_ulong address,
>                                         MMUAccessType access_type,
> @@ -2859,12 +2855,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>       cacheattrs1 = result->cacheattrs;
>       memset(result, 0, sizeof(*result));
>   
> -    if (arm_feature(env, ARM_FEATURE_PMSA)) {
> -        ret = get_phys_addr_pmsav8(env, ipa, access_type,
> -                                   ptw->in_mmu_idx, is_secure, result, fi);
> -    } else {
> -        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
> -    }
> +    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
>       fi->s2addr = ipa;
>   
>       /* Combine the S1 and S2 perms.  */

LGTM but better have Peter double-check ;)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


