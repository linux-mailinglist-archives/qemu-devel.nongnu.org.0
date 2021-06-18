Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FEB3ACE4E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 17:08:58 +0200 (CEST)
Received: from localhost ([::1]:60694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luG77-0002cX-Uf
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 11:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luG6F-0001ii-Pb
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:08:03 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:39680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luG6D-0003hV-GI
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 11:08:03 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 o88-20020a17090a0a61b029016eeb2adf66so8071925pjo.4
 for <qemu-devel@nongnu.org>; Fri, 18 Jun 2021 08:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NdGbtBsV1TZZ2yJ2qix2fUZK+fELs5GygZVmfUmXyMI=;
 b=DJLQh2AgPBTd5H8ANyEWgYUCQhlk2RSzohZYhAl7WG5VcZK0dRISn9ctXrzwzh30mZ
 urjc3i1AUftS+dDsuj+I1bM7yMohXKfuR5Z6w1I7SQrJSq387IS+wfGciUO3lGN1GhVp
 5b7DJf0rPHQqjg3MvwOAd56FJx68K86164B3kCFLEb3YGOFroVoMemrDqeWbzMdCjLnT
 uEQjYcZbK0xuAF9U4MLooADEaIhcOMFCokT9piGuaju6x6xbWas+N1sro8mN4sutoNa8
 z/kpQSemGLrtGYdyw7SYfQTRJo/AUq3qGXi+ZoIaWV+YySqkbKnhfiawCVQCRITjV+sS
 UOkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NdGbtBsV1TZZ2yJ2qix2fUZK+fELs5GygZVmfUmXyMI=;
 b=WYISn9c9YIbuf3oF9+dzeSDhHd3JdxgEMjmpwvfy2A9TNcOV3sM4HCCxn0K5uk+a1F
 VveDqd24sWB1Zd0cqtaDvsIRa4Hnh5D5IV/iZVwZqUE089/urEq0ah3oAkDhIeTM1UMc
 tolwCK/0+VglU6Cvb2Z71ddS0KRaI1ttF5caVRp2AKzjk69YalCJtPzz7hXlMEHdltO+
 WsCzl+nYk164+hCl9KXiRBMnuvACwf4Yf8mpmRZoxjxvmFr1bw5sb/0CJ5swkOS05LIi
 VaipmquJOyvINzDec7onjl2H3fzIKLkIsq5si8100wymNEF8Wq3JY03wZ4wmfqvHvu+v
 I/Fg==
X-Gm-Message-State: AOAM533yHHhOEPBnHYyr+1/62k/goFZqeNH0DGSRIb49LOqOYxdpysru
 cU0hH6C6XfVeIIZvW+6N/Ne32sInE2bUQQ==
X-Google-Smtp-Source: ABdhPJxc/u4EUZP325d1PuRzptaTk+zvCjuz0peJUVed+n1ZjxjFm4RUK0CRz31Z540DwCXbNFJQ9A==
X-Received: by 2002:a17:90b:247:: with SMTP id
 fz7mr22386824pjb.137.1624028879860; 
 Fri, 18 Jun 2021 08:07:59 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m18sm8600720pff.88.2021.06.18.08.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jun 2021 08:07:59 -0700 (PDT)
Subject: Re: [PATCH 1/7] target/arm/translate-vfp.c: Whitespace fixes
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210618141019.10671-1-peter.maydell@linaro.org>
 <20210618141019.10671-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5a37aadf-c125-e03e-731d-d978ba0f666c@linaro.org>
Date: Fri, 18 Jun 2021 08:07:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210618141019.10671-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.202,
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

On 6/18/21 7:10 AM, Peter Maydell wrote:
> In the code for handling VFP system register accesses there is some
> stray whitespace after a unary '-' operator, and also some incorrect
> indent in a couple of function prototypes.  We're about to move this
> code to another file, so fix the code style issues first so
> checkpatch doesn't complain about the code-movement patch.
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-vfp.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

