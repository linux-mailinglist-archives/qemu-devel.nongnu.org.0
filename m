Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8298A30F3B4
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 14:13:03 +0100 (CET)
Received: from localhost ([::1]:50872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7eRS-0002S7-Jy
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 08:13:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l7eP8-0001Zc-7S
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:10:39 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:59229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1l7eP1-0002fd-Nr
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 08:10:37 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 257EB7462E1;
 Thu,  4 Feb 2021 14:10:27 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E14127462DB; Thu,  4 Feb 2021 14:10:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id DEBF974581E;
 Thu,  4 Feb 2021 14:10:26 +0100 (CET)
Date: Thu, 4 Feb 2021 14:10:26 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v2 08/13] vt82c686: Move creation of ISA devices to the
 ISA bridge
In-Reply-To: <e78d15f1-13a6-d856-2801-f28b8077d97c@flygoat.com>
Message-ID: <2d73d668-aad2-1a84-376f-521e99b1850@eik.bme.hu>
References: <cover.1610223396.git.balaton@eik.bme.hu>
 <bf9400cc8e4ddd3129aa5678de4d3cf38384805f.1610223397.git.balaton@eik.bme.hu>
 <f77d6471-d19d-a1c2-e447-18181d55ba86@amsat.org>
 <5c5ce8b9-f5c4-c58d-6f8a-76c47ad8db4d@eik.bme.hu>
 <2a45450d-8357-c03e-7e11-bd59bffa61ae@amsat.org>
 <1b55216e-4526-6f50-eac2-f91797a64e7@eik.bme.hu>
 <alpine.LMD.2.03.2102012101480.9444@eik.bme.hu>
 <e78d15f1-13a6-d856-2801-f28b8077d97c@flygoat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-845156101-1612444226=:66698"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-845156101-1612444226=:66698
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 4 Feb 2021, Jiaxun Yang wrote:
> 在 2021/2/2 上午4:04, BALATON Zoltan 写道:
>> On Sun, 10 Jan 2021, BALATON Zoltan wrote:
>>> On Sun, 10 Jan 2021, Philippe Mathieu-Daudé wrote:
>>>> +PCI experts
>>>> 
>>>> On 1/10/21 1:43 AM, BALATON Zoltan wrote:
>>>>> On Sun, 10 Jan 2021, Philippe Mathieu-Daudé wrote:
>>>>>> Hi Zoltan,
>>>>>> 
>>>>>> On 1/9/21 9:16 PM, BALATON Zoltan wrote:
>>>>>>> Currently the ISA devices that are part of the VIA south bridge,
>>>>>>> superio chip are wired up by board code. Move creation of these ISA
>>>>>>> devices to the VIA ISA bridge model so that board code does not need
>>>>>>> to access ISA bus. This also allows vt82c686b-superio to be made
>>>>>>> internal to vt82c686 which allows implementing its configuration via
>>>>>>> registers in subseqent commits.
>>>>>> 
>>>>>> Is this patch dependent of the VT82C686B_PM changes
>>>>>> or can it be applied before them?
>>>>> 
>>>>> I don't know but why would that be better? I thought it's clearer to
>>>>> clean up pm related parts first before moving more stuff to this file so
>>>>> that's why this patch comes after (and also because that's the order I
>>>>> did it).
>>>> 
>>>> Not any better, but easier for me to get your patches integrated,
>>>> as I'm reviewing your patches slowly. Finding other reviewers
>>>> would certainly help.
>>> 
>>> No problem, I'll wait for your review. Merging parts of the series does 
>>> not help much because the whole series is needed for vt8231 which is 
>>> prerequisite for pegasos2 so eventually all of these are needed so it does 
>>> not matter if this one patch gets in earlier or later.
>>> 
>>> Not sure who could help with review. Maybe Jiaxun or Huacai as this is 
>>> used by fuloong2e so they might be interested and could have info on this 
>>> chip. Most of these patches just cleaning up the vt82c686b and adding some 
>>> missing features so these can be reused by the vt8231 model in last 3 
>>> patches (which is very similar to 686b only some reg addresses and ids 
>>> seem to be different for what we are concerned).
>> 
>> Ping? There are still a few patches needing review:
>> 
>> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=223512
>> 
>> Jiaxun, Hiacai, or anybody else could you please help reviewing or testing 
>> if this works with fuloong2e?
>
> Tested the series against Fuloong2E PMON. Fuloong's kernel doesn't have much 
> to do with
> VIA ISA.
>
> Which patch is pending for test or review?

Thank you. In the above patchwork link there are numbers next to patches 
showing the number of tags, those which don't have any need review, mostly 
the last few. Unfortunately patchwork seems to be down at the moment from 
here. Pathes that don't have review yet are: vt82c686: Fix up power 
management io base and config and those starting with vt82c686: Fix 
superio_cfg_{read,write}() functions and after that. The patchew link for 
the series is here:

https://patchew.org/QEMU/cover.1610223396.git.balaton@eik.bme.hu/

Regards,
BALATON Zoltan
--3866299591-845156101-1612444226=:66698--

