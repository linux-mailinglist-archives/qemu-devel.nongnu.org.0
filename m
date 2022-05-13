Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BBA525CA7
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 09:59:58 +0200 (CEST)
Received: from localhost ([::1]:59642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npQDN-0003kN-Kc
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 03:59:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1npPzp-00030b-Cq
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:45:57 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:33812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1npPzm-0003UT-2Y
 for qemu-devel@nongnu.org; Fri, 13 May 2022 03:45:56 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so7378231pjb.1
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 00:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PI+K08lmFNbjNUYa2axTfPxSopzatM33FbuIfhDameg=;
 b=ifHBtkNDpDvBNaez2AAE0R9ypMnPyRIjQXIp9oUHiUjQlmfa4J5wSlL6fk4Of30zmD
 40NfidrV7rU+THqxfczTM5sKf5iT5alP0ha6ttAlM2fYfqKHKPVMcdLmhdEl6+WW9nSB
 RV/cKeBOCsm9Hym1k5/HhQqElnL64HlyMimdulORUOhRrSE/NhxBnRWCnp/lDkxOLnr2
 kKkWkUOW/V8czI3q2YAbbpIHDk3ZmOJ6+NU//t0+Zh09r1BFgO9//Zqg2DfJTwundxA6
 YSBtb5Ue0GHm4NfDSZnSEK9medgMbTZv0w+yWBjUzR++SArXmWzsJXBJ6QUn6GCm6zry
 5QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PI+K08lmFNbjNUYa2axTfPxSopzatM33FbuIfhDameg=;
 b=kmbhp3UlZM4wzoEu9NRVYfP4MpeUGyqHgdABKMPpo341cp0O8KQLASH87X9Wo5b6cc
 Q4QV/sIMCeS6tKzDQ+r5+4aKeXyAVes8gggcQQI3s3EIfwp/3mFFWvZz74S3hjWbuh+N
 YcYj5NCt0f2tilrPKX+S1PsSuIdYWriNcp8ljpBoksWGpbKwvKtORl+GjuAMSDSv2evw
 wLfh8qUxBS2DVrU2DQ7Sd7GJxbI9ftrGIX+Jo9FcqKp16de65zDkWtvr8N9IE7NQuN1s
 n/lO88Wk2meVIGONVqf+IRWSx6oe96g8lCTSnZkdsdayRgCULtlLHWZD8jYAaI1Raiqt
 ZL6A==
X-Gm-Message-State: AOAM532bfLx1wVO9koqkWT2vt9cITlACWMapDIrBpxFgKfK/rV89K2Tg
 FUFoFsO4+2qCGsPatKdF9MqcHw==
X-Google-Smtp-Source: ABdhPJxImp63W5HzAuRQaSmLKJ3bnAuYbfkw2mmL/mmRvy0e4QyonIo3qNapI1Y95SzIw/MCFShtGw==
X-Received: by 2002:a17:90a:9109:b0:1cb:a814:8947 with SMTP id
 k9-20020a17090a910900b001cba8148947mr14619051pjo.52.1652427950873; 
 Fri, 13 May 2022 00:45:50 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 x12-20020a62860c000000b0050dc7628198sm1061751pfd.114.2022.05.13.00.45.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 00:45:50 -0700 (PDT)
Message-ID: <52b51b16-7624-635a-06a4-0b5f1c0037e7@ozlabs.ru>
Date: Fri, 13 May 2022 17:45:46 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [RFC PATCH qemu] spapr/docs: Add a few words about x-vof
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
References: <20220506055124.3822112-1-aik@ozlabs.ru>
 <7008431e-6813-a763-f6fe-30088f1b519b@gmail.com>
 <980eb62c-55e1-d6fc-78da-c4e4e517f30a@ozlabs.ru>
 <65dd09bf-5dec-5f4c-f97b-4dc8e835e795@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <65dd09bf-5dec-5f4c-f97b-4dc8e835e795@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 5/12/22 23:40, Daniel Henrique Barboza wrote:
> 
> 
> On 5/12/22 00:10, Alexey Kardashevskiy wrote:
>>
>>
>> On 5/12/22 06:42, Daniel Henrique Barboza wrote:
>>>
>>>
>>> On 5/6/22 02:51, Alexey Kardashevskiy wrote:
>>>> The alternative small firmware needs a few words of what it can and
>>>> absolutely cannot do; this adds those words.
>>>>
>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>> ---
>>>>   docs/system/ppc/pseries.rst | 28 ++++++++++++++++++++++++++++
>>>>   1 file changed, 28 insertions(+)
>>>>
>>>> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
>>>> index d9b65ad4e850..4c98a94f9add 100644
>>>> --- a/docs/system/ppc/pseries.rst
>>>> +++ b/docs/system/ppc/pseries.rst
>>>> @@ -32,14 +32,42 @@ Missing devices
>>>>   Firmware
>>>>   ========
>>>> +The pSeries platform in QEMU comes with 2 firmwares:
>>>> +
>>>>   `SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
>>>>   implementation of the `IEEE 1275-1994, Standard for Boot 
>>>> (Initialization
>>>>   Configuration) Firmware: Core Requirements and Practices
>>>>   <https://standards.ieee.org/standard/1275-1994.html>`_.
>>>> +SLOF performs bus scanning, PCI resource allocation, provides the 
>>>> client
>>>> +interface to boot from block devices and network.
>>>> +
>>>>   QEMU includes a prebuilt image of SLOF which is updated when a 
>>>> more recent
>>>>   version is required.
>>>> +VOF (Virtual Open Firmware) is a minimalistic firmware to work with
>>>> +``-machine pseries,x-vof=on``. When enabled, the firmware acts as a 
>>>> slim
>>>> +shim and QEMU implements parts of the IEEE 1275 Open Firmware 
>>>> interface.
>>>> +
>>>> +VOF does not have device drivers, does not do PCI resource 
>>>> allocation and
>>>> +relies on ``-kernel`` used with Linux kernels recent enough (v5.4+)
>>>> +to PCI resource assignment. It is ideal to use with petitboot.
>>>> +
>>>> +Booting via ``-kernel`` supports the following:
>>>> ++-------------------+-------------------+------------------+
>>>> +| kernel            | pseries,x-vof=off | pseries,x-vof=on |
>>>> ++===================+===================+==================+
>>>> +| vmlinux BE        |     ✓             |     ✓            |
>>>> ++-------------------+-------------------+------------------+
>>>> +| vmlinux LE        |     ✓             |     ✓            |
>>>> ++-------------------+-------------------+------------------+
>>>> +| zImage.pseries BE |     x             |     ✓¹           |
>>>> ++-------------------+-------------------+------------------+
>>>> +| zImage.pseries LE |     ✓             |     ✓            |
>>>> ++-------------------+-------------------+------------------+
>>>
>>> You need an empty line at the start and at the end of the table. 
>>> Otherwise it'll
>>> be rendered as regular text.
>>
>> How do you build htmls from these btw?
> 
> Had to do this yesterday because I changed machines recently. In a 
> Fedora 35
> system I did this:
> 
> 
> sudo dnf install python3-sphinx
> sudo dnf install python-sphinx_rtd_theme-doc
> pip install sphinx_rtd_theme


I only needed the last one, compiles htmls now. I was trying to figure 
out in Makefiles where is that "html" target and I just could not :)


