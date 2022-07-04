Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BB05651A8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 12:03:43 +0200 (CEST)
Received: from localhost ([::1]:37068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Ivf-0003nu-1V
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 06:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ItH-0001fL-CX
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:01:18 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ItC-0000jn-6Z
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 06:01:15 -0400
Received: by mail-pg1-x534.google.com with SMTP id s27so8469124pga.13
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 03:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zGThNGFgy1kDwX4sF6+5bztcWO3GGECBQ+8sGjw3Bik=;
 b=qU9yJtmer1Dbt/693PeBQBkx54B7rSXarOBw+i+5KCB5u2xe79k5qGorHjxCTWYvAY
 HKFTqdLeBarUTnqnWgU8TP11lfyi4je/UO13AFBsfEG9uNxySdDi6/LXDJrFASTOsOaW
 /xmVAQJBAaV4FCi3ei28vxEAL75M4Gan+y7gmnuySGbZAKPa5RiBFbCvBVhRqB+W5Bc6
 sZ9mYXGTzNzirh/fmwHPshZC3dhAJBrDokm6/1DMMP1CdlCdJRO0CqWR60zYF15lDfOW
 m1eQDqhTlN5fLotjGB4ErREBLAAyGisNGxKqyH7nsUY8pQeS9WRixbLqgW02kKOMnZUL
 Urjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zGThNGFgy1kDwX4sF6+5bztcWO3GGECBQ+8sGjw3Bik=;
 b=0pBV5wYj7UysICPgXBXXL9/peOcLI+QZCB27FkWk6yhtf4npkNbfFAlLTUL6pjmKnr
 TXL6wZUveAk4M4gJB7hHZKpQhoCBBfmhFForEag7xVEbXSlSCh86paNQTbyQDMHJGGVz
 o/+d6MW8jLxPGf0byywXwYipaRxbDFAOImtxfrT2mcBnvhfl5ULl/OuYS13LPLqXqX08
 qptGdeJ4F1Y18ybYTfQIN7v2fvVZCIbYnzOe67kyHr+x1q2TpKyhgHal0HSREUwkszWD
 WJRq2VX8VTnTbkNguLE7MMvS2Bf0XA+0PgT5yEF3aTUeYm3VZsNPLydXSU3N2OZif5FR
 QFJg==
X-Gm-Message-State: AJIora8H08Cm8F5+5lPDDu40g5l/BO2TKM+OFMmkZZh3gF78mjXUA9NM
 jaeT81kpFfwOP7P9dZ78vDQagA==
X-Google-Smtp-Source: AGRyM1uQSqQ94CeMWecLpbEWase1lqnyHqjprU/+9XOaP8pMbTpW1hXEBLTGGuOPsFxSsHT7mYvOfA==
X-Received: by 2002:aa7:989a:0:b0:525:252f:3c51 with SMTP id
 r26-20020aa7989a000000b00525252f3c51mr35681703pfl.39.1656928868758; 
 Mon, 04 Jul 2022 03:01:08 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a17090301ce00b0016be82cc7b4sm1139633plh.8.2022.07.04.03.01.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 03:01:08 -0700 (PDT)
Message-ID: <e47a03fc-745c-5a6e-94d7-c90d4541326a@linaro.org>
Date: Mon, 4 Jul 2022 15:31:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 02/11] target/openrisc: Fix memory reading in debugger
Content-Language: en-US
To: Stafford Horne <shorne@gmail.com>, QEMU Development <qemu-devel@nongnu.org>
Cc: Openrisc <openrisc@lists.librecores.org>
References: <20220703212823.10067-1-shorne@gmail.com>
 <20220703212823.10067-3-shorne@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220703212823.10067-3-shorne@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/4/22 02:58, Stafford Horne wrote:
> In commit f0655423ca ("target/openrisc: Reorg tlb lookup") data and
> instruction TLB reads were combined.  This, broke debugger reads where
> we first tried to map using the data tlb then fall back to the
> instruction tlb.
> 
> This patch replicates this logic by first requesting a PAGE_READ
> protection mapping then falling back to PAGE_EXEC.
> 
> Signed-off-by: Stafford Horne <shorne@gmail.com>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

