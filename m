Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E691F51398E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 18:17:59 +0200 (CEST)
Received: from localhost ([::1]:48228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk6q7-0007vw-2n
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 12:17:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk5vl-0005zh-Pi
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:19:45 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:40928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nk5vj-0004a1-QD
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 11:19:45 -0400
Received: by mail-pg1-x52b.google.com with SMTP id x12so4233679pgj.7
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rs+sXY4Si2YvWzVA8ySoQvKVRKL3235O14vhHnV2DXo=;
 b=iHqPaBvhUv5Ly+RWeJOBdi03P5+VUwaRPfr945ZUgjglAAY6vk6JX7li/qx/yJrE6o
 g09nuv6KqSucSSfolSlisftdBq03Wi1VMHXuhmwywVD6Z0nXkXTTkimX201mB7oPQP1t
 xN+xHf6YaBGyaYDQVOO7tol3DvnOPUpOxyVHS49qLMW69IMCGVwmtgYb7Do4SPu+f1/7
 m6PTGVXXeiDI1TOVFaaTa8EKxD4UK182OPzQltiN7nFNurNE7HzzAf+ncmK36aqigIeC
 TWowOYGGPqly7gCPSD5GR9KzD6wF1CdSneYLcYzucVxqbI1p6wR2FtTAExh8go/G0Eee
 d5hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rs+sXY4Si2YvWzVA8ySoQvKVRKL3235O14vhHnV2DXo=;
 b=UrKNeCPaQBNp9OfV1OFKuNVmIh/1EOaUDQQhatEiZcb2HI4FgYENDX5jQU+3b0cbvI
 N/11/BkCiZx6x96myq/wkMilC/sDnKQ3w6i2XfGpW2nov3BZT0j1zyM25pHHVPqJT1ey
 eoZDL+OYkZgOP85YbfGKDAaGPqD11QRqnAxw8Ek1aPbJlnbSI39L+ecSSQy6b5LNMB/b
 AtAHYWBsA/jT4S8QnjYe5T13fakfTSHp1Rka87ohWHTsIQbeJxS+WsdC/cQInZruo3Xl
 3hq1KimrwBY+/6/wkUnPdVQJU+1Byf0iocJ7xO1QVjZYmN1sJfsy+ojmsBjJ8D6SziLM
 bQLA==
X-Gm-Message-State: AOAM530Uo+jLdn6PDfaWvYg3ekBeVRX/WPxUmsciO8SGOAorreVerY4a
 B/oFeyTzOmuw0/bNV29ocwoMoA==
X-Google-Smtp-Source: ABdhPJwgk6RmuF4PRfUpeVG29shB/m8UoVw2k/yuonKBakQYB4hm1zDASo86menBAaQPS48fl5Ocmw==
X-Received: by 2002:a65:6bd6:0:b0:39d:4f85:9ecf with SMTP id
 e22-20020a656bd6000000b0039d4f859ecfmr29090856pgw.336.1651159182284; 
 Thu, 28 Apr 2022 08:19:42 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a63e00c000000b003c14af505f9sm2836314pgh.17.2022.04.28.08.19.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 08:19:41 -0700 (PDT)
Message-ID: <40272c05-c2d5-756e-5096-a05f53367095@linaro.org>
Date: Thu, 28 Apr 2022 08:19:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm: Enable SCTLR_EL1.BT0 for aarch64-linux-user
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220427042312.294300-1-richard.henderson@linaro.org>
 <CAFEAcA-636wFtzEF56y8PcjcZy2J9RuNaw1nHMQ4Nsn_55ndCw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA-636wFtzEF56y8PcjcZy2J9RuNaw1nHMQ4Nsn_55ndCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/22 05:56, Peter Maydell wrote:
> On Wed, 27 Apr 2022 at 05:23, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This controls whether the PACI{A,B}SP instructions trap with BTYPE=3
>> (indirect branch from register other than x16/x17).  The linux kernel
>> sets this in bti_enable().
>>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/998
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
>> --- a/tests/tcg/aarch64/Makefile.target
>> +++ b/tests/tcg/aarch64/Makefile.target
>> @@ -26,11 +26,11 @@ run-plugin-pauth-%: QEMU_OPTS += -cpu max
>>   endif
>>
>>   # BTI Tests
>> -# bti-1 tests the elf notes, so we require special compiler support.
>> +# bti-1 test the elf notes, so we require special compiler support.
> 
> Did you intend to edit this comment line ?
> 
> Otherwise
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Oops, no.  At one point I had bti-3 sharing this line, and following code, but it didn't work.

r~

