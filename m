Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F654F60AE
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:55:39 +0200 (CEST)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc68I-0002qR-Bx
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc65f-00009Q-Ke
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:52:56 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:39799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc65c-0003vl-0A
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:52:53 -0400
Received: by mail-qt1-x833.google.com with SMTP id s7so4339493qtk.6
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Eu9q923+4mh1ex17Ktmti+jtR1M/Zz7kkNryAeOmTuQ=;
 b=U2Z++EihF6WGUTTrHjn+PlaOzjhwwfLOQB3o/xScQEcvgPvdkX2wv/RmmXhTTQsCgD
 EnYU63QbBkCDg2YbMdu0+Axds6/YDgSuOgtDw2s2kZptEXaQpQuRAAn88gi0H2z4Yv6k
 cvo+uYu51X+Cf2HZb4HHBZ53eL8vT6u1FU9m2ki2z5UxL2d5BfpcNVfZJEqv70eAwMmI
 Mpt3bj/s9AW30OWcxYKkShOMfh0TolOTv177jY+P4QpGwvfn+qgSb6UJOOSjmOC8PRKA
 BkiyU9oLpSaiQ5MRw1hyoV+pR696o0N17R9S5Lb4a8mySBthOACSyqbgYWkcB5vDnhj0
 8OOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Eu9q923+4mh1ex17Ktmti+jtR1M/Zz7kkNryAeOmTuQ=;
 b=suTR4+k33mYtGLOVa+LYleZGBOogYHnfC+iEObn3X8Janvamm6VFxQZrfnPS4l1ZC6
 OEEVKprnc//fwQC/nsuRs7a1Cw/bG0cauSUEIT4moLvnHz3YIE5k+nCHn0XuuNzc0vCh
 mNMNj6BM4JKsOOe81200Z0SncJuhUohi1ABJHGNTW+dzM7rWFGSjzthjgJzbQPssOiJu
 u/Upg3xGjD7tZ0jUTwtMH9FVdsgDk7r/RlllxBi3RrpLiuSHtHn78nOmqNquhZL+WlZf
 bBMw4eNIPEznpjOYcZMl4OKI+2IV3W7gr20GQ9x0M0aSQPxxCDjCUnUGqQhYxp6/wBYa
 Vktw==
X-Gm-Message-State: AOAM531P91nFsTKTnNTJ610XUEeWIMyL9NFmtvR7Sf7Zc4kvycL6BMWz
 tRd4iXAH+sxn8nkOYDtxBeSmvA==
X-Google-Smtp-Source: ABdhPJwzNoRbPtflDt8dHed3gZwSbouukiu6cjSwDcih7BXTX1g6vrs2DpiwtghaoYQBO998AZo2SQ==
X-Received: by 2002:a05:620a:1371:b0:67b:303d:b5cd with SMTP id
 d17-20020a05620a137100b0067b303db5cdmr5794619qkl.320.1649253171208; 
 Wed, 06 Apr 2022 06:52:51 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 u21-20020ae9c015000000b0067d4b2e1050sm9543140qkk.55.2022.04.06.06.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:52:49 -0700 (PDT)
Message-ID: <be2a2b37-5cdb-3283-055e-764c49b70d8e@linaro.org>
Date: Wed, 6 Apr 2022 08:52:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 11/18] hw/arm/exynos4210: Delete unused macro
 definitions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x833.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Delete a couple of #defines which are never used.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

