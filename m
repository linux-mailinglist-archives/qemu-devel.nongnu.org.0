Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371A7483039
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 12:11:41 +0100 (CET)
Received: from localhost ([::1]:38376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4LFb-0007lV-R0
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 06:11:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4LEC-0006Pc-0n; Mon, 03 Jan 2022 06:10:12 -0500
Received: from [2607:f8b0:4864:20::92f] (port=43811
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4LE9-000448-G1; Mon, 03 Jan 2022 06:10:11 -0500
Received: by mail-ua1-x92f.google.com with SMTP id i5so42068551uaq.10;
 Mon, 03 Jan 2022 03:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3BkOxyIZLfX+5voECTNgrjWNy9NLm7CQSpXkk0SGuGU=;
 b=dW06u2ak6IzB/dKEkCxKMzxKp5fsez/uB0tkoe+iEIrmqky8f8xjjKHMVKDzM9VOzb
 h2mEjV7vz+/OpYZvfbW4yh9ouwQFWRzFpfQdvctKm3TIvRobKtku4ikCyuSmupWi7qUs
 mh41WHhUvXOFdp7TPY1Srpu4w4wqkK428Wog+944Fdx8vtQIyLFlBi1vpcDSoRK8TQLr
 TLOxOTiUKmGhciqDg8YO48iTZwLMoMjhZ2BzvbEpEZGI21Zu4NL5xEeuBAcKomYqUDDf
 V1gRqo7afpfbpWifbw9aL1UAfp1JSHzkKKJH0PRzgsKHXbOplve8BHOD3BDEqZk3ploH
 F0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3BkOxyIZLfX+5voECTNgrjWNy9NLm7CQSpXkk0SGuGU=;
 b=kGC61WYbbd7rCfrFHq8E34vThhBo3UFtjFH1JDjsEgQ0zodAVfcEZ+WCo2Ok2WHgoC
 vez2SbBVijoPoHSEMv+0apuW47HEXe5HbCK+bjLm5yoYl1ezlvAlhzTdB8tmrxTM6VKH
 EGr4En8MDOesj1Nxf4N35LFzCjAd76fW+aAzYKDonCxuFtpLkqicgU5K/mRwhErzTrZu
 WdTdB3vSAVRs4H8moV4/9jvpkm+mcqaa7/+twHMg+sb38Ff2lv9IV/KWJS/qM/PlA9yc
 qyHSV0f5Vpb8LF6n/DD3yirFzkrYSjcvVJ7z0hxlpwMJsG6xD+rR1Ak8hSnI58YMtlEY
 iU7Q==
X-Gm-Message-State: AOAM533Xq4+vNEMlM4j5+uTvCMZrgzaZApp6idA+90QoKj0+2N9Dghfs
 WNhx1BO72r/L8VWtjziSC3zjyEmnFPc=
X-Google-Smtp-Source: ABdhPJzcmRz3av885mnTPK+mkr4DqujLj7/omPqq65iGrRg4ir+ZbMwsrGLMX5I5KKs9VW3E/XILdg==
X-Received: by 2002:ab0:3d0c:: with SMTP id f12mr10059462uax.15.1641208206341; 
 Mon, 03 Jan 2022 03:10:06 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id m3sm7164058vsh.7.2022.01.03.03.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 03:10:06 -0800 (PST)
Message-ID: <3d16773a-f070-b2a8-24ae-34d0a7bed64d@gmail.com>
Date: Mon, 3 Jan 2022 08:10:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 0/3] Reorg ppc64 pmu insn counting
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211223030149.1947418-1-richard.henderson@linaro.org>
 <1b988844-075d-beb3-7fd1-a26f30e9f5dc@gmail.com>
 <1928bc96-ace5-3e5b-2da2-723ef3071173@linaro.org>
 <c2d241d4-d466-c599-e00e-3fdb62722bbb@gmail.com>
 <238d16f2-988d-2efe-b68a-b7581f54dda8@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <238d16f2-988d-2efe-b68a-b7581f54dda8@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.354,
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/3/22 03:48, Cédric Le Goater wrote:
> On 12/30/21 23:12, Daniel Henrique Barboza wrote:
>>
>>
>> On 12/23/21 18:19, Richard Henderson wrote:
>>> On 12/23/21 12:36 PM, Daniel Henrique Barboza wrote:
>>>> This reorg is breaking PMU-EBB tests, unfortunately. These tests are run from the kernel
>>>> tree [1] and I test them inside a pSeries TCG guest. You'll need to apply patches 9 and
>>>> 10 of [2] beforehand (they apply cleanly in current master) because they aren't upstream
>>>> yet and EBB needs it.
>>>>
>>>> The tests that are breaking consistently with this reorg are:
>>>>
>>>> back_to_back_ebbs_test.c
>>>> cpu_event_pinned_vs_ebb_test.c
>>>> cycles_test.c
>>>> task_event_pinned_vs_ebb_test.c
>>>
>>> In which case perhaps drop my first patch for now, and instead simply replicate your tcg algorithm in c exactly -- using none of the helpers that currently exist.
>>>
>>> We can improve the code, and the use of pmc_get_event from hreg_compute_hregs_value second.
>>
>>
>> While attempting to do that I figured what was off with this series and ended up
>> fixing it.
>>
>> It's now working with the event-based branch interrupt tests and Avocado seems happy
>> as well. It took some small adjustments/fixes in patches 1/2 and an extra patch of mine
>> tuning the existing logic after the reorg.
>>
>>
>> I'll clean it up and re-send it next week/year.
> 
> Shouldn't we merge this series first ? It is really improving emulation
> and keeps the check-avocado tests under the timeout limit (which I find
> important).


As it is this series is breaking EBB tests if we apply the EBB interrupt patches
on top of it. If your concern is strictly with the Avocado tests then we'd better
off pushing my TCG version which fixes Avocado and don't break anything else.

Besides, I'll sent the v2 of this series today, tomorrow at the latest. We're better
off pushing the fixed version.


Thanks,

Daniel



> 
> Thanks,
> 
> C.

