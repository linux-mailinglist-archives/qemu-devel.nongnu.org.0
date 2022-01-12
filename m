Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3FD48C721
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:22:31 +0100 (CET)
Received: from localhost ([::1]:39534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fSI-0003kZ-PK
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:22:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n7erS-0003bp-NT
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:44:28 -0500
Received: from [2001:738:2001:2001::2001] (port=17226 helo=zero.eik.bme.hu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1n7erP-0002tG-Ve
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 09:44:26 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B3D7C746397;
 Wed, 12 Jan 2022 15:44:17 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 47E9E746351; Wed, 12 Jan 2022 15:44:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 44D387457F0;
 Wed, 12 Jan 2022 15:44:17 +0100 (CET)
Date: Wed, 12 Jan 2022 15:44:17 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: Looking for advise on debugging a non-boot kernel on
 qemu-system-sh4
In-Reply-To: <a9a107d8-f30a-a6d4-5569-4c541630a97e@physik.fu-berlin.de>
Message-ID: <be8883df-c247-2a2b-5e87-8662c1547488@eik.bme.hu>
References: <4882e4cc-6754-1c8a-a8ae-a2ceeca115fb@physik.fu-berlin.de>
 <e11d3ee1-2a25-7633-babd-d45f36b04c5b@eik.bme.hu>
 <013d782d-0d7c-8204-cab2-08102a7d80f4@physik.fu-berlin.de>
 <3c524162-e83-a9b3-1e28-2aa28dbefa76@eik.bme.hu>
 <f0933be1-75ee-b053-1f53-f96258d41163@physik.fu-berlin.de>
 <d2553511-b83c-d4f1-5a88-b661bc97eb@eik.bme.hu>
 <9189dbe7-cf92-19c7-dee5-b707262964d1@physik.fu-berlin.de>
 <3f483f63-9e68-b1da-01ab-a1e05dcf45aa@physik.fu-berlin.de>
 <378d863-abbb-57b7-d624-ce1ca81d09c@eik.bme.hu>
 <105383e6-9dab-e2bd-ffe2-fead5555f37c@physik.fu-berlin.de>
 <c3cf7b52-10bc-eff3-c08a-d6e743cb863@eik.bme.hu>
 <db8b375b-0403-e7b3-44a6-89e440b5e2d2@physik.fu-berlin.de>
 <82c6635-68c7-9b51-3f6c-7555dfb7958c@eik.bme.hu>
 <a9a107d8-f30a-a6d4-5569-4c541630a97e@physik.fu-berlin.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1656294934-1641998657=:17852"
X-Spam-Probability: 9%
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:738:2001:2001::2001
 (failed)
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-2?Q?Robert_=A6wi=EAcki?= <robert@swiecki.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1656294934-1641998657=:17852
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hello,

On Wed, 12 Jan 2022, John Paul Adrian Glaubitz wrote:
> Hi Zoltan!
>
> On 10/26/21 00:40, BALATON Zoltan wrote:
>> On Tue, 26 Oct 2021, John Paul Adrian Glaubitz wrote:
>>> Hi Zoltan!
>>>
>>> On 10/23/21 15:22, BALATON Zoltan wrote:
>>>>> You either need to strip the kernel with "strip vmlinux" or use the image from arch/sh/
>>>>> boot/zImage.
>>>>
>>>> I've actually used that kernel but looked at the wrong uncompressed size, it's indeed just
>>>> 9.2MB when stripped so that should work. I was trying to debug further and found two problems:
>>>>
>>>> Commit abb0cd93494 (accel/tcg: Split out log_cpu_exec) seems to have broken -singlestep -d in_asm,cpu
>>>> output with sh after a delay slot. Since that commit I get:
>>>> (...)
>>>> This seems to take a wrong turn at the delayed branch and somehow ends up at 0x8c800964 instead of
>>>> 0x8c801528 but I'm not sure where to look firther why. I'm cc-ing Richard for both the -d cpu and
>>>> this hoping he has some more insight.
>>>
>>> Shall we open a bug report?
>>
>> Well, we don't know yet what to put in the bug report apart from there is some bug somewhere. That's
>> not too useful. I now understand that the -d output is not showing already translated TBs (I knew this
>> but most of the time with -singlestep it gives good results anyway) but here it runs the loops without
>> further output then we only see the first loop iteration and the end result. So the problem is not that
>> it goes to 0x8c800964 as I think that's part of the loop for decompressing the kernel but it seems
>> something is overwriting 0x8c800964 while it still expects to run code from there but I don't know what
>> and why. One way to find could be to disassemble the kernel code and compare that with the -d output and
>> check every instruction manually but that takes a lot of time or if you have a cross debugger you could
>> try attaching that to QEMU and try to debug it that way but I don't have that either. Any other idea how
>> to find out what is happening?
>
> Robert Święcki (CC'ed) found out that disabling tracing support makes Debian's kernel bootable [1].
>
> Not sure if this is a kernel bug or a QEMU bug then. Does QEMU have any support for kernel tracing?
>
> Adrian
>
>> [1] https://marc.info/?l=linux-sh&m=164193147916418&w=2

I don't think there's any support in QEMU that interacts with kernel 
tracing. I think more likely is that disabling this option either avoids 
some code path in the kernel where the problem happens or it changes the 
memory layout (e.g. making the kernel take less space) so it does not 
overwrite the part where it crashes (if it's really a problem with writing 
to wrong address it may still corrupt something else but that may not 
cause immediate crash). So while it boots it may still have a problem 
later if it happens to write to used memory. Best way would be to debug 
with cross debugger and find where exactly it's crashing and find out why 
but I don't have a cross debugger for SH4 at the moment nor time to look 
into this.

Regards,
BALATON Zoltan
--3866299591-1656294934-1641998657=:17852--

