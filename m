Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FD7435C92
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 10:04:13 +0200 (CEST)
Received: from localhost ([::1]:45278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdT3c-0006jG-63
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 04:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mdT1g-0005Ms-AR; Thu, 21 Oct 2021 04:02:13 -0400
Received: from pegase2.c-s.fr ([93.17.235.10]:38295)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophe.leroy@csgroup.eu>)
 id 1mdT1X-0007VA-L6; Thu, 21 Oct 2021 04:02:11 -0400
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HZg1K69SJz9sSQ;
 Thu, 21 Oct 2021 10:01:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n_eowc5ZdWbC; Thu, 21 Oct 2021 10:01:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HZg1K4tG2z9sSN;
 Thu, 21 Oct 2021 10:01:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E93B8B812;
 Thu, 21 Oct 2021 10:01:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2u-GYiiZf9Ey; Thu, 21 Oct 2021 10:01:57 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.154])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 382B18B764;
 Thu, 21 Oct 2021 10:01:56 +0200 (CEST)
Subject: Re: Deprecate the ppc405 boards in QEMU?
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <5e4f78ce-1508-5689-ec29-79edad0c824e@kaod.org>
 <491d6265-3785-b11-b7f0-621a3d2823@eik.bme.hu>
 <b9f27c1b-1162-b178-9333-89c0dd707c12@redhat.com>
 <103e098a-a8ac-a22a-8aad-3df7d8cde148@amsat.org>
 <939f2d12-38f6-4ab0-b688-384136d1d9c@eik.bme.hu>
 <4e07823e-7162-525a-4a61-9bed63e85d58@kaod.org>
 <5263c819-b13c-f48a-d720-15b085537070@csgroup.eu>
 <8add201d-73cc-d7b1-cb52-f1fd18eb5d69@csgroup.eu>
 <d33f80df-1f82-b542-1e46-ffd3d3e01861@redhat.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5845a9ac-a33c-e17d-190f-6104d1ace0dd@csgroup.eu>
