Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 687894B2A30
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 17:26:56 +0100 (CET)
Received: from localhost ([::1]:58576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIYl5-0003kU-I6
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 11:26:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYcc-0004XH-KV; Fri, 11 Feb 2022 11:18:10 -0500
Received: from [2607:f8b0:4864:20::430] (port=33761
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIYcY-0007iX-Gj; Fri, 11 Feb 2022 11:18:09 -0500
Received: by mail-pf1-x430.google.com with SMTP id t36so6292133pfg.0;
 Fri, 11 Feb 2022 08:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HKy+54r3kPvEsdRKeUwuulEqApURLp9eG6DA0mzLXC4=;
 b=pWal7Qk+qeuCmVjHdOdt/Ztk9gewSx3H6R5+kjA7V6qICO3qI29t9GCBDpaQmm6+Is
 cjoaV5ZSlXheQ+ioWMeRzNL9emXDs5gv8+dZO5gOTm1SJKpx8AZGzbC5DyJOCrsb6sQJ
 Z6FHPUbOB6tR7H3H2r33OIucuCsemNGepPxNLlSBgDbmPRiHnNQeYky0dLgry/EtgiXh
 uvkI9AuMUMcs23RIIvoEY9O4NRlYWjNk7v1vnRXfze4Kltp8oX1764EKBpMMdG47Ion+
 eQ9C28PAhvkravMq9mN5MyXoA3x7qXSpicGyMUb57MkpVTEUr3MvwajH00XMCWdRyBaC
 ZNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HKy+54r3kPvEsdRKeUwuulEqApURLp9eG6DA0mzLXC4=;
 b=a9bvmvY2w9VGh/oKPp7ZrPXdQpH9YX+jstUZ4FtkidUEBGTdFLMbh2DueH1vk46QGY
 70zYpsOS1Oem/Uiy3gCR06J0V5bn3bFIvoKe2BQJOQ4Vxj4k0y1HzxkbWSbGUj+Ub7/x
 GWqCDdtO2+j2ZMCiqyaOfdy5OUhLI0lIO6dUb5HxmHb6ApVehguXTc0q1CJDwiZ7G6bH
 2radnPfWwlGZaav1VDb4iL1rcdKcIZiw0UGHVAFDKjOR9KZ2lJBNgu4LlINs/5XU1Okr
 kHICzrQIfyT1PxxrsotcweUOwXjJZC6sqv5YhAfapJv5kROLDDkeJrUDKjhqmsPfvHmU
 chWQ==
X-Gm-Message-State: AOAM53228towHmRINE9rmadnhVEoadIw3Z3Cfxsx/8g5t7oVkB/JpbW+
 0ZNmHGm+tQ5wIZQHXK8p+rA=
X-Google-Smtp-Source: ABdhPJyi7RCE+MQ+I+jMRFmYj4IKZXuof6CW7+znZJMNLvgS5wBOp+d3K95kem/Tv1bqNvhNLHpb1Q==
X-Received: by 2002:a65:6ccf:: with SMTP id g15mr1937037pgw.105.1644596284176; 
 Fri, 11 Feb 2022 08:18:04 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id h25sm25466813pfn.208.2022.02.11.08.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 08:18:03 -0800 (PST)
Message-ID: <a45108c0-c5ed-3d98-77d2-c8b9c5c26be8@amsat.org>
Date: Fri, 11 Feb 2022 17:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Andrew Strauss <astrauss11@gmail.com>,
 Keith Packard <keithp@keithp.com>, qemu-arm@nongnu.org
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
 <8b6fca38-8a4e-af35-f202-86a5a3f98e47@amsat.org>
 <CAFEAcA-2=TD9FeOn9ZJLBmJJBfQhOKSTRWpOXEw0AVktWmE6vA@mail.gmail.com>
 <878ruhedv0.fsf@linaro.org>
In-Reply-To: <878ruhedv0.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 11/2/22 14:22, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Thu, 10 Feb 2022 at 11:48, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> Hi Alex,
>>>
>>> On 10/2/22 12:30, Alex Bennée wrote:
>>>> The previous numbers were a guess at best and rather arbitrary without
>>>> taking into account anything that might be loaded. Instead of using
>>>> guesses based on the state of registers implement a new function that:
>>>>
>>>>    a) scans the MemoryRegions for the largest RAM block
>>>>    b) iterates through all "ROM" blobs looking for the biggest gap
>>>>
>>>> The "ROM" blobs include all code loaded via -kernel and the various
>>>> -device loader techniques.
>>>>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Cc: Andrew Strauss <astrauss11@gmail.com>
>>>> Cc: Keith Packard <keithp@keithp.com>
>>>> Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>>>
>>>> +static LayoutInfo common_semi_find_bases(CPUState *cs)
>>>>    {
>>>> -    MemoryRegion *subregion;
>>>> +    FlatView *fv;
>>>> +    LayoutInfo info = { 0, 0, 0, 0 };
>>>> +
>>>> +    RCU_READ_LOCK_GUARD();
>>>> +
>>>> +    fv = address_space_to_flatview(cs->as);
>>>
>>> Why are we using the CPU view and not address_space_memory?
>>
>> If you have a choice between "use the right view of an
>> address space" and "use the global address_space_memory",
>> it's better to prefer the former, I think. We use the
>> latter in lots of places, but it's not conceptually the
>> right way to think about how the memory system works IMHO.

Yes I agree.

For user-mode, this patch makes sense. For system-mode it is
not obvious to make sense of SYS_HEAPINFO (except focusing in
cores targeting embedded systems eventually).

> In this case the addresses have to be as the CPU sees them because it's
> between the CPU and the semihosting backend to share data.

Beside the sysemu curiosity, the patch logic is fine, so:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks,

Phil.

