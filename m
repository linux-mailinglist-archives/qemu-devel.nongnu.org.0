Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C02258AB29
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 14:57:42 +0200 (CEST)
Received: from localhost ([::1]:41612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJwtZ-0008Gs-2p
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 08:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJwrB-0006RB-Di; Fri, 05 Aug 2022 08:55:13 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:19645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oJwr7-0004VP-IL; Fri, 05 Aug 2022 08:55:12 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1C062746381;
 Fri,  5 Aug 2022 14:55:02 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D06D274637E; Fri,  5 Aug 2022 14:55:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CD904746335;
 Fri,  5 Aug 2022 14:55:01 +0200 (CEST)
Date: Fri, 5 Aug 2022 14:55:01 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
cc: Peter Maydell <peter.maydell@linaro.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 "list@suse.de:PowerPC" <qemu-ppc@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 12/20] ppc/ppc405: QOM'ify EBC
In-Reply-To: <743ea55a-915e-5991-5d7c-ef00ee307ee9@kaod.org>
Message-ID: <a992199c-b51d-6baa-b91b-4959ec4a46e8@eik.bme.hu>
References: <20220803132844.2370514-1-clg@kaod.org>
 <20220803132844.2370514-13-clg@kaod.org>
 <973576c1-deb8-3973-34e7-d038ca2200c2@gmail.com>
 <4885e6d0-8fff-4712-d032-c5afcac79ff7@kaod.org>
 <7b97e54b-4d80-6db9-af33-40a539827ddd@eik.bme.hu>
 <3b1bc6c5-a363-0a42-f0dc-eafc14376fe2@kaod.org>
 <1e6be2f3-4c7a-2432-5034-fa012c662df@eik.bme.hu>
 <7ecefd72-b799-8a8c-51fd-28730a12ebf1@kaod.org>
 <a3c2da20-c161-a6d2-6ed1-c0954991eff5@eik.bme.hu>
 <CAFEAcA-au_h+B05HriBQcGh9hsvmzksuHisqAx4cqGKAY8+8Dg@mail.gmail.com>
 <18dcac8a-d5e8-b6e-b9b-838cb1badb7@eik.bme.hu>
 <743ea55a-915e-5991-5d7c-ef00ee307ee9@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-179645442-1659700685=:57311"
Content-ID: <41d0a7fa-ebf1-53d7-3b99-bf2d0352f3@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-179645442-1659700685=:57311
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <1b7e1423-6425-3684-db40-4c2363b120a4@eik.bme.hu>

On Fri, 5 Aug 2022, Cédric Le Goater wrote:
> On 8/4/22 21:26, BALATON Zoltan wrote:
>> On Thu, 4 Aug 2022, Peter Maydell wrote:
>>> On Thu, 4 Aug 2022 at 19:03, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>>>> I was trying to find out how to do it but I don't understand QOM enough 
>>>> to
>>>> answer the simple question of how to get the cpu object from QOM. My
>>>> guesses are:
>>>> 
>>>> object_resolve_path_type("/machine", TYPE_POWERPC_CPU, NULL)
>> 
>> Out of curiosity would this work though to get the cpu or if not why not 
>> and what would be a preferred way? I could not find this out from reading 
>> the object.h comments, the docs/deve/qom.rst, nor searching the code.
>
> You could scan the object topology using object_child_foreach_recursive()
> and use object_dynamic_cast() to find a POWERPC CPU object. A link is
> much faster !

Yes that sounds a lot slower, I hoped there's simple easy way to get to 
the cpu, then we could simplify this a bit.

One more idea, you've introduced the Ppc405MachineState which you can get 
to casting current_machine and so it's a convenient place to store a cpu 
pointer or even just use PPC405_MACHINE(current_machine)->soc.cpu. This 
works for these 405 machines you've changed in this series but other 
PPC4xx machines don't have this machine and soc states yet. Could these 
Ppc405MachineState and Ppc405SoCState be more generic as 
Ppc4xxMachineState and Ppc4xxSoCState considering that these chips are 
quite similar or maybe we need an abstract PPC4xxSoC class but machine 
state could be shared? (If you say this is too much cahnges for you now I 
may try to look at this later once your series is merged but going that 
way now could save some churn.) If we had a Ppc4xxMachineState that has a 
cpu pointer then we could easily add that to bamboo and sam460ex now and 
these QOMified devices could then use PPC4XX_MACHINE(current_machine)->cpu 
instead of a link property. What do you think?

>> If this is the preferred way then so be it, I just don't like it because I 
>> think this is too many boilerplate code that could be avoided. This series:
>>
>>   9 files changed, 894 insertions(+), 652 deletions(-)
>>
>>   and that's including removing all of the taihu machine; the file where 
>> the QOMification is done:
>>
>>   hw/ppc/ppc405_uc.c              | 799 +++++++++++++++++++-------------
>
> Yes. You should consider also that this code is > 15 years old and
> serious shortcuts have been taken to "make things work". I think QOM
> clarifies the models and represents better the HW topology. There is
> a price in being explicit.

I know this is a mess curently but QOM is full of boilerplate code which 
is confusing for new people and makes it hard to undestand the code. So 
cutting down the boilerplate and making things simpler would help people 
who want to get started with QEMU development. If adding a property was 
3-4 additional lines I wouldn't care but if it makes the code 
significantly more complex and thus harder to understand at a glance then 
I'd rather avoid it if possible and stick to simple terms. Verbosity is 
good if it explains things better but bad if it's hiding the important 
details between unneeded complexity due to having to use constructs that 
are not obvious. Also the property needs to be set which is additional 
lines and possibility for mistakes so if there's a way to avoid that I 
think that's better.

>> Ideally introducing QOM should make it simpler not more complex. Four of 
>> the QOMified devices only have a property defined at all because of this 
>> cpu link that's only used once in the realize method to register DCRs. This 
>> is about 10 lines of code each. If there was a simple way to get the cpu 
>> object from these realize methods then we could get rid of all these 
>> properties and save about 40-50 lines and make these simpler.
>
> I tried several approaches and found this one was the simplest and not
> too verbose really.
>
> The DCRs are accessed by software through the use of the mtdcr and mfdcr
> instructions. These are converted in transactions on a side band bus,
> the DCR bus, which connects the on-SoC devices to the CPU. The "cpu" link
> should be considered as modeling this little piece of HW logic connecting
> the device to the DCR bus.

I rather consider it an implementation detail and trying to find the 
simplest way. If we don't find anything simpler I'm OK with link 
properties but I'm not convinced yet there's no simpler solution to this 
problem that could avoid some of the additional complexity.

Regards,
BALATON Zoltan
--3866299591-179645442-1659700685=:57311--

