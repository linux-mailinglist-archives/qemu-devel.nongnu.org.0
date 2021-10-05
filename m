Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A4B421EC9
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 08:19:55 +0200 (CEST)
Received: from localhost ([::1]:35456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXdnu-00042M-3w
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 02:19:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1mXdmO-00036w-8S
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:18:20 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:37846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>) id 1mXdmK-0004v6-VT
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 02:18:20 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 oa6-20020a17090b1bc600b0019ffc4b9c51so1116232pjb.2
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 23:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2cc+ShbfnKkyyIq3o6SDEadSboZpuJvM7mmzDfr1Hp8=;
 b=zYJaet/eWarU+hv9KdCv5Vk1bRJhvN7yw771dt4V9GmfuyPbT+qOMg3zmZXkuZLgM1
 9q1RdUzTz9GJcFH7aGAqs0ZNMbdKCWuWwf2ialujMffzA5erHcCz7TWxDktkxFqrecXt
 QZ2Yksu9h/IPmSTQE3/s3Er4T26XejJap8L8vdyODkLYL41R4+a5eUX7yBUMzyKFUXer
 A7BVNkTg1e0Ra6hWW2EIBIgrRGuiiBeLUa8SeZ3Y2JJDdmW1YYnj0dEOvBQCCbcZlHhT
 09AkK8lmW/Ne0p4PI9zoJsB8J5RJ9yVLDMnpEDAOKsPbXzT86PD3ipsykFFUJ6kX8UFh
 p2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2cc+ShbfnKkyyIq3o6SDEadSboZpuJvM7mmzDfr1Hp8=;
 b=YkiXlbCENDw3hySn2TAcFMxiG0+RvSVjye7KS8KyV3noJisEigRXIdo1eUc6sb/tv9
 2kAlw2zmsWjnvHPPFlDdgLujDvYYvxKyNckcecE+xPyLepDyR3RTKItzN4ouYPGXROCQ
 /ElYpgVSxpKLaZHpIM/tme9AKEDz9PS0PxIoXlhMHyaEdj59JRNfTwdR+TG2NhqM7uQz
 5MVIHHHBihnaSwHvOtpQ8GuC6JEOhf/zB06hNtz/iXfyMH3cNb2PgHR0CNDTlhg7ZCnl
 veMGvrqN9w//Fc7pL2RXqLxT8UeEqDBM+sLfugvvLsXaxSiIlW5cT43I2HR5KAJDKdp0
 l76w==
X-Gm-Message-State: AOAM532eKFt7vRv5YdiwSyqRjsVwwoI9R1MtgPgR/BwYkJXaDZHfcBzW
 dCqEMWeWe4bTZ8hPLPDEHOxoVw==
X-Google-Smtp-Source: ABdhPJzOjMYvtvDjE7dUq+kacyc7XZCKN+JaPS726Pvw7oBWy/T0c/4Zlv1ZGamfVRLkkmkO9ThRxQ==
X-Received: by 2002:a17:902:8495:b0:13e:6a01:f5fb with SMTP id
 c21-20020a170902849500b0013e6a01f5fbmr3590635plo.61.1633414693760; 
 Mon, 04 Oct 2021 23:18:13 -0700 (PDT)
Received: from [192.168.10.153] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id x20sm799827pjp.48.2021.10.04.23.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 23:18:13 -0700 (PDT)
Message-ID: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
Date: Tue, 5 Oct 2021 17:18:05 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:93.0) Gecko/20100101
 Thunderbird/93.0
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>
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
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=aik@ozlabs.ru; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 05/10/2021 15:44, Christophe Leroy wrote:
> 
> 
> Le 05/10/2021 à 02:48, David Gibson a écrit :
>> On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
>>> On 01/10/2021 15.04, Christophe Leroy wrote:
>>>>
>>>>
>>>> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>>>>> On 01/10/2021 13.12, Peter Maydell wrote:
>>>>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com> wrote:
>>>>>>> Nevertheless, as long as nobody has a hint where to find that
>>>>>>> ppc405_rom.bin, I think both boards are pretty useless in QEMU 
>>>>>>> (as far as I
>>>>>>> can see, they do not work without the bios at all, so it's
>>>>>>> also not possible
>>>>>>> to use a Linux image with the "-kernel" CLI option directly).
>>>>>>
>>>>>> It is at least in theory possible to run bare-metal code on
>>>>>> either board, by passing either a pflash or a bios argument.
>>>>>
>>>>> True. I did some more research, and seems like there was once
>>>>> support for those boards in u-boot, but it got removed there a
>>>>> couple of years ago already:
>>>>>
>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf
>>>>>
>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b
>>>>>
>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37
>>>>>
>>>>>> But I agree that there seem to be no signs of anybody actually
>>>>>> successfully using these boards for anything, so we should
>>>>>> deprecate-and-delete them.
>>>>>
>>>>> Yes, let's mark them as deprecated now ... if someone still uses
>>>>> them and speaks up, we can still revert the deprecation again.
>>>>
>>>> I really would like to be able to use them to validate Linux Kernel
>>>> changes, hence looking for that missing BIOS.
>>>>
>>>> If we remove ppc405 from QEMU, we won't be able to do any regression
>>>> tests of Linux Kernel on those processors.
>>>
>>> If you/someone managed to compile an old version of u-boot for one of 
>>> these
>>> two boards, so that we would finally have something for regression 
>>> testing,
>>> we can of course also keep the boards in QEMU...
>>
>> I can see that it would be usefor for some cases, but unless someone
>> volunteers to track down the necessary firmware and look after it, I
>> think we do need to deprecate it - I certainly don't have the capacity
>> to look into this.
>>
> 
> I will look at it, please allow me a few weeks though.

Well, building it was not hard but now I'd like to know what board QEMU 
actually emulates, there are way too many codenames and PVRs.

Here is what I was building:
https://github.com/aik/u-boot/tree/ppc4xx-qemu

CONFIG_SYS_ARCH="powerpc"
CONFIG_SYS_CPU="ppc4xx"
CONFIG_SYS_VENDOR="esd"
CONFIG_SYS_BOARD="pmc405de"
CONFIG_SYS_CONFIG_NAME="PMC405DE"

Is this any use?

-- 
Alexey

