Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA8F53D673
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 12:43:00 +0200 (CEST)
Received: from localhost ([::1]:40180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxRFC-0007Jv-Jf
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 06:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nxRD1-0006c7-8Q; Sat, 04 Jun 2022 06:40:43 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:46657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nxRCz-0003qe-Jq; Sat, 04 Jun 2022 06:40:42 -0400
Received: by mail-pf1-x430.google.com with SMTP id j6so8956438pfe.13;
 Sat, 04 Jun 2022 03:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FJZdld67BarQ7W9+GgqM+iGrTAQw+zIqBjIf1fSOj1k=;
 b=pqLPMqEZsnyBr1nYDcd7w0U9TGykOGW5SAu3TcDQFFGoBujwyZlWIK1E/39y4S/blL
 S8rUR8hPh2O9exZveVNdspc+rszHfixy09ePfoJNm0kHbj+Tt2M2Mza6X4hjahUU5L/d
 nyyA0Lev+4/6iTZBSvJgKVpziy5h+cIaYqM/PLjisTRw2q9orPeiolQlATOol8PazFGD
 5esCO557gMzUoclGQHdpxBE5HLWCRoaCpCqi61czBp8fXrF1oCtbvBhQmloAR3NQk0iF
 5bBWfHe93owbBrAy7mXtgZodDqhNSbUj8Xo0Uasv5hjp0qwLpx/gZrIDzRJL5yM179dC
 4oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FJZdld67BarQ7W9+GgqM+iGrTAQw+zIqBjIf1fSOj1k=;
 b=MWUjSOvnrwzUitmqqV1Ggh1oP0NSvWAyBi301YGWGFEWxYkp/O05itLRCwidH3cs/k
 17gLUfQ7/n/1mb3yO7Z1UQ+JH1LT05lm1LCfV1WIESNeGOqRTYKfGg8mDiZUaKpfInaN
 jRuhpEIYBrJncrlFw6cDvEkFIqee4pY3kU46XHNfAtMLdIqnBX3YntbZ9mDID+ZusqbT
 qio9z4MJkf9dHTnwO/4SckGtEYLhL3TcHFnLfLS0kd8/sGPC6mA//E2QJKWSq6j8hEps
 2C+aEPVm0iuXhvzGqxY/3oTLvFTkiyFKSHLJ9MfbuWtroZBs3JUOraYdx98ZUywyyW0p
 UMdg==
X-Gm-Message-State: AOAM5306UwK+DKuI7V+SHxF+v9ElM05f6HK1zP4ebkHji40d+6fHUXqo
 3Hr0YnZTbqv/h1vLST6FUZE=
X-Google-Smtp-Source: ABdhPJwbnbWzNtujagPNFbg8VHJUgWMqaWLdC8PH6AJkgjhOpbD+Gvn5ksq7TTy90eTJRYv2NH5MDA==
X-Received: by 2002:aa7:88d2:0:b0:50a:cf7d:6ff1 with SMTP id
 k18-20020aa788d2000000b0050acf7d6ff1mr14545410pff.67.1654339239377; 
 Sat, 04 Jun 2022 03:40:39 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y200-20020a6264d1000000b0051bdf74177fsm3165581pfb.80.2022.06.04.03.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jun 2022 03:40:38 -0700 (PDT)
Message-ID: <c1295e83-88e1-7530-6965-f7385b908a83@amsat.org>
Date: Sat, 4 Jun 2022 12:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 01/28] target/arm: Move stage_1_mmu_idx decl to internals.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20220604040607.269301-1-richard.henderson@linaro.org>
 <20220604040607.269301-2-richard.henderson@linaro.org>
In-Reply-To: <20220604040607.269301-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/6/22 06:05, Richard Henderson wrote:
> Move the decl from ptw.h to internals.h.  Provide an inline
> version for user-only, just as we do for arm_stage1_mmu_idx.
> Move an endif down to make the definition in helper.c be
> system only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 5 +++++
>   target/arm/helper.c    | 5 ++---
>   2 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index b654bee468..72b6af5559 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -979,11 +979,16 @@ ARMMMUIdx arm_mmu_idx(CPUARMState *env);
>    * Return the ARMMMUIdx for the stage1 traversal for the current regime.
>    */
>   #ifdef CONFIG_USER_ONLY
> +static inline ARMMMUIdx stage_1_mmu_idx(ARMMMUIdx mmu_idx)
> +{

Should we assert(mmu_idx == ARMMMUIdx_Stage1_E0)?

> +    return ARMMMUIdx_Stage1_E0;
> +}

