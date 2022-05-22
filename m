Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25795530031
	for <lists+qemu-devel@lfdr.de>; Sun, 22 May 2022 03:19:06 +0200 (CEST)
Received: from localhost ([::1]:41626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsaFM-0000bo-UF
	for lists+qemu-devel@lfdr.de; Sat, 21 May 2022 21:19:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsaEB-0008FY-Hi
 for qemu-devel@nongnu.org; Sat, 21 May 2022 21:17:51 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsaE9-0003wA-T2
 for qemu-devel@nongnu.org; Sat, 21 May 2022 21:17:51 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 10so6803437plj.0
 for <qemu-devel@nongnu.org>; Sat, 21 May 2022 18:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=UNlH6wg9BHEjV9JcXLunwk1niSK7faadu2QaBTaGMIU=;
 b=Yk6660wNGnJ/NyKU/yqdqthZ/XCqt4aGp5/78xDilUvRa7pE/8gB0O4ffCWVM0FIM6
 g3G9Gej6lw2Yt3OHfPwwZOWjOrpT+97KfE6vLlq7Z/74TN3CpNjtrUazp9O80oEsWCa1
 ewPGWduYo4BHu0ekXXe3jFvS/FCGt4VRj+LX2ltBuHfYIeSdcHLx2EAOdqAjbs2lCavN
 EZpiPzlslH0Yf73oWJia9W+YiyxIpcIO1OExeSSeduQaAkXKbxhmFAtuis2EX5OKGBu/
 XqaStjcOW/v8Hla+lEvf4r12hwYkHLxuTU0Z8u2EHtOEakKGSKQhUGyA91gSVdVCEoeT
 twYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UNlH6wg9BHEjV9JcXLunwk1niSK7faadu2QaBTaGMIU=;
 b=566LpKjcPSEen1jjmvr41vNSBbfRFJ3M1s5nZVQj25pS9igkWIoaIbPeqEMyEhoNS6
 NtgWHBGjb0Ak81gfGbuA/ejnqmaOXIsO9Vbpaceh7WMQYAsxHOXHETs1RHq9gPrtwXZT
 ort0Okvs+xA/s34WjKEjbBFAKQedIR1iztD7We5n6R9JmGaOYXCOwW0j56ZhXk5Wkyg4
 MEhZ2ykWFx/1hi2HJ75Xlv+jV5wDu7H4s3kuVigCHG0aMvapatUIY8RL6EXIe+hocD0w
 oDdLa5pMcjCmtk/tjIZowDxU9MK7djKp5TmbSKmK/LOjXsIe/7fw4GVgukfEQG9NP0tU
 HNEQ==
X-Gm-Message-State: AOAM5323LXkjBsIhYb5LyesepEAq3xHtTumjS3WsnLh+OJT5tAWm3BSs
 jLQ9aVRT1ohmqu7nMMiB9wZxXzZhSgAZ8g==
X-Google-Smtp-Source: ABdhPJxl5UeHTdBRY/zpQPAmq9UsbuaGDbdG9dDr+OiouPSNI04jhVUBts9kX+HhcDZqa6y//+KZKQ==
X-Received: by 2002:a17:902:a415:b0:161:74b2:c1c2 with SMTP id
 p21-20020a170902a41500b0016174b2c1c2mr16032468plq.2.1653182268318; 
 Sat, 21 May 2022 18:17:48 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 p18-20020a170902f09200b0015e8d4eb23bsm2191235pla.133.2022.05.21.18.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 May 2022 18:17:47 -0700 (PDT)
Message-ID: <7ebb70a9-96ff-a3c0-f872-ea2eefdda18c@linaro.org>
Date: Sat, 21 May 2022 18:17:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: qemu-user (arm64) fails (null ptr deref) under qemu-system-x86_64
 w/o avx?
Content-Language: en-US
To: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
References: <7c82caac-4426-b107-af3c-79b99856fca9@msgid.tls.msk.ru>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7c82caac-4426-b107-af3c-79b99856fca9@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

On 5/18/22 02:13, Michael Tokarev wrote:
> Hi!
> 
> Here's an interesting bug. Interesting because qemu-user does not run under qemu-system.
> 
> Running 7.0.0 qemu-aarch64-static under 7.0.0 qemu-system-x86_64 -enable-kvm with
> default cpu type, getting:
> 

What is the test case?

I thought I'd be able to see the same problem by disabling AVX support in 
tcg/i386/tcg-target.c.inc.  But so far everything I have tried works.

And for completeness, what's the compiler that produced the qemu-aarch64-static binary?


r~

