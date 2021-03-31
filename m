Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AF3350AD8
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 01:33:35 +0200 (CEST)
Received: from localhost ([::1]:36482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRkL3-00008i-0p
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 19:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRkJ0-0007gj-4Q
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 19:31:22 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lRkIx-00084M-Cs
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 19:31:21 -0400
Received: by mail-pg1-x52b.google.com with SMTP id m7so374438pgj.8
 for <qemu-devel@nongnu.org>; Wed, 31 Mar 2021 16:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fMUpHOmngwEAfZTi8DwkePtRcr7LlAPVoQFzyF5UeQs=;
 b=zKbShca1mOBUce4XxMY7lKIA/bX+PX7Z3bAhpFmE9EZo4iOTJJ7W3ahlulTUlRQe+O
 e7X+Ji/W1eDRmoQbxk1cfwFajsENYjXOHfzEVDnbYQfPflUfeMveRINI3OVDvZNPxp2A
 6kzm56aDbnUamBcv9reKZ4/mHqW+X4iNP8GG2pyOOCev47vo9XPE6cqFhQfmSj1UkeXF
 /wu4fpLPCcJAo5ayNQXCrSnDkL2T9sp0O7fkkzgCQEUXiH5gNJ6qYdoVOP7PuMG6UQIn
 J5uRW+udNae2m5xdCuE8shBMdWfE0qAVsQvjzh3+r+ni/Sn1UE4/0DNHvAFKG4hwYdr7
 pZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fMUpHOmngwEAfZTi8DwkePtRcr7LlAPVoQFzyF5UeQs=;
 b=bwiEoqUTwPaP4wOPOyhd9Brxt7HO5UhPpC9Ix+HqHVL9BJsvLLdbMYLtYn3NEm2woX
 BKeKrpyljHxvoOFl2EHoluWJtObvoE+Ph5rhiZuXyoFRQS7z5Fu1eaJubcyEG5ldwV4c
 T6dESAli2NQ8H1kDSgKeSV1MJEQdqv9VfkxmWDWa8jZoGbGQW68AuqgTLFdvMaX/lSgH
 YJbXmUoXXmqSlasAu/EFcUSLidtJP+Q43j0yFgJzjmciZOcnbz9QMhEL0XlvJjHOfcxp
 RI5WdAW80XDo6DfRt3bOT3yDqaB+WhzCEgNkN938vAtNRMAkNc23uVazOXwg5LEbAX0U
 DigQ==
X-Gm-Message-State: AOAM533SdHIHbMzSTseUEp+mBGDho9k2Ul5VSUml2cfsOH+bJBjgp1h6
 bIRS/H/4XpAWqu7cT8ippEmoCw==
X-Google-Smtp-Source: ABdhPJzqd0vDNtQyR/gy6GV6Rhs6VpO56Z1tlRuV1P5gYqIb9/0Kgm5Yqx0XGdjLSexI4avmrOAgmg==
X-Received: by 2002:a63:d40b:: with SMTP id a11mr5149140pgh.192.1617233477207; 
 Wed, 31 Mar 2021 16:31:17 -0700 (PDT)
Received: from [192.168.101.174] ([75.147.178.105])
 by smtp.gmail.com with ESMTPSA id gf20sm3221673pjb.39.2021.03.31.16.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Mar 2021 16:31:16 -0700 (PDT)
Subject: Re: [PATCH v1 2/8] hw/intc: GICv3 ITS register definitions added
To: shashi.mallela@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210323041238.133835-1-shashi.mallela@linaro.org>
 <20210323041238.133835-3-shashi.mallela@linaro.org>
 <87mtur10mu.fsf@linaro.org>
 <35e6e1b000a4aae059b95ff24e83e66995e2917b.camel@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6ad7829c-4098-74e3-c8fe-f4722faa19a7@linaro.org>
Date: Wed, 31 Mar 2021 16:31:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <35e6e1b000a4aae059b95ff24e83e66995e2917b.camel@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
Cc: peter.maydell@linaro.org, leif@nuviainc.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, rad@semihalf.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/31/21 9:48 AM, shashi.mallela@linaro.org wrote:
>>> +        if (!(s->ctlr & GITS_CTLR_ENABLED)) {
>>> +            s->cbaser = value;
>>> +            if (!extract_cmdq_params(s)) {
>>> +                qemu_log_mask(LOG_GUEST_ERROR,
>>> +                       "%s: error extracting GITS_CBASER
>>> parameters "
>>> +                       TARGET_FMT_plx "\n", __func__, offset);
>>
>> So are these all LOG_UNIMP or are they a programming failure on our
>> part?
> they are not LOG_UNIMP but error indications during processing which
> could be due to invalid parameters passed from the driver

Then we should re-word the message so that it does not read as if it is a qemu 
problem, but a guest problem.

It is difficult to do this with the code structure you've written, but you 
could use an Error** parameter (include/qabi/error.h) to extract_cmdq_params so 
that you can diagnose exactly what is wrong.


r~

