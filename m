Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D28B55261DC
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 14:29:56 +0200 (CEST)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npUQd-0001H2-QJ
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 08:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1npULf-0007Io-11; Fri, 13 May 2022 08:24:47 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:41754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1npULc-0006YO-Vj; Fri, 13 May 2022 08:24:46 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 y14-20020a9d460e000000b00605ee347da1so4820709ote.8; 
 Fri, 13 May 2022 05:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Cmwk+xHBAVq/0M1Z+i4nYNDV0bWUneg8YcoWZPSMpqU=;
 b=YlPSLJurupFH6OWKR9wKV6z7tbnzjbC4uMLqq1pef/lLnKviR6jDL+tq5cvXfblzEB
 Sbn7qZhEtW7DQjgdHCjbu3ws4N1DXrVt01dc+2BuqUiLUlINYKW4Mb+VnkIVFsSCOrXx
 GEbTjERi+sQ4EyejCOzBvo4TqW5tgjJ2dzXdJqrTHVX8TM+73E3b/ejbnSK/aR8gWDqz
 HaydhZBnteWmSDJPTCZluUtKeDAZVprgfBCkPfm257mp8ad5mUwpjDg69pkvIfuCFy9F
 0utByePz4X5LujFL/lwPRSoU/Zy390fa3w5lP4F76jZauSEVS4OwNg4g/QEWHiF1wV7v
 vOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cmwk+xHBAVq/0M1Z+i4nYNDV0bWUneg8YcoWZPSMpqU=;
 b=t218W5+vusBTUAGsJwiRzXkUuT8IstSK8adVyZ2zAnlI2TFLK5HdsiXX90t5ZgzcaZ
 //aTM/alXcjXfu2HCnqujw8GXx4H44D+jF1JEDsXoo05qnfXrMzDx3dtQdl1vMdy2s9Q
 zZCxRqbOlDXzw0mH978nnNdUkn15C5rm76KckyWbVDtQAGT9PrwmvMHd5+mt59UYJtmx
 iAYEqZF0tNOt9+jpOVPWY1fa52lvae0VlK2ZzGpVFqMNGN/zbwXad4Qkyxg9dqGVghzo
 6tiEfNtJLZolGGIXkjngPIWA0bwOQ9EY34E+cCr/QZvXu4nyzbaAAJRt6VtmJKgUvn8k
 DZBw==
X-Gm-Message-State: AOAM532ih7Ke08NgalBLRuf1bWqzZozrcjkZkrXto7XBOwbjiXepmC2B
 dgr2IS65G/361JEEBLdEa/DDos69NbU=
X-Google-Smtp-Source: ABdhPJwQ5LY+FXJ8VWgiOAcPDqfQf9LMGjlVJA4GfxZlQVQd84/euGnuwzzwzHxP6bbxjaJVMuCLKQ==
X-Received: by 2002:a05:6830:1698:b0:605:f508:66a with SMTP id
 k24-20020a056830169800b00605f508066amr1677313otr.63.1652444682903; 
 Fri, 13 May 2022 05:24:42 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:6d99:130b:198b:b4b2:dcf0?
 ([2804:431:c7c7:6d99:130b:198b:b4b2:dcf0])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a4a8409000000b0035eb4e5a6b8sm900800oog.14.2022.05.13.05.24.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 05:24:42 -0700 (PDT)
Message-ID: <b88ee6d5-b99c-a4fe-d7dd-edd4b08f0559@gmail.com>
Date: Fri, 13 May 2022 09:24:40 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH qemu] spapr/docs: Add a few words about x-vof
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>
References: <20220506055124.3822112-1-aik@ozlabs.ru>
 <7008431e-6813-a763-f6fe-30088f1b519b@gmail.com>
 <980eb62c-55e1-d6fc-78da-c4e4e517f30a@ozlabs.ru>
 <65dd09bf-5dec-5f4c-f97b-4dc8e835e795@gmail.com>
 <52b51b16-7624-635a-06a4-0b5f1c0037e7@ozlabs.ru>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <52b51b16-7624-635a-06a4-0b5f1c0037e7@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 5/13/22 04:45, Alexey Kardashevskiy wrote:
