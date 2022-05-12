Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B573524E79
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 15:42:38 +0200 (CEST)
Received: from localhost ([::1]:44422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1np95R-00064M-0e
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 09:42:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1np934-0004Qt-T7; Thu, 12 May 2022 09:40:10 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:45987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1np932-0001Qa-Nz; Thu, 12 May 2022 09:40:10 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-e93bbb54f9so6606744fac.12; 
 Thu, 12 May 2022 06:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=B/t/Lbj4mfDpA/GnpQYAbyQf1d9qR7xNbEXaA4IyPwY=;
 b=Bm4U+5sfaROmKawfxlbtw5yVP1tgqiSrjciTO7ASKz9Eo5e8n7fVhnGAK/lNcPtDTQ
 fX320HQfpUH5y53FiaoOh+MvACiVMnzAnCuikkcofQihGgggnjiTDZnmND/Mb8sBF06m
 70pBrTog/k0XyTSgwD6UpGQB2l7ii4dMMDoXkGKUyks/QsR3PvaYiCPn1oDUT9oda5Yo
 zm9P19O2uf4C2okdKKJ6Z94QJx8sfCa7dsLa+I275W0hsdw3hf7nPOIfmOF/CQopYpOp
 zX1yA0sgAQqWhbzyKKCYqDAfVXTctGpTqJ19GK32gZK+0AhAaeUhe/Z/0O+O1is7HjmI
 lMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B/t/Lbj4mfDpA/GnpQYAbyQf1d9qR7xNbEXaA4IyPwY=;
 b=NAWhpjtQBJj6y3bgWOWvJwxy3YHGkbGQmblfQrvcNqLcSNg0BHYpGNh0cDYi3o1ESw
 giDqJBgnCJzQIOyJV1bHv0nHp4bSj9cRf7Zo3ek2kDQ53wZW4/Ki9toz5gVQTF9PHVTn
 WI9HMPbcSwnN48DkVXfqFpXWmkmCoa+XqYcyYQE8qnrYdneOCy2gxBTx6BITWg5b/j+M
 8aV0AwcnatH87Oo3eHNrGgZ586Y8rbh9bwjhjMcY0+9XCRaUTrd+HSMT0xvIBoy9aWqh
 fQGf7cf9ziJ5oKkdoRAvHJnDaxdwEApNUm2SsN4KrarNTIbXdJ/aHZx1LrqKBu3nNEKf
 TRog==
X-Gm-Message-State: AOAM5305oFp1nIpPfEvmHHhTwbgfy1sQUJxTMUn6SE3pWJLsxz2FFe89
 zlNpDCeDplsKcl4Sb7kFCxyWp+icSJw=
X-Google-Smtp-Source: ABdhPJxRbJxL7dcrLTwXcaHXMJQebmOhLXx+hVSGVGaUzH9tFXqmq+p13OiclgtQHT3FWkN0WFsQPg==
X-Received: by 2002:a05:6870:f143:b0:e6:6c21:3593 with SMTP id
 l3-20020a056870f14300b000e66c213593mr5770927oac.55.1652362806856; 
 Thu, 12 May 2022 06:40:06 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c7:6d99:130b:198b:b4b2:dcf0?
 ([2804:431:c7c7:6d99:130b:198b:b4b2:dcf0])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a9d0389000000b006060322126fsm1840871otf.63.2022.05.12.06.40.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 06:40:06 -0700 (PDT)
Message-ID: <65dd09bf-5dec-5f4c-f97b-4dc8e835e795@gmail.com>
Date: Thu, 12 May 2022 10:40:03 -0300
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
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <980eb62c-55e1-d6fc-78da-c4e4e517f30a@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2b.google.com
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



On 5/12/22 00:10, Alexey Kardashevskiy wrote:
> 
> 
> On 5/12/22 06:42, Daniel Henrique Barboza wrote:
>>
>>
>> On 5/6/22 02:51, Alexey Kardashevskiy wrote:
>>> The alternative small firmware needs a few words of what it can and
>>> absolutely cannot do; this adds those words.
>>>
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>>   docs/system/ppc/pseries.rst | 28 ++++++++++++++++++++++++++++
>>>   1 file changed, 28 insertions(+)
>>>
>>> diff --git a/docs/system/ppc/pseries.rst b/docs/system/ppc/pseries.rst
>>> index d9b65ad4e850..4c98a94f9add 100644
>>> --- a/docs/system/ppc/pseries.rst
>>> +++ b/docs/system/ppc/pseries.rst
>>> @@ -32,14 +32,42 @@ Missing devices
>>>   Firmware
>>>   ========
>>> +The pSeries platform in QEMU comes with 2 firmwares:
>>> +
>>>   `SLOF <https://github.com/aik/SLOF>`_ (Slimline Open Firmware) is an
>>>   implementation of the `IEEE 1275-1994, Standard for Boot (Initialization
>>>   Configuration) Firmware: Core Requirements and Practices
>>>   <https://standards.ieee.org/standard/1275-1994.html>`_.
>>> +SLOF performs bus scanning, PCI resource allocation, provides the client
>>> +interface to boot from block devices and network.
>>> +
>>>   QEMU includes a prebuilt image of SLOF which is updated when a more recent
>>>   version is required.
>>> +VOF (Virtual Open Firmware) is a minimalistic firmware to work with
>>> +``-machine pseries,x-vof=on``. When enabled, the firmware acts as a slim
>>> +shim and QEMU implements parts of the IEEE 1275 Open Firmware interface.
>>> +
>>> +VOF does not have device drivers, does not do PCI resource allocation and
>>> +relies on ``-kernel`` used with Linux kernels recent enough (v5.4+)
>>> +to PCI resource assignment. It is ideal to use with petitboot.
>>> +
>>> +Booting via ``-kernel`` supports the following:
>>> ++-------------------+-------------------+------------------+
>>> +| kernel            | pseries,x-vof=off | pseries,x-vof=on |
>>> ++===================+===================+==================+
>>> +| vmlinux BE        |     ✓             |     ✓            |
>>> ++-------------------+-------------------+------------------+
>>> +| vmlinux LE        |     ✓             |     ✓            |
>>> ++-------------------+-------------------+------------------+
>>> +| zImage.pseries BE |     x             |     ✓¹           |
>>> ++-------------------+-------------------+------------------+
>>> +| zImage.pseries LE |     ✓             |     ✓            |
>>> ++-------------------+-------------------+------------------+
>>
>> You need an empty line at the start and at the end of the table. Otherwise it'll
>> be rendered as regular text.
> 
> How do you build htmls from these btw?

Had to do this yesterday because I changed machines recently. In a Fedora 35
system I did this:


sudo dnf install python3-sphinx
sudo dnf install python-sphinx_rtd_theme-doc
pip install sphinx_rtd_theme

(not sure if all steps are needed)

Then the generated docs will be under build/docs/manual .


> 
>>
>>> +Notes:
>>
>> I also don't believe you need the "Notes:" addendum here. It's clear that you're
>> making an observation about the zImage.pseries BE and x-vof=on case.
> 
> But only this combination needs kernel-addr=0, other images do not need that with SLOF or VOF.


I mentioned about the "Notes:" string. We can remove it and leave just the

+¹ must set kernel-addr=0


Since it's clear that you're making a note about that item in the table.



> 
> 
>>
>> Everything else LGTM. If no one else has any comment, and you're ok with these
>> changes I mentioned, I can amend it myself with my R-b.
> 
> I'll probably repost after the other patch with kernel-addr is merged into your tree. Thanks,

I already picked it (just waiting some tests to finish). But feel free to
send a v2 if you want to play around generating the docs to see how
your patch looks like in the finished HTML.


Thanks,


Daniel

> 
> 
>>
>>
>>
>> Thanks,
>>
>>
>> Daniel
>>
>>
>>> +¹ must set kernel-addr=0
>>> +
>>>   Build directions
>>>   ================
> 

