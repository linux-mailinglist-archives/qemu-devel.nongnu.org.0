Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FB5381AE9
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 22:04:53 +0200 (CEST)
Received: from localhost ([::1]:53438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li0Wq-0007DB-Vq
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 16:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li0TX-0004kn-0y; Sat, 15 May 2021 16:01:27 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:19083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1li0TS-0004lh-UC; Sat, 15 May 2021 16:01:26 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 2304F74570E;
 Sat, 15 May 2021 22:01:18 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id D95FD7456E3; Sat, 15 May 2021 22:01:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D86907456B4;
 Sat, 15 May 2021 22:01:17 +0200 (CEST)
Date: Sat, 15 May 2021 22:01:17 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 0/6] hw/southbridge: QOM'ify vt82c686 as
 VT82C686B_SOUTHBRIDGE
In-Reply-To: <c3f36b44-ccff-f685-a439-7bb58f4b1d0f@amsat.org>
Message-ID: <60bf7c9c-a5c0-b193-95c4-a673aa8410c6@eik.bme.hu>
References: <20210511041848.2743312-1-f4bug@amsat.org>
 <ecdd9299-ec2-5049-fe1e-d3c7d261d@eik.bme.hu>
 <6e9cad77-bb24-6c0a-f841-1f8a1f3515e6@amsat.org>
 <211f4a16-a521-512c-ff52-aabf7a5f13@eik.bme.hu>
 <5d38775e-d2a7-6ae1-2483-8516e8b0c6c3@amsat.org>
 <1ebcddfc-6986-84b4-7264-a6a95e1aa9e4@eik.bme.hu>
 <d806256f-36b3-e012-3087-6dba1b910e8a@amsat.org>
 <bd9a3731-1721-2d66-ddb5-547d6eac65a0@eik.bme.hu>
 <c3f36b44-ccff-f685-a439-7bb58f4b1d0f@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="3866299591-965917759-1621108830=:7809"
Content-ID: <434f34ad-8794-6c3-3011-c4e1a459a64a@eik.bme.hu>
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
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-block@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-965917759-1621108830=:7809
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <cc50cedd-1657-72cc-9637-60c7f895213c@eik.bme.hu>

On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote:
> On 5/15/21 4:37 PM, BALATON Zoltan wrote:
>> On Thu, 13 May 2021, Philippe Mathieu-Daudé wrote:
>>> On 5/13/21 1:54 PM, BALATON Zoltan wrote:
>>>> On Thu, 13 May 2021, Philippe Mathieu-Daudé wrote:
>>>>> On 5/11/21 3:09 PM, BALATON Zoltan wrote:
>>>>>> On Tue, 11 May 2021, Philippe Mathieu-Daudé wrote:
>>>>>>> Hi Zoltan,
>>>>>>>
>>>>>>> On 5/11/21 1:28 PM, BALATON Zoltan wrote:
>>>>>>>> On Tue, 11 May 2021, Philippe Mathieu-Daudé wrote:
>>>>>>>>> The motivation behind this series is to remove the
>>>>>>>>> isa_get_irq(NULL) call to simplify the ISA generic model.
>>>>>>>>>
>>>>>>>>> Since v1:
>>>>>>>>> - rebased on top of remotes/dg-gitlab/tags/ppc-for-6.1-20210504
>>>>>>>>
>>>>>>>> I'll try to have a look at these later but some notes: The pegasos2
>>>>>>>> changes are now in master so if this was before that maybe
>>>>>>>> rebasing on
>>>>>>>> master is now enough.
>>>>>>>
>>>>>>> This is what this series does, simply rebase on top of your merged
>>>>>>> patches.
>>>>>>>
>>>>>>>> However I wonder if any changes to pegasos2.c is
>>>>>>>> needed due to changed init of the chip model or is that only
>>>>>>>> affecting
>>>>>>>> 82c686b?
>>>>>>>
>>>>>>> There is no change in 'init' in this series, it is only QOM
>>>>>>> boilerplate
>>>>>>> code churn, no logical change intended.
>>>>>>>
>>>>>>>> Please also note that pegasos2 is not enabled by default due to
>>>>>>>> needing undistributable firmware ROM so to test it you need to
>>>>>>>> enable it
>>>>>>>> in default-configs/devices/ppc-softmmu.mak
>>>>>>>
>>>>>>> I remember you said you were mostly interested in the VT8231, not
>>>>>>> the VT82C686. This series only QOM'ify the latter.
>>>>>>
>>>>>> OK as I said I haven't looked at it in detail.
>>>>>>
>>>>>>> What is your idea? Send the firmware off-list and explain how
>>>>>>> the OS works and how (what) to test?
>>>>>>
>>>>>> I've already sent you this info:
>>>>>>
>>>>>> https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg01553.html
>>>>>
>>>>> Well, if you have everything setup, it is easier to test and send
>>>>> a Tested-by tag.
>>>>
>>>> I indend to test it when I'll have some time but I could not get to
>>>> it yet.
>>>>
>>>>>> but I can't write a test case so if you want to automate this and make
>>>>>> it part of QEMU tests then some help with that would be appreciated.
>>>>>
>>>>> You are not the only want wanting that. I'm working on a solution to
>>>>> run
>>>>> such tests (depending on binary blobs) in your own namespace, but it
>>>>> will take me time (doing it in my free time, without help).
>>>>
>>>> I did not mean to say you should do this urgently, just sent this as a
>>>> reminder about how this could be tested in case you forgot because
>>>> you've asked about testing.
>>>
>>> Unrelated to this series, with master (dab59ce0312) I sometime get:
>>>
>>> Initializing KBD...00000012                               FAILED.
>>>
>>> and then the mouse isn't working.
>>>
>>> Sometimes:
>>>
>>> Initializing KBD...                                       Done.
>>>
>>> and the mouse is crazy (similar to my host mouse).
>>>
>>> Anyway, there is smth wrong with patch #2 of this series:
>>> "Simplify removing unuseful qemu_allocate_irqs() call".
>>
>> As I said before, when I've tried to do it that way first it did not
>> work for me so I introduced the indirection which fixed it but I did not
>> understand why it was needed or I forgot by now so all I remember is
>> that I could not directly connect the irq and needed the local function
>> for some reason.
>
> OK, I'll try to figure out what the problem is and come back to you.

I'm not sure, but could this be related to a note Peter made in this 
series:

https://lists.nongnu.org/archive/html/qemu-ppc/2020-12/msg00171.html

about converting PPC interrupts to qdev qpios? Could it be that the irq 
cannot be connected directly as it has some unexpected behaviour due to 
this?

Regards,
BALATON Zoltan
--3866299591-965917759-1621108830=:7809--

