Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E832B6CAE94
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 21:28:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgsVA-00019I-FD; Mon, 27 Mar 2023 15:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgsV7-00018f-S2
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 15:27:29 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pgsV6-00053e-9C
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 15:27:29 -0400
Received: by mail-pl1-x631.google.com with SMTP id o11so9470207ple.1
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 12:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679945246;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2XckOnMLdO56ogCbHhifiVV0hpW5KsLBvmQ7yzVNv5g=;
 b=ZfkyUFwQ4njfNela8uHofgpCpWhJkVa1UgxqVThZNAIn9DcQA15HGhG1N4CyF0a8um
 /0kYC+yklX09cs9n8rAxxe3Iid0Ef76IPHdRU0Rb/95JdrE9IFqbiZA9ZORFfwP3RiWl
 Els2CK6WukW4PBzjoTpyidiWJpP2ld4An3qNvxAZI9KzeJY14gCM3tVCACqTU81jS7xM
 Ukahq0V8DdvanLH56O5aYj52Su8oUUSPZ2qGZeGY7MZsvJtyDpLqCqi4YXlVUhdzBzDC
 /YiueikJ7dww9KshhhSlbauRhhqLvYD7diZsPNT9pNgq0UoaWr3EbXXDT63F3dzK6rB7
 TIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679945246;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2XckOnMLdO56ogCbHhifiVV0hpW5KsLBvmQ7yzVNv5g=;
 b=Sk1sWvRt9XWmnn0/pEB+bUPiOcrG89di+ZAl2HPP1NvJ+TD3iqOApJymUrOFInCsFy
 3gpNG/gaLzri2LEipYdtOzy5BENj0Po6pFQykUwAOyu01FbdlSnoftvFeb4gAU8oO63u
 YG2/jYyauhs4mr13N5saen9AqeQlq+QMAciOJwm0pv4PE0sKyf60jKOj4SfEFV7CG7kv
 6zokwkoYHZ6A8T/X5BvIiXTrCz4q8PXQ51DKIeF0p5LH67SO3yqZlAEoqg4/B0LzIlDZ
 NooIdyFiwcwxiJUNnDYwKmRtwfgDswzKI/4Vqn2ZvzzjoIRe3PJNj/YaELf34YTjcSlb
 qeQA==
X-Gm-Message-State: AAQBX9dFWIaBuHiGzC7afPYgtUo50DI1oZS5U0TtsBJY+n94CdWfKjVy
 p/W7/lMPBgZk1oUwAsYPARToBg==
X-Google-Smtp-Source: AKy350ar4naJNqGiKRX0lO0pLFyLu9td+g9dnoFD6AICUX67k0afAiWwxpzy/UU9+xooCJIyaM1pLA==
X-Received: by 2002:a17:90b:3e86:b0:23d:e2b:cf1f with SMTP id
 rj6-20020a17090b3e8600b0023d0e2bcf1fmr12582172pjb.16.1679945246444; 
 Mon, 27 Mar 2023 12:27:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:6705:aa17:3641:e634?
 ([2602:ae:1544:6601:6705:aa17:3641:e634])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1709026ac500b0019a7ef5e9a8sm158682plt.82.2023.03.27.12.27.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Mar 2023 12:27:25 -0700 (PDT)
Message-ID: <6262a2c0-5884-1da2-cd7c-98bbb0fe669b@linaro.org>
Date: Mon, 27 Mar 2023 12:27:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH for-8.0 11/11] linux-user/arm: Take more care allocating
 commpage
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: cota@braap.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
References: <20230322150744.175010-1-richard.henderson@linaro.org>
 <20230322150744.175010-12-richard.henderson@linaro.org>
 <87zg7ysi4y.fsf@linaro.org> <fd714eec-2241-8c32-08d4-b2b346f611e7@linaro.org>
Content-Language: en-US
In-Reply-To: <fd714eec-2241-8c32-08d4-b2b346f611e7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/27/23 10:36, Richard Henderson wrote:
> On 3/27/23 01:38, Alex Bennée wrote:
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> User setting of -R reserved_va can lead to an assertion
>>> failure in page_set_flags.  Sanity check the value of
>>> reserved_va and print an error message instead.  Do not
>>> allocate a commpage at all for m-profile cpus.
>>
>> I see this:
>>
>>    TEST    convd on i386
>> qemu-i386: Unable to reserve 0x100000000 bytes of virtual address space
>> at 0x8000 (File exists) for use as guest address space (check your
>> virtual memory ulimit setting, min_mmap_addr or reserve less using -R
>> option)
>>
>> on the ubuntu aarch64 static build:
>>
>>    https://gitlab.com/stsquad/qemu/-/jobs/4003523064
> 
> Odd.  Works on aarch64.ci.qemu.org outside of the gitlab environment.

Bah.  I forgot --disable-pie.


r~


