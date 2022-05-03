Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135925187CC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:03:31 +0200 (CEST)
Received: from localhost ([::1]:35296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlu3m-0005aE-2s
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlu2A-0004da-4l
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:01:50 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlu28-0007oO-Co
 for qemu-devel@nongnu.org; Tue, 03 May 2022 11:01:49 -0400
Received: by mail-pl1-x629.google.com with SMTP id h12so15158612plf.12
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 08:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2kxACQlkj0bwC2CTtG+tW5RlJS2D9VZBzoMpo5BFOMo=;
 b=S6RcBAqpGlqoTl1TKm7QDy7iq/WHhg5zpYBCXmlF4bsOcBsg148Nu6gWG7r+XhXswB
 2JJs/9iLuU8nMvYIgWEwfuYImQ6wHLyOySrvhEFRWWSDppjvThG0/mWEvorsegn7WPSs
 xtSEWz73v6BW90CJ/I3fK23fL+1kncP9EbcGbcdozj+6L2nCSNtqE/tJpEPmWJtdb8zw
 pn/EF25ToF0ymKUrpO/jmzGsleq1twRBp363BLGHILJtq6HCRXcVBjZEEiIpYouexUao
 +4L2EaJ0wRlmlGiPd7Lhb6+0lo+M8S/EKwSRrZMLQ68CRPgjqsXSlIar7VhZXpFpKvv7
 8l4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2kxACQlkj0bwC2CTtG+tW5RlJS2D9VZBzoMpo5BFOMo=;
 b=m8gAiM52coLPOSFLvN5DPNbkYsEVGTbi9pZPpG2vJyzgJoP/NzWAL834Kq763V22uN
 zjwgFsjTqA5mNNAfUVuGaTq2HNJqWI1kzYMNs+qgRi4OfJAc3Vwfviyf/Dx/gV4Zjg9o
 gfZYrHOIMs0f3385AG6E590N+EukWUqXb1WQGqyhpKvNPLhkB7pLi/KEennZ7WXJLw2F
 A+c99vhv76v4dVm1ZZrkGe7Dq8s1eO2uEw/NXXsLiSMX6dpbG1d0ix/n1Oo1YcA4+Dti
 mnsPeNc1ynGZzErFOmTG3Fp76scP4x/FIW2R2rF2LVIx6GBSgs2OCUUBcPxe+baEwpsX
 YusQ==
X-Gm-Message-State: AOAM530GEQWRyKnXnAYq+GTsbUTop2nRlApfCPakTZcDwd8HaFmD4Wd7
 QGCdZVP5vKurFMcJwC7F0u48IA==
X-Google-Smtp-Source: ABdhPJzZy9OARPyDU7wmw4DHQUeXqNhOT0r5v9ZekUyK2doG6iVmI0H3WIyn7li1L+LVLDAgVPXaXA==
X-Received: by 2002:a17:903:1c1:b0:15e:8cd0:46c9 with SMTP id
 e1-20020a17090301c100b0015e8cd046c9mr16189196plh.72.1651590106810; 
 Tue, 03 May 2022 08:01:46 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a1709026b0300b0015e8d4eb237sm6405490plk.129.2022.05.03.08.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 08:01:46 -0700 (PDT)
Message-ID: <e22f73a0-4763-e256-3f06-33ca858f8fe1@linaro.org>
Date: Tue, 3 May 2022 08:01:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH 2/4] tcg/ppc: ST_ST memory ordering is not provided
 with eieio
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220503103334.2046414-1-npiggin@gmail.com>
 <20220503103334.2046414-2-npiggin@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220503103334.2046414-2-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 5/3/22 03:33, Nicholas Piggin wrote:
> eieio does not provide ordering between stores to CI memory and stores
> to cacheable memory so it can't be used as a general ST_ST barrier.
> 
> Signed-of-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   tcg/ppc/tcg-target.c.inc | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index cfcd121f9c..3ff845d063 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -1836,8 +1836,6 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
>       a0 &= TCG_MO_ALL;
>       if (a0 == TCG_MO_LD_LD) {
>           insn = LWSYNC;
> -    } else if (a0 == TCG_MO_ST_ST) {
> -        insn = EIEIO;
>       }
>       tcg_out32(s, insn);
>   }

Certainly matches the comment from patch 1.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