Date: Thu, 21 Oct 2021 10:01:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d33f80df-1f82-b542-1e46-ffd3d3e01861@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=93.17.235.10;
 envelope-from=christophe.leroy@csgroup.eu; helo=pegase2.c-s.fr
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.267,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 21/10/2021 à 09:25, Thomas Huth a écrit :
> On 21/10/2021 08.48, Christophe Leroy wrote:
>>
>>
>> Le 20/10/2021 à 15:16, Christophe Leroy a écrit :
>>>
>>>
>>> Le 20/10/2021 à 14:43, Cédric Le Goater a écrit :
>>>> On 10/20/21 13:42, BALATON Zoltan wrote:
>>>>> On Wed, 20 Oct 2021, Philippe Mathieu-Daudé wrote:
>>>>>> On 10/5/21 14:29, Thomas Huth wrote:
>>>>>>> On 05/10/2021 14.20, BALATON Zoltan wrote:
>>>>>>>> On Tue, 5 Oct 2021, Cédric Le Goater wrote:
>>>>>>>>> On 10/5/21 08:18, Alexey Kardashevskiy wrote:
>>>>>>>>>> On 05/10/2021 15:44, Christophe Leroy wrote:
>>>>>>>>>>> Le 05/10/2021 à 02:48, David Gibson a écrit :
>>>>>>>>>>>> On Fri, Oct 01, 2021 at 04:18:49PM +0200, Thomas Huth wrote:
>>>>>>>>>>>>> On 01/10/2021 15.04, Christophe Leroy wrote:
>>>>>>>>>>>>>> Le 01/10/2021 à 14:04, Thomas Huth a écrit :
>>>>>>>>>>>>>>> On 01/10/2021 13.12, Peter Maydell wrote:
>>>>>>>>>>>>>>>> On Fri, 1 Oct 2021 at 10:43, Thomas Huth <thuth@redhat.com>
>>>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>>>>> Nevertheless, as long as nobody has a hint where to 
>>>>>>>>>>>>>>>>> find that
>>>>>>>>>>>>>>>>> ppc405_rom.bin, I think both boards are pretty useless in
>>>>>>>>>>>>>>>>> QEMU (as far as I
>>>>>>>>>>>>>>>>> can see, they do not work without the bios at all, so it's
>>>>>>>>>>>>>>>>> also not possible
>>>>>>>>>>>>>>>>> to use a Linux image with the "-kernel" CLI option 
>>>>>>>>>>>>>>>>> directly).
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> It is at least in theory possible to run bare-metal code on
>>>>>>>>>>>>>>>> either board, by passing either a pflash or a bios 
>>>>>>>>>>>>>>>> argument.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> True. I did some more research, and seems like there was 
>>>>>>>>>>>>>>> once
>>>>>>>>>>>>>>> support for those boards in u-boot, but it got removed 
>>>>>>>>>>>>>>> there a
>>>>>>>>>>>>>>> couple of years ago already:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/98f705c9cefdf 
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/b147ff2f37d5b 
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> https://gitlab.com/qemu-project/u-boot/-/commit/7514037bcdc37 
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> But I agree that there seem to be no signs of anybody 
>>>>>>>>>>>>>>>> actually
>>>>>>>>>>>>>>>> successfully using these boards for anything, so we should
>>>>>>>>>>>>>>>> deprecate-and-delete them.
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Yes, let's mark them as deprecated now ... if someone 
>>>>>>>>>>>>>>> still uses
>>>>>>>>>>>>>>> them and speaks up, we can still revert the deprecation 
>>>>>>>>>>>>>>> again.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I really would like to be able to use them to validate 
>>>>>>>>>>>>>> Linux Kernel
>>>>>>>>>>>>>> changes, hence looking for that missing BIOS.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> If we remove ppc405 from QEMU, we won't be able to do any
>>>>>>>>>>>>>> regression
>>>>>>>>>>>>>> tests of Linux Kernel on those processors.
>>>>>>>>>>>>>
>>>>>>>>>>>>> If you/someone managed to compile an old version of u-boot for
>>>>>>>>>>>>> one of these
>>>>>>>>>>>>> two boards, so that we would finally have something for
>>>>>>>>>>>>> regression testing,
>>>>>>>>>>>>> we can of course also keep the boards in QEMU...
>>>>>>>>>>>>
>>>>>>>>>>>> I can see that it would be usefor for some cases, but unless 
>>>>>>>>>>>> someone
>>>>>>>>>>>> volunteers to track down the necessary firmware and look 
>>>>>>>>>>>> after it, I
>>>>>>>>>>>> think we do need to deprecate it - I certainly don't have the
>>>>>>>>>>>> capacity
>>>>>>>>>>>> to look into this.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> I will look at it, please allow me a few weeks though.
>>>>>>>>>>
>>>>>>>>>> Well, building it was not hard but now I'd like to know what 
>>>>>>>>>> board
>>>>>>>>>> QEMU actually emulates, there are way too many codenames and 
>>>>>>>>>> PVRs.
>>>>>>>>>
>>>>>>>>> yes. We should try to reduce the list below. Deprecating embedded
>>>>>>>>> machines
>>>>>>>>> is one way.
>>>>>>>>
>>>>>>>> Why should we reduce that list? It's good to have different cpu
>>>>>>>> options when one wants to test code for different PPC versions 
>>>>>>>> (maybe
>>>>>>>> also in user mode) or just to have a quick list of these at one 
>>>>>>>> place.
>>>>>>>
>>>>>>> I think there are many CPUs in that list which cannot be used 
>>>>>>> with any
>>>>>>> board, some of them might be also in a very incomplete state. So
>>>>>>> presenting such a big list to the users is confusing and might 
>>>>>>> create
>>>>>>> wrong expectations. It would be good to remove at least the CPUs 
>>>>>>> which
>>>>>>> are really completely useless.
>>>>>>
>>>>>> Maybe only remove some from system emulation but keep all of them
>>>>>> in user emulation?
>>>>>
>>>>> Or keep them all but mark those that are not tested/may be 
>>>>> incomplete? So the used can see what is expected to work and what 
>>>>> may need to be fixed. That way somebody may try and fix it whereas 
>>>>> if it's not there they are unlikely to try to add it.
>>>>
>>>>
>>>> The bamboo machine with 440 CPUs is booting with the latest kernel
>>>> and we have an acceptance test for it now, thanks to Thomas. There
>>>> is not much effort in keeping them in a working state until someone
>>>> volunteers. Hopefully, Christophe is making sure that we are not
>>>> breaking anything with Linux support.
>>>>
>>>> The 405 machine are still close to deprecation I think. We are still
>>>> struggling to boot one with mainline Linux, using uboot provided by
>>>> Thomas which skips SDRAM init. It is not clear to me if u-boot is
>>>> strictly necessary. It depends if Linux relies on it to do some
>>>> pre-initialization of HW. I guess once we find a good DTS for it, or
>>>> not, we can take a decision.
>>>>
>>>
>>> I now have a hacked configuration booting linux with the hotfoot DTS 
>>> and the kernel is booting up to starting /init
>>>
>>> Then it is faulting forever taking a DSI for write protection. The 
>>> problem is now likely in Linux and I'm investigating it, but I'm 
>>> having problem with GDB (7.8.1), I'm hitting the bug 
>>> https://sourceware.org/bugzilla/show_bug.cgi?id=17700
>>>
>>> And GDB 11.1 coredumps while reading vmlinux's symbols
>>>
>>> Hopefully I'll find a GDB version between 7.8 and 11 that works.
>>
>> I bisected the issue to 
>> https://github.com/linuxppc/linux/commit/52ae92cc290f0506eef9ad5466bb453ce4a9e80e 
> 
> 
> You could argue that this commit introduced a bug, or at least a bad 
> behavior in the kernel: According to the 405 user's manual that I have:
> 
>   10.2 Reserved Fields
>   For all registers having fields marked as reserved, the reserved
>   fields should be written as zero and read as undefined. That is,
>   when writing to a reseved field, write a 0 to the field. When
>   reading from a reserved field, ignore the field.
> 
> Thus the kernel should not write non-zero bits into the upper bits of 
> this register.

