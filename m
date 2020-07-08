Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CAB218CF0
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jul 2020 18:27:23 +0200 (CEST)
Received: from localhost ([::1]:45680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtCuo-0007E1-0w
	for lists+qemu-devel@lfdr.de; Wed, 08 Jul 2020 12:27:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtCtH-0006L1-Dj
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 12:25:47 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:35730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jtCtF-0005el-Gx
 for qemu-devel@nongnu.org; Wed, 08 Jul 2020 12:25:46 -0400
Received: by mail-pf1-x443.google.com with SMTP id a14so15608369pfi.2
 for <qemu-devel@nongnu.org>; Wed, 08 Jul 2020 09:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=evWWpTCh47T2jYv4+tktTPnwjA+7Nam2WkVwGXFvb2I=;
 b=XEMnyzG6VKI4j1qHbX4l94gcBTHLiIof/jE2+p/n8Q9SFpA7AQsCCkEtfPZDjpY5DZ
 wfSn/1mRu2Ga5oU1+p1H3W16KfHOhIIFGSt8PG2oaw396f4Rivsc21FqEfyhh4TPzroH
 qIKK0wt2Dl72bBsC85qGzAuARL/OokyS83yNTOZAGMcOHSoYVQHgzok1dK4vsJL9tIfQ
 FqPM0naYTCNNbzcRM2127LjImRCoBTihu7/xZ5M0Pj0tQjAFMsRCTpym+lfe4iTGHBrA
 1CwikUNOq9YuF2hGn99bm9WCVeRlyWlTszJV7UBaKOz7exoZszDhJbXzI60zgV9Y5q6k
 dPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=evWWpTCh47T2jYv4+tktTPnwjA+7Nam2WkVwGXFvb2I=;
 b=Xlz79yR1YmWHwlsNFOuNsKM8799F0rbZXRtooGwo+9W27lFZReH1qAH2jk7+8/KALm
 Knyvoq+PNbmIPHwH/BjoZ3Tdkcopr/6qHi/5lyVrSYRNFMAvFS0s1xlMME2aXrsDcJBR
 v41aZ/GL4qex+ZzrPv0ghzJJFBIKhlKYjVAniLfeIP749fK4iTWup2oYmBwoR1uyZsSi
 8wzGt7LxlPbTd79uPYiKGqeta/mkyUWdTwXcRiFgtZ29ZqLoFJXZvNwTIYM55LrBEP8o
 aYdCZN8w6s2IGkOw57F4oCs4SziNtL24Uk5+hH1wq9pksd3D95/j4xuQuxt1dhgY80gd
 W+VA==
X-Gm-Message-State: AOAM530SAiyE9sUDqu3UMuz7P4rJfEje8H5oYGofEF/W9Ho63UP5Pt8C
 gIK2IEG2DyKuxtP1J6TX3e38KiGn43c=
X-Google-Smtp-Source: ABdhPJypeIcW3TIoGx8VKFVgMfSxLbwqiE3/57K51D14iU21mAtnxbvpG6/VTou4TJ2YI2ZC94Lrrw==
X-Received: by 2002:a63:531e:: with SMTP id h30mr48369470pgb.165.1594225543356; 
 Wed, 08 Jul 2020 09:25:43 -0700 (PDT)
Received: from [192.168.7.121] (24-113-145-216.wavecable.com. [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id 7sm288609pgw.85.2020.07.08.09.25.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2020 09:25:42 -0700 (PDT)
Subject: Re: [PATCH 09/21] target/xtensa: add DFP option, registers and opcodes
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20200706234737.32378-1-jcmvbkbc@gmail.com>
 <20200706234737.32378-10-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4fc60414-4b04-2402-3e72-50e77a7854b6@linaro.org>
Date: Wed, 8 Jul 2020 09:25:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200706234737.32378-10-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/20 4:47 PM, Max Filippov wrote:
> +float64 HELPER(add_d)(CPUXtensaState *env, float64 a, float64 b)
> +{
> +    set_use_first_nan(true, &env->fp_status);
> +    return float64_add(a, b, &env->fp_status);
> +}
> +
>  float32 HELPER(add_s)(CPUXtensaState *env, float32 a, float32 b)
>  {
> +    set_use_first_nan(env->config->use_first_nan, &env->fp_status);
>      return float32_add(a, b, &env->fp_status);
>  }

I think you can do better than to set the use_first_nan flag before every
operation.

E.g. the translator could remember the previous setting within the TB, only
changing when necessary.  E.g. if env->config->use_first_nan, then set it
during reset and never change it again.  Similarly if DFP is not enabled.


r~