> 
> (not sure if all steps are needed)
> 
> Then the generated docs will be under build/docs/manual .
> 
> 
>>
>>>
>>>> +Notes:
>>>
>>> I also don't believe you need the "Notes:" addendum here. It's clear 
>>> that you're
>>> making an observation about the zImage.pseries BE and x-vof=on case.
>>
>> But only this combination needs kernel-addr=0, other images do not 
>> need that with SLOF or VOF.
> 
> 
> I mentioned about the "Notes:" string. We can remove it and leave just the
> 
> +¹ must set kernel-addr=0
> 
> 
> Since it's clear that you're making a note about that item in the table.
> 
> 
> 
>>
>>
>>>
>>> Everything else LGTM. If no one else has any comment, and you're ok 
>>> with these
>>> changes I mentioned, I can amend it myself with my R-b.
>>
>> I'll probably repost after the other patch with kernel-addr is merged 
>> into your tree. Thanks,
> 
> I already picked it (just waiting some tests to finish). But feel free to
> send a v2 if you want to play around generating the docs to see how
> your patch looks like in the finished HTML.


Nah, the changes you made are fine so I am not planning on posting 
another version. Thanks for fixing it up.


> 
> 
> Thanks,
> 
> 
> Daniel
> 
>>
>>
>>>
>>>
>>>
>>> Thanks,
>>>
>>>
>>> Daniel
>>>
>>>
>>>> +¹ must set kernel-addr=0
>>>> +
>>>>   Build directions
>>>>   ================
>>

-- 
Alexey

