Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3A933D492
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 14:08:16 +0100 (CET)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lM9Ql-00053H-Kv
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 09:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lM9PV-0004YA-Qz; Tue, 16 Mar 2021 09:06:57 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:11597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1lM9PS-0005oo-Li; Tue, 16 Mar 2021 09:06:57 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 461AC7462DB;
 Tue, 16 Mar 2021 14:06:50 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 13E507462BD; Tue, 16 Mar 2021 14:06:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 11ABA7456B4;
 Tue, 16 Mar 2021 14:06:50 +0100 (CET)
Date: Tue, 16 Mar 2021 14:06:50 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v7 0/8] Pegasos2 emulation
In-Reply-To: <d5bdc780-4809-2666-35cb-a2096ed967e0@vivier.eu>
Message-ID: <e16d3b59-3d3a-2299-1689-72304a18da90@eik.bme.hu>
References: <cover.1615345138.git.balaton@eik.bme.hu>
 <85548594-aaa1-8d3a-cedf-d2dd92f05028@eik.bme.hu>
 <b6bda254-ac3-d271-3e1b-bf73e4282e9b@eik.bme.hu>
 <d6d7d87b-7c7d-69e8-a7f4-e6611a4096ea@vivier.eu>
 <276e8961-d058-c47e-82dd-1715881607d5@amsat.org>
 <4ce33c11-af3c-4a18-fccb-9c9bdb2b26c2@vivier.eu>
 <ea5f6f28-3be1-6a80-7b8a-c3563baec061@eik.bme.hu>
 <d5bdc780-4809-2666-35cb-a2096ed967e0@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1872429226-1615899603=:94005"
Content-ID: <97848fb0-5e20-3ab7-ace4-8e2a288aaea9@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1872429226-1615899603=:94005
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <7d1c95e-e549-ace9-e338-279f5e7ce5f5@eik.bme.hu>

On Tue, 16 Mar 2021, Laurent Vivier wrote:
> Le 16/03/2021 à 13:24, BALATON Zoltan a écrit :
>> On Tue, 16 Mar 2021, Laurent Vivier wrote:
>>> Le 16/03/2021 à 12:49, Philippe Mathieu-Daudé a écrit :
>>>> On 3/16/21 10:01 AM, Laurent Vivier wrote:
>>>>> Le 15/03/2021 à 13:33, BALATON Zoltan a écrit :
>>>>>> On Sat, 13 Mar 2021, BALATON Zoltan wrote:
>>>>>>> On Wed, 10 Mar 2021, BALATON Zoltan wrote:
>>>>>>>> Hello,
>>>>>>>
>>>>>>> I've started posting this series well in advance to get it into 6.0 and yet it seems like it may
>>>>>>> be missing it due to organisational issues (no real complaints were found with patches but
>>>>>>> Philippe seems to like more review that does not seem to happen as nobody is interested). Looks
>>>>>>> like David is waiting for an ack from Philippe but will be away next week so if this is not
>>>>>>> resolved now it may be too late on Monday. To avoid that:
>>>>>>>
>>>>>>> David, could you please send an ack before you leave for the last two patches so it could get
>>>>>>> committed via some other tree while you're away?
>>>>>>>
>>>>>>> Philippe, if you can't ack the vt82c686 patches now are you OK with taking the whole series via
>>>>>>> your tree before the freeze? That would give you some more days to review and it could always be
>>>>>>> reverted during the freeze but if it's not merged now I'll have to wait until the summer to
>>>>>>> get it
>>>>>>> in again which would be another long delay. I don't think this will get more reviews unless it's
>>>>>>> in master and people can start using and testing it better.
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> Since David seems to be away for this week before seeing my mail asking for an ack from him, now
>>>>>> this can only get in by Philippe or Peter. (David said before he'd be OK with the series if
>>>>>> Philippe
>>>>>> acked it so I think that can count as an implicit ack and it could always be reverted before the
>>>>>> releease.)
>>>>>>
>>>>>> Philippe, do you have anything against this to get merged now? If not please send a pull or ack it
>>>>>> so it has a chance to be in 6.0 or tell if you still intend to do anything about it before the
>>>>>> freeze. This series was on the list since January and the remaining parts you did not take are
>>>>>> here
>>>>>> since February 22nd and the version after your first review since two weeks so it would be nice to
>>>>>> sort this out and not block it any further without a good reason.
>>>>>
>>>>> Pegasos looks like a New World PowerMac, so perhaps Mark can help?
>>>>
>>>> The PPC part is mostly reviewed. The problem is the first patch:
>>>> "vt82c686: Implement control of serial port io ranges via config regs".
>>>
>>> vt82c686.c is a Fuloong 2E file, why Fuloong 2E maintainers are not involved in the review?
>>
>> Philippe is MIPS maintainer and he was involved and reviewed most patches. Huacai did not respond
>> much and Jiaxun's email adress is constantly stripped by the list so whenrver I add him it will be
>> lost the next time. He seems to be more interested in Fuloong 3 anyway so did not respond much either.
>>
>> All in all I think there's just not enough interest in these machines/devices so my stance is that
>> if it does not break anything just take it now and then we'll have enough time for further review,
>> fixing or reverting during the freeze. Whereas if this is kept pushing back then nothing will happen
>> with them for the next 2-3 months then we'll be back to here and miss the next release as well.
>
> The PATCH 1 doesn't seem to be needed to have a working Pegasos 2 machine, does it?

It is needed (as well as all other patches in the series). Patch 1 is 
needed for getting serial output which is the only way to communicate with 
the Pegasos2 firmware so it's really hard to boot anything without it.

> If the problem is only with the first patch perhaps you can remove it to have it merged and come
> back later with a cleaner implementation (it is presented to be a hack)?

I'll try to explain it again in another message but there's no cleaner 
solution available without much more work than I want to take up. To do it 
a more cleaner way ISA emulation would need to be QOM'ified that I won't 
do. This solution is a hack in that it pokes the isa-serial device from a 
superclass but there's no easier and cleaner way to do it so this should 
be good enough for now and it has the lowest chance to break anything 
else.

> I think PATCH 6 can already be merged, and PATCH 2 can be done outside of the series as a pre-requisite.
>
> Then it will be easier to manage a series only adding devices for your new machine.

It's all or nothing I'm afraid as all these pathces are needed for 
pegasos2 to work so taking only a few of them won't let users use it in 
6.0.

Regards,
BALATON Zoltan
--3866299591-1872429226-1615899603=:94005--

