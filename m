Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E0A39CB63
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Jun 2021 00:07:57 +0200 (CEST)
Received: from localhost ([::1]:58952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpeSR-0003C1-UB
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 18:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeRU-00028J-Un
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:06:56 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:39574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpeRS-0001rJ-PX
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 18:06:56 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 o17-20020a17090a9f91b029015cef5b3c50so9502997pjp.4
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 15:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D1vHC4nOOZSv8wDXciCt+GBKfzoZEb5SkLvyQVsgHRs=;
 b=L56W9p5aM5g/eaqT7vUq4+lnEdhWIPs9lKf82VCZRsQKY4ZVIQkWo41nsWtpFWjm9r
 hMnNBkcoAcUzj89+3FvIr78VfsCHd8C1RY2xAN3+Plv70dGzcNKsmyB1riw6MbFegLMk
 i27TzdROneeyHuPLz0eTyjKbYxcdezcakGx3MfVtrztWYvCwb/G2qnx9lvWKKzjMyTLz
 6OOUs+LXadL+XfVhqZjz9sjZMTdvziZW2WjsmZFnmwSirWj28RZI1SNzJJnm3NHrofkA
 PeDg3gCmqensD0fHbk+8HOGnbbSp8BKUpfy1ZoCwXUak3GSk0aTMw7/MNIRQv6hAeBAJ
 BTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D1vHC4nOOZSv8wDXciCt+GBKfzoZEb5SkLvyQVsgHRs=;
 b=Idhk2SYYPy1pkI5Ta0q17PAP1x5pBinHMoon1eCAq2fo74avB6pH+RAcCYlLLVnBPg
 X3SlYVBEGsSdNFDvVCTEMOyAWRpvYOsqG45sTwaVCqVDIX56Fn7QovhaNl2yyTBUa3Qg
 ySmjpjOahgrRX5x8hU66xKnDy09m44RjewFd3lMKhh9TIi4/KtdIEPVoNaCcHN5hQZ+X
 UOvzEn9DgIMQUWdxt3aNV93+FGaikmOnBagSotnWwdkvFNGvznXLZaYz89s6TAKTMYpl
 +5NrLm2/Cd9AX+zhgQGHy9xkTQBDB26wxcee6LpyKX+YYQUdHzFt4DOhOiDtYc0XsUuI
 phKg==
X-Gm-Message-State: AOAM531rgqt2gEWOBL3xzfZu8wVOqqamGYTz2y9gLHx1v2J+9r46O2p4
 o/RWiwfZ2Zp7qCXh2ch1L8ql1g==
X-Google-Smtp-Source: ABdhPJzLwFYTvHw8MUcyMGrx+sCNxVPc/HNNoTK1PRgMFBQbib92OrzFZM4EKqx10kSYSIKv8o0d4Q==
X-Received: by 2002:a17:902:c1d2:b029:101:656b:8c06 with SMTP id
 c18-20020a170902c1d2b0290101656b8c06mr10676927plc.77.1622930812611; 
 Sat, 05 Jun 2021 15:06:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 n69sm4735944pfd.132.2021.06.05.15.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 15:06:52 -0700 (PDT)
Subject: Re: [PATCH v16 85/99] target/arm: cpu-pauth: new module for ARMv8.3
 Pointer Authentication
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-86-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <59ab1d7c-3529-609f-0e24-4d17f40116b4@linaro.org>
Date: Sat, 5 Jun 2021 15:06:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-86-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> Pointer Authentication is an AARCH64-only ARMv8.3 optional
> extension, whose cpu properties can be separated out in its own module.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/cpu.h           |  3 --
>   target/arm/tcg/cpu-pauth.h | 34 ++++++++++++++++++++
>   target/arm/cpu.c           |  1 +
>   target/arm/cpu64.c         | 35 ++-------------------
>   target/arm/tcg/cpu-pauth.c | 63 ++++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/meson.build |  1 +
>   6 files changed, 101 insertions(+), 36 deletions(-)
>   create mode 100644 target/arm/tcg/cpu-pauth.h
>   create mode 100644 target/arm/tcg/cpu-pauth.c
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e9bfb6f575..02e0fe5dbd 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -216,13 +216,10 @@ typedef struct ARMPredicateReg {
>       uint64_t p[DIV_ROUND_UP(2 * ARM_MAX_VQ, 8)] QEMU_ALIGNED(16);
>   } ARMPredicateReg;
>   
> -void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
>   /* In AArch32 mode, PAC keys do not exist at all.  */
>   typedef struct ARMPACKey {
>       uint64_t lo, hi;
>   } ARMPACKey;
> -#else
> -static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
>   
>   #endif /* TARGET_AARCH64 */
>   
> diff --git a/target/arm/tcg/cpu-pauth.h b/target/arm/tcg/cpu-pauth.h
> new file mode 100644
> index 0000000000..af127876fe
> --- /dev/null
> +++ b/target/arm/tcg/cpu-pauth.h
> @@ -0,0 +1,34 @@
> +/*
> + * QEMU AArch64 Pointer Authentication Extensions
> + *
> + * Copyright (c) 2013 Linaro Ltd
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see
> + * <http://www.gnu.org/licenses/gpl-2.0.html>
> + */
> +
> +#ifndef CPU_PAUTH_H
> +#define CPU_PAUTH_H
> +
> +/* ARMv8.3 pauth is an AARCH64 option, only include this for TARGET_AARCH64 */
> +
> +#include "cpu.h"
> +
> +/* called by arm_cpu_finalize_features in realizefn */
> +void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
> +
> +/* add the CPU Pointer Authentication properties */
> +void cpu_pauth_add_props(Object *obj);
> +
> +#endif /* CPU_PAUTH_H */

Similar comments re "cpu.h" and the proliferation of headers.
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

