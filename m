Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8735551106F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 07:15:22 +0200 (CEST)
Received: from localhost ([::1]:38572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nja1J-0007lA-8C
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 01:15:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nja0A-00075L-NY
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 01:14:10 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:36669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nja08-0003Xy-Sz
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 01:14:10 -0400
Received: by mail-pf1-x433.google.com with SMTP id z16so663532pfh.3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 22:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=C5PI6ZArAaCRkaY5wgVB/s7ohQWIa7fXpHKlzAxuays=;
 b=HSPNATQ3MzL4pq3qBesPigJobD7ciIdc4hlxkHzMOVwxYpJJIDF2l/OCdtANH3KRMr
 b+85ohuig453HDJRLd4CUzpxqvTdVZ8i+lQjG2YiSP6aSliQx3/TaCPUTeTj5NOpUGgx
 vgy2bDFy4Dk3bEf1ZnDBgNZDHZ9imqlGCkofVMIVRh7VLbwOtFm1QJO2gFVh3FX6f8f3
 DU8fCQOKAN3C7tMBbjiys1VFt/u9G7OTYZiZF+M1+lL0sEfMbVAiSUm14ovtN+JiNNBq
 1J/dl1QxFcE8azPTnpv4PbZOqE9CIRek0vbwJIYeE+svbz9v2cOVgmjq6DMKJ3rXLX+l
 K4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C5PI6ZArAaCRkaY5wgVB/s7ohQWIa7fXpHKlzAxuays=;
 b=4ue4JpyvYiCXREsPEie3I9irnGulZ3owMXjdjYESyrV+IGsvVJuGgC6Ntm5yd7Jh4O
 mNrPkHpwOby8Qh7TgE2sPfpPz5qu7XH7dQbSYhfjzGZRuLnJJaAZTkqnbMkBSlSW3om3
 vXBIG/t7qRApQ+9X2RNip0lVNTdKVa1DTYHAChALkaj45Sf9Qo8oi05xWgtzvrzzX0Uc
 WCS7wY2WVlO7UkaHg0S6pKRUU3FiI7PQcSAWyJgb9T34G0ZIkUk/LbhGwQaMQ+7rV5We
 217iihmVDG6x2ywiz8c0kdcMCZafVBbmTXT+aC/h7aTrifO3oSpoNoF7hLMsJXgY7y9L
 4c4w==
X-Gm-Message-State: AOAM532a1SboCSSutuxltPQhja8sN9R+ZA/NPuwRPzt7tv4/QvTgZzXi
 MOtYvdL2botPBbqDPC+o0qnuQA==
X-Google-Smtp-Source: ABdhPJwhsYt1vws4ijpuX33BRtR9KdwgtLi6jSagMsr9VbWmloLoTNQOwyhXQTCidyd2sQgqxFu7zA==
X-Received: by 2002:a05:6a00:15d0:b0:50d:3810:922e with SMTP id
 o16-20020a056a0015d000b0050d3810922emr16431637pfu.6.1651036447071; 
 Tue, 26 Apr 2022 22:14:07 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004f72acd4dadsm17529480pfx.81.2022.04.26.22.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 22:14:06 -0700 (PDT)
Message-ID: <68e1b1dc-f396-7b2f-8aac-b01138116d43@linaro.org>
Date: Tue, 26 Apr 2022 22:14:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Possible bug when setting aarch64 watchpoints
Content-Language: en-US
To: Chris Howard <cvz185@web.de>, qemu-devel@nongnu.org
References: <DF7731C2-424F-4438-BD46-A09CAAE21835@web.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <DF7731C2-424F-4438-BD46-A09CAAE21835@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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

On 4/24/22 04:40, Chris Howard wrote:
> Hi, I’m new to qemu (and even bug-reporting) so apologies in advance…
> 
> The MASK field in DBGWCRx_EL1 is **5** bits wide [28:24].
> 
> In target/arm/kvm64.c I found the line:
> 
>   wp.wcr = deposit32(wp.wcr, 24, 4, bits);		// ie **4** bits instead of **5**
> 
> 
> If it’s not copying (or calculating?) the number of bits correctly this would explain the behaviour I’m seeing:
> 
> If I set
> 
> DBGWVR0_EL1 = 0x00800000
> 
> and
> 
> DBGWCR0_EL1 = 0x1F<<24 | 0xFF<<5 | 0b11<<3 | 0b11<<1 | 0b1<<0
> 
> and then access  memory [0x00807FFF]  I get a watchpoint exception. (ie. watchpoints ARE working/enabled)
> 
> But if I access [0x008080000] I *don’t* get an exception.
> 
> **If the MASK field gets set to 0b1111 instead of 0b11111 then only the bottom 15 bits of the address get masked (instead of 31) and the masked address isn’t 0x00800000, and the exception won’t be triggered.**
> 
> 
> Unfortunately, changing the 4 to a 5 and recompiling had no effect :-(
> 
> I may well have misunderstood something. :-/

You're not.  It's a typo, repeated twice.  Will fix.


r~

