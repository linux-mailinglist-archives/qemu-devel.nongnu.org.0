Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EADF6D3D88
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 08:47:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjDxq-0004wj-AU; Mon, 03 Apr 2023 02:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjDxf-0004vD-7U
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:46:40 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pjDxV-0005Nn-Ly
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 02:46:33 -0400
Received: by mail-wr1-x42b.google.com with SMTP id y14so28131064wrq.4
 for <qemu-devel@nongnu.org>; Sun, 02 Apr 2023 23:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680504377;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fPogU37TNIdSOidR+OKftctaER7nXqN/RHURpSud5J4=;
 b=szhy9Ba5LstfxuyD4GJp680Zt5EH2xsKT5yWYBzFLN4jwrzJ/t62rushIMlk3zrzmd
 zT38vkNwHym16+Gv6pS9Sb1sy9AKWN8WCKl4McNcP7a7PFA0rp2Loa1mzPTT08DsPjNS
 cxEFA50KMZOyhfVSKJIn7ulIjkH7OB0h8vG2QjquguWo9FVTKlagRYk7ahJN81xKl2n3
 yhxBhB3nZ25o6vhmDNyxNCinRj62Ywuv/219WQwCZH97zh97/IL6wUQ0eN8p7arHiEHZ
 AllC7ZClhebaJbR5U+FL4bBuaDbm2/9PfWb1YFyC9gKPT2uOVpTixWqMrq9Z0SChchsM
 szyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680504377;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fPogU37TNIdSOidR+OKftctaER7nXqN/RHURpSud5J4=;
 b=6Bjoz9LExkfB54GBlc0yetn4noXrnapascSYdN9mbJ0fCTT5bdE0OXBaSGW8x0R8lD
 c6/yTByiG3mtVfbvmj74kyKH9GPtgRb3voCj/iURih3bpB5iFUcOnTDtSYykwYbCoWv8
 XmegkdLC6UHF5xUQJ/AiXZSKnEpTNWMWiNIQ4NiLIQOhiGb7wx+JDnWQ3Ey+mJODwAbN
 udJNlh/ovaHDYjDDSvAQrJvWFVqhc7BFm3iGnV6Q6fv0XHOEOEcdw4fwcnlGOpFRXB40
 /n4CY2cczZV7kdP9kzbyT0wpwxrnHXtRny8wdC5k3U7j/7vWZS6ZRXyIBw35BdTERB/r
 ao4A==
X-Gm-Message-State: AAQBX9ejHzSNxeI0MmCjEgWQFFzgxgO2xoceTr0wOV8dzOuNjZLEM3qt
 txMwvtu3+q9PkDaEZSfQ32WAbA==
X-Google-Smtp-Source: AKy350YIk6zAiXN0t5fjaQ5HxTtf7w0q9N48daQ3w81/nuf6Zqk/mLIqWhrv1CV7vrRXRWWq79wgjg==
X-Received: by 2002:a5d:5742:0:b0:2cf:e3c7:5975 with SMTP id
 q2-20020a5d5742000000b002cfe3c75975mr13007540wrw.34.1680504377022; 
 Sun, 02 Apr 2023 23:46:17 -0700 (PDT)
Received: from [192.168.127.175] (246.red-95-127-42.staticip.rima-tde.net.
 [95.127.42.246]) by smtp.gmail.com with ESMTPSA id
 n18-20020a5d4852000000b002c561805a4csm8884390wrs.45.2023.04.02.23.46.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 02 Apr 2023 23:46:16 -0700 (PDT)
Message-ID: <be73a63b-76fb-c223-b93a-a964bae7ed99@linaro.org>
Date: Mon, 3 Apr 2023 08:46:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: xen bits broke x32 build
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Joao Martins <joao.m.martins@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Cc: Paul Durrant <paul@xen.org>
References: <b7796732-6334-c68b-3baa-2354644152f8@msgid.tls.msk.ru>
 <8e00cd8d-1914-e9e5-e4c1-23be705399c1@oracle.com>
 <9059b75a-07c2-d90b-83ae-6011b1c2c36a@msgid.tls.msk.ru>
 <D03542A7-2475-4BF3-8B32-CBA9447AD393@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <D03542A7-2475-4BF3-8B32-CBA9447AD393@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.37,
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

On 1/4/23 14:10, David Woodhouse wrote:
> On 1 April 2023 12:57:33 BST, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 01.04.2023 14:45, Joao Martins пишет:
>>> On 01/04/2023 09:40, Michael Tokarev wrote:
>>>> After bringing in xen guest support, qemu fails to build on x32:
>>>> Adding the folks who added the feature too
>>>
>>>> target/i386/kvm/xen-emu.c:876:5: note: in expansion of macro ‘qemu_build_assert’
>>>>     876 |     qemu_build_assert(sizeof(struct vcpu_info) == 64);
>>>>         |     ^~~~~~~~~~~~~~~~~
>>>>
>>>> This one should be easy to fix, but I wonder if there are other issues
>>>> with x32 exists..
>>>>
>>> Not sure.
>>>
>>> struct vcpu_info is supposed to be 64bytes on both 32-bit and 64-bit builds.
>>>
>>> If anything maybe arch_vcpu_info struct is different on 32-bit and 64-bit...
>>> David, Paul, any ideas?
>>
>> Yes, it is arch_vcpu_info. I assumed it is a trivial thing, but let me explain
>> if it's not the case.
>>
>> include/hw/xen/interface/arch-x86/xen.h :
>>
>> #if defined(__i386__)
>> #include "xen-x86_32.h"
>> #elif defined(__x86_64__)
>> #include "xen-x86_64.h"
>> #endif
>>
>> (I wonder if it ever possible to have none of the two defined).
>>
>> Now, xen-x86_32.h has:
>>
>> struct arch_vcpu_info {
>>     unsigned long cr2;
>>     unsigned long pad[5]; /* sizeof(vcpu_info_t) == 64 */
>> };
>>
>> Assuming sizeof(long)==32bits. But actually it is 64bits on x32.
>>
>> While xen-x86_64.h has:
>>
>> struct arch_vcpu_info {
>>     unsigned long cr2;
>>     unsigned long pad; /* sizeof(vcpu_info_t) == 64 */
>> };
>>
>>
>> It looks like for x32, the test in arch-x86/xen.h should be:
>>
>> #if defined(__x86_64__)
>> #include "xen-x86_64.h"
>> #else
>> #include "xen-x86_32.h"
>> #endif
>>
>> since x32 is almost like x86_64. The only difference from x86_64
>> is sizeof(pointer), which is 32bits.
> 
> Hm, doesn't x32 also align uint64_t to 64 bits (unlike i386 which only aligns it to 32 bits)?
> 
>> Well. Maybe xen support should be disabled entirely on x32.
>> Or maybe x32 should be declared as unsupported entirely.
>> I dunno.
> 
> We rely heavily on the struct layouts being precisely the same, since these are ABI for the Xen guests. Wherever there was some 32/64 compatibility issue — and often where there wasn't — that's why I littered it with those build assertions.
> 
> But while there are enough in there to sanity check the i386 vs. x86_64 ABI differences, I wouldn't swear that I've put in enough checks for x32. So "it builds without hitting an assertion" does not necessarily mean it'll be *correct*. Let's disable it on x32.

Does "(unsigned) long" type mix well with "ABI"?