Yes, SHOULD, not SHALL ...


The following changes fixes the issue in the kernel though:

diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 618d7f3f9c95..bcde7e284bfa 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -317,8 +317,9 @@ _ENTRY(saved_ksp_limit)
  	/* The bailout.  Restore registers to pre-exception conditions
  	 * and call the heavyweights to help us out.
  	 */
-	mtspr	SPRN_PID, r12
  	mtcrf	0x80, r12
+	rlwinm	r12, r12, 0, 0xff
+	mtspr	SPRN_PID, r12
  	mfspr	r9, SPRN_SPRG_SCRATCH4
  	mfspr	r12, SPRN_SPRG_SCRATCH3
  	mfspr	r11, SPRN_SPRG_SCRATCH6
@@ -397,8 +398,9 @@ _ENTRY(saved_ksp_limit)
  	/* The bailout.  Restore registers to pre-exception conditions
  	 * and call the heavyweights to help us out.
  	 */
-	mtspr	SPRN_PID, r12
  	mtcrf	0x80, r12
+	rlwinm	r12, r12, 0, 0xff
+	mtspr	SPRN_PID, r12
  	mfspr	r9, SPRN_SPRG_SCRATCH4
  	mfspr	r12, SPRN_SPRG_SCRATCH3
  	mfspr	r11, SPRN_SPRG_SCRATCH6
@@ -542,8 +544,9 @@ finish_tlb_load:

  	/* Done...restore registers and get out of here.
  	*/
-	mtspr	SPRN_PID, r12
  	mtcrf	0x80, r12
+	rlwinm	r12, r12, 0, 0xff
+	mtspr	SPRN_PID, r12
  	mfspr	r9, SPRN_SPRG_SCRATCH4
  	mfspr	r12, SPRN_SPRG_SCRATCH3
  	mfspr	r11, SPRN_SPRG_SCRATCH6


> 
>> The problem is in QEMU, it should ignore upper bits of PID register.
> 
> Agreed, that's certainly necessary, too.

Yes it seems clear in 405 user's manual chapter 7 Memory Management, 
especially in all drawings, that only bits 24:31 are taken into account 
from PID register.


Christophe

