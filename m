Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 211894C4F37
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 21:00:40 +0100 (CET)
Received: from localhost ([::1]:40704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNglZ-0006xe-V8
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 15:00:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNgk2-000676-CR
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 14:59:02 -0500
Received: from [2607:f8b0:4864:20::433] (port=37812
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNgk0-0001VR-QN
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 14:59:01 -0500
Received: by mail-pf1-x433.google.com with SMTP id y5so5598968pfe.4
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 11:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WyF1Pud7FCsO26d97a/zGChZ/SbpMy9bl4j8NZzolGY=;
 b=biT46p/pxx4m3G8v/EyhC2yRbYCYA0khazakz0ROB2hweGyo4r4jCD0gtecrH+LAx7
 gBMdicExR2oVscHWzkFv5NZSaBs645hxHN/V9mhFPZsNvrcu+dp8gmK2bsmOOx8VdJYf
 fanOQg8lssReesX5OwGAlK6cZZ11TtiXZOMj/zxTwIq2gFL1oEp5y7qyU0/RGFcs+sBq
 EFmwcBmuhBsop78v3E25RJF8rMemQZeMRuAwitRtvbqP3EDGAqz6arXSt3hzZRwNhDZk
 uNrgljgBGrIXTDo4B0EBqQ/1fZ4w4PndFFECEAUfceGBoO60++g46jictKPeMwn7bnCN
 ZXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WyF1Pud7FCsO26d97a/zGChZ/SbpMy9bl4j8NZzolGY=;
 b=Wtrp4VxcE3HBWwoB39BK3uTtRDVWHeNCV606j1mQY3l7o7vfT/2wecKG7FDKlujOR3
 Dn1+2stG8I88uYxTLrWKbZYL5w8JvrD2U9aif1bIK/mz67pIAuTh0UyDQ290iQ3DN2S0
 eCN9h0PifZ4L2C/1kmWI1A0th5YjjBuUVBhVuxY06dKV67x2Q8mzIt6vYn4pfLyZFwTB
 ymO092cGaZtp1uFLEJu/NXW9dcv/U6tHqKhFv8SSg3mKaNVzT1BnlvLQ8ungJD56GJS9
 WW+fVRBg/0XXFWzPSyQxZWfjBlKLYVy0j/Sjdauoc6oq6EapyKsCDz5+VlWg+tn1dq38
 SqAA==
X-Gm-Message-State: AOAM533gjIQCvphzFwlwBRipOHWcJiR1HuKEzGGSfQ3P56AC5T7NBL2x
 L2XqpkIMa/a+WS0zhwQotg7ung==
X-Google-Smtp-Source: ABdhPJzm/q0jRg5DCuvfSfH68YWgdE7Niav0QAzEdzukdwtjIB2tCdVHL+b2rigS3162JuohHhRysw==
X-Received: by 2002:aa7:91ca:0:b0:4e1:fe3:5da6 with SMTP id
 z10-20020aa791ca000000b004e10fe35da6mr9239025pfa.85.1645819138851; 
 Fri, 25 Feb 2022 11:58:58 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 k5-20020aa788c5000000b004df7bf0a290sm4176783pff.1.2022.02.25.11.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 11:58:58 -0800 (PST)
Message-ID: <4b7e4f2e-3809-b6b2-917f-22e53cfc94f4@linaro.org>
Date: Fri, 25 Feb 2022 09:58:54 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v14 4/4] target/ppc: trigger PERFM EBBs from power8-pmu.c
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220225101140.1054160-1-danielhb413@gmail.com>
 <20220225101140.1054160-5-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220225101140.1054160-5-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/22 00:11, Daniel Henrique Barboza wrote:
> This patch adds the EBB exception support that are triggered by
> Performance Monitor alerts. This happens when a Performance Monitor
> alert occurs and MMCR0_EBE, BESCR_PME and BESCR_GE are set.
> 
> fire_PMC_interrupt() will execute the raise_ebb_perfm_exception() helper
> which will check for MMCR0_EBE, BESCR_PME and BESCR_GE bits. If all bits
> are set, do_ebb() will attempt to trigger a PERFM EBB event.
> 
> If the EBB facility is enabled in both FSCR and HFSCR we consider that
> the EBB is valid and set BESCR_PMEO. After that, if we're running in
> problem state, fire a POWERPC_EXCP_PERM_EBB immediately. Otherwise we'll
> queue a PPC_INTERRUPT_EBB.
> 
> Signed-off-by: Daniel Henrique Barboza<danielhb413@gmail.com>
> ---
>   target/ppc/cpu.h         |  5 +++++
>   target/ppc/excp_helper.c | 48 ++++++++++++++++++++++++++++++++++++++++
>   target/ppc/power8-pmu.c  |  3 +--
>   3 files changed, 54 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

