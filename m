Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CEFB4F60AD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:54:11 +0200 (CEST)
Received: from localhost ([::1]:46158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc66s-0001O9-Ao
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc65S-00089g-Kx
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:52:42 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:40744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc65Q-0003uI-1z
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:52:42 -0400
Received: by mail-qt1-x835.google.com with SMTP id i4so4325171qti.7
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J96nQ92cyv+EOuupFrNNTIWr0oDK9CNOnAjcMHGwprI=;
 b=bLA2Rwy5ZEcnOO9pwouiLGfFpknBiNWYAE4QJB9144o4prbBvcBtx6fc42k2o5oIN2
 i60f+Lm8ohAx4sFMdqaMfu+g1MoqSs/2lriUxOOvCI1Yzhwfs3UGHit3W8neJAQlhUGz
 2+9/x/lW9B1b8XktsM4hIZAjPgZjrILs8ULCDkXtKeFG6+S2GcvXoudKBCLoDK0Eyflz
 EQUc5nmaoPPsZ2ujAjK93qFAR6wHG41uNZPMCkEmuHZg3KjynnLeHp3R7PiGrhXuZpnQ
 53Os405R9Y6+1qI+eyxpyro65piKBaP6eXNccytJ+qkMMGjEIfpQNHsiN2rL65IqLJ+P
 9PdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J96nQ92cyv+EOuupFrNNTIWr0oDK9CNOnAjcMHGwprI=;
 b=l/PNf9cL9rTGQ4MxN45OBVT1LKIBd264ZLS0htP0nZ3HY60hEiU9deIIhBCY1sczF/
 pwPVd1kbTRe5f8xzGbew6qyIstF3F0feQLoZkB5RmQ0UqqzJGtOcBy+B4X+MHfwS3zrl
 EK6pYaK1J1yZNhLYc/IQly6u0NiRUR+Kipck1vVOH21svl4mhTJvgweoqwacGWQd50e/
 d3IHb+LyWc4aKVWuzgCRRNKleXwZYD7S0moSFkDbMqWdd0kd29cumHYdWfoGFm4zyp8X
 0K3pS/82skHVe8GXj1/f0nGRWw9GV0sUdlm5cUn9Z8wRxRycKikLZLZQBK1RDlljTeFA
 qIWQ==
X-Gm-Message-State: AOAM533xeOhU4yq+8Ez+qurx6e8oT+KeYbD0QP8ImpVsr3rMxUKc03UM
 g5Qym1+Bq49M0j6z0Flz/LRW3w==
X-Google-Smtp-Source: ABdhPJyAitoqEm3kSLC0a3wQufH4SV33t4TVg24xL0iofe3Gtsvfq4eXwCDPdy7p6XNeyaUk6xK61g==
X-Received: by 2002:a05:620a:783:b0:67d:4c9d:d103 with SMTP id
 3-20020a05620a078300b0067d4c9dd103mr5683187qka.250.1649253159054; 
 Wed, 06 Apr 2022 06:52:39 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 c65-20020a37b344000000b00699aa260f5dsm8711630qkf.1.2022.04.06.06.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:52:38 -0700 (PDT)
Message-ID: <87d2342f-9ec7-6b31-0af4-437abd5bfe7d@linaro.org>
Date: Wed, 6 Apr 2022 08:52:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 10/18] hw/arm/exynos4210: Move
 exynos4210_combiner_get_gpioin() into exynos4210.c
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 10:46, Peter Maydell wrote:
> The function exynos4210_combiner_get_gpioin() currently lives in
> exynos4210_combiner.c, but it isn't really part of the combiner
> device itself -- it is a function that implements the wiring up of
> some interrupt sources to multiple combiner inputs.  Move it to live
> with the other SoC-level code in exynos4210.c, along with a few
> macros previously defined in exynos4210.h which are now used only
> in exynos4210.c.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h   | 11 -----
>   hw/arm/exynos4210.c           | 82 +++++++++++++++++++++++++++++++++++
>   hw/intc/exynos4210_combiner.c | 77 --------------------------------
>   3 files changed, 82 insertions(+), 88 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

