Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42986422043
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:11:37 +0200 (CEST)
Received: from localhost ([::1]:45454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfY0-0005LB-97
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:11:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1mXfRz-0002EL-0u
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:05:23 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1mXfRw-0001Xq-F9
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:05:22 -0400
Received: by mail-pl1-x630.google.com with SMTP id t11so1757977plq.11
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 01:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nOS1Tao45cDG8oA/2ggaSEGwK1BHfDxY8faAp0sboFM=;
 b=SY8MZ3pHSOV5GY5A+HigGD9HTnTK7fM71husohUFaXfrJLmJzufaJmnlpuP/67jlB+
 2T3MR/5Kh/UO+OR1bIbgPnPoMdVQkdHB8kHCjgI04EhactxNL3qSvb0Bh6LlRCGHC5cK
 cvLpS0hxOpUg1q5DbFCNLNIWilFczgHwCVysnyXj5OkPoxVd7X1hXAB63Wr31mYZctzx
 gxqGuqNIB6zuXBkeQadfgwNvI8y5dF6RUIMhvg8qeQYRKG7DM5Tu2aEUdUri0TT289wb
 Xe3mE+ONM5dH9jAvsmlWTET/wyqcoq5tP3aw0/39zcDrYJd9s5JOg8BiyhyQcQaChpu4
 fLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nOS1Tao45cDG8oA/2ggaSEGwK1BHfDxY8faAp0sboFM=;
 b=CYPzE3tH5dChrTiNQzG/iGr8vjVU/LXmNLCYzDhtNZTMBNujHmGmYHUfRuJZYCNXNf
 u/Mu68SNGVo8Lh/tNTgn+uErp3JQXxz6TZsTFFl/O0dVNcdrG0hnCuYnzASsIX0D4O/X
 5XDvLIPL6GWkvEh5PtzCikDOF0ZYUlb3MtfYJsu9O+DZrpmxm2MvDvldrHbe2h6TmRWO
 Pa9Rv++pKmMFQksY4N5gVGHwBAPCkKDojrIFIfscoJk1V0QutzQYUavZz3xRYp9iQLGE
 N7qgRkGjfDXJ0MNdBtR4JDPrV0pkAR3P+T9kdqOW6x5lwMNpcwDLjJRT9xjWBdHT7Gzf
 KHTg==
X-Gm-Message-State: AOAM530UwyYqYlIFv5XX7/oMc0AweTGlAvn5Pbi/s4iZ2rTLD/TyOY3H
 f9ATtSSVt2pPCFBAH8d91tNPiA==
X-Google-Smtp-Source: ABdhPJzt1uuPL9lSC2wvyP1Tmx81bQWhdMQbuoPKAQqYR7T2FdU0YAunyMGQQoj7h4BsIXPv+VbDRA==
X-Received: by 2002:a17:90a:9909:: with SMTP id
 b9mr2170355pjp.55.1633421116955; 
 Tue, 05 Oct 2021 01:05:16 -0700 (PDT)
Received: from [192.168.10.153] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id mj2sm1301069pjb.18.2021.10.05.01.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 01:05:16 -0700 (PDT)
Message-ID: <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
Date: Tue, 5 Oct 2021 19:05:08 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=aik@ozlabs.ru; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 05/10/2021 17:42, Thomas Huth wrote:
> On 05/10/2021 08.18, Alexey Kardashevskiy wrote:
>>
>>
>> On 05/10/2021 15:44, Christophe Leroy wrote:
>>>
>>>
>>> Le 05/10/2021 à 02:48, David Gibson a écrit :
>>>> On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
>>>>> On 01/10/2021 15.04, Christophe Leroy wrote:
>>>>>>
>>>>>>
>>>>>> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>>>>>>> On 01/10/2021 13.12, Peter Maydell wrote:
>>>>>>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>>>> Nevertheless, as long as nobody has a hint where to find that
>>>>>>>>> ppc405_rom.bin, I think both boards are pretty useless in QEMU 
>>>>>>>>> (as far as I
>>>>>>>>> can see, they do not work without the bios at all, so it's
>>>>>>>>> also not possible
>>>>>>>>> to use a Linux image with the "-kernel" CLI option directly).
>>>>>>>>
>>>>>>>> It is at least in theory possible to run bare-metal code on
>>>>>>>> either board, by passing either a pflash or a bios argument.
>>>>>>>
>>>>>>> True. I did some more research, and seems like there was once
>>>>>>> support for those boards in u-boot, but it got removed there a
>>>>>>> couple of years ago already:
>>>>>>>
>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
>>>>>>>
>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
>>>>>>>
>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
>>>>>>>
>>>>>>>> But I agree that there seem to be no signs of anybody actually
>>>>>>>> successfully using these boards for anything, so we should
>>>>>>>> deprecate-and-delete them.
>>>>>>>
>>>>>>> Yes, let's mark them as deprecated now ... if someone still uses
>>>>>>> them and speaks up, we can still revert the deprecation again.
>>>>>>
>>>>>> I really would like to be able to use them to validate Linux Kernel
>>>>>> changes, hence looking for that missing BIOS.
>>>>>>
>>>>>> If we remove ppc405 from QEMU, we won't be able to do any regression
>>>>>> tests of Linux Kernel on those processors.
>>>>>
>>>>> If you/someone managed to compile an old version of u-boot for one 
>>>>> of these
>>>>> two boards, so that we would finally have something for regression 
>>>>> testing,
>>>>> we can of course also keep the boards in QEMU...
>>>>
>>>> I can see that it would be usefor for some cases, but unless someone
>>>> volunteers to track down the necessary firmware and look after it, I
>>>> think we do need to deprecate it - I certainly don't have the capacity
>>>> to look into this.
>>>>
>>>
>>> I will look at it, please allow me a few weeks though.
>>
>> Well, building it was not hard but now I'd like to know what board 
>> QEMU actually emulates, there are way too many codenames and PVRs.
>>
>> Here is what I was building:
>> https://github.com/aik/u-boot/tree/ppc4xx-qemu
>>
>> CONFIG_SYS_ARCH="powerpc"
>> CONFIG_SYS_CPU="ppc4xx"
>> CONFIG_SYS_VENDOR="esd"
>> CONFIG_SYS_BOARD="pmc405de"
>> CONFIG_SYS_CONFIG_NAME="PMC405DE"
>>
>> Is this any use?
> 
> If I've got u-boot commit 98f705c9cefdfdba62c069821bbba10273a0a8
> right, there used to be SYS_BOARD="405ep" config before that removal, so 
> that sounds like a promising match for the ref405ep of QEMU?

Tricky. The board can be 405ep if 
TARGET_IO/TARGET_DLVISION/TARGET_DLVISION_10G selected. Neither compiles 
at 98f705c9cefdfdba62c^ due to missing CONFIG_SYS_PCI_PTM1PCI :-/

> 
> The support for "taihu" even got removed earlier, in u-boot commit 
> 123b6cd7a4f75536734a7bff97db6eebce614bd1 , and the commit message says 
> that it did not compile anymore at the end, so you might need to check 
> out an even older version for that one.


What is so special about taihu?



-- 
Alexey

