Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E78155A21C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 21:53:20 +0200 (CEST)
Received: from localhost ([::1]:34456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4pMk-0007gz-KY
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 15:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4pJg-0006Gl-90
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 15:50:08 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:40653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o4pJe-0006jb-Ld
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 15:50:07 -0400
Received: by mail-pl1-x62b.google.com with SMTP id k7so2955827plg.7
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 12:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NxajXOp3g2CV39RTM/0OnCfYeLAr1IUZ5vNFdmvXdCY=;
 b=ZsCb0e0Gdct/GWateDKLAPUQVQ3xRes5w4o1mLOmMoHWhn386xnuqKHCoYkhj6ZXih
 MlhQLelkLlHvvcBNylOu7/INii4N6zQBpsLwdm4BYDv06zuT3mtGT8ZSmhz87K2NEy9z
 nobxEiE10itsQIrHyi6NnJh7i2zSKVvTo5+xQ1eNwAGcxzUQpbpeUgDKZ8Kz+LOGKvGl
 +brH5b9JeK5xZd3c9AJpvdj1EX7HrCDKxzGI/dJqyTXv+WD8/0TSd7LH0My9EInFQ6Y0
 9itH6wQ1gl7c1txpXE5Enu7oUXo1m2OJEaTctJl8tMp8nbBIF81AqRdNhX2+46xBbRcM
 6PMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NxajXOp3g2CV39RTM/0OnCfYeLAr1IUZ5vNFdmvXdCY=;
 b=jLmcQZ/QNO8rhjbV0Kf8d3jLUOPzc6uScluHVr79zxU2DO4H+Adks0qbpCkvmsKWoI
 lYA32f7VbeG5G7rOS17Ya2AsZOqsmTMVGRl1aAKQ5mZredHOi1vdU3oWS90MzJqdOJ6/
 85gh4w8ByGC8rMwMyJnu07+bN3/jhc9KznIScBxBW8Wk2bejQGSOCoCxrhty5uXj+zb+
 G5FxTa9fXwjuLVHiZ12eTXW6gvJVhfMMY/XH2pu7hXacP7BC49ONT3ZSJNKpZGgJmCuy
 CJxnOwZg3R3IgurWQrHKLJJrjnzxWFuWtP9XwTiKSaY2QiwZ3KuyNwlHwldwQ9OmBKwJ
 IWQg==
X-Gm-Message-State: AJIora/g8Vda0gJFiasG8Z8MQqiYzBjjPP7Hm/7hQi1CgCnEbRDnnwPU
 SKuVGYRWhpAObI60OkfAjhM6tg==
X-Google-Smtp-Source: AGRyM1uWXi0KG503W19MsRJ46qHGyeQgbcFwRm3MAgOdtYIlt8YmdKAy6ZTR55Lk3Zy5yDiBf2FPCg==
X-Received: by 2002:a17:903:1211:b0:15e:8208:8cc0 with SMTP id
 l17-20020a170903121100b0015e82088cc0mr711591plh.52.1656100204767; 
 Fri, 24 Jun 2022 12:50:04 -0700 (PDT)
Received: from ?IPV6:2602:ae:1543:f001:b25a:9949:8352:ec5d?
 ([2602:ae:1543:f001:b25a:9949:8352:ec5d])
 by smtp.gmail.com with ESMTPSA id
 b7-20020a62cf07000000b0051835ccc008sm2114394pfg.115.2022.06.24.12.50.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Jun 2022 12:50:04 -0700 (PDT)
Message-ID: <fa56c2e6-3f05-e446-4b31-d6b88ee115de@linaro.org>
Date: Fri, 24 Jun 2022 12:50:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RESEND v2 2/2] target/ppc: Implement ISA 3.00 tlbie[l]
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, npiggin@gmail.com
References: <20220624191424.190471-1-leandro.lupori@eldorado.org.br>
 <20220624191424.190471-3-leandro.lupori@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220624191424.190471-3-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/24/22 12:14, Leandro Lupori wrote:
> This initial version supports the invalidation of one or all
> TLB entries. Flush by PID/LPID, or based in process/partition
> scope is not supported, because it would make using the
> generic QEMU TLB implementation hard. In these cases, all
> entries are flushed.
> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   target/ppc/helper.h                          |  18 +++
>   target/ppc/mmu_helper.c                      | 154 +++++++++++++++++++
>   target/ppc/translate/storage-ctrl-impl.c.inc |  15 ++
>   3 files changed, 187 insertions(+)
> 
> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
> index d627cfe6ed..5e663a0a50 100644
> --- a/target/ppc/helper.h
> +++ b/target/ppc/helper.h
> @@ -672,6 +672,24 @@ DEF_HELPER_FLAGS_1(tlbia, TCG_CALL_NO_RWG, void, env)
>   DEF_HELPER_FLAGS_2(tlbie, TCG_CALL_NO_RWG, void, env, tl)
>   DEF_HELPER_FLAGS_2(tlbiva, TCG_CALL_NO_RWG, void, env, tl)
>   #if defined(TARGET_PPC64)
> +
> +/*
> + * tlbie[l] helper flags
> + *
> + * RIC, PRS, R and local are passed as flags in the last argument.
> + */
> +#define TLBIE_F_RIC_SHIFT       0
> +#define TLBIE_F_PRS_SHIFT       2
> +#define TLBIE_F_R_SHIFT         3
> +#define TLBIE_F_LOCAL_SHIFT     4
> +
> +#define TLBIE_F_RIC_MASK        (3 << TLBIE_F_RIC_SHIFT)
> +#define TLBIE_F_PRS             (1 << TLBIE_F_PRS_SHIFT)
> +#define TLBIE_F_R               (1 << TLBIE_F_R_SHIFT)
> +#define TLBIE_F_LOCAL           (1 << TLBIE_F_LOCAL_SHIFT)
> +

Better to put these somewhere else -- internal.h probably -- helper.h is included multiple 
times.

r~

