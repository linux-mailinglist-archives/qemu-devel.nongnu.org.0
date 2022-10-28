Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3342610C86
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 10:56:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooL8i-0002Qw-5t; Fri, 28 Oct 2022 04:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooL8g-0002Qe-Km; Fri, 28 Oct 2022 04:54:54 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooL8e-0003C0-Fg; Fri, 28 Oct 2022 04:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RSaPeoW2DNC/u6OVGV4tBqbToEcxLLGKS6gPqha0Gjg=; b=ZF8kQcoqQs3fO/s0o16OkbbMfn
 /J+sg2CgsxHlopmMb78VW2eXfeTwigHmmYJe3iq8pwmzlcKL9kJBA2MJ5OvcWUeg1RqQsBAkwqkd1
 JBJQQj3uG0e0RxuWUjqTNfW6XlOZXz+90Ig2QMBWD4CVDzBnnYiYUuhUmRno4JD9xG+U6p2DF74ap
 Z5pOrdhRgbyfjwGHbtGDRwG6n1b6tVK64qvg9OXoUpk2nevphqvXE7R7QD7rCqNdlrxVZ3iAChglS
 PK80WnmCf7slSJWDNpS2Rorg3Vp/guJtNu0anhyFjttIxcEAfUVjiAaR0mYH2tAFrtTQvNV5b9g/A
 Ejo/DTYDSnFZZDOh2hNR77t8eaU/iHRQR/nIRNBA2qbaRwZcFHv99zAOzZbBK+zP3bjgjZs+hbrqA
 Gp+9ktqOqLxQ42WtRLVI2btKevjWMc+od2vph6NtMxzbkIP44pZeV9pjCPC1Vng6fxVzKIhXHo5RY
 ehs96303C0xylqRfc6uRUchF5/QlgNW2ev3GWRiyNgFR6X3mSqQ75eyHNdzNcn+Gxd2VCR+FHsvbU
 eC8muR2AIB//dTpKrkYWwBd2xbgkrtDwRqaUJyBCOGR3oMdkSoZVYvM/YnYTfPLXoVzg/ZKD3uaHj
 gUMaCfu2e8v29RzN1XYWYm5F3cowXDleOMFO4AA7k=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooL8T-0000B9-DL; Fri, 28 Oct 2022 09:54:45 +0100
Message-ID: <16bb7a56-ed91-a829-ab5b-94b4be564e71@ilande.co.uk>
Date: Fri, 28 Oct 2022 09:54:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <cover.1664827008.git.balaton@eik.bme.hu>
 <2514e45b2ac438e40180cdf51e156a9dcf6a4df4.1664827008.git.balaton@eik.bme.hu>
 <1a8cace1-1401-1420-d933-0ab7c7d78bfd@ilande.co.uk>
 <2c3014a6-ad5-c595-6222-d82ae42ecf@eik.bme.hu>
 <a5fdd3f0-9f2d-4281-d73e-7cef108962a4@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <a5fdd3f0-9f2d-4281-d73e-7cef108962a4@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 05/13] mac_{old|new}world: Simplify cmdline_base
 calculation
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 14/10/2022 16:25, BALATON Zoltan wrote:

