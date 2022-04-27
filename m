Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6354F510F27
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 05:06:07 +0200 (CEST)
Received: from localhost ([::1]:45218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njY0E-0005Gp-HJ
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 23:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXy2-0003Kx-Qz
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 23:03:55 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:44734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njXy1-0002NI-8Y
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 23:03:50 -0400
Received: by mail-pl1-x636.google.com with SMTP id j8so428771pll.11
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 20:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=HO4glNFPsYOApCs8m1Fpe3iMrRuJe0rdbYbKX7a2aSQ=;
 b=SajjO98FCypH1OA65cR2hu6KNXxIIVgJC9F5js60dZJ/mr+FdurEu5vHP1ptsTKDFx
 9FU65Rm9iIobBfHzaKoR2XO4MNoQYFLF9ExVZUgj9TGuXxY4T6ojCtnJHpxdMR4ciuMf
 3ti1feAfYgEXKfFHY9LX7alxAQi8wL69+4SeBt8o4hv63B4vl7xEUhfpSXODSmmLQ7/L
 iOECMaWqv5k4ZKKq5eSPtiDKnPxZZGlHfrJt6oemh71HFhu537QyjvSjyeA1ZWQJXbfR
 nlZjSq3SdqGeX0589lls/ZKUFxLFJQyHE4eed9tfPFqPaxNkY4qoCbO66QlhSkO6vHW3
 E4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=HO4glNFPsYOApCs8m1Fpe3iMrRuJe0rdbYbKX7a2aSQ=;
 b=v1YftQxnhhG+fUpDQrTkrU1icyyKn75EM3ea0MnvC1clvCZaKJm3xcIRtt3SQGkWpe
 7u+fOolKGe9AZufZ74GcjJGNUpukjHbzmy1D+fNAcuMLmEX8g8v57SYnUvvsWjqPvytk
 xX3s05JcHKmKgYhLH+eNEqQnuVo4/HLyCB2ZXhdrVFcB1Lgg9YELLn4n78zwciWgCyPy
 Z5uRY7Y63C3Mxl8dqZc6TvXMDUgSU8nvpJA+0thMwyW/1q5ScoIiseHzUxlEKA2zhf7k
 wFYlZSMVZ5H80Tfz5w7f2bOeijxQ5f4J1XClNh84FkbM5ppIYzB2gr+KKvKY8PyolhY6
 r3wg==
X-Gm-Message-State: AOAM531JfhRJtJ1PQEivYHdXiHEjGaEvr7UiJOpRD6ZlRVgYL48IA7lC
 ANsZQChz/sjyu1SHlN8ahtV65J5nDuv6OQ==
X-Google-Smtp-Source: ABdhPJyF5kDvkbJf0B9Zx+cQsXDe5Ds7SXQYkAEBeYw8bOgLGhC8GY6K93XnIiFTsMgbq3biE1dgBQ==
X-Received: by 2002:a17:90b:3b8c:b0:1d4:c5e9:db89 with SMTP id
 pc12-20020a17090b3b8c00b001d4c5e9db89mr38425324pjb.178.1651028617124; 
 Tue, 26 Apr 2022 20:03:37 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a62c702000000b0050d299e3b7dsm4341691pfg.186.2022.04.26.20.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 20:03:36 -0700 (PDT)
Message-ID: <dae39a89-5961-07da-cbd8-63e086351d69@linaro.org>
Date: Tue, 26 Apr 2022 20:03:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] accel/tcg: Assert mmu_idx in range before use in cputlb
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20220401170813.318609-1-richard.henderson@linaro.org>
In-Reply-To: <20220401170813.318609-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 10:08, Richard Henderson wrote:
> Coverity reports out-of-bound accesses within cputlb.c.
> This should be a false positive due to how the index is
> decoded from MemOpIdx.  To be fair, nothing is checking
> the correct bounds during encoding either.
> 
> Assert index in range before use, both to catch user errors
> and to pacify static analysis.
> 
> Fixes: Coverity CID 1487120, 1487127, 1487170, 1487196, 1487215, 1487238
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Queuing to tcg-next.

r~

