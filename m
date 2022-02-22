Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2C74C0513
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 00:06:34 +0100 (CET)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMeEr-0005XL-2I
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 18:06:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMeD8-0004ac-Df
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 18:04:46 -0500
Received: from [2607:f8b0:4864:20::533] (port=44866
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nMeD6-0005dt-4A
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 18:04:45 -0500
Received: by mail-pg1-x533.google.com with SMTP id c1so3506175pgk.11
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 15:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T0Il7E8FP9jEQTss21CTj07DAqig+XJf4TgBEycr1VE=;
 b=pbKcOEv02A5RvHI1pfAwBK2mTIWR7f5BpPNA3w20vnWsp4Kaqa4dGKw46FLb12gTrm
 JX0pj7QN0PvwlvWxZMAi59emuKmSsOscwUjkwHsurcbL1o/4XVQ54dAIofjxCJ54Kiva
 /P2e7yJyuf2itlnNcBVuzt9NepbanvMaVjGmIkByNt1xTo8UKJ4T+v/Q+1YoDwD8gT4h
 xFVX1ZVG4+jSL6Hzj4gJG60V3YPyCbdVZn8YfDTCZ9sY5zn8W/+FfVa/NTJVGWDwPeKO
 sQiQG8W40QiiiNIHSF5LSHvQl0fzfJyLGQ6KEBdljP0z0mldSxBr05/A3Kwbd5WEBjiA
 3eRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T0Il7E8FP9jEQTss21CTj07DAqig+XJf4TgBEycr1VE=;
 b=dELQImIqEbsGI331SrawKgb/WczxtU0r4RFtF/eUg3nEz8DQQ1WhM9IFkdzXHee0Mj
 QnPEGbZO8UCLbkw8jpjN1k7qEK7Ztzv3dVmMwzf0XsXlglJEODLQwVck+O9xlMyb3d38
 hi1VdZmhbMu5Mx3CKWHv7+kapPTd3e6yQn/6EwsWQzi8ukpcgQbeOzcoproe592X3nFe
 sZsJtjMMu5b21wjWtAlJgPmsmRnEleEW/JfPVqAGKCmmyE+/JI5RS1CsdArIk4HhFsVH
 8Hgl7oPR0ekwu086kXy9Gsfay5BCHUN21OJl579giSpECJ0CR/nTsjUWJ2P9CopIn/1g
 9atg==
X-Gm-Message-State: AOAM530rIDHGuFd33a9bN599tEvKTbanV77WCW+QnclIPvUyd+olgzN7
 6B7zIWoF9OWafQe3m0PHQ5mGSw==
X-Google-Smtp-Source: ABdhPJwNq5vCjUm+nDUFXaB01TBijUVbKJJEalXuKQvrq4+ODUjF1irsM8i9FoED/xIerxEohK7cmQ==
X-Received: by 2002:aa7:81c3:0:b0:4f2:6d3f:6158 with SMTP id
 c3-20020aa781c3000000b004f26d3f6158mr6687786pfn.82.1645571082631; 
 Tue, 22 Feb 2022 15:04:42 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110])
 by smtp.gmail.com with ESMTPSA id v10sm19170247pfu.38.2022.02.22.15.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 15:04:42 -0800 (PST)
Message-ID: <448f4f84-4c9b-2dc0-8c45-e3af7407c29d@linaro.org>
Date: Tue, 22 Feb 2022 13:04:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 31/47] tcg/tcg-op-gvec.c: Introduce tcg_gen_gvec_4i
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220222143646.1268606-1-matheus.ferst@eldorado.org.br>
 <20220222143646.1268606-32-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220222143646.1268606-32-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/22 04:36, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Following the implementation of tcg_gen_gvec_3i, add a four-vector and
> immediate operand expansion method.
> 
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   include/tcg/tcg-op-gvec.h |  22 ++++++
>   tcg/tcg-op-gvec.c         | 146 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 168 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

