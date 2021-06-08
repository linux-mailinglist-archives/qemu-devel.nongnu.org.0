Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED71A3A06A8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 00:15:41 +0200 (CEST)
Received: from localhost ([::1]:40416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqk0b-0005cC-2U
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 18:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjze-0004iX-N0
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:14:42 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjzc-0004Ic-1g
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:14:42 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 mp5-20020a17090b1905b029016dd057935fso193212pjb.5
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 15:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=j4U3ZDYvEqtHirtZH/WP8MPg6nnJS8rgWjAqxaRWfbo=;
 b=DFB1EKKQB/XbXCrrWVni6RO9P/WUJXi+ZFii3tGt1w+q1rbVyJZwYEB77Y0vx5O+bP
 n6lylyeS+m0Fbbi21fXabFwbzn1+m2l4RKzgN+vJGhCiveZH9sJ0EPFLpT0BcaSn1deO
 /rM4Z+OysHXO9CJeIkCFIUX+veLsCmdbCETFvHrchZbuoww6OgoR7RQDtONT3SY72YI9
 ed3NaQNRQrVLLjC1dQm/jCYsf3+0B38tSm8dH5Nn+BVxgPYLiSeEnIc9w8qNekxXGxza
 LBKXyws7O7qJp4VYpQClfUBOtxDseEIOydN9bUqhsx8F/eq1/RkDyRlQno8xutZNG3Ql
 IiiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j4U3ZDYvEqtHirtZH/WP8MPg6nnJS8rgWjAqxaRWfbo=;
 b=pHN5CdTkYzpS85b5eT1ZLa81LVbu+tJwAsNqxW3h/SD47uemuMouAFL/HYnRtkcGrT
 0Hbr5HI33bl3CmzJA9VXGOf7i+uMCB1RHv6n9J1kRB51vzdKMIotD2fnFUR513e72qkO
 LjOnFoHUNnueLp+2w32bcqbxMO7/DWVKtLvsD97MKL61IAFhQxkKu59rbPBHxHcMJ5Wp
 gmWOwIGP//D14uzv9KoGUzksKjeJkJYfhqW/y7nZw6CjrWkizI+Aew45R9BCJyaxwKW1
 TUuWP4A2+77bhYApSKidv/HAaXeiJ1L8IyU5Cyb3P0aIdT+/Zo0N3MM2kNRJa2/1cTjA
 AfFg==
X-Gm-Message-State: AOAM531TXogmLVggbRoGz+fjO3Qq7YH0GMsRa2N62hrw/9mtNTNr9cHB
 4DPdhM5+eUKfjavva3GgvzhhnTToXMmONQ==
X-Google-Smtp-Source: ABdhPJyAVvsSIyrzXcM94q/qHKTMxSwVfJu4E427yrgTPrh0PTqZVBbOcOkMhwmxGdnc2HAKfqm2KQ==
X-Received: by 2002:a17:90a:fb51:: with SMTP id
 iq17mr16800141pjb.26.1623190478425; 
 Tue, 08 Jun 2021 15:14:38 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 u1sm12260124pgh.80.2021.06.08.15.14.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:14:38 -0700 (PDT)
Subject: Re: [PATCH 15/55] bitops.h: Provide hswap32(), hswap64(), wswap64()
 swapping operations
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b20f93ed-b344-dbb5-18e1-38762b8323eb@linaro.org>
Date: Tue, 8 Jun 2021 15:14:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Currently the ARM SVE helper code defines locally some utility
> functions for swapping 16-bit halfwords within 32-bit or 64-bit
> values and for swapping 32-bit words within 64-bit values,
> parallel to the byte-swapping bswap16/32/64 functions.
> 
> We want these also for the ARM MVE code, and they're potentially
> generally useful for other targets, so move them to bitops.h.
> (We don't put them in bswap.h with the bswap* functions because
> they are implemented in terms of the rotate operations also
> defined in bitops.h, and including bitops.h from bswap.h seems
> better avoided.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/bitops.h   | 29 +++++++++++++++++++++++++++++
>   target/arm/sve_helper.c | 20 --------------------
>   2 files changed, 29 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

