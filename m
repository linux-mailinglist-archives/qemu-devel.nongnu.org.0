Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 263D743BB86
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 22:26:16 +0200 (CEST)
Received: from localhost ([::1]:47184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfT1T-00033d-5s
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 16:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSyz-00028j-MX
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:23:41 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:42960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfSyy-0004LF-2p
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 16:23:41 -0400
Received: by mail-pl1-x62b.google.com with SMTP id v16so359196ple.9
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 13:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z07nv1RVSlGZCw+tIN2VUKupIRCCNdBDZ2x8nvioqPw=;
 b=ydFMpTQoYcMYGTZlN5LQH7uGERCoVL4+TxQgrXFyHrfRaf8nzhPBAeLIB8GvwNi2vb
 OL/1OES7+mRnf0TvP5ekF/5jWXY6s1CaM1mD1AHmL7ga9cdN59EwG5w1mqD3EumDvXmM
 B73/c8rRTXhTvcXZ/K+7fTNgCOPBdtX7HTOMD6sPyT9euunETmu0mb4fSrZyOun/zgRB
 8VLAVLv3CU8CHAa3jsq4qx0wB8AmEsMOayArkacQ/Y2dRCmkKRp7yk66BQgVeUDB4AmP
 aZHspoh5UQNOS0CM9DkFmUuuTfy7IxKh+5JTx2XzzCAyOjI/8e+jGp+UXUHEWlgOVtCC
 RJ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z07nv1RVSlGZCw+tIN2VUKupIRCCNdBDZ2x8nvioqPw=;
 b=mGPdBketfZP742y6SuWku/Bu75tynTauv6UmlbyI5OYuRM4cHiY0fmWHtUwOdPk/Ti
 JtD2+Ys13Ii9Dv1/a+Wye8CXuS/xbMKQSaAJac6TyTr5+ZBhYXJs1uZAPAs+xzW5dVLY
 lZMW1X9er5U9viYYU/aJUFDdLIRb7fKyBYczdK2Aq/JchxaSWeqwtK1U3YsZA+ANVzR0
 W1ozLFRaTPaQPEwU/CLKtTFO8OemAaR6zpKpL0PFwX6sMIQQ0s+yUSeBqT7p3tp/7jxa
 Crzkk2j/Hzf1Mc7XXWvBwGze83TNx5tVlwlqVIcu/unAjSqYFndfB3qSiCnZ+U0XxAir
 x3GQ==
X-Gm-Message-State: AOAM530d9/DfmNIP3wJQNGkdjfUyQo0DkCVx/xgPXaLJ1zker2q5KuqG
 8xPqf2RXK0M0VQm8YUkRMXLFqtELIor8Vw==
X-Google-Smtp-Source: ABdhPJxm6p9PZVV13CAHBUrvLTBI02KugUoZciQbIqfOtWTdMra1kB/cN9deaOR/CCjXhSOi5AWD0g==
X-Received: by 2002:a17:90a:7e93:: with SMTP id
 j19mr1095064pjl.172.1635279818622; 
 Tue, 26 Oct 2021 13:23:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id g22sm6402577pfj.181.2021.10.26.13.23.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Oct 2021 13:23:38 -0700 (PDT)
Subject: Re: [PATCH v1 24/28] tracing: excise the tcg related from tracetool
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
 <20211026102234.3961636-25-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6232fbe4-5f69-a5ac-1842-ce7421df6382@linaro.org>
Date: Tue, 26 Oct 2021 13:23:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211026102234.3961636-25-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.215,
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 Luis Vilanova <vilanova@imperial.ac.uk>, mahmoudabdalghany@outlook.com,
 aaron@os.amperecomputing.com, cota@braap.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 3:22 AM, Alex Bennée wrote:
> diff --git a/include/exec/helper-gen.h b/include/exec/helper-gen.h
> index 1c2e7a8ed3..7b6ca975ef 100644
> --- a/include/exec/helper-gen.h
> +++ b/include/exec/helper-gen.h
> @@ -79,8 +79,6 @@ static inline void glue(gen_helper_, name)(dh_retvar_decl(ret)          \
>   }
>   
>   #include "helper.h"
> -#include "trace/generated-helpers.h"
> -#include "trace/generated-helpers-wrappers.h"
>   #include "accel/tcg/tcg-runtime.h"
>   #include "accel/tcg/plugin-helpers.h"
>   
> diff --git a/include/exec/helper-proto.h b/include/exec/helper-proto.h
> index ba100793a7..c4b1bda632 100644
> --- a/include/exec/helper-proto.h
> +++ b/include/exec/helper-proto.h
> @@ -38,7 +38,6 @@ dh_ctype(ret) HELPER(name) (dh_ctype(t1), dh_ctype(t2), dh_ctype(t3), \
>   #define IN_HELPER_PROTO
>   
>   #include "helper.h"
> -#include "trace/generated-helpers.h"
>   #include "accel/tcg/tcg-runtime.h"
>   #include "accel/tcg/plugin-helpers.h"
>   
> diff --git a/include/exec/helper-tcg.h b/include/exec/helper-tcg.h
> index 16cd318b83..3933258f1a 100644
> --- a/include/exec/helper-tcg.h
> +++ b/include/exec/helper-tcg.h
> @@ -59,7 +59,6 @@
>       | dh_typemask(t5, 5) | dh_typemask(t6, 6) | dh_typemask(t7, 7) },
>   
>   #include "helper.h"
> -#include "trace/generated-helpers.h"
>   #include "accel/tcg/tcg-runtime.h"
>   #include "accel/tcg/plugin-helpers.h"
>   

These should have gone with the previous patch.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

