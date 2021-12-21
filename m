Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798D47C88A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 22:02:14 +0100 (CET)
Received: from localhost ([::1]:33604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzmGx-0001Oa-Of
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 16:02:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzmE8-0006Y9-S5
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 15:59:16 -0500
Received: from [2607:f8b0:4864:20::433] (port=44812
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzmE7-0006Cm-Hb
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 15:59:16 -0500
Received: by mail-pf1-x433.google.com with SMTP id k64so342054pfd.11
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 12:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=m7y1LdL4pTFQqx5oArycbLlm4zWoCC22sOLI9BZuwJ4=;
 b=BNNr5WejRdett5voM1ycJrWIbsLkmC+mEWsuaLdL9y4IJKm5hOwlVIHrDNoHvpinDD
 IohMkV9e3zezmojezpNCRCroAEPmnrNMVDHoBnF0BF2dn4IyshHUOt+/tR3y9giEMzv6
 iCpOOOgwABPHyBuud3oA+vLokZlee9Hpj5CrhwQDg0AHfQ8Y4bxcwM1xfZH7GmnsZq/N
 5/4nVqcUEeFD8cTnRb5MjlUGggd09w9ciRpuZEBHs9JyjJXUC7qovzk0PtpSwgeTnuAb
 ejsDnQeBrWG5r9O+ZhYtbM+EdeDcN2I2IF/aBILkNr7HLYSHwtL6L7nHDw2UJMQ4cuHY
 iyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m7y1LdL4pTFQqx5oArycbLlm4zWoCC22sOLI9BZuwJ4=;
 b=MAGPZvYvRtNPPY8gn1bC6aX59qPhkMHCaIlzS4UR9RQFEUc5nlNA7QyPIOFRhgX8fc
 T07epKi2c/cQkJ6jmASZZDoBVTtlLtLUgS85EKF2dEnerPNQlRIAofGArvfXhEhhZJSo
 7Tsaksy+frLe2bbag6Y4LGKCcYlfHOktJC91c2VEr2Lm0kTGIXawQ2EOKXChMcihyizs
 jV1OCtZADF8PyTJIJxT9Q49uczYckhumL+vdSUZyKEY2D/qmR7rEbsH+nN0GGVsyYbuj
 EoyLujwxtKjHfgkEV0pflBAOQgYHiqSHytKMmIk2rDNVJwiqcVeTJ6b/LyFb6/CHF0c5
 GRBQ==
X-Gm-Message-State: AOAM530gz19Z6ETVCJl4bvo61qXMzoPkc5ucb8c9zms4wD1eI0UQpuBv
 pJ15R5H9mxc1UPuy/l+G4kTOhG0YwACoUQ==
X-Google-Smtp-Source: ABdhPJxwdXVTZGafK1Z78fqoyesTbXsU8W2ilcCzPqf8VAIdW4azKbrwvEZ6S1WXb+u7hTvc+GjiAg==
X-Received: by 2002:a63:780e:: with SMTP id t14mr99687pgc.605.1640120353003;
 Tue, 21 Dec 2021 12:59:13 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id n16sm2499pja.46.2021.12.21.12.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 12:59:12 -0800 (PST)
Subject: Re: [PATCH 3/8] configure, makefile: remove traces of really old files
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211221110526.351709-1-pbonzini@redhat.com>
 <20211221110526.351709-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f79af7b2-1615-3425-44e1-ca35db54f70d@linaro.org>
Date: Tue, 21 Dec 2021 12:59:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211221110526.351709-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/21/21 3:05 AM, Paolo Bonzini wrote:
> These files have been removed for more than year in the best
> case, or for more than ten years for some really old TCG files.
> Remove any traces of it.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   Makefile  | 11 ++++-------
>   configure |  9 ---------
>   2 files changed, 4 insertions(+), 16 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

