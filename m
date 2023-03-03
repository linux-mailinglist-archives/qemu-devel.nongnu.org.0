Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096486A978F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:50:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4rb-0006Ix-Hj; Fri, 03 Mar 2023 07:50:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY4rZ-0006IC-1o
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:50:17 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY4rW-00008w-KH
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:50:16 -0500
Received: by mail-wr1-x429.google.com with SMTP id h11so2142843wrm.5
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 04:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677847812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ssztaoREULm8OCU1dCA1/uLiRuuwVyYr5/IqlgnY47c=;
 b=Bn/AM2r8XITJTPL2WyYDLmWzBFqRtn1FT2jHwi+/5LIEAlYAMLfYfdYXy1kQkS2PoL
 re2iLAeU6zRcld5wdvd6WXG8i85mfxZLw/V+fkW/V6Z3gvnEAZdink9WEUfQO71ENXv1
 B5HSzV3ws6t4bqx199WXLBJWcCM11nS8Y4lwTB5tyvsthvFGaCY+MaicwEoGnkdXno3E
 WME9BcaZ5z88muJpMxEPQLFbl3N2ceGFOjhQ+2Y+JEv/0jc3SWvtWMcJt1XnbJth9J6a
 fHVlrC/mwhxUJ+BjK6TLrq/5rMFWz6/NyMF/VhI9He0pkSZbop5R1Ny4GdFqUG6qW6r8
 Boeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677847812;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ssztaoREULm8OCU1dCA1/uLiRuuwVyYr5/IqlgnY47c=;
 b=tzv1owYyb3GinpSCV1+z9V7aw8N22UEciPPeH6VLn+OATBHtXnv9iRjHcG0Hj1gdvI
 kBKi3iqxWb1TnS/djD5SsikJp28JkqnNlEadSAr2PQZ3YhR4MKu904t9kjHrQcNBwRcb
 3FPS9O6OiCDk8Z97rvkcBtGMX78ywsDEXgkN/u4R+YaG3sJPGxs1K98Os5BN8tgId42n
 T7hyLd1sxxhPy21M+l0YdH9SAAh/esWmeM6JxV4x+LL32ebvpa1MlCoXBomisu1USMMd
 XNH9vVWRVW6bexpnQpj3z7Zj8jnHwR40FXMxpFERVoWViBTzbLZw06aL7uq2umYE22wG
 vi3g==
X-Gm-Message-State: AO0yUKUMx0rksg8AnV89IK1rMyCE77HomQmO7d36UkD78yEmN4LblLjT
 loxI1vTqODtIccbLOLzrABAuFQ==
X-Google-Smtp-Source: AK7set8rh//A99FSu07pjdjXhioxLuY+b1rTGF7+mjTMYLSKdbK2g7tnB4MHrb+o+R5e18k4it7Tsw==
X-Received: by 2002:adf:da47:0:b0:2c9:f488:5f54 with SMTP id
 r7-20020adfda47000000b002c9f4885f54mr1140405wrl.57.1677847812539; 
 Fri, 03 Mar 2023 04:50:12 -0800 (PST)
Received: from [192.168.206.175] (7.red-88-28-24.dynamicip.rima-tde.net.
 [88.28.24.7]) by smtp.gmail.com with ESMTPSA id
 ip21-20020a05600ca69500b003eb596cbc54sm2407336wmb.0.2023.03.03.04.50.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 04:50:12 -0800 (PST)
Message-ID: <2e33d6b7-543a-b929-ca23-6102c36d2488@linaro.org>
Date: Fri, 3 Mar 2023 13:50:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 00/18] hw/ide: Untangle ISA/PCI abuses of
 ide_init_ioport()
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>, qemu-ppc@nongnu.org
References: <20230302224058.43315-1-philmd@linaro.org>
 <366B37B3-B601-4405-9D7B-4FF1A6D1B9AF@infradead.org>
 <152836d8-d417-df05-4819-cd3d7756732a@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <152836d8-d417-df05-4819-cd3d7756732a@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 3/3/23 08:46, Mark Cave-Ayland wrote:
> On 03/03/2023 06:58, David Woodhouse wrote:
> 
>> On 2 March 2023 22:40:40 GMT, "Philippe Mathieu-Daudé" 
>> <philmd@linaro.org> wrote:
>>> Since v2: rebased
>>>
>>> I'm posting this series as it to not block Bernhard's PIIX
>>> cleanup work. I don't have code change planned, but eventually
>>> reword / improve commit descriptions.
>>>
>>> Tested commit after commit to be sure it is bisectable. Sadly
>>> this was before Zoltan & Thomas report a problem with commit
>>> bb98e0f59c ("hw/isa/vt82c686: Remove intermediate IRQ forwarder").
>>
>> However much I stare at the partial revert which fixes it, I just 
>> cannot believe that the change could make any difference at all. 
>> There's got to be something weird going on there.
>>
>> I was going to ask if the level mode for the PIT made any difference, 
>> but this is the output IRQ from the PIT to the CPU itself so I don't 
>> see how it would.
>>
>> Would like to see a report with tracing from pic_update_irq, the CPU 
>> interrupt "handler" and the intermediate IRQ handler. With the 
>> intermediate present and without it. To compare the two.
> 
> I suspect it's related to the removal of the allocation of the qemu_irq: 
> qdev gpios work by adding a child IRQ object to the device, so it could 
> be possible that something in the gpio internals isn't being updated 
> correctly when the value is overwritten directly.
> 
> Is the problem picked up when running a binary built with 
> --enable-sanitizers? That's normally quite good at detecting this kind 
> of issue.

No ASan warning. However I see (before/after bb98e0f59c):

qemu-system-ppc: pc87312: unsupported device reconfiguration (0f 11 00)
qemu-system-ppc: pc87312: unsupported device reconfiguration (0f 11 84)
qemu-system-ppc: pc87312: unsupported device reconfiguration (09 01 84)


