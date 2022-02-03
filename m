Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B17C24A9077
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 23:10:58 +0100 (CET)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFkJb-0006qk-Mf
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 17:10:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFkCI-0001xc-86
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 17:03:22 -0500
Received: from [2607:f8b0:4864:20::42f] (port=40547
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nFkCE-0001xk-Qk
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 17:03:21 -0500
Received: by mail-pf1-x42f.google.com with SMTP id e6so3362803pfc.7
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 14:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Hlvm+MjaT3L/Zf1f3awZy/er0qThgJL2b/6l9FAGleo=;
 b=oGyyhyVs2yKdO2Vo8yMUZYhPdwZqaytlHZs76/x+0qNj8glDkCJttvxMeDXFxc0Mtm
 BgWU2HzYuETWbjnw6Ka43q7osxuGdPdv/fHKlMrgISiZQ2g18GtGrl+k0qkWGxmrb5P/
 sjQFXUbPbENZ2WVoCuavArg9xlPvzzs6xShZoq707DRVt63yuOwEkCpzWf0Av4c50EuN
 kbzfodo27sp0fDN6dsvWxwzWftX0nY140krV16bqaQhggidkbx2P38C8lJBTOMpKJKhs
 M+HjIU3OJcKoqd9g9eo8w2LCKfzkl/ju62YbeuOE2Xm5aBsH4CPlX7f4aA/cPQa1Upu5
 E2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hlvm+MjaT3L/Zf1f3awZy/er0qThgJL2b/6l9FAGleo=;
 b=b9aoTWS1qlPcXDzurXJy6414QmlLapwrZmgCk+fKhvJGvsVhG5rJjrIsFoAPYwo2aP
 y6UN95rYRxIBhfb8B+Kg6iqKIq736m4DFq7BDOFlLctT6VuAEs5pvqqcng1S+1DI6u24
 JCrZarvGGE5e8GMnq+R3ykzfM/Pilc5rTvy65KVPFZUCtEYs3XS83kCOhshFO1UlSlFV
 2g7cWgA0T+y2iodOlxHaUK/KaiVeog+Cx90Z2ZLGnj294GDhORHjwHrh/PIWu4xYR3tX
 nJTwm9JH3VacBQbrHFXPzx7jyn6AdbKSQd/UqszwdzQFFYwltlfsioTWiBJF+Hr90KRq
 9Xgw==
X-Gm-Message-State: AOAM533/1odQkk4IyBhpJS/IypoUEuBONj4Y0clSFTeLEBRG75eaiZjM
 BDGb/UPkAnGlza0zKBaL9Fq9AQ==
X-Google-Smtp-Source: ABdhPJzySfDHhEt33vTN9Kq1KKhs5TYX98Il0UgKZ+FVT62vjBs/nx9coeEEqexw1cJGWWCEjEW/pw==
X-Received: by 2002:a05:6a00:b42:: with SMTP id p2mr184345pfo.50.1643925741913; 
 Thu, 03 Feb 2022 14:02:21 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:e4a0:3bb7:a616:35c9?
 ([2001:8003:3a49:fd00:e4a0:3bb7:a616:35c9])
 by smtp.gmail.com with ESMTPSA id z13sm8229pfh.45.2022.02.03.14.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 14:02:21 -0800 (PST)
Message-ID: <2b1358f1-0447-4805-d7e2-e01eb1b3ed9d@linaro.org>
Date: Fri, 4 Feb 2022 09:02:16 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 06/13] hw/intc/arm_gicv3_its: Fix address calculation in
 get_ite() and update_ite()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
 <20220201193207.2771604-7-peter.maydell@linaro.org>
 <afbbee74-b6fc-7b55-f7e4-c5ae926f7519@linaro.org>
 <CAFEAcA9Dj0K5T677__5wBA5=T5c1qOxNxwW5hkZU9-vDCP-76Q@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9Dj0K5T677__5wBA5=T5c1qOxNxwW5hkZU9-vDCP-76Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 21:45, Peter Maydell wrote:
> On Thu, 3 Feb 2022 at 03:59, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 2/2/22 06:32, Peter Maydell wrote:
>>> In get_ite() and update_ite() we work with a 12-byte in-guest-memory
>>> table entry, which we intend to handle as an 8-byte value followed by
>>> a 4-byte value.  Unfortunately the calculation of the address of the
>>> 4-byte value is wrong, because we write it as:
>>>
>>>    table_base_address + (index * entrysize) + 4
>>> (obfuscated by the way the expression has been written)
>>>
>>> when it should be + 8.  This bug meant that we overwrote the top
>>> bytes of the 8-byte value with the 4-byte value.  There are no
>>> guest-visible effects because the top half of the 8-byte value
>>> contains only the doorbell interrupt field, which is used only in
>>> GICv4, and the two bugs in the "write ITE" and "read ITE" codepaths
>>> cancel each other out.
>>>
>>> We can't simply change the calculation, because this would break
>>> migration of a (TCG) guest from the old version of QEMU which had
>>> in-guest-memory interrupt tables written using the buggy version of
>>> update_ite().  We must also at the same time change the layout of the
>>> fields within the ITE_L and ITE_H values so that the in-memory
>>> locations of the fields we care about (VALID, INTTYPE, INTID and
>>> ICID) stay the same.
> 
>> This is confusing: 5-3 is titled "example of the number of bits that might be stored in an
>> ITE"?  Surely there must be a true architected format for this table, the one real
>> hardware uses.  Surely tcg will simply have to suck it up and break migration to fix this
>> properly.
> 
> No, the ITE format is implementation-defined, like that of the other
> in-guest-memory tables the ITS uses. It's UNPREDICTABLE for a guest
> to try to directly access the tables in memory -- they are only ever
> written or read by the ITS itself in response to incoming commands,
> so it's not a problem for the format in memory to be impdef. This
> flexibility in the spec allows implementations to minimize the size
> of their data tables based on how large an ID size they support and
> other potentially-configurable parameters. For instance if you look
> at the values for the GITS_BASER* for the GIC-700 in its TRM you
> can see that its Collection Table entry size is only 2 bytes, since
> it uses the "rdbase is a CPU number" format; an ITS that used the
> "rdbase is a physical address" implementation choice would need
> more bytes there. (QEMU also uses "rdbase is a CPU number", but
> we have rather profligately opted to use 8 bytes per collection
> table entry.)

Ah, right.  In which case,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

