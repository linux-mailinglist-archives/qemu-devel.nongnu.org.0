Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A874AAD26
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 01:19:28 +0100 (CET)
Received: from localhost ([::1]:40392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGVH5-0003D7-Ex
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 19:19:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVCH-0001Tu-Os
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:14:29 -0500
Received: from [2607:f8b0:4864:20::1032] (port=53855
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGVCG-0000cw-6B
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 19:14:29 -0500
Received: by mail-pj1-x1032.google.com with SMTP id h12so9222102pjq.3
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 16:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lcrDTG6uCPBz/5WAKeWlJmpysP6FJsYyLGoEOrKN3Ic=;
 b=ku7NIYvMMw3C6ihq2fdreRYZOx4maZMI+iOAjOCC5TOX/TZCa7w/xBfxg7OE5aYnta
 o5vGCYFYEiviNJ7kHVwMPPjh9FeHHQoXGe9lPHOuRwUpWbHF6f/jceM4GhwFFdQLh7yA
 m5UgVreY6yCxX1OsS1CuDebRXUqI2hBd0MggjYiyOzjHXFPj+/0E62KY49mEJiKV04o8
 iomXxB+H+TWZt4W9iJ76jug2FGLJc6z2DjH4ZyTdZnsty1FV9fnP+w8oV2FmOLTAsM7b
 S08E08so1BpJrTgnSlMELzF2Ge8krNwwtzEeiqZFjzFlFGsy/5LHvjJCdKkT4s3a3Oih
 o/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lcrDTG6uCPBz/5WAKeWlJmpysP6FJsYyLGoEOrKN3Ic=;
 b=r23F0GGkJ7iIAeDXxgv9w8x7IDq4ssvEWWwo5MYzjYS8dlSIGYSNgEaU6z85684mH7
 FeafnvGOZFU4765E104F8B3XC2ErFYE2TZ00mH/rC95bBaQTs2fP1hgUNPsuLHfRMmUK
 FXxjos4JYX7lvsgkSRVKHD43+cq3tjOn6L2B5ZcVOsF1nUNEa3nCrJZY7JNfABMRG9Ru
 guwB1zj/3dKvCbd2pmcKR5VnFYEzIzuMFCzhKh1unY5hJIRu/OX9QYTsxjDGH7AJDRwd
 FoksNBs7x0yMAz8+0rDqz70NK2ArNW7f+HqByz0xs3ITlRABapE7gcWV+6jdV53IE5iA
 t4EA==
X-Gm-Message-State: AOAM5317X8uZ+12ZoJKvbpxzdXdjSTaJBugITdSWmnWDXjXVCL759ARr
 ypNKTYfUrjcaU69RmgFWg6LtgA==
X-Google-Smtp-Source: ABdhPJwkYGGdnKXgMPKGpF3N9kmm7ptZDDzazJiZaW91DGBRld8PfUMN8XL/r0+A6Z5tU3mkmsOGXA==
X-Received: by 2002:a17:902:b213:: with SMTP id
 t19mr9754243plr.65.1644106466716; 
 Sat, 05 Feb 2022 16:14:26 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id o8sm7235609pfu.52.2022.02.05.16.14.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 16:14:26 -0800 (PST)
Message-ID: <b9a3ca90-64a7-683d-6f6d-172f87f3c0e8@linaro.org>
Date: Sun, 6 Feb 2022 11:14:21 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/6] target/arm: Use aarch64_cpu_register() for 'host' CPU
 type
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220204165506.2846058-1-peter.maydell@linaro.org>
 <20220204165506.2846058-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204165506.2846058-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 03:55, Peter Maydell wrote:
> Use the aarch64_cpu_register() machinery to register the 'host' CPU
> type.  This doesn't gain us anything functionally, but it does mean
> that the code for initializing it looks more like that for the other
> CPU types, in that its initfn then doesn't need to call
> arm_cpu_post_init() (because aarch64_cpu_instance_init() does that
> for it).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu64.c | 17 ++++-------------
>   1 file changed, 4 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

