Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927C9422065
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:14:48 +0200 (CEST)
Received: from localhost ([::1]:53854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXfb5-00033a-KN
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mXfUH-0004Sc-Jw
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:07:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mXfUB-0003aT-VB
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:07:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633421259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8FE5nZK1UhiBdXaqM+Fam9rAD6Lmt/g3WS3TYUh7qw=;
 b=QFoomKk4c0UFtOYvDXdLdbVZRztA8nGEFYea8uoqFoHzz68U7sNYzex+pFlJG34pFtdrlT
 sSJKO1x1BMkMQFdp0ayOAT8f7d/IgJasKkBr2IS/dDwM0+OUp0DsHxZhcXW1bE4TYNcYNL
 5Mvzi4Jkn7xW8+mRwGKVVcKCydFNlQ4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-521-2j7mmCLEO3W2esXgNz-mNg-1; Tue, 05 Oct 2021 04:07:36 -0400
X-MC-Unique: 2j7mmCLEO3W2esXgNz-mNg-1
Received: by mail-wr1-f69.google.com with SMTP id
 w2-20020a5d5442000000b0016061c95fb7so5440170wrv.12
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 01:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z8FE5nZK1UhiBdXaqM+Fam9rAD6Lmt/g3WS3TYUh7qw=;
 b=dbpxx/rgq+DdIQQ8YLdg4cS7jSWC1VTpI3jwNWRfJlrMiMB81Vlj3AHGJb/gq3gVY9
 Qu/fPGWKOhRK0wP+lvQta7S+6sNrL/VxcxzmDArZqYPcLH0W1EFcLVDTjzGVopTEAHYO
 /V3RqbL46TfdDjAk5SougJ5gcSirCx0OayCRWNPyXyL+nxfIm4o3GHVjEfZOkllnQ/ht
 2ZnbcNlY78VkptXKv8RmeB+egqEAQeAFbE3LlxUNIK/LynwZpE4N/8819rtHvgXvxk8u
 OVbEdWdTC8HuMGcxMEEFBeORhi9hk6PYeKsxvKDs87/XQ7IrK9Jvk7F3h2tuDn4QJYH8
 42+w==
X-Gm-Message-State: AOAM533e76oqJkIP6lb9vHX3K3BrQalzPRurLn+8AFVLEC95FXbNbrlu
 SnpKKmFeTYW744x2kIXi8lyGLBtHgayYkXtGl3ZXqWJzMYBuGcE9vjwIl2xWH5MQ9ovDbT3o/wo
 5iLdBZKz4KnXfYew=
X-Received: by 2002:adf:8b41:: with SMTP id v1mr16444652wra.255.1633421255703; 
 Tue, 05 Oct 2021 01:07:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE4xP+WZeR0QOuMbxUscf9nHB+Lptda9ULkHvHR5FHsnrZ3uY9HgvHeAXPyykxELHa//gJcA==
X-Received: by 2002:adf:8b41:: with SMTP id v1mr16444609wra.255.1633421255401; 
 Tue, 05 Oct 2021 01:07:35 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id 1sm733607wmb.24.2021.10.05.01.07.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 01:07:34 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
To: Alexey Kardashevskiy <aik@ozlabs.ru>,
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
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
Date: Tue, 5 Oct 2021 10:07:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 05/10/2021 10.05, Alexey Kardashevskiy wrote:
> 
> 
> On 05/10/2021 17:42, Thomas Huth wrote:
>> On 05/10/2021 08.18, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 05/10/2021 15:44, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 05/10/2021 à 02:48, David Gibson a écrit :
>>>>> On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
>>>>>> On 01/10/2021 15.04, Christophe Leroy wrote:
>>>>>>>
>>>>>>>
>>>>>>> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>>>>>>>> On 01/10/2021 13.12, Peter Maydell wrote:
>>>>>>>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>>>>> Nevertheless, as long as nobody has a hint where to find that
>>>>>>>>>> ppc405_rom.bin, I think both boards are pretty useless in QEMU (as 
>>>>>>>>>> far as I
>>>>>>>>>> can see, they do not work without the bios at all, so it's
>>>>>>>>>> also not possible
>>>>>>>>>> to use a Linux image with the "-kernel" CLI option directly).
>>>>>>>>>
>>>>>>>>> It is at least in theory possible to run bare-metal code on
>>>>>>>>> either board, by passing either a pflash or a bios argument.
>>>>>>>>
>>>>>>>> True. I did some more research, and seems like there was once
>>>>>>>> support for those boards in u-boot, but it got removed there a
>>>>>>>> couple of years ago already:
>>>>>>>>
>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
>>>>>>>>
>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
>>>>>>>>
>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
>>>>>>>>
>>>>>>>>> But I agree that there seem to be no signs of anybody actually
>>>>>>>>> successfully using these boards for anything, so we should
>>>>>>>>> deprecate-and-delete them.
>>>>>>>>
>>>>>>>> Yes, let's mark them as deprecated now ... if someone still uses
>>>>>>>> them and speaks up, we can still revert the deprecation again.
>>>>>>>
>>>>>>> I really would like to be able to use them to validate Linux Kernel
>>>>>>> changes, hence looking for that missing BIOS.
>>>>>>>
>>>>>>> If we remove ppc405 from QEMU, we won't be able to do any regression
>>>>>>> tests of Linux Kernel on those processors.
>>>>>>
>>>>>> If you/someone managed to compile an old version of u-boot for one of 
>>>>>> these
>>>>>> two boards, so that we would finally have something for regression 
>>>>>> testing,
>>>>>> we can of course also keep the boards in QEMU...
>>>>>
>>>>> I can see that it would be usefor for some cases, but unless someone
>>>>> volunteers to track down the necessary firmware and look after it, I
>>>>> think we do need to deprecate it - I certainly don't have the capacity
>>>>> to look into this.
>>>>>
>>>>
>>>> I will look at it, please allow me a few weeks though.
>>>
>>> Well, building it was not hard but now I'd like to know what board QEMU 
>>> actually emulates, there are way too many codenames and PVRs.
>>>
>>> Here is what I was building:
>>> https://github.com/aik/u-boot/tree/ppc4xx-qemu
>>>
>>> CONFIG_SYS_ARCH="powerpc"
>>> CONFIG_SYS_CPU="ppc4xx"
>>> CONFIG_SYS_VENDOR="esd"
>>> CONFIG_SYS_BOARD="pmc405de"
>>> CONFIG_SYS_CONFIG_NAME="PMC405DE"
>>>
>>> Is this any use?
>>
>> If I've got u-boot commit 98f705c9cefdfdba62c069821bbba10273a0a8
>> right, there used to be SYS_BOARD="405ep" config before that removal, so 
>> that sounds like a promising match for the ref405ep of QEMU?
> 
> Tricky. The board can be 405ep if 
> TARGET_IO/TARGET_DLVISION/TARGET_DLVISION_10G selected. Neither compiles at 
> 98f705c9cefdfdba62c^ due to missing CONFIG_SYS_PCI_PTM1PCI :-/
> 
>>
>> The support for "taihu" even got removed earlier, in u-boot commit 
>> 123b6cd7a4f75536734a7bff97db6eebce614bd1 , and the commit message says 
>> that it did not compile anymore at the end, so you might need to check out 
>> an even older version for that one.
> 
> 
> What is so special about taihu?

taihu is the other 405 board defined in hw/ppc/ppc405_boards.c (which I 
suggested to deprecate now)

  Thomas


