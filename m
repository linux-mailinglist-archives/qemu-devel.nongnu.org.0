Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD2F2E8D72
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 18:08:57 +0100 (CET)
Received: from localhost ([::1]:50326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw6sC-0004vL-OX
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 12:08:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kw6rA-0004MY-4U
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 12:07:52 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:33825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kw6r5-0003BQ-6I
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 12:07:51 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 19BA5747100;
 Sun,  3 Jan 2021 18:07:43 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id CD05C7470DD; Sun,  3 Jan 2021 18:07:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id CB2A774645F;
 Sun,  3 Jan 2021 18:07:42 +0100 (CET)
Date: Sun, 3 Jan 2021 18:07:42 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 00/24] vt82c686b clean ups and vt8231 emulation - all in
 one
In-Reply-To: <3a8f9b76-6e26-f483-3252-e1fd7f0c888d@amsat.org>
Message-ID: <d39c8f3c-6eac-1cb5-481-f5ef9b7a312a@eik.bme.hu>
References: <cover.1609584215.git.balaton@eik.bme.hu>
 <6f66caae-64fb-6325-9950-8ff52f1b13eb@amsat.org>
 <43d1085-572e-4bc4-c28-66478848e83f@eik.bme.hu>
 <3a8f9b76-6e26-f483-3252-e1fd7f0c888d@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-154345205-1609693662=:62321"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-154345205-1609693662=:62321
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 3 Jan 2021, Philippe Mathieu-Daudé wrote:
> On 1/3/21 3:27 PM, BALATON Zoltan via wrote:
>> On Sun, 3 Jan 2021, Philippe Mathieu-Daudé wrote:
>>> On 1/2/21 11:43 AM, BALATON Zoltan via wrote:
>>>> Hello,
>>>>
>>>> This is an all in one series containing all the patches from my
>>>> previous part I and part II vt82c686b clean up series plus the end of
>>>> it to finally add vt8231 emulation that will be used by subsequent
>>>> ppc/pegasos2 emulation. I consider this finished for now and good
>>>> enough to get in also cleaning up and improving fuloong2e emulation a
>>>> bit but previous disclaimer is still valid: It does not aim to fix all
>>>> existing bugs or make the model perfectly emulate the real chip just
>>>> reach the level where we can have working emulation to boot guests
>>>> which can then be improved later. (E.g. I think state saving was
>>>> broken before and it remains broken after because I don't know all the
>>>> details how to add vmstate for all kinds of data structures and this
>>>> could be addressed separately when fixing the already broken state
>>>> saving if someone wants to test and fix it.) With this it boots at
>>>> least MorphOS on pegasos2 and works with the pmon_2e.bin for fuloong2e
>>>> which needs more fixes for Linux that are currently under review. More
>>>> testing is welcome.
>>>>
>>>> It still needs the Bonito BONITO_PCICONF_REG_MASK fix for fuloong2e
>>>> because it no longer maps SMBus but due to the Bonito bug guest cannot
>>>> write register 0xd2 to map it. With that fix pmon_2e.bin from here:
>>>> http://www.anheng.com.cn/loongson/pmon/ works for me with this
>>>> command: qemu-system-mips64el -M fuloong2e -net none -bios pmon_2e.bin
>>>>
>>>> After rolling this for two years now I hope it can finally be merged
>>>> and eventually also get pegasos2 emulation that will need this.
>>>>
>>>> Regards,
>>>> BALATON Zoltan
>>>>
>>>> BALATON Zoltan (24):
>>>>   vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA
>>>>   vt82c686: Remove unnecessary _DEVICE suffix from type macros
>>>>   vt82c686b: Rename VT82C686B to VT82C686B_ISA
>>>>   vt82c686: Remove vt82c686b_[am]c97_init() functions
>>>>   vt82c686: Split off via-[am]c97 into separate file in hw/audio
>>>>   audio/via-ac97: Simplify code and set user_creatable to false
>>>>   vt82c686: Remove legacy vt82c686b_isa_init() function
>>>>   vt82c686: Remove legacy vt82c686b_pm_init() function
>>>>   vt82c686: Convert debug printf to trace points
>>>>   vt82c686: Remove unneeded includes and defines
>>>>   vt82c686: Use shorter name for local variable holding object state
>>>>   vt82c686: Rename superio config related parts
>>>
>>> As the first half of this series is reviewed, I'm queuing it
>>> (patches 1-12) via mips-next.
>>
>> Thanks, You may want to fix the single vt82c686b: in the above commit
>> title that was a typo, just for consistency.
>
> Fixed (along with your git author email, instead of the list).

Thanks, sorry for the email address, that's something that seems to have 
changed last August without me doing anthing differently and I still don't 
know if it's something with the list or my mail provider. I've asked them 
both but I guess it's still holidays so haven't got an answer yet.

>> Will this pull include the
>> Bonito BONITO_PCICONF_REG_MASK fix or some replacement for that? That
>> would be needed to get the rest of this series starting with 15/24
>> working. Up to that it's just clean up which should be OK.
>
> I checked the Bonito(32) ASIC and Bonito64 (FPGA) manuals, and
> for (vendor_id = 0xdf53, device_id = 0x00d5) our implementation
> is correct. I am waiting for further news from Jiaxun who asked
> someone at Loongson for a manual of their Bonito variant.
>
> I expect a different PCI device_id, so we can add it with your
> change.

It's not my change, Jiaxun suggested it but fixes the problem with 
accessing register at 0xd2 that's needed on fuloong2e to get SMBus mapped 
after my series (patch 15 to be exact).

>> I can repost
>> the remaining patches rebased once it's merged in master or if you tell
>> me which branch should I use.
>
> IMHO no need (at least not worthwhile until mips/next is merged).

OK, I'll wait for that then before posting the remaining patches again. If 
you can have a look at them anyway I can make any necessary changes by 
then.

Regards,
BALATON Zoltan
--3866299591-154345205-1609693662=:62321--

