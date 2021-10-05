Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B62421EF6
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 08:44:07 +0200 (CEST)
Received: from localhost ([::1]:53808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXeBK-0000Yn-1r
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 02:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mXe9t-000875-VT
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:42:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mXe9p-0007eI-OG
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633416152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OpknrH6s6+VFD6Si2Jcd9ToOvb5QaIEbfuJXFEMdOOY=;
 b=FUgyPH9OHVXBTKyAslsRnxzIpnFqsVTkzd7wqRMXNJb6235FosHr0vWC+kZ3zKtfCIubo2
 h/V06nSqcuiyJO2khEw4WbfqrhyWA6VQ5RT43MUr1jLi8WNYAqYudftYQTpXY9Oy8GktU3
 zdiyLY3PMWyiNd/hDnUej3Il11p3mpE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-ee1IV3ZrP0W5SSznfhwXPA-1; Tue, 05 Oct 2021 02:42:29 -0400
X-MC-Unique: ee1IV3ZrP0W5SSznfhwXPA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m9-20020a05600c4f4900b003057c761567so880121wmq.1
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 23:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OpknrH6s6+VFD6Si2Jcd9ToOvb5QaIEbfuJXFEMdOOY=;
 b=a8Fi00tmXKDkUZWd16qDHTggEw8xgciHx2P5EjYbare9Ps1AHIm2SVgmWMDEWmltU7
 +Q7J1OcUU0gQQ/+dJ8JVtFt4DoQomqN3ICkQAsVA2D3HfT8m4BKBZB2yoEyNj6qHRhn5
 RmigX7gvnqQ6bFL8aF4FyiaKvYfjQmsjq3Z1eVw+Fg7nreaFH0f1DgZWzrfs3KPexq15
 uFhKG+EAGANS1RmkImq+xLY+mVCUmfLMSSxBjN26GEqGDm/InjKFSnf//23TaWtGUSZH
 Ra0CnHR3NZyRK9nxX6Uz09kDBA/dnF6NcUxRvtyDnDL7smrTQ+J1MVyk0T/m9x9TOAGz
 RqOA==
X-Gm-Message-State: AOAM532xc3O+pvGgNzuWYAchMUy+dDklnStX0MbP3mRVPODcL4FfflyZ
 B0n38Ww1NXq+qszOoZNt4uKjdNnX/WOdtLHR8zVQbTou8yDtLOcIZN+x6ir+MD+4eulT4SU7wKx
 i2lBMbLPCyQO5JPw=
X-Received: by 2002:a05:600c:3784:: with SMTP id
 o4mr1602801wmr.180.1633416148662; 
 Mon, 04 Oct 2021 23:42:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYG7vcErfjh/E5EKo2OT+NXSj94Xp1KCIgJrl1NVUgu/GqCL/NU3lqt9h8z8VRHx1xnxoZsA==
X-Received: by 2002:a05:600c:3784:: with SMTP id
 o4mr1602777wmr.180.1633416148358; 
 Mon, 04 Oct 2021 23:42:28 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id z79sm804100wmc.17.2021.10.04.23.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 23:42:27 -0700 (PDT)
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
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Message-ID: <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
Date: Tue, 5 Oct 2021 08:42:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 05/10/2021 08.18, Alexey Kardashevskiy wrote:
> 
> 
> On 05/10/2021 15:44, Christophe Leroy wrote:
>>
>>
>> Le 05/10/2021 à 02:48, David Gibson a écrit :
>>> On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
>>>> On 01/10/2021 15.04, Christophe Leroy wrote:
>>>>>
>>>>>
>>>>> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>>>>>> On 01/10/2021 13.12, Peter Maydell wrote:
>>>>>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>>> Nevertheless, as long as nobody has a hint where to find that
>>>>>>>> ppc405_rom.bin, I think both boards are pretty useless in QEMU (as 
>>>>>>>> far as I
>>>>>>>> can see, they do not work without the bios at all, so it's
>>>>>>>> also not possible
>>>>>>>> to use a Linux image with the "-kernel" CLI option directly).
>>>>>>>
>>>>>>> It is at least in theory possible to run bare-metal code on
>>>>>>> either board, by passing either a pflash or a bios argument.
>>>>>>
>>>>>> True. I did some more research, and seems like there was once
>>>>>> support for those boards in u-boot, but it got removed there a
>>>>>> couple of years ago already:
>>>>>>
>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
>>>>>>
>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
>>>>>>
>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
>>>>>>
>>>>>>> But I agree that there seem to be no signs of anybody actually
>>>>>>> successfully using these boards for anything, so we should
>>>>>>> deprecate-and-delete them.
>>>>>>
>>>>>> Yes, let's mark them as deprecated now ... if someone still uses
>>>>>> them and speaks up, we can still revert the deprecation again.
>>>>>
>>>>> I really would like to be able to use them to validate Linux Kernel
>>>>> changes, hence looking for that missing BIOS.
>>>>>
>>>>> If we remove ppc405 from QEMU, we won't be able to do any regression
>>>>> tests of Linux Kernel on those processors.
>>>>
>>>> If you/someone managed to compile an old version of u-boot for one of these
>>>> two boards, so that we would finally have something for regression testing,
>>>> we can of course also keep the boards in QEMU...
>>>
>>> I can see that it would be usefor for some cases, but unless someone
>>> volunteers to track down the necessary firmware and look after it, I
>>> think we do need to deprecate it - I certainly don't have the capacity
>>> to look into this.
>>>
>>
>> I will look at it, please allow me a few weeks though.
> 
> Well, building it was not hard but now I'd like to know what board QEMU 
> actually emulates, there are way too many codenames and PVRs.
> 
> Here is what I was building:
> https://github.com/aik/u-boot/tree/ppc4xx-qemu
> 
> CONFIG_SYS_ARCH="powerpc"
> CONFIG_SYS_CPU="ppc4xx"
> CONFIG_SYS_VENDOR="esd"
> CONFIG_SYS_BOARD="pmc405de"
> CONFIG_SYS_CONFIG_NAME="PMC405DE"
> 
> Is this any use?

If I've got u-boot commit 98f705c9cefdfdba62c069821bbba10273a0a8
right, there used to be SYS_BOARD="405ep" config before that removal, so 
that sounds like a promising match for the ref405ep of QEMU?

The support for "taihu" even got removed earlier, in u-boot commit 
123b6cd7a4f75536734a7bff97db6eebce614bd1 , and the commit message says that 
it did not compile anymore at the end, so you might need to check out an 
even older version for that one.

  Thomas



