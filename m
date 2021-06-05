Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D747439CA74
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Jun 2021 20:14:05 +0200 (CEST)
Received: from localhost ([::1]:46508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpao8-0003d4-NZ
	for lists+qemu-devel@lfdr.de; Sat, 05 Jun 2021 14:14:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpanN-0002l8-5N
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 14:13:17 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpanK-0002NU-Pt
 for qemu-devel@nongnu.org; Sat, 05 Jun 2021 14:13:16 -0400
Received: by mail-pg1-x52c.google.com with SMTP id e22so10468124pgv.10
 for <qemu-devel@nongnu.org>; Sat, 05 Jun 2021 11:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+Jgk9p8Czxc/HetAphE9a9mdBCtdlvAhzuxOBut2rXk=;
 b=mJkd4XUtgZdsEotfA4cAvSR6+7lB/L8jDDCGe2gonME5ab/d5IZ1Nhk8c97D8pq4ij
 tSGYyqZv5aNPkyXDFjOA7ci4uYFLwTAt0Xy/Da8EQJExgsOUhLmwrrFjo9gRPZ96KUuP
 /ZvI87WQryUeg9VTHtAfr5fCji2yjJI9rN+zDyHcZvlD5H0FkRZcRb8+55I0sqed14Js
 1v7KDwUv++rUBpwumGlgLqh4IkmTdSqbKvuuy6B+TBYtl6KqlSDU4GibqYBQnW0PEN6H
 cTZrSPyi78rzUN8HpAb5v2F6W8KYIEJPNKVkpdogcCq4We/14dV9Mx8nHmDpe3YssWI+
 hOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+Jgk9p8Czxc/HetAphE9a9mdBCtdlvAhzuxOBut2rXk=;
 b=btG4xvQegX08BTLU6sjzHCS72/0pAhyzKiu6K3K2OI27mcfn+2G9WAyRgbFG3iMFLu
 gZZFBmfo4fbfPl9xGMHI86pPioqNuG6B1vUNuvo5C4ghPI9qd15vSUDyMqkt9AoFd9Sz
 mVxuHHtJswnvFCAh/ftm+JVdhJvbEDqOTungtpdfTG48Qe0WfB5TdCY1nAuCBLWob9ME
 A3avq8eXKqHJjwzGyb+MV4vRz0zJGEQUNvMBzITmliVY8poL+DVAG0tALnc7giYQYqpv
 WK97XVyuBTOoGHWMUJlipGlDN2d4GIq4l3rtPJEUozgjmfKh9eqPOVzHjISiSTNBUCuS
 yF/Q==
X-Gm-Message-State: AOAM5337ghkolZMklqx1FR5c1VRstLQQvAVpzRwIxZJbTxBZ0XEXbKXZ
 VVTAbQS3R6mMN8phdB1W5IlJ8w==
X-Google-Smtp-Source: ABdhPJyaYUMAg5Oh8xNwiIZHHhkq3tjwvACDXfHAMsmKjqPyH4TTOcwUui7M0P4w3Wz7EDV4OAx22A==
X-Received: by 2002:a62:5288:0:b029:2e3:fd7d:267a with SMTP id
 g130-20020a6252880000b02902e3fd7d267amr10395121pfb.21.1622916792862; 
 Sat, 05 Jun 2021 11:13:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 190sm5010120pgd.1.2021.06.05.11.13.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jun 2021 11:13:12 -0700 (PDT)
Subject: Re: [PATCH v16 71/99] target/arm: cpu-sve: new module
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-72-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0a105bf1-a64e-f9cd-3ab2-d3ac4157297f@linaro.org>
Date: Sat, 5 Jun 2021 11:13:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-72-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
> +#ifndef CPU_SVE_H
> +#define CPU_SVE_H
> +
> +/* note: SVE is an AARCH64-only option, only include this for TARGET_AARCH64 */

This seems unnecessary.

> @@ -201,13 +202,9 @@ typedef struct {
>   
>   #ifdef TARGET_AARCH64
>   # define ARM_MAX_VQ    16
> -void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp);
> -void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp);
>   #else
>   # define ARM_MAX_VQ    1
> -static inline void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp) { }
> -static inline void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp) { }
> -#endif
> +#endif /* TARGET_AARCH64 */

Hmm.  I'm not sure about removing the stubs, but see below.

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2fef8ca471..6db37b42d1 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -23,6 +23,7 @@
>   #include "target/arm/idau.h"
>   #include "qapi/error.h"
>   #include "cpu.h"
> +#include "cpu-sve.h"

Not following the advice given above, which I agree with.

> +#ifdef TARGET_AARCH64
>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
>           arm_cpu_sve_finalize(cpu, &local_err);
>           if (local_err != NULL) {
> @@ -838,6 +840,7 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
>               }
>           }
>       }
> +#endif /* TARGET_AARCH64 */

New ifdefs, which isn't great.  But I also see that it's more or less a 1-1 
swap.  One ifdef here, or one ifdef in the header to create the stub.  So I 
guess it's a draw.

So, modulo the comment at the top,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


