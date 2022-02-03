Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E74A7DE5
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 03:26:07 +0100 (CET)
Received: from localhost ([::1]:35292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFRoz-0002mp-Mk
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 21:26:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFRmW-0001A3-0M
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:23:32 -0500
Received: from [2607:f8b0:4864:20::62e] (port=43603
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFRmR-0000OU-Ma
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:23:31 -0500
Received: by mail-pl1-x62e.google.com with SMTP id d1so911204plh.10
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 18:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tIofPPFKxe5KjVvoF9VUePFaya6n4ldKVA9gyauPOAw=;
 b=GkzxAmxQjs4BFwJfQYqxGhyZcfYsK3mMnUQjYahziyTmxLqTLZsKt4dO53yjk4Ftzx
 PiJjC0bVUaiJsHASJf7GWuuXHB+3zEwlBxTgc3SScbNBYFaLBJfosth1gVYdlj61g6ik
 UMv0tthUoCXI+75SdQKX70iowvnNj2xCUYxYrfTGbxP1qgFuUzpvejmqb6ZZEq5MscIH
 J0fe6igDP+I+rIHnyllbWm0USgmLUT7ttVemblgJUmmN/jX3f84dqCPbq8z033NFnEA/
 ONWyEgSGs3FcbeFmrp5wTbBm7z+0+2MN7Y9J8XnlK89YVogbyb2RS+SuMxo4kFq0dNdW
 uUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tIofPPFKxe5KjVvoF9VUePFaya6n4ldKVA9gyauPOAw=;
 b=vcoKEfcheuP95MrHFIWmSiPsOtUnNeAheL/GPF79CDhbcFEZ7UITaryt2733GQHI9I
 1avmmZkzkB0nFkSO+dcvZGUmddASMZ0gAjzgu7wV2dbDJ7L9V4mnK8+pUEObJE5aOCuK
 Sp9p24ebwOhP9Hwd81/EeRGH17Wy3Mg0IBatrzfObxgBipCf03yBdB7+e5QfYZymJq/X
 Ml77qU8MMELWs/HNWU0u8voNhfD7DN+PB5UZqYyHjOoRanAXe2ISvR+GjqJDJ1qzCDCM
 sHTpjzxap99fC5UaDN7/aF+Z17xZa5dZOVKgBwVXfDcLfipEr3ZgeDgGVKRxT9JSqnI+
 GKfg==
X-Gm-Message-State: AOAM532tALEMIQGfLtKmh9lrf47/86Q0KoHUp6tqStOF6tq7Gl8G4XX6
 cvUXGSfnI02fYc4bSRWvO+9ktg==
X-Google-Smtp-Source: ABdhPJwZ0O0Hs7ESKHYCi44AMYSTFUZEB1Tp6Kn4j5yU0Y6vOai7vte5ni10yrH5vd00d/VX0OjB/w==
X-Received: by 2002:a17:902:8c92:: with SMTP id
 t18mr7404042plo.11.1643855005646; 
 Wed, 02 Feb 2022 18:23:25 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:801:72a7:386c:deca?
 ([2001:8003:3a49:fd00:801:72a7:386c:deca])
 by smtp.gmail.com with ESMTPSA id pc4sm8954145pjb.3.2022.02.02.18.23.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 18:23:25 -0800 (PST)
Message-ID: <4d102117-f62c-825d-e686-d5b3331078c2@linaro.org>
Date: Thu, 3 Feb 2022 13:23:19 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/13] hw/intc/arm_gicv3_its: Keep DTEs as a struct, not a
 raw uint64_t
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201193207.2771604-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 06:31, Peter Maydell wrote:
> In the ITS, a DTE is an entry in the device table, which contains
> multiple fields. Currently the function get_dte() which reads one
> entry from the device table returns it as a raw 64-bit integer,
> which we then pass around in that form, only extracting fields
> from it as we need them.
> 
> Create a real C struct with the same fields as the DTE, and
> populate it in get_dte(), so that that function and update_dte()
> are the only ones that need to care about the in-guest-memory
> format of the DTE.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> This isn't a massive gain for the DTE, though I do think it
> looks a bit nicer. The real benefit is in aligning all the
> get_{cte,dte,ite} functions to have the same shaped API:
> currently get_ite() is different from all the rest.
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

