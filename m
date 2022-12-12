Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7B264A4BF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:27:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4ldn-0002H0-QL; Mon, 12 Dec 2022 11:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p4ldm-0002G6-3D
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:26:54 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p4ldk-00038E-Fi
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:26:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wMzcqMFiAudPSBY37HDUohos9kgByHmIyvrvK7Qd5bw=; b=NLFJNpJjejPmUvYqzAavStBUtl
 TT6iTBQLOuGFdHqFRYdGnvzXj34OK1URg7TwfupsOKdstSckb6dszAoObB2qSfmuNBn7dY3ZSBwer
 wsUtz/ZRWG0zZfWtZBvodQGg1wlmQcFeiPW9bVLKEg8RBfZX673hqnBtn7tYNIWTJxr93g9K8BDLn
 ftyEB0oXRGayWVh4m+W3UzRTEluuQynW2xVDPiF3hKUIcD/p/ua1+VIjdDhWhzNHCPAvEkSobUyvO
 jxUPS+z3f4MWFJnguiZ7BTd+7mQ/652ulaxwaozeyWGVz9RxnNJggKlBnDwm/o/7pSdW0XYk8JYV7
 idBFZx1OMaPhFQEMCDtJy9Q0mq9ZIkFsAvxmMkHjf+T1Dd7FSexjTzOBfUhbHSOvIkpTfXmbZAxzY
 evYextYqLgAfKGWrsndq5K9oqPZL0ABGFp77uOxbHlEGqQxe+1uKAJAEORjzc3mH/y9pQjEI3BoUo
 tDaK86wceegfU5ioPj260iUASiUyITy3Y/vhdFcpoMFRBWjYDnTBzOKX/IcClTwjBzfteMoEeI0w5
 EXMDPc6+cm/4j5LC4AkgpLgLuv1fojLLWsQVd46qINSEzC5c9n7Q3M+eDPK+cvIVcFcXFZO7zp13g
 DU7Zyb2VjLmrC/AUMlVLquNzMSJWqyMVgnim8U/CU=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1p4ldR-00029R-DL; Mon, 12 Dec 2022 16:26:37 +0000
Message-ID: <b9d1f3c1-e98d-cf98-5dfc-dd40b82412a0@ilande.co.uk>
Date: Mon, 12 Dec 2022 16:26:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: Michael S Tsirkin <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
References: <20221212075600.17408-1-thuth@redhat.com>
 <12d9fcbf-e00f-1154-63e0-36420e89f619@ilande.co.uk>
 <dd94d639-ff48-554a-c462-ae7fe2399d4e@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <dd94d639-ff48-554a-c462-ae7fe2399d4e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3] hw/rtc/mc146818rtc: Make this rtc device target
 independent
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/12/2022 13:48, Thomas Huth wrote:

> On 12/12/2022 14.39, Mark Cave-Ayland wrote:
>> On 12/12/2022 07:56, Thomas Huth wrote:
>>
>>> The only reason for this code being target dependent is the apic-related
>>> code in rtc_policy_slew_deliver_irq(). Since these apic functions are rather
>>> simple, we can easily move them into a new, separate file (apic_irqcount.c)
>>> which will always be compiled and linked if either APIC or the mc146818 device
>>> are required. This way we can get rid of the #ifdef TARGET_I386 switches in
>>> mc146818rtc.c and declare it in the softmmu_ss instead of specific_ss, so
>>> that the code only gets compiled once for all targets.
>>>
>>> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   v3: Move TYPE_APIC_COMMON from apic_internal.h to apic.h and use it
>>>
>>>   include/hw/i386/apic.h          |  2 ++
>>>   include/hw/i386/apic_internal.h |  2 --
>>>   include/hw/rtc/mc146818rtc.h    |  1 +
>>>   hw/intc/apic_common.c           | 27 -----------------
>>>   hw/intc/apic_irqcount.c         | 53 +++++++++++++++++++++++++++++++++
>>>   hw/rtc/mc146818rtc.c            | 25 +++++-----------
>>>   hw/intc/meson.build             |  6 +++-
>>>   hw/rtc/meson.build              |  3 +-
>>>   8 files changed, 69 insertions(+), 50 deletions(-)
>>>   create mode 100644 hw/intc/apic_irqcount.c
>>>
>>> diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
>>> index da1d2fe155..24069fb961 100644
>>> --- a/include/hw/i386/apic.h
>>> +++ b/include/hw/i386/apic.h
>>> @@ -1,6 +1,7 @@
>>>   #ifndef APIC_H
>>>   #define APIC_H
>>> +#define TYPE_APIC_COMMON "apic-common"
>>
>> Ah sorry, I should have been more specific here: what I was suggesting was to move 
>> the entire QOM type information into apic.h as per the normal convention, as 
>> opposed to just the #define. At first glance that would involve lines 128-190 in 
>> apic_internal.h which would also bring in APICCommonClass and APICCommonState - 
>> possibly the change may warrant its own commit.
> 
> At least APICCommonState is target specific since it uses "X86CPU" ... so moving that 
> to apic.h would be very counterproductive here.

Ah okay I see now - sorry I didn't spot that earlier.

> Anyway, moving those structs is certainly way more than what is required for this 
> patch, so if we decide to move anything else related to the APIC, it should be done 
> in a separate patch later.

Agreed, it makes sense to fix the build issue first and then sort out the headers 
later given that it seems to be less than straightforward :/


ATB,

Mark.

