Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270324BB065
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Feb 2022 04:50:02 +0100 (CET)
Received: from localhost ([::1]:35250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKuHP-0004uX-UC
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 22:49:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKuFZ-00041O-Df
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 22:48:05 -0500
Received: from [2607:f8b0:4864:20::42f] (port=46893
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKuFX-0004Ov-MB
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 22:48:05 -0500
Received: by mail-pf1-x42f.google.com with SMTP id i21so1308131pfd.13
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 19:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6N1EnLMGnEq8wQ5a/od9AfA+7poSeJEV510Fw3dyECY=;
 b=aBnWBbRO91L74bZC61aTdvoUO7mw3c9WEATCetT84kAPTIx91AoAtrFRLoM3feAGdp
 KUBrNPpTaBN1ODp6u7+CNFgj0Nqgay8YG3QZqbsCDS2Mi+Q4gS+repA0BP3Z4HoprNAu
 7aI0/NmQHt/rY2Hj85N1FYt0hKNbyRyho7mgWIw0nUq2NbkOeLXUCFS2rSj/+caOB5y1
 C3iS6yfW89BSkVUSpwm04EdG5iqc+PATGt8VUQ5Le0Ji0K7iy6dHoXqdbnT+W39tc2mS
 6wJxh+1Zb+6vE9r0mCSFeqP6oH8hqYcfRyh/vEWQ96ZXdQRD1mPdJoYODSMo9og0juEW
 Kd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6N1EnLMGnEq8wQ5a/od9AfA+7poSeJEV510Fw3dyECY=;
 b=PtKDjC18L+V+IxYMBEIC9oSYhv4/FTS2O/q43VEOZ/7Yz4a6Sw/eIGhgysF0jjryfJ
 HAPPrqDbPmbak0HUQ6dABi8s7XL0BbA7Kt3hT1hhcajfFMK84z3lOt4umVUzbdI2+ZDJ
 mJ47NGBSRLE6ZNlpLfnYR3HP+BNfecHqAw6BL8AE7f/g8B3L7EE++BdlBWhamKDQA8KX
 FFtQNV5urEex7QWjXedUAUDt7Qg1KCOPHLysbPW/Ok9Dwg6jgx7Y/VikK6X9GxmbdUZe
 Majxy98Q8DADBz4Hu3QflrDihqDbuPvi3An8c8hCCniYyBEhZktjlq7f3F/kJBCy+l4R
 bwaw==
X-Gm-Message-State: AOAM530SByUnkIAAzcfFc2IfLLH6i+SI5myjkDi0znZKJL54t2reD2Vl
 xHRmy33FaFBBAmhUaARnMohT0w==
X-Google-Smtp-Source: ABdhPJwH+pXR+AhVLQLP7IZ6GXvkosY0yrJgigrFJp+kgmd9tMeK7pWtXkLq75pkayH1vT3MIIDFAw==
X-Received: by 2002:a63:ce51:0:b0:362:c4fd:273b with SMTP id
 r17-20020a63ce51000000b00362c4fd273bmr4817719pgi.540.1645156082068; 
 Thu, 17 Feb 2022 19:48:02 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id c23sm1001460pfi.136.2022.02.17.19.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 19:48:01 -0800 (PST)
Message-ID: <a8dd9d30-843c-0510-db1c-de965220778f@linaro.org>
Date: Fri, 18 Feb 2022 14:47:56 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 00/15] target/arm: Implement LVA, LPA, LPA2 features
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <CAFEAcA_m1Hobh8M+RBto_uECQdq1BN7nvMFOsCbrkL773MEr1Q@mail.gmail.com>
 <87v8xd9yw9.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87v8xd9yw9.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/18/22 04:37, Alex Bennée wrote:
> 
> Peter Maydell <peter.maydell@linaro.org> writes:
> 
>> On Thu, 10 Feb 2022 at 04:04, Richard Henderson
>> <richard.henderson@linaro.org> wrote:
>>>
>>> Changes for v2:
>>>    * Introduce FIELD_SEX64, instead of open-coding w/ sextract64.
>>>    * Set TCR_EL1 more completely for user-only.
>>>    * Continue to bound tsz within aa64_va_parameters;
>>>      provide an out-of-bound indicator for raising AddressSize fault.
>>>    * Split IPS patch.
>>>    * Fix debug registers for LVA.
>>>    * Fix long-format fsc for LPA2.
>>>    * Fix TLBI page shift.
>>>    * Validate TLBI granule vs TCR granule.
>>>
>>> Not done:
>>>    * Validate translation levels which accept blocks.
>>>
>>> There is still no upstream kernel support for FEAT_LPA2,
>>> so that is essentially untested.
>>
>> This series seems to break 'make check-acceptance':
>>
>>   (01/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2:
>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>> Timeout reached\nOriginal status: ERROR\n{'name':
>> '01-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2',
>> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/results/j...
>> (900.74 s)
>>   (02/59) tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3:
>> INTERRUPTED: Test interrupted by SIGTERM\nRunner error occurred:
>> Timeout reached\nOriginal status: ERROR\n{'name':
>> '02-tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3',
>> 'logdir': '/mnt/nvmedisk/linaro/qemu-from-laptop/qemu/build/arm-clang/tests/results/j...
>> (900.71 s)
>>
>> UEFI runs in the guest and seems to launch the kernel, but there's
>> no output from the kernel itself in the logfile. Last thing it
>> prints is:
>>
>> EFI stub: Booting Linux Kernel...
>> EFI stub: EFI_RNG_PROTOCOL unavailable, no randomness supplied
>> EFI stub: Using DTB from configuration table
>> EFI stub: Exiting boot services and installing virtual address map...
>> SetUefiImageMemoryAttributes - 0x000000007F500000 - 0x0000000000040000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007C190000 - 0x0000000000040000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007C140000 - 0x0000000000040000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007F4C0000 - 0x0000000000030000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007C0F0000 - 0x0000000000040000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007BFB0000 - 0x0000000000040000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007BE00000 - 0x0000000000030000
>> (0x0000000000000008)
>> SetUefiImageMemoryAttributes - 0x000000007BDC0000 - 0x0000000000030000
>> (0x0000000000000008)
>>
>> This ought to be followed by the usual kernel boot log
>> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
>> etc but it isn't. Probably the kernel is crashing in early bootup
>> before it gets round to printing anything.
> 
> As this test runs under -cpu max it is likely exercising the new
> features (and failing).

I would have thought so too.  However...

I've bisected this to the final LPA2 patch.  I have not tracked down what exactly is going 
on with this, but it's definitely not the guest exercising the new feature -- there is no 
upstream support for LPA2.

I'll keep looking.


r~


