Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD16F2E8C99
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 15:28:31 +0100 (CET)
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kw4Mw-0000BY-Pi
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 09:28:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kw4Ll-00087j-Iu
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 09:27:18 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:51864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kw4Lf-0004QG-JS
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 09:27:16 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id DEE22747100;
 Sun,  3 Jan 2021 15:27:08 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9AF267470DD; Sun,  3 Jan 2021 15:27:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 95E5774645F;
 Sun,  3 Jan 2021 15:27:08 +0100 (CET)
Date: Sun, 3 Jan 2021 15:27:08 +0100 (CET)
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 00/24] vt82c686b clean ups and vt8231 emulation - all in
 one
In-Reply-To: <6f66caae-64fb-6325-9950-8ff52f1b13eb@amsat.org>
Message-ID: <43d1085-572e-4bc4-c28-66478848e83f@eik.bme.hu>
References: <cover.1609584215.git.balaton@eik.bme.hu>
 <6f66caae-64fb-6325-9950-8ff52f1b13eb@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2045360382-1609684028=:62321"
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2045360382-1609684028=:62321
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sun, 3 Jan 2021, Philippe Mathieu-Daudé wrote:
> On 1/2/21 11:43 AM, BALATON Zoltan via wrote:
>> Hello,
>>
>> This is an all in one series containing all the patches from my
>> previous part I and part II vt82c686b clean up series plus the end of
>> it to finally add vt8231 emulation that will be used by subsequent
>> ppc/pegasos2 emulation. I consider this finished for now and good
>> enough to get in also cleaning up and improving fuloong2e emulation a
>> bit but previous disclaimer is still valid: It does not aim to fix all
>> existing bugs or make the model perfectly emulate the real chip just
>> reach the level where we can have working emulation to boot guests
>> which can then be improved later. (E.g. I think state saving was
>> broken before and it remains broken after because I don't know all the
>> details how to add vmstate for all kinds of data structures and this
>> could be addressed separately when fixing the already broken state
>> saving if someone wants to test and fix it.) With this it boots at
>> least MorphOS on pegasos2 and works with the pmon_2e.bin for fuloong2e
>> which needs more fixes for Linux that are currently under review. More
>> testing is welcome.
>>
>> It still needs the Bonito BONITO_PCICONF_REG_MASK fix for fuloong2e
>> because it no longer maps SMBus but due to the Bonito bug guest cannot
>> write register 0xd2 to map it. With that fix pmon_2e.bin from here:
>> http://www.anheng.com.cn/loongson/pmon/ works for me with this
>> command: qemu-system-mips64el -M fuloong2e -net none -bios pmon_2e.bin
>>
>> After rolling this for two years now I hope it can finally be merged
>> and eventually also get pegasos2 emulation that will need this.
>>
>> Regards,
>> BALATON Zoltan
>>
>> BALATON Zoltan (24):
>>   vt82c686: Rename AC97/MC97 parts from VT82C686B to VIA
>>   vt82c686: Remove unnecessary _DEVICE suffix from type macros
>>   vt82c686b: Rename VT82C686B to VT82C686B_ISA
>>   vt82c686: Remove vt82c686b_[am]c97_init() functions
>>   vt82c686: Split off via-[am]c97 into separate file in hw/audio
>>   audio/via-ac97: Simplify code and set user_creatable to false
>>   vt82c686: Remove legacy vt82c686b_isa_init() function
>>   vt82c686: Remove legacy vt82c686b_pm_init() function
>>   vt82c686: Convert debug printf to trace points
>>   vt82c686: Remove unneeded includes and defines
>>   vt82c686: Use shorter name for local variable holding object state
>>   vt82c686: Rename superio config related parts
>
> As the first half of this series is reviewed, I'm queuing it
> (patches 1-12) via mips-next.

Thanks, You may want to fix the single vt82c686b: in the above commit 
title that was a typo, just for consistency. Will this pull include the 
Bonito BONITO_PCICONF_REG_MASK fix or some replacement for that? That 
would be needed to get the rest of this series starting with 15/24 
working. Up to that it's just clean up which should be OK. I can repost 
the remaining patches rebased once it's merged in master or if you tell me 
which branch should I use.

Regards,
BALATON Zoltan
--3866299591-2045360382-1609684028=:62321--