> On Fri, 14 Oct 2022, BALATON Zoltan wrote:
>> On Fri, 14 Oct 2022, Mark Cave-Ayland wrote:
>>> On 03/10/2022 21:13, BALATON Zoltan wrote:
>>>
>>>> By slight reorganisation we can avoid an else branch and some code
>>>> duplication which makes it easier to follow the code.
>>>>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>>   hw/ppc/mac_newworld.c | 6 +++---
>>>>   hw/ppc/mac_oldworld.c | 7 +++----
>>>>   2 files changed, 6 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
>>>> index 6bc3bd19be..73b01e8c6d 100644
>>>> --- a/hw/ppc/mac_newworld.c
>>>> +++ b/hw/ppc/mac_newworld.c
>>>> @@ -194,9 +194,11 @@ static void ppc_core99_init(MachineState *machine)
>>>>                            machine->kernel_filename);
>>>>               exit(1);
>>>>           }
>>>> +        cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
>>>> +                                         KERNEL_GAP);
>>>>           /* load initrd */
>>>>           if (machine->initrd_filename) {
>>>> -            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + 
>>>> KERNEL_GAP);
>>>> +            initrd_base = cmdline_base;
>>>>               initrd_size = load_image_targphys(machine->initrd_filename,
>>>>                                                 initrd_base,
>>>>                                                 machine->ram_size - initrd_base);
>>>> @@ -206,8 +208,6 @@ static void ppc_core99_init(MachineState *machine)
>>>>                   exit(1);
>>>>               }
>>>>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
>>>> -        } else {
>>>> -            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + 
>>>> KERNEL_GAP);
>>>>           }
>>>>           ppc_boot_device = 'm';
>>>>       } else {
>>>> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
>>>> index cb67e44081..b424729a39 100644
>>>> --- a/hw/ppc/mac_oldworld.c
>>>> +++ b/hw/ppc/mac_oldworld.c
>>>> @@ -168,10 +168,11 @@ static void ppc_heathrow_init(MachineState *machine)
>>>>                            machine->kernel_filename);
>>>>               exit(1);
>>>>           }
>>>> +        cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
>>>> +                                         KERNEL_GAP);
>>>>           /* load initrd */
>>>>           if (machine->initrd_filename) {
>>>> -            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
>>>> -                                            KERNEL_GAP);
>>>> +            initrd_base = cmdline_base;
>>>>               initrd_size = load_image_targphys(machine->initrd_filename,
>>>>                                                 initrd_base,
>>>>                                                 machine->ram_size - initrd_base);
>>>> @@ -181,8 +182,6 @@ static void ppc_heathrow_init(MachineState *machine)
>>>>                   exit(1);
>>>>               }
>>>>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
>>>> -        } else {
>>>> -            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + 
>>>> KERNEL_GAP);
>>>>           }
>>>>           ppc_boot_device = 'm';
>>>>       } else {
>>>
>>> Is there any particular reason why you would want to avoid the else branch? I
>>
>> It avoids code duplication and to me it's easier to follow than an else branch. 
>> With this patch cmdline_base calculation is clearly tied to kernel_base and 
>> kernel_size if only kernel is used and initrd_base initrd_size when initrd is used. 
>> With the else branch it's less obvious because it's set much later in the else 
>> branch while initrd_base duplicates it above. So avoiding this duplication makes 
>> the code easier to read and less prone to errors if the calculation is ever modified.
>>
>>> don't feel this patch is an improvement since by always setting cmdline_base to a 
>>> non-zero value, as a reviewer I then have to check all other uses of cmdline_base 
>>> in the file to ensure that this doesn't cause any issues.
>>
>> There aren't that many uses that it's difficult to check and this only need to be 
>> done once.
>>
>>> I much prefer the existing version since setting the values of cmdline_base and 
>>> initrd_base is very clearly scoped within the if statement.
>>
>> What can I say, it's hard to argue with preferences but avoiding code duplication 
>> is worth the effort reviewing this patch in my opinion.
> 
> Also compare the before and after this series:
> 
> https://github.com/patchew-project/qemu/blob/master/hw/ppc/mac_newworld.c
> https://github.com/patchew-project/qemu/blob/9c1cd2828b3d3bd3a7068134a57ae9bb07f5a681/hw/ppc/mac_newworld.c 
> 
> 
> I think the result is much easier to follow without else brances as you can read it 
> from top to bottom instead of jumping around in else branches that is less clear and 
> also more lines. Also setting default value avoids any used uninitialised cases which 
> you would need to check if you set vars in if-else instead so unlike what you say 
> this does not introduce such cases but closes the possibility instead. So please take 
> the time to review it in exchange of the time I've put it in writing it.

I've revisited this looking at the links provided above, and after consideration my 
opinion is that that having the more localised scoping of the variables is more 
worthwhile (i.e. the compiler can better catch errors) rather than eliminating the 
duplication for a couple of lines. Please drop this patch before posting the next 
version of the series.


ATB,

Mark.