> 
> 
> On 5/12/22 23:40, Daniel Henrique Barboza wrote:
>>
>>
>> On 5/12/22 00:10, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 5/12/22 06:42, Daniel Henrique Barboza wrote:
>>>>
>>>>
>>>> On 5/6/22 02:51, Alexey Kardashevskiy wrote:
>>>>> The alternative small firmware needs a few words of what it can and
>>>>> absolutely cannot do; this adds those words.
>>>>>
>>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>> ---
>>>>>   docs/system/ppc/pseries.rst | 28 ++++++++++++++++++++++++++++
>>>>>   1 file changed, 28 insertions(+)
>>>>>
>>>>> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
>>>>> index d9b65ad4e850..4c98a94f9add 100644
>>>>> --- a/docs/system/ppc/pseries.rst
>>>>> +++ b/docs/system/ppc/pseries.rst
>>>>> @@ -32,14 +32,42 @@ Missing devices
>>>>>   Firmware
>>>>>   ========
>>>>> +The pSeries platform in QEMU comes with 2 firmwares:
>>>>> +
>>>>>   `SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
>>>>>   implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
>>>>>   Configuration) Firmware: Core Requirements and Practices
>>>>>   <https://standards.ieee.org/standard/1275-1994.html>`_.
>>>>> +SLOF performs bus scanning, PCI resource allocation, provides the client
>>>>> +interface to boot from block devices and network.
>>>>> +
>>>>>   QEMU includes a prebuilt image of SLOF which is updated when a more recent
>>>>>   version is required.
>>>>> +VOF (Virtual Open Firmware) is a minimalistic firmware to work with
>>>>> +``-machine pseries,x-vof=on``. When enabled, the firmware acts as a slim
>>>>> +shim and QEMU implements parts of the IEEE 1275 Open Firmware interface.
>>>>> +
>>>>> +VOF does not have device drivers, does not do PCI resource allocation and
>>>>> +relies on ``-kernel`` used with Linux kernels recent enough (v5.4+)
>>>>> +to PCI resource assignment. It is ideal to use with petitboot.
>>>>> +
>>>>> +Booting via ``-kernel`` supports the following:
>>>>> ++-------------------+-------------------+------------------+
>>>>> +| kernel            | pseries,x-vof=off | pseries,x-vof=on |
>>>>> ++===================+===================+==================+
>>>>> +| vmlinux BE        |     ✓             |     ✓            |
>>>>> ++-------------------+-------------------+------------------+
>>>>> +| vmlinux LE        |     ✓             |     ✓            |
>>>>> ++-------------------+-------------------+------------------+
>>>>> +| zImage.pseries BE |     x             |     ✓¹           |
>>>>> ++-------------------+-------------------+------------------+
>>>>> +| zImage.pseries LE |     ✓             |     ✓            |
>>>>> ++-------------------+-------------------+------------------+
>>>>
>>>> You need an empty line at the start and at the end of the table. Otherwise it'll
>>>> be rendered as regular text.
>>>
>>> How do you build htmls from these btw?
>>
>> Had to do this yesterday because I changed machines recently. In a Fedora 35
>> system I did this:
>>
>>
>> sudo dnf install python3-sphinx
>> sudo dnf install python-sphinx_rtd_theme-doc
>> pip install sphinx_rtd_theme
> 
> 
> I only needed the last one, compiles htmls now. I was trying to figure out in Makefiles where is that "html" target and I just could not :)
> 
> 
>>
>> (not sure if all steps are needed)
>>
>> Then the generated docs will be under build/docs/manual .
>>
>>
>>>
>>>>
>>>>> +Notes:
>>>>
>>>> I also don't believe you need the "Notes:" addendum here. It's clear that you're
>>>> making an observation about the zImage.pseries BE and x-vof=on case.
>>>
>>> But only this combination needs kernel-addr=0, other images do not need that with SLOF or VOF.
>>
>>
>> I mentioned about the "Notes:" string. We can remove it and leave just the
>>
>> +¹ must set kernel-addr=0
>>
>>
>> Since it's clear that you're making a note about that item in the table.
>>
>>
>>
>>>
>>>
>>>>
>>>> Everything else LGTM. If no one else has any comment, and you're ok with these
>>>> changes I mentioned, I can amend it myself with my R-b.
>>>
>>> I'll probably repost after the other patch with kernel-addr is merged into your tree. Thanks,
>>
>> I already picked it (just waiting some tests to finish). But feel free to
>> send a v2 if you want to play around generating the docs to see how
>> your patch looks like in the finished HTML.
> 
> 
> Nah, the changes you made are fine so I am not planning on posting another version. Thanks for fixing it up.


No problem!


Queued in gitlab.com/danielhb/qemu/tree/ppc-next. Thanks,


Daniel

> 
> 
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>>
>>>
>>>>
>>>>
>>>>
>>>> Thanks,
>>>>
>>>>
>>>> Daniel
>>>>
>>>>
>>>>> +¹ must set kernel-addr=0
>>>>> +
>>>>>   Build directions
>>>>>   ================
>>>
> 

