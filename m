Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F623936F7
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 22:19:25 +0200 (CEST)
Received: from localhost ([::1]:37182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmMTU-0003cq-G3
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 16:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmMSN-0002jn-Pq
 for qemu-devel@nongnu.org; Thu, 27 May 2021 16:18:15 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:55227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmMSM-0002jf-6f
 for qemu-devel@nongnu.org; Thu, 27 May 2021 16:18:15 -0400
Received: by mail-pj1-x1030.google.com with SMTP id g24so1172359pji.4
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 13:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=MhuMNG8mvLywvLE3IdvlHxgSTicfdRTnmILuv8ThzF8=;
 b=XxAerePpVah38GQO01Cqug5tB065Dk1gPbzin/aFglh4+deLurCuL+mdZeYe7Yd3vq
 tgXhxuA9ds/RF/1YRhuGjjVunD8gvuwlLyW/rvTIfdPwWvHNSz1zNSbohcYAw5RKd5eT
 aZj2KUHEAKx7n8BQTGuY2hOQrmtGOdvjmfixnlqSGoINnqoVqmC8nvWJng+LlCl/Cex4
 q4gCKMuof4cJfiC7I8gXeDRv3HfUopQ9YBblBLTUlGBJQstACZEf6ZLjMMt5YstxBsc5
 DjwuQFNjOe4naPpHB3nuIp9JMM2CEn3+8cHElnSMKU8ZDVRJcHJ/sQgTdjZicdQCPPRm
 seng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MhuMNG8mvLywvLE3IdvlHxgSTicfdRTnmILuv8ThzF8=;
 b=srYGry18l28IO+selMej/cBQ3w8L9QMGSM3/XGObVo/sMobHZqnQGQZQ0RWxGwwzIV
 YmmSNYO6sgXOTji8KqdIytqkMm0wGPvyFD/hpcVu+l+lKuxRGUlpT4meK72Slj3OH8E/
 pxYwfwQ4ENLLBVDgovPgVMW3VolVP7lIKmcB9MQcloL9mK4yEu4P1rJid+nUo+KyS8V5
 uVld+QsnidjP9nLJkAE/25g1GjxP5U3btBkoLf3RNjiCLrcX2SGi8IrKOkQewDc6bf2I
 vQaCwMi8cYjnW9rhzq2Vjmpt4oxIMLrT9pG0ZLSoqA4WsxhRgDncLn1w9o+x2UdSG4KZ
 ZTuQ==
X-Gm-Message-State: AOAM532doEBRuGzlROY5iesMpEOdCCGwlpQCvlb/5HmKzR4r2Jk801wG
 N8BQTRfCaKkpz1noKdRneWOgWyKew5h6Bw==
X-Google-Smtp-Source: ABdhPJw9CGbwLJe+0yjNJBpHRLOtE9ARWGwZy4OcE8PdOZW+2CrXAOZRsCO02vkVjC0ra45ZUWb+oA==
X-Received: by 2002:a17:90a:950c:: with SMTP id
 t12mr272173pjo.135.1622146692711; 
 Thu, 27 May 2021 13:18:12 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 204sm2606611pfy.56.2021.05.27.13.18.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 13:18:12 -0700 (PDT)
Subject: Re: [PATCH] arm: Consistently use "Cortex-Axx", not "Cortex Axx"
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210527095152.10968-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5736a85e-05d6-5e67-646f-78b71651fe3a@linaro.org>
Date: Thu, 27 May 2021 13:18:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527095152.10968-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 5/27/21 2:51 AM, Peter Maydell wrote:
> The official punctuation for Arm CPU names uses a hyphen, like
> "Cortex-A9". We mostly follow this, but in a few places usage
> without the hyphen has crept in. Fix those so we consistently
> use the same way of writing the CPU name.
> 
> This commit was created with:
>    git grep -z -l 'Cortex ' | xargs -0 sed -i 's/Cortex /Cortex-/'
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

