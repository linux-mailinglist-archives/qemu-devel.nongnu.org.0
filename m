Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 528A839CB6E
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 00:16:29 +0200 (CEST)
Received: from localhost ([::1]:38510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpeai-0000WM-9H
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 18:16:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeZH-00073X-HD
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:14:59 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeZE-0006k5-RK
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:14:59 -0400
Received: by mail-pl1-x62b.google.com with SMTP id f3so909928plg.2
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 15:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MJjwxe7JAteDnTKhF2sh+LOaK+sU3QrsYOhr4lLVUo0=;
 b=gZkKWeHruhWuyKPOjsbYtQ3ii+Z8M6R0A/Hg4oaYkxpW4YW/n/b+c09QMTgh5+LiUX
 mTjx4f80+V9e/m9YKxu5WUO/oItH0NWIidxnfGIKeyRhB1UMh0j0pBtHBR0XS2liyArh
 B4+aXOH7qZQ76TG6Tpne3ND5Q9SowSHxvFK9I4vB2ej8EYPozEOpGw5fpDbJHLWo/tRq
 A0XpOstn7X6jca/0AnmHQKsD2kpRTf9lypBRI+Y8UWEaMVLmDb/x1nDVOQTJe8J2K07l
 bgikVtSXX0ys9A3Uo5+ezoXr7bjrD9B6+87MlsJLq7XpWInaQIAEuiUgerPsu5mypXic
 nb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MJjwxe7JAteDnTKhF2sh+LOaK+sU3QrsYOhr4lLVUo0=;
 b=PfdDlSn/4hWT8fN22e24TPAMoALGYUHXfc/N4LeqKoNk0Sbzv6E4gddHvNkEE0AHrx
 q3wPeJ6mLER/GGEsVW7V6x93O+oL1fae5FHm1QK0o/HCxl6XSDIcWCRfU6Q6ltoKc3F0
 Fcup8LhYeXmMNbiTOw3e0aYU3te0j7Temp1X1HmotRtWWdjNCUYqm2A+F1Yai8J20TI1
 dpwOUvEkh2enU+HS3jGlZFOy/1nPANKl0pCtdSGpvhYVoJajU5UtDhHhhJZ0B+ZECWEQ
 07UXgHBNAitlPQjg9TbqHzTdUK9jasnp0J0zBWnZqO+R/BFQBLjSgN6qA8zyTjYFT7dl
 qigg==
X-Gm-Message-State: AOAM530uql7mtoHXZLoSkI4KZVLzEYQfUvPrxP2XNuFPK2eiQZtSqDq0
 AIkb+uBPXLHMPV+ffNIOOEOGAgzha+RnzA==
X-Google-Smtp-Source: ABdhPJzc5l/ug8a4L8Y/Kbh2510ie1E8T5CSlXYcU3VcOvR5zuY2EFtVwmAvdw91zHq6wxZostauLQ==
X-Received: by 2002:a17:902:988d:b029:ef:68aa:d775 with SMTP id
 s13-20020a170902988db02900ef68aad775mr10515600plp.57.1622931294642; 
 Sat, 05 Jun 2021 15:14:54 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 s24sm8209793pju.9.2021.06.05.15.14.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 15:14:54 -0700 (PDT)
Subject: Re: [PATCH v16 88/99] target/arm: cpu64: rename
 arm_cpu_finalize_features
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-89-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5a4dd603-672f-aa43-c59a-79b0e29c6a76@linaro.org>
Date: Sat, 5 Jun 2021 15:14:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-89-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.59,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> @@ -469,11 +469,10 @@ static gchar *aarch64_gdb_arch_name(CPUState *cs)
>       return g_strdup("aarch64");
>   }
>   
> -void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
> +void aarch64_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>   {
>       Error *local_err = NULL;
>   
> -#ifdef TARGET_AARCH64
>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>           if (!cpu_sve_finalize_features(cpu, &local_err)) {
>               error_propagate(errp, local_err);
> @@ -492,7 +491,6 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>               }
>           }
>       }
> -#endif /* TARGET_AARCH64 */
>   

The ifdef removal shouldn't be buried in a rename.


r~

